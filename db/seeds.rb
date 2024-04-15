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
DailyQuote.all do |d|
    d.destroy
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

DailyQuote.find_or_create_by(date: '2024-04-18', quote: "I've never seen that. I've never seen anybody drive their garbage down to the street and bang the hell out of it with a stick. I-I've never seen that.", watch_title_id: burbs.id)

DailyQuote.find_or_create_by(date: '2024-07-13', quote: "A thermostat on a home furnace; is that supposed to go to 5,000 degrees, you think?", watch_title_id: burbs.id)

dune = WatchTitle.create_with(
    tmdb_id: 841,
    imdb_id: "tt0087182",
    poster_path: "/9jE1U4vzlZQMvfbKWq5fj00iJBw.jpg",
    title: "Dune",
    release_date: "1984-12-14",
    overview: "In the year 10,191, the most precious substance in the universe is the spice Melange. The spice extends life. The spice expands consciousness. The spice is vital to space travel.  The spice exists on only one planet in the entire universe, the vast desert planet Arrakis, also known as Dune.  Its native inhabitants, the Fremen, have long held a prophecy that a man would come, a messiah who would lead them to true freedom.",
    runtime: 137
).find_or_create_by(tmdb_id: 841)

DailyQuote.find_or_create_by(date: '2024-04-19', quote: "And how can this be? For he is the Kwisatz Haderach!", watch_title_id: dune84.id)

back_school = WatchTitle.create_with(
    tmdb_id: 15596,
    imdb_id: "tt0090685",
    poster_path: "/bIQH3dptGaMBtwos7j9lEHt65BV.jpg",
    title: "Back to School",
    release_date: "1986-06-13",
    overview: "Self-made millionaire Thornton Melon decides to get a better education and enrolls at his son Jason's college. While Jason tries to fit in with his fellow students, Thornton struggles to gain his son's respect, giving way to hilarious antics.",
    runtime: 96
).find_or_create_by(tmdb_id:)

DailyQuote.find_or_create_by(date: '2024-04-20', quote: "Lay off Vanessa. She gives great headache.", watch_title_id: back_school.id)

buckaroo = WatchTitle.create_with(
    tmdb_id: 11379,
    imdb_id: "tt0086856",
    poster_path: "/a7K5OcylQbWtCbrUzegfi31yaSs.jpg",
    title: "The Adventures of Buckaroo Banzai Across the 8th Dimension",
    release_date: "1984-08-15",
    overview: "Adventurer/surgeon/rock musician Buckaroo Banzai and his band of men, the Hong Kong Cavaliers, take on evil alien invaders from the 8th dimension.",
    runtime: 103
).find_or_create_by(tmdb_id:)

DailyQuote.find_or_create_by(date: '2024-04-21', quote: "Why is there a watermelon there?", watch_title_id: bucakaroo.id)

thirteenth_warrior = WatchTitle.create_with(
    tmdb_id: 1911,
    imdb_id: "tt0120657",
    poster_path: "/rinf4I01FLwUKoXvcZV45QrWmAw.jpg",
    title: "The 13th Warrior",
    release_date: "1999-08-13",
    overview: "A Muslim ambassador exiled from his homeland, Ahmad ibn Fadlan finds himself in the company of Vikings. While the behavior of the Norsemen initially offends ibn Fadlan, the more cultured outsider grows to respect the tough, if uncouth, warriors. During their travels together, ibn Fadlan and the Vikings get word of an evil presence closing in, and they must fight the frightening and formidable force, which was previously thought to exist only in legend.",
    runtime: 102
).find_or_create_by(tmdb_id:)

DailyQuote.find_or_create_by(date: '2024-04-22', quote: "It's all right, little brother... there are more!", watch_title_id: thirteenth_warrior.id)

