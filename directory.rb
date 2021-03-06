def input_students
  # create an empty array
  students = []
  puts "Please enter the name and cohort of the students (separated by space)"
  puts "To finish, just hit return twice"
  # get the first name
  input_val = gets.chomp.strip.split(" ")
  name = input_val[0]
  cohort = input_val[1] || "Default_Cohort"
  # while the name is not empty, repeat this code
  while name != nil do
    # add the student hash to the array
    students << {name: name, cohort: cohort, country: random_country, hobby: random_hobby}
    if students.count == 1
      puts "Now we have #{students.count} student"
    else
      puts "Now we have #{students.count} students"
    end
    puts "Please enter the name and cohort of the next student (separated by space)"
    # get another name from the user
    input_val = gets.chomp.strip.split(" ")
    name = input_val[0]
    cohort = input_val[1] || "Default_Cohort"
  end
  # return the array of students
  students
end

def random_hobby
  ["Yoga","paragliding","dancing","swimming"].sample
end

def random_country
  ["UK","Madagascar","Monaco","Mars"].sample
end

def print_header
  puts "The students of Villains Academy".center(100,"*")
  puts "--------------------------------".center(100,"*")
end

def print(students)
  students.each_with_index do |student, index|
    puts "#{index+1}. #{student[:name]} belongs to (#{student[:cohort]} cohort) with hobby #{student[:hobby]} coming from #{student[:country]}"
  end
end

def print_while(students)
  count = 0
  while count < students.length
    puts "#{count + 1}. #{students[count][:name]} belongs to (#{students[count][:cohort]} cohort)"
    count += 1
  end
end

def print_cohort(students)
  #puts students.length.to_s
  students = students.group_by {|arhash| arhash[:cohort]}
  puts students
  students.each{|arhash|
    puts arhash.class
    puts arhash
    arhash.each{|arcon|
      puts arcon.class
      puts arcon
      puts "Now for the cohort: #{k}"
        v.each {|studentHash|
          puts " #{studentHash[:name]} belongs to (#{studentHash[:cohort]} cohort)"
      }
    }
  }
end

def print_specific_char(students)
  puts "Please enter the character for students name"
  # get another name from the user
  namechar = gets.chomp
  count = 0
  students.each do |student|
    if student[:name][0] == namechar
      count += 1
      puts "#{count}. #{student[:name]} belongs to (#{student[:cohort]} cohort)"
    end
  end
  if count == 1
    puts "Overall we have #{count} student whose name starts with the char #{namechar}".center(100,"*")
  else
    puts "Overall we have #{count} students whose name starts with the char #{namechar}".center(100,"*")
  end

end

def print_specific_size(students)
puts "The students with name shorter than 12 are:"
count = 0
  students.each do |student|
    if student[:name].length < 12
      count += 1
      puts "#{count}. #{student[:name]} belongs to (#{student[:cohort]} cohort)"
    end
  end
  if count == 1
    puts "Overall we have #{count} student whose name has less than 12 chars.".center(100,"*")
  else
    puts "Overall we have #{count} students whose name has less than 12 chars.".center(100,"*")
  end
end


def print_footer(students)
  if student.count ==1
    puts "Overall, we have #{students.count} great student"
  else
    puts "Overall, we have #{students.count} great students"
  end
end

students = input_students
#nothing happens until we call the methods
print_header
#print(students)
print_cohort(students)
#print_specific_char(students)
#print_specific_size(students)
#print_while(students)
#print_footer(students)
