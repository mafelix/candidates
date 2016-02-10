# This is the main entrypoint into the program
# It requires the other files/gems that it needs

require 'pry'
require_relative 'candidates'
require_relative 'filters'

## Your test code can go here

# binding.pry

#pp @candidates
#puts find(15)
#puts qualified_candidates(@candidates)


def repl
  loop do
    puts "Enter a command: Find1, all, qualified, quit"
    input = gets.chomp.to_s
    if input == 'Find1' 
      puts "Which id?(Integer)"
      idinput = gets.chomp.to_i
      answer = find(idinput)
    elsif input == 'all'
      answer = @candidates
    elsif input =='qualified'
      qualified = qualified_candidates(@candidates)
      answer = qualified
    elsif input == 'quit'
      break
    else
      answer = "Please select a valid input"
    end
    puts answer
  end
end
repl