fugitive = WatchTitle.create_with(
    tmdb_id: 5503,
    imdb_id: "tt0106977",
    poster_path: "/b3rEtLKyOnF89mcK75GXDXdmOEf.jpg",
    title: "The Fugitive",
    release_date: "1993-08-06",
    overview: "Wrongfully convicted of murdering his wife and sentenced to death, Richard Kimble escapes from the law in an attempt to find the real killer and clear his name.",
    runtime: 131
).find_or_create_by(tmdb_id:)

DailyQuote.find_or_create_by(date: '2024-04-23', quote: "Well, we say hinky.", watch_title_id: fugitive.id)

wizard = WatchTitle.create_with(
    tmdb_id: 183,
    imdb_id: "tt0098663",
    poster_path: "/dtgNNq3TBbpBX6RXHLt5gAMdwPV.jpg",
    title: "The Wizard",
    release_date: "1989-12-15",
    overview: "A boy and his brother run away from home and hitch cross-country, with help from a girl they meet, to compete in the ultimate video-game championship.",
    runtime: 100
).find_or_create_by(tmdb_id:)

DailyQuote.find_or_create_by(date: '2024-04-24', quote: "50,000? You got 50,000 on Double Dragon?", watch_title_id: wizard.id)

# Halloween

# dead_alive = WatchTitle.create_with(
#     tmdb_id: ,
#     imdb_id: ,
#     poster_path: ,
#     title: ,
#     release_date: ,
#     overview: ,
#     runtime: 
# ).find_or_create_by(tmdb_id:)

# DailyQuote.find_or_create_by(date: '2024-10-01', quote: "I kick arse for the Lord!", watch_title_id: dead_alive.id)

# maximum_overdrive = WatchTitle.create_with(
#     tmdb_id: ,
#     imdb_id: ,
#     poster_path: ,
#     title: ,
#     release_date: ,
#     overview: ,
#     runtime: 
# ).find_or_create_by(tmdb_id:)

# DailyQuote.find_or_create_by(date: '2024-10-02', quote: "I think I just loaded my pants.", watch_title_id: maximum_overdrive.id)

# gb_one = WatchTitle.create_with(
#     tmdb_id: ,
#     imdb_id: ,
#     poster_path: ,
#     title: ,
#     release_date: ,
#     overview: ,
#     runtime: 
# ).find_or_create_by(tmdb_id:)

# DailyQuote.find_or_create_by(date: '2024-10-03', quote: "During the rectification of the Vuldrini, the traveler came as a large and moving Torg! Then, during the third reconciliation of the last of the McKetrick supplicants, they chose a new form for him: that of a giant Slor! Many Shuvs and Zuuls knew what it was to be roasted in the depths of the Slor that day, I can tell you!", watch_title_id: gb_one.id)

# gb_two = WatchTitle.create_with(
#     tmdb_id: ,
#     imdb_id: ,
#     poster_path: ,
#     title: ,
#     release_date: ,
#     overview: ,
#     runtime: 
# ).find_or_create_by(tmdb_id:)

# DailyQuote.find_or_create_by(date: '2024-10-04', quote: "My guys are still under a judicial mistrangement order... that blue thing I got from her!", watch_title_id: gb_two.id)

# vvitch = WatchTitle.create_with(
#     tmdb_id: ,
#     imdb_id: ,
#     poster_path: ,
#     title: ,
#     release_date: ,
#     overview: ,
#     runtime: 
# ).find_or_create_by(tmdb_id:)

# DailyQuote.find_or_create_by(date: '2024-10-05', quote: "Wouldst thou like to live deliciously?", watch_title_id: vvitch.id)

# transylvania = WatchTitle.create_with(
#     tmdb_id: ,
#     imdb_id: ,
#     poster_path: ,
#     title: ,
#     release_date: ,
#     overview: ,
#     runtime: 
# ).find_or_create_by(tmdb_id:)

# DailyQuote.find_or_create_by(date: '2024-10-06', quote: "Yuck! Monster breath!", watch_title_id: transylvania.id)

# comet = WatchTitle.create_with(
#     tmdb_id: ,
#     imdb_id: ,
#     poster_path: ,
#     title: ,
#     release_date: ,
#     overview: ,
#     runtime: 
# ).find_or_create_by(tmdb_id:)

