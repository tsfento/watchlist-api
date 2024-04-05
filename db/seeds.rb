# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

UserWatchTitle.all do |u|
    u.destroy
end
WatchTitle.all do |w|
    w.destroy
end

burbs = WatchTitle.create_with(
    tmdb_id: 11974,
    imdb_id: "tt0096734",
    poster_path: "/vrVPAcv2njVdnkqhBwGBc7UxCjz.jpg",
    title: "The 'Burbs",
    release_date: "1989-02-17",
    overview: "When secretive new neighbors move in next door, suburbanite Ray Peterson and his friends let their paranoia get the best of them as they start to suspect the newcomers of evildoings and commence an investigation. But it's hardly how Ray, who much prefers drinking beer, reading his newspaper and watching a ball game on the tube expected to spend his vacation.",
    runtime: 102
).find_or_create_by(tmdb_id: 11974)
dune84 = WatchTitle.create_with(
    tmdb_id: 841,
    imdb_id: "tt0087182",
    poster_path: "/9jE1U4vzlZQMvfbKWq5fj00iJBw.jpg",
    title: "Dune",
    release_date: "1984-12-14",
    overview: "In the year 10,191, the most precious substance in the universe is the spice Melange. The spice extends life. The spice expands consciousness. The spice is vital to space travel.  The spice exists on only one planet in the entire universe, the vast desert planet Arrakis, also known as Dune.  Its native inhabitants, the Fremen, have long held a prophecy that a man would come, a messiah who would lead them to true freedom.",
    runtime: 137
).find_or_create_by(tmdb_id: 841)

DailyQuote.create(date: '2024-04-02', quote: "There go the Goddamn brownies!", watch_title_id: burbs.id)
DailyQuote.create(date: '2024-04-03', quote: "Father! The sleeper has awakened!", watch_title_id: dune84.id)