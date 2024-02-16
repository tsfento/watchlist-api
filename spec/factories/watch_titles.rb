FactoryBot.define do
  factory :watch_title do
    tmdb_id { 1381 }
    imdb_id { 'tt0414993' }
    poster_path { '/tnmkVAYrHITpdKgmZ7CzVBEI4ho.jpg' }
    title { 'The Fountain' }
    release_date { '2006-11-22' }
    overview { 'Spanning over one thousand years, and three parallel stories, The Fountain is a story of love, death, spirituality, and the fragility of our existence in this world.' }
    runtime { 96 }
  end
end
