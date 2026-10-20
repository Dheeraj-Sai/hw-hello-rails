# Seed the RottenPotatoes DB with some movies.
# Uses find_or_create_by! to ensure seeding is idempotent (prevents duplicate data).

movies = [
  {
    title: 'My Neighbor Totoro',
    rating: 'G',
    description: 'Two young girls explore their country home and meet a friendly forest spirit.',
    release_date: '16-Apr-1988'
  },
  {
    title: 'Green Book',
    rating: 'PG-13',
    description: 'A working-class Italian-American bouncer becomes the driver of an African-American classical pianist on a tour of venues through the 1960s American South.',
    release_date: '16-Nov-2018'
  },
  {
    title: 'Parasite',
    rating: 'R',
    description: 'Greed and class discrimination threaten the newly formed symbiotic relationship between the wealthy Park family and the destitute Kim clan.',
    release_date: '30-May-2019'
  },
  {
    title: 'Nomadland',
    rating: 'R',
    description: 'A woman in her sixties embarks on a journey through the American West after losing everything in the Great Recession.',
    release_date: '19-Feb-2021'
  },
  {
    title: 'CODA',
    rating: 'PG-13',
    description: 'As a CODA (Child of Deaf Adults), Ruby is the only hearing person in her home.',
    release_date: '13-Aug-2021'
  },
  {
    title: 'Aladdin',
    rating: 'G',
    description: 'A kindhearted street urchin and a power-hungry Grand Vizier vie for a magic lamp.',
    release_date: '25-Nov-1992'
  },
  {
    title: 'The Terminator',
    rating: 'R',
    description: 'A cyborg assassin is sent back in time to kill Sarah Connor.',
    release_date: '26-Oct-1984'
  },
  {
    title: 'When Harry Met Sally',
    rating: 'R',
    description: 'Harry and Sally have known each other for years and fear sex would ruin friendship.',
    release_date: '21-Jul-1989'
  },
  {
    title: 'The Help',
    rating: 'PG-13',
    description: 'An aspiring author during the civil rights movement decides to write a book about African American maids.',
    release_date: '10-Aug-2011'
  },
  {
    title: 'Raiders of the Lost Ark',
    rating: 'PG',
    description: 'Archaeologist Indiana Jones races against Nazis to find the legendary Ark of the Covenant.',
    release_date: '12-Jun-1981'
  }
]

movies.each do |movie|
  Movie.find_or_create_by!(title: movie[:title]) do |m|
    m.rating = movie[:rating]
    m.description = movie[:description]
    m.release_date = movie[:release_date]
  end
end

puts "Database successfully seeded with #{Movie.count} movies."
