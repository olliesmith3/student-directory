def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  students = []
  name = gets.chop
  while !name.empty? do
    puts "Which cohort are they in?"
    cohort = gets.chop.to_sym
    months = [:Janurary, :February, :March, :April, :May, :June, :July, :August, :September, :October, :November, :December]
    if !months.include? cohort
      cohort = :unknown
    end
    students << {name: name, cohort: cohort, place_of_birth: :UK}
    puts "Now we have #{students.count} students"
    name = gets.chop
  end
  students
end
def print_header
  puts "The students of Villains Academy"
  puts "-------------"
end
#def print(students)
#  students.each_with_index do |student, index|
#    puts "#{index + 1}. #{student[:name]} (#{student[:cohort]} cohort) born in #{student[:place_of_birth]}".center(60)
#  end
#end
def group(students)
  cohorts = []
  students.each do |student|
    cohorts << student[:cohort]
  end
  cohorts.uniq.each do |cohort|
    students.each do |student|
      if cohort == student[:cohort]
        puts "#{student[:name]} (#{student[:cohort]} cohort)"
      end
    end  
  end
end
def print_footer(students)
  if students.count == 1
    puts "Overall, we only have 1 student"
  else
    puts "Overall, we have #{students.count} great students"
  end
end
#nothing happens until we call the methods
students = input_students
print_header
#print(students)
group(students)
print_footer(students)