# This class calls up an accounts file from the drive, then reads it on initialization,
# converting lines into series of usernames and passwords. (It's pretty weak code, but it
# does have the benefit of being really simple!) We can then register new accounts that
# get written to the file using the very basic user interface below.

class AccountManager

  def initialize(filename = 'w4-accounts.txt')
    # Here's our instance variable that holds the hash (or dictionary, etc) with all of
    # our account information in it.
    @hash = { }
    # This is exception handling for the file IO. (Basically a try-catch block like
    # you would see in other languages.)
    begin
      @file = File.open(filename, "a+")
      # There's actually a number of ways to read lines in a file. I prefer this one, since
      # it is the most readable, in my own opinion.
      for line in @file.readlines
        name, password = line.chomp.split
        # The unless clauses here ensure that improperly formatted data isn't read into the
        # hash at all. Further work would likely delete corrupted entries from the file altogether.
        @hash[name] = password unless name.nil? or password.nil? or line.chomp.split.length > 2
      end

      rescue SystemCallError
        $stderr.print "IO failed: " + $!
        @file.close
        File.delete(filename)
        raise
    end
  end

  # This method returns the password of an account given the account name. (Not very secure! But
  # great for debugging and seeing how the manager works.)
  def GetAccountPassword(name)
    if @hash[name].nil?
      puts "Account name not recognized."
      print "Accounts: "
      puts @hash
      return "Try 'register'"
    else
      return @hash[name]
    end
  end

  # This method registers a new username-password combo, then writes it to the file. That means that
  # the account can be used immediately and will be available later. Obvious improvements include
  # checking for duplicate entries and allowing for updating passwords.
  def Register(name, password)
    @file.write(name + " " + password + "\n")
    @hash[name] = password unless name.nil? or password.nil?
  end

  def Close()
    @file.close()
  end
end

am = AccountManager.new
print ":> "
while (name = gets.chomp) != "exit"
  if name.downcase == "register"
    print "Username: "
    name = ""
    name = gets.chomp until name.length > 0 and name.split.length == 1
    print "Password: "
    password = ""
    password = gets.chomp until password.length > 0 and password.split.length == 1
    am.Register(name, password)
  else
    puts am.GetAccountPassword(name)
  end
  print ":> "
end
am.Close()
