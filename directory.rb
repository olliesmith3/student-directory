def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  students = []
  name = gets.chomp
  while !name.empty? do
    puts "Which cohort are they in?"
    cohort = gets.chomp.to_sym
    months = [:Janurary, :February, :March, :April, :May, :June, :July, :August, :September, :October, :November, :December]
    if !months.include? cohort
      cohort = :unknown
    end
    students << {name: name, cohort: cohort, place_of_birth: :UK}
    puts "Now we have #{students.count} students"
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
    puts "#{index + 1}. #{student[:name]} (#{student[:cohort]} cohort) born in #{student[:place_of_birth]}".center(60)
  end
end
def print_footer(students)
  puts "Overall, we have #{students.count} great students"
end
#nothing happens until we call the methods
students = input_students
print_header
print(students)
print_footer(students)