5.times do 
    fake_name = Faker::Name.name
    fake_email = Faker::Internet.email
    fake_password = Faker::Space.constellation
    Teacher.create(name:, username:, password:)
end




Teacher.all.each do |t|


  # create students
  20.times do
    first = Faker::Name.first_name
    last = Faker::Name.last_name
    name = "#{first} #{last}"
    username = first[0] + last[0] + last
    pass = Faker::Space.constellation
    Student.create(name: name, username: username.downcase, password: pass, teacher_id: t.id)
  end
end

# Create student reviews
Student.all.each do |s|
  3.times do
    review = Faker::Movies::HarryPotter.quote
    t = Teacher.find_by(id: s.teacher_id)
    book = t.books[rand(t.books.length)]
    Review.create(rating: rating, review: review, student_id: s.id, book_id: book.id)
  end
end
