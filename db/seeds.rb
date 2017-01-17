# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Movie.destroy_all
Review.destroy_all
movies = ['avatar', 'radio', 'titanic', 'shrek']
lorem_sizes = ['Lorem ipsum dolor sit amet.',
  'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Facilis ullam laudantium in asperiores, a quo.',
  'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Laborum sint quaerat beatae quas error illum consequuntur delectus at dolore! Quo sed vitae quod, quisquam perspiciatis.'
]
names = ['jane doe', 'john doe']
reviews = ['good', 'bad', 'okay']
REVIEWS_PER_MOVIE = 2

movies.each do |movie|
  Movie.create({title: movie, release_date: Date.new})
end

Movie.count.times do |i|
  REVIEWS_PER_MOVIE.times do |review|
    movie_id = i + 1
    text = lorem_sizes.sample
    reviewer = names.sample
    title = "it was #{reviews.sample}"
    date = Date.new
    Review.create({
      title: title, reviewer_name: reviewer,
      review_text: text, review_date: date,
      movie_id: movie_id
      })
  end
end
