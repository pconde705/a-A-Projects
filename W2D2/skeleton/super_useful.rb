# PHASE 2
def convert_to_int(str)
  begin
    # puts "Try Again"
    # answer = gets.chomp
    # Integer(answer)
    Integer(str)
  rescue ArgumentError
    return "False, write a correct string number"
    # puts, not return, "string" if you want to retry with a message
    # retry
  rescue TypeError
    return "No booleans please!"
  rescue StandardError
    return nil
  end
end

# PHASE 3
FRUITS = ["apple", "banana", "orange"]

def reaction(maybe_fruit)
  if FRUITS.include? maybe_fruit
    puts "OMG, thanks so much for the #{maybe_fruit}!"
  else
    raise StandardError
  end
end

def feed_me_a_fruit
  puts "Hello, I am a friendly monster. :)"

  begin
    puts "Feed me a fruit! (Enter the name of a fruit:)"
    maybe_fruit = gets.chomp
    reaction(maybe_fruit)
  rescue StandardError
    retry if maybe_fruit == "coffee"
  end
end

# PHASE 4



class BestFriend
  def initialize(name, yrs_known, fav_pastime)
    @name = name
    raise StandardError.new("What's your name?") if name.empty?
    @yrs_known = yrs_known
    raise StandardError.new("At least 5 years") if yrs_known < 5
    @fav_pastime = fav_pastime
    raise StandardError.new("We need a FAV!!!!!!") if fav_pastime.empty?

  end

  def talk_about_friendship
    puts "Wowza, we've been friends for #{@yrs_known} years. Let's be friends for another #{1000 * @yrs_known}."
  end

  def do_friendstuff
    puts "Hey bestie, let's go #{@fav_pastime}. Wait, why don't you choose. 😄"
  end

  def give_friendship_bracelet
    puts "Hey bestie, I made you a friendship bracelet. It says my name, #{@name}, so you never forget me."
  end
end
