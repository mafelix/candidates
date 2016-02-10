# In this file we define the methods to help filter out candidates
# This way, we keep these methods separated from other potential parts of the program

#search hash id[keys] to find value that == id value
raise '@candidates must be an array' if @candidates.nil?

def find(id)
  begin
    candidate = @candidates.find{|hash| hash[:id] == id}
    if !(candidate)
      raise ArgumentError.new("Not a valid input")
    else
      return candidate
    end
    rescue ArgumentError => e #assigns exception type to a variable
      puts e.message
  end
end
#single candidate check yoe

def experienced?(input)
  input >= 2
end

def qualified_candidates(candidates)
  qual_arr = []

  candidates.each do |x|
    if experienced?(x[:years_of_experience]) && github_pts(x[:github_points]) && age(x[:age]) && datecheck(x[:date_applied]) && languages(x[:languages])
      qual_arr << x
    end 
  end
  return qual_arr
end

def github_pts(input)
  input >= 100
end

def languages(input)
  if /Ruby/.match(input.to_s) || /Javascript/.match(input.to_s)
    return true
  end
end

def age(input)
  input >= 18
end

def datecheck(input)
  now = Time.now.to_date
  if (input-now).to_i <= 15
    return true
  end
end

def sort_by_qualifications(input)
  sorted = input.sort_by {|index| [index[:years_of_experience], index[:github_points]]}
  sorted.reverse
end


