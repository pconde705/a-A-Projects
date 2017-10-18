require 'sqlite3'
require 'singleton'

class QuestionsDatabase < SQLite3::Database
  include Singleton

  def initialize
    super('questions.db')
    self.type_translation = true
    self.results_as_hash = true
  end

end

class User

  def self.all
    data = QuestionsDatabase.instance.execute("SELECT * FROM users")
    data.map { |datum| User.new(datum) }
  end

  def self.find_by_id(id)
    user = QuestionsDatabase.instance.execute(<<-SQL, id)
      SELECT
        *
      FROM
        users
      WHERE
        id = ?
    SQL

    return nil unless user.length > 0

    User.new(user.first)
  end

  def self.find_by_name(fname, lname)
    user = QuestionsDatabase.instance.execute(<<-SQL, fname, lname)
      SELECT
        *
      FROM
        users
      WHERE
        fname = ? AND lname = ?
    SQL

    return nil unless user.length > 0

    User.new(user.first)
  end

  attr_accessor :id, :fname, :lname

  def initialize(options)
    @id = options['id']
    @fname = options['fname']
    @lname = options['lname']
  end

  def authored_questions
    Question.find_by_user_id(@id)
  end

  def authored_replies
    Reply.find_by_author_id(@id)
  end

  def followed_questions
    QuestionFollow.followed_questions_for_user_id(@id)
  end

  def liked_questions
    QuestionLike.liked_questions_for_user_id(@id)
  end

  # This won't work because there are two different user_id columns which mean
  # that the database is unable to read from the correct one. We would have to rename one of them
  # into author_id or what not.
  def average_karma
    my_questions = QuestionsDatabase.instance.execute(<<-SQL)
      SELECT DISTINCT
        (CAST(COUNT(question_likes.id) AS FLOAT) / COUNT(DISTINCT(questions.id))) AS average_likes
      FROM
        questions
      LEFT OUTER JOIN
        question_likes ON question_likes.questions_id = questions.id
      -- JOIN
      --   users ON questions.user_id = users.id
      WHERE
        question_likes.user_id = #{@id}
    SQL
    my_questions
  end
end

class Question

  def self.all
    data = QuestionsDatabase.instance.execute("SELECT * FROM questions")
    data.map { |datum| Question.new(datum) }
  end

  def self.find_by_id(id)
    question = QuestionsDatabase.instance.execute(<<-SQL, id)
      SELECT
        *
      FROM
        questions
      WHERE
        id = ?
    SQL

    return nil unless question.length > 0

    Question.new(question.first)
  end

  def self.find_by_title(title)
    title = QuestionsDatabase.instance.execute(<<-SQL, title)
      SELECT
        *
      FROM
        questions
      WHERE
        title = ?
    SQL

    return nil unless title.length > 0

    Question.new(title.first)
  end

  def self.find_by_user_id(user_id)
    user = User.find_by_id(user_id)
    raise "#{user_id} not found in DB" unless user

    u_id = QuestionsDatabase.instance.execute(<<-SQL, user_id)
      SELECT
        *
      FROM
        questions
      WHERE
        user_id = ?
    SQL

    return nil unless u_id.length > 0

    Question.new(u_id.first)
  end

  def self.most_followed(n)
    QuestionFollow.most_followed_questions(n)
  end

  def self.most_liked(n)
    QuestionLike.most_liked_questions(n)
  end

  attr_accessor :id, :title, :body, :user_id

  def initialize(options)
    @id = options['id']
    @title = options['title']
    @body = options['body']
    @user_id = options['user_id']
  end

  def author
    User.find_by_id(@user_id)
  end

  def replies
    Reply.find_by_questions_id(@id)
  end

  def followers
    QuestionFollow.followers_for_question_id(@id)
  end

  def likers
    QuestionLike.likers_for_question_id(@id)
  end

  def num_likes
    QuestionLike.num_likes_for_question_id(@id)
  end
end

class QuestionFollow

  def self.all
    data = QuestionsDatabase.instance.execute("SELECT * FROM questions_follows")
    data.map { |datum| QuestionFollow.new(datum) }
  end

  def self.find_by_id(id)
    q_follow = QuestionsDatabase.instance.execute(<<-SQL, id)
      SELECT
        *
      FROM
        question_follows
      WHERE
        id = ?
    SQL

    return nil unless q_follow.length > 0

    QuestionFollow.new(q_follow.first)
  end

  def self.followers_for_question_id(question_id)
    QuestionsDatabase.instance.execute(<<-SQL, question_id)
      SELECT
        fname, lname
      FROM
        users
      JOIN
        questions ON questions.user_id = users.id
      JOIN
        question_follows ON question_follows.user_id = users.id
      WHERE
        questions_id = ?
    SQL
  end

  def self.followed_questions_for_user_id(user_id)
    QuestionsDatabase.instance.execute(<<-SQL, user_id)
      SELECT
        title
      FROM
        questions
      JOIN
        users ON questions.user_id = users.id
      JOIN
        question_follows ON question_follows.questions_id = questions.id
      WHERE
        question_follows.user_id = ?
    SQL
  end

  def self.most_followed_questions(n)
    QuestionsDatabase.instance.execute(<<-SQL, n)
    SELECT
      title, COUNT(fname) AS follower_count
    FROM
      questions
    JOIN
      users ON questions.user_id = users.id
    JOIN
      question_follows ON question_follows.questions_id = questions.id
    GROUP BY
      questions.id
    ORDER BY
      COUNT(fname) DESC
    LIMIT
      ?
    SQL
  end

  attr_accessor :id

  def initialize(options)
    @id = options['id']
  end
