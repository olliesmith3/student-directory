require "csv"

@students = []

def add_to_students(name, cohort)
  @students << {name: name, cohort: cohort.to_sym, place_of_birth: :UK}
end

def input_students
  puts "Please enter the names of the students".center(100)
  puts "To finish, just hit return twice".center(100)
  name = STDIN.gets.chomp
  while !name.empty? do
    puts "Which cohort are they in?".center(100)
    cohort = STDIN.gets.chop.to_sym
    months = [:Janurary, :February, :March, :April, :May, :June, :July, :August, :September, :October, :November, :December]
    if !months.include? cohort
      cohort = :unknown
    end
    add_to_students(name, cohort)
    puts @students.count == 1 ? "Now we have #{@students.count} student".center(100) : "Now we have #{@students.count} students".center(100) 
    puts "Please enter the name of another student or press enter to finish".center(100)
    name = STDIN.gets.chop
  end
end

def interactive_menu
  loop do
    print_menu
    process(STDIN.gets.chomp)
  end
end

def print_menu
  puts "\n"
  puts "Select the option you would like by typing the number and then pressing Enter\n\n".center(100)
  puts "1. Input the students"
  puts "2. Show the students"
  puts "3. Save the list to students.csv"
  puts "4. Load the list from students.csv"
  puts "5. Print source code"
  puts "9. Exit"
end

def show_students
  print_header
  print_student_list
  print_footer
end

def process(selection)
  case selection
  when "1"
    input_students
  when "2"
    show_students
  when "3"
    puts "Which file would you like to save students to?"
    save_students(gets.chomp)
    puts "Those students have been saved".center(100)
  when "4"
    puts "Which file would you like to load students from?"
    load_students(gets.chomp)
    puts "Students have been loaded".center(100)
  when "5"
    print_source_code
  when "9"
    exit 
  else
    puts "I don't know what you meant, try again"
  end
end

def print_header
  if @students.count != 0
    puts "The students of Villains Academy".center(100)
    puts "-------------".center(100)
  else
    puts "There are currently no students".center(100)
  end
end

def print_student_list
  @students.each_with_index do |student, index|
    puts "#{index + 1}. #{student[:name]} (#{student[:cohort]} cohort) born in #{student[:place_of_birth]}".center(100)
  end
end

#def group(students)
#  cohorts = []
#  students.each do |student|
#    cohorts << student[:cohort]
#  end
#  cohorts.uniq.each do |cohort|
#    students.each do |student|
#      if cohort == student[:cohort]
 #       puts "#{student[:name]} (#{student[:cohort]} cohort)"
#      end
#    end  
#  end
#end

def print_footer
  if @students.count == 1
    puts "Overall, we only have 1 student".center(100)
  elsif @students.count > 1
    puts "Overall, we have #{@students.count} great students".center(100)
  end
end

def save_students(filename = "students.csv")
  CSV.open(filename, "w") { |csv|
  @students.each do |student|
    csv << [student[:name], student[:cohort]]
  end
  }
end

def load_students(filename = "students.csv")
  CSV.foreach(filename) { |row|
    name, cohort = row
    add_to_students(name, cohort)
  }
end

def try_load_students
  filename = ARGV.first
  #if filename.nil?
  #  filename = "students.csv"
  #end
  return if filename.nil?
  if File.exists?(filename)
    load_students(filename)
    puts "Loaded #{@students.count} from #{filename}"
  else
    puts "Sorry, #{filename} doesn't exist."
    exit
  end
end

def print_source_code
  puts "Source code for directory.rb"
  puts File.open(__FILE__, "r").read
end

try_load_students
interactive_menu