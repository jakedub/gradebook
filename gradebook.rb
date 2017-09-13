require 'csv'

def print_gradebook(filename)
 grade_book = CSV.read("input1.csv", headers:true).each do |grade|
   project = grade.drop(1)
 end
   grade_book.each do |row|
     student = row.drop(0)
     grade = row.drop(1).to_i
     grade_hash[student] = grade
   end

end

def apply_average (all)
  all.sum/all.size
end

def average(grade_hash)
  new_hash = {}
  grade_hash.each do |key,value|
    new_hash[key] = (value.reduce{|sum, num|} sum + num}/ value.length)
  end
  new_hash
end

def assignment_scores(grade_hash, assignment_num)
    as = grade_hash.map{|key, value| grade_hash[key] [assignment_num -1]}
  end

def assignment_scores_average(grade_hash, assignment_num)
    as = grade_hash.map{|key, value| grade_hash[key] [assignment_num -1]}
    apply_average(as)
end

def assignment_average (grade_hash, assignment_num)
  (assignment_scores(grade_hash, assignment_num).reduce(:+)/grade_arr.length)
end

def class_average(grade_hash)
  grades = grade_hash.values.flatten
  apply_average(grades)
end

def avg_by_student(grade_hash, student)
  single = grade_hash[student]
  apply_average(single)
end

def letter(score)
  if score >= 90
    "A"
  elsif score >= 80
    "B"
  elsif score >= 70
    "C"
  elsif score >= 60
    "D"
  else
    "F"
  end
end

puts "Average by Student:"

puts "#{project}: #{assignment_scores_average} #{letter(assignment_scores_average)}"

puts "Average by Assignment:"
puts "#{student:} #{avg_by_student} #{letter(avg_by_student)}"

puts "Class Average: #{class_average}"

if __FILE__ == $0
  filename = $ARGV[0]
  if filename
    full_filename = File.absolute_path(filename)
    if File.exists?(full_filename)
      print_gradebook(full_filename)
    else
      puts "#{filename} does not exist!"
    end
  else
    puts "Please give a filename as an argument."
  end
end