end

class Reply
  def self.all
    data = QuestionsDatabase.instance.execute("SELECT * FROM replies")
    data.map { |datum| Reply.new(datum) }
  end

  def self.find_by_id(id)
    reply = QuestionsDatabase.instance.execute(<<-SQL, id)
      SELECT
        *
      FROM
        replies
      WHERE
        id = ?
    SQL

    return nil unless reply.length > 0

    Reply.new(reply.first)
  end

  def self.find_by_author_id(author_id)
    author = User.find_by_id(author_id)
    raise "#{author_id} not found in DB" unless author

    a_id = QuestionsDatabase.instance.execute(<<-SQL, author_id)
      SELECT
        *
      FROM
        replies
      WHERE
        author_id = ?
    SQL

    return nil unless a_id.length > 0

    Reply.new(a_id.first)
  end

  def self.find_by_questions_id(questions_id)
    questions = User.find_by_id(questions_id)
    raise "#{questions_id} not found in DB" unless questions

    q_id = QuestionsDatabase.instance.execute(<<-SQL, questions_id)
      SELECT
        *
      FROM
        replies
      WHERE
        questions_id = ?
    SQL

    return nil unless q_id.length > 0

    Reply.new(q_id.first)
  end

  attr_accessor :id, :author_id, :questions_id, :body_reply, :parent_reply_id

  def initialize(options)
    @id = options['id']
    @author_id = options['author_id']
    @questions_id = options['questions_id']
    @body_reply = options['body_reply']
    @parent_reply_id = options['parent_reply_id']
  end

  def author
    User.find_by_id(@author_id)
  end

  def question
    Question.find_by_id(@questions_id)
  end

  def parent_reply
    Reply.find_by_id(@parent_reply_id)
  end

  def child_replies
    QuestionsDatabase.instance.execute(<<-SQL)
      SELECT
        *
      FROM
        replies
      WHERE
        parent_reply_id = #{@id}
      SQL
  end
end

class QuestionLike
  def self.all
    data = QuestionsDatabase.instance.execute("SELECT * FROM question_likes")
    data.map { |datum| QuestionLike.new(datum) }
  end

  def self.find_by_id(id)
    q_like = QuestionsDatabase.instance.execute(<<-SQL, id)
      SELECT
        *
      FROM
        question_likes
      WHERE
        id = ?
    SQL

    return nil unless q_like.length > 0

    QuestionLike.new(q_like.first)
  end

  def self.likers_for_question_id(question_id)
    QuestionsDatabase.instance.execute(<<-SQL, question_id)
      SELECT
        fname, lname
      FROM
        users
      JOIN
        question_likes ON question_likes.user_id = users.id
      JOIN
        questions ON question_likes.questions_id = questions.id
      WHERE
        question_likes.questions_id = ?
    SQL
  end

  def self.num_likes_for_question_id(question_id)
    QuestionsDatabase.instance.execute(<<-SQL, question_id)
      SELECT
        COUNT(lname) AS number_of_likes
      FROM
        users
      JOIN
        question_likes ON question_likes.user_id = users.id
      JOIN
        questions ON question_likes.questions_id = questions.id
      WHERE
        question_likes.questions_id = ?
    SQL
  end

  def self.liked_questions_for_user_id(user_id)
    QuestionsDatabase.instance.execute(<<-SQL, user_id)
      SELECT
        title
      FROM
        questions
      JOIN
        question_likes ON question_likes.questions_id = questions.id
      JOIN
        users ON questions.user_id = users.id
      WHERE
        question_likes.user_id = ?
    SQL
  end

  def self.most_liked_questions(n)
    QuestionsDatabase.instance.execute(<<-SQL, n)
    SELECT
      title, COUNT(fname) AS like_count
    FROM
      questions
    JOIN
      users ON questions.user_id = users.id
    JOIN
      question_likes ON question_likes.questions_id = questions.id
    GROUP BY
      questions.id
    ORDER BY
      COUNT(fname) DESC
    LIMIT
      ?
    SQL
  end

  attr_accessor :id

  def initialize(options)
    @id = options['id']
  end

end
