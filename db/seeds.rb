# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

burbs = WatchTitle.create(
    tmdb_id: 11974,
    imdb_id: "tt0096734",
    poster_path: "/vrVPAcv2njVdnkqhBwGBc7UxCjz.jpg",
    title: "The 'Burbs",
    release_date: Fri, 17 Feb 1989 00:00:00.000000000 UTC +00:00,
    overview: "When secretive new neighbors move in next door, suburbanite Ray Peterson and his friends let their paranoia get the best of them as they start to suspect the newcomers of evildoings and commence an investigation. But it's hardly how Ray, who much prefers drinking beer, reading his newspaper and watching a ball game on the tube expected to spend his vacation.",
    runtime: 102
)
dune84 = WatchTitle.create(
    tmdb_id: 841,
    imdb_id: "tt0087182",
    poster_path: "/9jE1U4vzlZQMvfbKWq5fj00iJBw.jpg",
    title: "Dune",
    release_date: Fri, 14 Dec 1984 00:00:00.000000000 UTC +00:00,
    overview: "In the year 10,191, the most precious substance in the universe is the spice Melange. The spice extends life. The spice expands consciousness. The spice is vital to space travel.  The spice exists on only one planet in the entire universe, the vast desert planet Arrakis, also known as Dune.  Its native inhabitants, the Fremen, have long held a prophecy that a man would come, a messiah who would lead them to true freedom.",
    runtime: 137
)

DailyQuote.create(date: '2024-04-02', quote: "There go the Goddamn brownies!", watch_title_id: bubs.id)
DailyQuote.create(date: '2024-04-03', quote: "Father! The sleeper has awakened!", watch_title_id: dune84.id)