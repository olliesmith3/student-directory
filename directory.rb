def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  students = []
  name = gets.chomp
  while !name.empty? do
    puts "how old are they?"
    age = gets.chomp
    students << {name: name, cohort: :november, age: age}
    puts "Now we have #{students.count} students"
    puts "Please enter the names of the students"
    puts "To finish, just hit return twice"
    name = gets.chomp
  end
  students
end
def print_header
  puts "The students of Villains Academy"
  puts "-------------"
end
def print(students)
  students.each_with_index do |student, index|
    puts "#{index + 1}. #{student[:name]}, age #{student[:age]} (#{student[:cohort]} cohort)".center(40)
  end
end
def print_footer(names)
  puts "Overall, we have #{names.count} great students"
end

students = input_students
print_header
print(students)
print_footer(students)