def welcome
  puts "Welcome!"
end

def get_character_from_user
  puts "please enter a character name"
  input = gets.chomp()
  input.downcase!
  # use gets to capture the user's input. This method should return that input, downcased.
end