# DailyQuote.find_or_create_by(date: '2024-10-07', quote: "Daddy would have gotten us Uzis.", watch_title_id: comet.id)

# troll = WatchTitle.create_with(
#     tmdb_id: ,
#     imdb_id: ,
#     poster_path: ,
#     title: ,
#     release_date: ,
#     overview: ,
#     runtime: 
# ).find_or_create_by(tmdb_id:)

# DailyQuote.find_or_create_by(date: '2024-10-08', quote: "Have you been playing with a dead cat?", watch_title_id: troll.id)

# troll_two = WatchTitle.create_with(
#     tmdb_id: ,
#     imdb_id: ,
#     poster_path: ,
#     title: ,
#     release_date: ,
#     overview: ,
#     runtime: 
# ).find_or_create_by(tmdb_id:)

# DailyQuote.find_or_create_by(date: '2024-10-09', quote: "A double-decker bologna sandwich!", watch_title_id: troll_two.id)

# tucker = WatchTitle.create_with(
#     tmdb_id: ,
#     imdb_id: ,
#     poster_path: ,
#     title: ,
#     release_date: ,
#     overview: ,
#     runtime: 
# ).find_or_create_by(tmdb_id:)

# DailyQuote.find_or_create_by(date: '2024-10-10', quote: "Oh my God, they cut off his bowlin' fingers!", watch_title_id: tucker.id)

# monster_house = WatchTitle.create_with(
#     tmdb_id: ,
#     imdb_id: ,
#     poster_path: ,
#     title: ,
#     release_date: ,
#     overview: ,
#     runtime: 
# ).find_or_create_by(tmdb_id:)

# DailyQuote.find_or_create_by(date: '2024-10-11', quote: "My dad's at the pharmacy and my mom's at the movies with her personal trainer.", watch_title_id: monster_house.id)

# monster_squad = WatchTitle.create_with(
#     tmdb_id: ,
#     imdb_id: ,
#     poster_path: ,
#     title: ,
#     release_date: ,
#     overview: ,
#     runtime: 
# ).find_or_create_by(tmdb_id:)

# DailyQuote.find_or_create_by(date: '2024-10-12', quote: "Creature stole my twinkie.", watch_title_id: monster_squad.id)

# near_dark = WatchTitle.create_with(
#     tmdb_id: ,
#     imdb_id: ,
#     poster_path: ,
#     title: ,
#     release_date: ,
#     overview: ,
#     runtime: 
# ).find_or_create_by(tmdb_id:)

# DailyQuote.find_or_create_by(date: '2024-10-13', quote: "We keep odd hours.", watch_title_id: near_dark.id)

# were_rabbit = WatchTitle.create_with(
#     tmdb_id: ,
#     imdb_id: ,
#     poster_path: ,
#     title: ,
#     release_date: ,
#     overview: ,
#     runtime: 
# ).find_or_create_by(tmdb_id:)

# DailyQuote.find_or_create_by(date: '2024-10-14', quote: "Aww. The bounce has gone from his bungee.", watch_title_id: were_rabbit.id)

# days_later = WatchTitle.create_with(
#     tmdb_id: 170,
#     imdb_id: "tt0289043",
#     poster_path: "/sQckQRt17VaWbo39GIu0TMOiszq.jpg",
#     title: "28 Days Later",
#     release_date: "2002-10-31",
#     overview: "Twenty-eight days after a killer virus was accidentally unleashed from a British research facility, a small group of London survivors are caught in a desperate struggle to protect themselves from the infected. Carried by animals and humans, the virus turns those it infects into homicidal maniacs -- and it's absolutely impossible to contain.",
#     runtime: 113
# ).find_or_create_by(tmdb_id:)

# DailyQuote.find_or_create_by(date: '2024-10-15', quote: "No, see, this is a really shit idea. You know why? Because it's really obviously a shit idea.", watch_title_id: days_later.id)