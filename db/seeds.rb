# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

Movie.destroy_all

puts 'creating movies'

response = HTTParty.get('http://tmdb.lewagon.com/movie/top_rated')

response['results'].each do |result|
  Movie.create!(
    title: result['original_title'],
    overview: result['overview'],
    poster_url: "https://image.tmdb.org/t/p/original/#{result['poster_path']}",
    rating: result['vote_average']
  )
end

puts 'movies done successfully'
