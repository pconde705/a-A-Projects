require_relative 'db_connection'
require 'active_support/inflector'
# NB: the attr_accessor we wrote in phase 0 is NOT used in the rest
# of this project. It was only a warm up.

class SQLObject
  def self.columns
    return @columns if @columns
    cols = DBConnection.execute2(<<-SQL)
    SELECT
      *
    FROM
      #{self.table_name}
    SQL
    @columns = cols[0].map { |e| e.to_sym }
  end

  def self.finalize!
    @columns = self.columns
    @columns.each do |column|
      define_method("#{column}") do
        self.attributes[column]
      end

      define_method("#{column}=") do |arg|
        self.attributes[column] = arg
      end
    end

  end

  def self.table_name=(table_name)
    @table_name = table_name
  end

  def self.table_name
    new_name = self.to_s.underscore
    @table_name || @table_name=("#{new_name}s")
  end

  def self.all
    cols = DBConnection.execute2(<<-SQL)
    SELECT
      *
    FROM
      #{@table_name}
    SQL
    self.parse_all(cols[1..-1])
  end

  def self.parse_all(results)
    results.map do |result|
      self.new(result)
    end
  end

  def self.find(id)
    solution = self.all.select {|a| return a if a.attributes[:id] == id }
    solution.empty? ? nil : solution
  end

  def initialize(params = {})
    @columns = self.class.columns
    params.each do |key, value|
      key = key.to_sym
      raise "unknown attribute '#{key}'" if !@columns.include?(key)
      self.send("#{key}=", value)
    end
  end

  def attributes
    return @attributes if @attributes
    @attributes = {}
  end

  def attribute_values
    @attributes.values
  end

  def insert
    col_names = self.class.columns.join(", ")
    question_marks = (["?"] * col_names.length).join(", ")

    result = DBConnection.execute2(<<-SQL, *attribute_values)
    INSERT INTO
      #{self.class.table_name} #{col_names}
    VALUES
      #{question_marks}
    SQL
    result
  end

  def update
    col_names = self.class.columns.join(", ")
    question_marks = (["?"] * col_names.length).join(", ")
    setting = col_names.each {|a| setting << "#{a} = ?"}
    p setting

    result = DBConnection.execute2(<<-SQL, *attribute_values)
    UPDATE
      #{self.class.table_name}
    SET
      #{setting}
    WHERE
      id
    SQL
    result
  end

  def save
    # ...
  end
end
