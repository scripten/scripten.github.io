class MegaGreeter
  attr_accessor :names

  # Create object
  def initialize(names = "World")
    @names = names
  end

  # Say hi to everyone
  def say_hi
    if @names.nil?
      puts "..."
    elsif @names.respond_to?("each")
      names.each do |name|
        puts "Hello, #{name.capitalize}!"
      end
    else
      puts "Hello #{@names.capitalize}!"
    end
  end

  def say_bye
    if @names.nil?
      puts "..."
    elsif @names.respond_to?("join")
      puts "Goodbye #{@names.join(", ")}. Come back soon!"
    else
      puts "Goodbye #{@names.capitalize}. Come back soon!"
    end
  end
end

if __FILE__ == $0
  mg = MegaGreeter.new
  mg.say_hi
  mg.say_bye

  mg.names = "zeke"
  mg.say_hi
  mg.say_bye

  mg.names = ["Al", "bert", "Carla", "debbie"]
  mg.say_hi
  mg.say_bye

  mg.names = nil
  mg.say_hi
  mg.say_bye
end
