# create an empty array as global variable
@students = []
def input_students
  puts "Please enter the name and cohort of the students (separated by space)"
  puts "To finish, just hit return twice"
  # get the first name
  input_val = STDIN.gets.chomp.strip.split(" ")
  name = input_val[0]
  # while the name is not empty, repeat this code
  while name != nil do
    student_string_to_hash(input_val.join(",") << random_hobby << "," << random_country)
    print_count
    puts "Please enter the name and cohort of the next student (separated by space)"
    input_val = STDIN.gets.chomp.strip.split(" ")
    name = input_val[0] 
  end
end

print_count
  if @students.length == 0
     puts "No students!"
  elsif @students.count == 1
     puts "Now we have #{@students.count} student"
  else
     puts "Now we have #{@students.count} students"
  end
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

def print_student_list
  @students.each_with_index do |student, index|
    puts "#{index+1}. #{@student[:name]} belongs to (#{@student[:cohort]} cohort) with hobby #{@student[:hobby]} coming from #{@student[:country]}"
  end
  print_count
end

def print_footer
 puts "Footer".center(100,"*")
 print_count
end

def interactive_menu
  loop do
    print_menu
    process (STDIN.gets.chomp)
   end
end

def show_students
  print_header
  print_student_list
  print_footer
end

def print_menu
  puts "1. Input the students"
  puts "2. Show the students"
  puts "3. Save the list to students.csv"
  puts "4. Load the list from students.csv"
  puts "9. Exit" # 9 because we'll be adding more items  
end

def check_file
  if (ARGV.first == nil)
    STDIN.puts "Please enter the filename to be used"
    filename = gets.chomp
    return filename
  else 
    return ARGV.first
  end 
end 

def process(selection)
  case selection
    when "1"
      input_students
    when "2"
      show_students
    when "3"      
      save_students(check_file)
    when "4"
      load_students(check_file)
    when "9"
      exit
    else
      puts "I don't know what you mean, try again"
  end
end

def save_students(filename = "students.csv")
  CSV.open(filename, "a") do |line|
    @students.each {|student|
      student_data = [student[:name], student[:cohort], student[:hobby], student[:country]]
      csv_line = student_date.join(",")
      #line.puts csv_line
      line << csv_line
    }
   end  
 puts "#{@students.count} students saved in file:#{filename}"
end

def load_students (filename = "students.csv")
  CSV.foreach(filename) do |line|
    student_string_to_hash(line)
  end
  puts "#{@students.count + 1} students loaded from file:#{filename}"
end  

def student_string_to_hash(line)
  name, cohort, hobby, country = line.chomp.split(",")
  @students << {name: name, cohort: cohort, hobby: hobby, country: country}
 end 


interactive_menu
#students = input_students
#nothing happens until we call the methods
#print_header
#print(students)
#print_cohort(students)
#print_specific_char(students)
#print_specific_size(students)
#print_while(students)
#print_footer(students)
