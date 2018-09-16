def input_students
  # create an empty array
  students = []
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  # get the first name
  name = gets.chomp
  # while the name is not empty, repeat this code
  while !name.empty? do
    # add the student hash to the array
    students << {name: name, cohort: :november}
    puts "Now we have #{students.count} students"
    puts "Please enter the name of the next student"
    # get another name from the user
    name = gets.chomp
  end
  # return the array of students
  students
end

def print_header
  puts "The students of Villains Academy"
  puts "--------------------------------"
end

def print(students)
  students.each_with_index do |student, index|
    puts "#{index+1}. #{student[:name]} belongs to (#{student[:cohort]} cohort)"
  end
end

def print_while(students)
  puts "in print while"
  count = 0
  puts student.length.to_s
  while count < students.length
    puts "#{count + 1}. #{student[:name]} belongs to (#{student[:cohort]} cohort)"
    count += 1
  end
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
  puts "Overall we have #{count} students whose name starts with the char #{namechar}"
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
  puts "Overall we have #{count} students whose name has less than 12 chars."
end


def print_footer(students)
  puts "Overall, we have #{students.count} great students"
end

students = input_students
#nothing happens until we call the methods
print_header
#print(students)
#print_specific_char(students)
#print_specific_size(students)
print_while(students)
#print_footer(students)
