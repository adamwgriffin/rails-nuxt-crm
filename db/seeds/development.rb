contacts = [
  { first_name: "Ozzy", last_name: "Osbourne", notes: "Singer for Black Sabbath and solo artist." },
  { first_name: "James", last_name: "Hetfield", notes: "Singer/guitarist for Metallica." },
  { first_name: "Lars", last_name: "Ulrich", notes: "Drummer for Metallica." },
  { first_name: "Tony", last_name: "Iommi", notes: "Guitarist for Black Sabbath." },
  { first_name: "Bruce", last_name: "Dickinson", notes: "Singer for Iron Maiden." },
  { first_name: "Steve", last_name: "Harris", notes: "Bassist for Iron Maiden." },
  { first_name: "Rob", last_name: "Halford", notes: "Singer for Judas Priest." },
  { first_name: "Kirk", last_name: "Hammett", notes: "Guitarist for Metallica." },
  { first_name: "Dave", last_name: "Mustaine", notes: "Singer/guitarist for Megadeth, ex-Metallica." },
  { first_name: "Tom", last_name: "Araya", notes: "Singer/bassist for Slayer." },
  { first_name: "Kerry", last_name: "King", notes: "Guitarist for Slayer." },
  { first_name: "Phil", last_name: "Anselmo", notes: "Singer for Pantera." },
  { first_name: "Don", last_name: "Dokken", notes: "Singer for Dokken." },
  { first_name: "Peter", last_name: "Criss", notes: "Drummer for Kiss." },
  { first_name: "Jake", middle_name: "E.", last_name: "Lee", notes: "Former guitarist for Ozzy Osbourne." },
  { first_name: "Ronnie", last_name: "Dio", notes: "Singer for Dio, Black Sabbath, Rainbow." },
  { first_name: "Geezer", last_name: "Butler", notes: "Bassist for Black Sabbath." },
  { first_name: "Glenn", last_name: "Tipton", notes: "Guitarist for Judas Priest." },
  { first_name: "Angus", last_name: "Young", notes: "Guitarist for AC/DC." },
  { first_name: "Brian", last_name: "Johnson", notes: "Singer for AC/DC." }
]

contacts.each do |attrs|
  Contact.create!(attrs)
end
