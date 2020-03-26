

5.times do #creating 5 teachers
    fake_name = Faker::Name.name
    fake_email = Faker::Internet.email
    fake_password = "password"
    Teacher.create(name: fake_name, username: fake_email, password: fake_password)
end




Teacher.all.each do |t| 

  20.times do #creating 20 students p/teacher 
    name = Faker::Name.unique.name
    grade = rand(1..12)
   
    Student.create(name: name, grade: grade)
  end

  5.times do #creating 5 classes per teacher
    name = Faker::Educator.course_name #create klasses
    period = rand(1..12)
    teacher_id = t.id
    Klass.create(name: name, period: period, teacher_id: teacher_id)
  end
end

@student_counter = 1
Klass.all.each do |k| #gives each klass 20 students
  20.times do
    klass_id = k.id

    if @student_counter <= Student.all.count
      student_id = @student_counter #uniq problem is here
    else
      @student_counter = 1 #stops student_id from going over student.count
      student_id = @student_counter
    end

    KlassesStudents.create(klass_id: klass_id, student_id: student_id)
    @student_counter += 1 #stops student redundancy in class
  end
  
end







# Create student reviews
Teacher.all.each do |t|
  20.times do
    review = Faker::Movies::BackToTheFuture.quote
    Review.create(content: review, student_id: (rand(1..Student.all.count)), teacher_id: t.id)
  end
end

