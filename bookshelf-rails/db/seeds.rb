# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Genre.create(name: "Mystery")
Genre.create(name: "Young Adult")
Genre.create(name: "Fantasy")
Genre.create(name: "Science")
Genre.create(name: "Non Fiction")
Genre.create(name: "Adventure")


author_list = [
  "Dan Brown",
  "Jodi Picoult",
  "J.K. Rowling",
  "Malcom Gladwell",
  "Steven Pinker",
  "Suzanne Collins"
]

author_list.each do |name|
  Author.create(name: name)
end


book_list = [
  [ "Angels and Demons", Author.find_by(name: "Dan Brown"), [Genre.find_by(name: "Mystery")] ],
  [ "My Sister's Keeper", Author.find_by(name: "Jodi Picoult"), [Genre.find_by(name: "Young Adult")]  ],
  [ "Harry Potter and the Sorcerer's Stone", Author.find_by(name: "J.K. Rowling"), [Genre.find_by(name: "Fantasy"), Genre.find_by(name: "Young Adult") ]  ],
  [ "The Outliers", Author.find_by(name: "Malcom Gladwell"), [Genre.find_by(name: "Science"), Genre.find_by(name: "Non Fiction")]  ],
  [ "The Blank Slate", Author.find_by(name: "Steven Pinker"), [Genre.find_by(name: "Science"), Genre.find_by(name: "Non Fiction")]  ],
  [ "The Hunger Games", Author.find_by(name: "Suzanne Collins"), [Genre.find_by(name: "Young Adult"), Genre.find_by(name: "Adventure")]  ]
]

book_list.each do |title, author, genres|
  book = Book.create( title: title)
  book.author = author
  book.genres.push(genres)
  book.save
end