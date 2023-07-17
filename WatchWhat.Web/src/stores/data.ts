import type { MovieCategory } from "@models";

export const movieCategories: MovieCategory[] = [
  {
    title: 'Action',
    movies: [
      {
        title: 'The Dark Knight',
        posterPath: 'the_dark_knight.jpg',
        releaseDate: new Date('2008-07-18'),
        voteAverage: '8.3'
      },
      {
        title: 'Gladiator',
        posterPath: 'gladiator.jpg',
        releaseDate: new Date('2000-05-05'),
        voteAverage: '8.5'
      },
      {
        title: 'Inception',
        posterPath: 'inception.jpg',
        releaseDate: new Date('2010-07-16'),
        voteAverage: '8.8'
      },
      {
        title: 'Mad Max: Fury Road',
        posterPath: 'mad_max_fury_road.jpg',
        releaseDate: new Date('2015-05-15'),
        voteAverage: '8.1'
      },
      {
        title: 'Die Hard',
        posterPath: 'die_hard.jpg',
        releaseDate: new Date('1988-07-15'),
        voteAverage: '8.2'
      },
      {
        title: 'John Wick',
        posterPath: 'john_wick.jpg',
        releaseDate: new Date('2014-10-24'),
        voteAverage: '7.4'
      },
      {
        title: 'Mission: Impossible - Fallout',
        posterPath: 'mission_impossible_fallout.jpg',
        releaseDate: new Date('2018-07-27'),
        voteAverage: '7.7'
      },
      {
        title: 'Black Panther',
        posterPath: 'black_panther.jpg',
        releaseDate: new Date('2018-02-16'),
        voteAverage: '7.3'
      },
      {
        title: 'The Terminator',
        posterPath: 'the_terminator.jpg',
        releaseDate: new Date('1984-10-26'),
        voteAverage: '8.0'
      },
      {
        title: 'Kill Bill',
        posterPath: 'kill_bill.jpg',
        releaseDate: new Date('2003-10-10'),
        voteAverage: '8.1'
      }
    ]
  },
  {
    title: 'Comedy',
    movies: [
      {
        title: 'The Hangover',
        posterPath: 'the_hangover.jpg',
        releaseDate: new Date('2009-06-05'),
        voteAverage: '7.7'
      },
      {
        title: 'Superbad',
        posterPath: 'superbad.jpg',
        releaseDate: new Date('2007-08-17'),
        voteAverage: '7.6'
      },
      {
        title: 'Bridesmaids',
        posterPath: 'bridesmaids.jpg',
        releaseDate: new Date('2011-05-13'),
        voteAverage: '6.8'
      },
      {
        title: 'Anchorman: The Legend of Ron Burgundy',
        posterPath: 'anchorman.jpg',
        releaseDate: new Date('2004-07-09'),
        voteAverage: '7.2'
      },
      {
        title: 'Airplane!',
        posterPath: 'airplane.jpg',
        releaseDate: new Date('1980-07-02'),
        voteAverage: '7.7'
      },
      {
        title: 'Monty Python and the Holy Grail',
        posterPath: 'monty_python.jpg',
        releaseDate: new Date('1975-05-25'),
        voteAverage: '8.2'
      },
      {
        title: 'Shaun of the Dead',
        posterPath: 'shaun_of_the_dead.jpg',
        releaseDate: new Date('2004-04-09'),
        voteAverage: '7.9'
      },
      {
        title: 'Napoleon Dynamite',
        posterPath: 'napoleon_dynamite.jpg',
        releaseDate: new Date('2004-06-11'),
        voteAverage: '6.9'
      },
      {
        title: 'Dumb and Dumber',
        posterPath: 'dumb_and_dumber.jpg',
        releaseDate: new Date('1994-12-16'),
        voteAverage: '7.3'
      },
      {
        title: 'Zoolander',
        posterPath: 'zoolander.jpg',
        releaseDate: new Date('2001-09-28'),
        voteAverage: '6.6'
      }
    ]
  },
  {
    title: 'Drama',
    movies: [
      {
        title: 'The Shawshank Redemption',
        posterPath: 'the_shawshank_redemption.jpg',
        releaseDate: new Date('1994-09-23'),
        voteAverage: '9.3'
      },
      {
        title: 'Forrest Gump',
        posterPath: 'forrest_gump.jpg',
        releaseDate: new Date('1994-07-06'),
        voteAverage: '8.8'
      },
      {
        title: 'The Godfather',
        posterPath: 'the_godfather.jpg',
        releaseDate: new Date('1972-03-24'),
        voteAverage: '9.2'
      },
      {
        title: "Schindler's List",
        posterPath: 'schindlers_list.jpg',
        releaseDate: new Date('1993-11-30'),
        voteAverage: '8.9'
      },
      {
        title: 'The Green Mile',
        posterPath: 'the_green_mile.jpg',
        releaseDate: new Date('1999-12-10'),
        voteAverage: '8.6'
      },
      {
        title: 'Good Will Hunting',
        posterPath: 'good_will_hunting.jpg',
        releaseDate: new Date('1997-12-05'),
        voteAverage: '8.3'
      },
      {
        title: 'The Pursuit of Happyness',
        posterPath: 'the_pursuit_of_happyness.jpg',
        releaseDate: new Date('2006-12-15'),
        voteAverage: '8.0'
      },
      {
        title: 'A Beautiful Mind',
        posterPath: 'a_beautiful_mind.jpg',
        releaseDate: new Date('2001-12-21'),
        voteAverage: '8.2'
      },
      {
        title: 'The Departed',
        posterPath: 'the_departed.jpg',
        releaseDate: new Date('2006-10-06'),
        voteAverage: '8.5'
      },
      {
        title: 'The Pianist',
        posterPath: 'the_pianist.jpg',
        releaseDate: new Date('2002-09-17'),
        voteAverage: '8.5'
      }
    ]
  },
  {
    title: 'Horror',
    movies: [
      {
        title: 'The Shining',
        posterPath: 'the_shining.jpg',
        releaseDate: new Date('1980-05-23'),
        voteAverage: '8.4'
      },
      {
        title: 'The Exorcist',
        posterPath: 'the_exorcist.jpg',
        releaseDate: new Date('1973-12-26'),
        voteAverage: '8.0'
      },
      {
        title: 'Psycho',
        posterPath: 'psycho.jpg',
        releaseDate: new Date('1960-09-08'),
        voteAverage: '8.5'
      },
      {
        title: 'Get Out',
        posterPath: 'get_out.jpg',
        releaseDate: new Date('2017-02-24'),
        voteAverage: '7.7'
      },
      {
        title: 'Hereditary',
        posterPath: 'hereditary.jpg',
        releaseDate: new Date('2018-06-08'),
        voteAverage: '7.3'
      },
      {
        title: 'A Nightmare on Elm Street',
        posterPath: 'a_nightmare_on_elm_street.jpg',
        releaseDate: new Date('1984-11-09'),
        voteAverage: '7.5'
      },
      {
        title: 'The Conjuring',
        posterPath: 'the_conjuring.jpg',
        releaseDate: new Date('2013-07-19'),
        voteAverage: '7.5'
      },
      {
        title: 'It',
        posterPath: 'it.jpg',
        releaseDate: new Date('2017-09-08'),
        voteAverage: '7.3'
      },
      {
        title: 'The Texas Chain Saw Massacre',
        posterPath: 'texas_chain_saw_massacre.jpg',
        releaseDate: new Date('1974-10-01'),
        voteAverage: '7.5'
      },
      {
        title: 'Scream',
        posterPath: 'scream.jpg',
        releaseDate: new Date('1996-12-20'),
        voteAverage: '7.3'
      }
    ]
  },
  {
    title: 'Adventure',
    movies: [
      {
        title: 'Raiders of the Lost Ark',
        posterPath: 'raiders_of_the_lost_ark.jpg',
        releaseDate: new Date('1981-06-12'),
        voteAverage: '8.4'
      },
      {
        title: 'Jurassic Park',
        posterPath: 'jurassic_park.jpg',
        releaseDate: new Date('1993-06-11'),
        voteAverage: '8.1'
      },
      {
        title: 'Indiana Jones and the Last Crusade',
        posterPath: 'indiana_jones_last_crusade.jpg',
        releaseDate: new Date('1989-05-24'),
        voteAverage: '8.2'
      },
      {
        title: 'Avatar',
        posterPath: 'avatar.jpg',
        releaseDate: new Date('2009-12-18'),
        voteAverage: '7.8'
      },
      {
        title: 'Star Wars: Episode IV - A New Hope',
        posterPath: 'star_wars_a_new_hope.jpg',
        releaseDate: new Date('1977-05-25'),
        voteAverage: '8.6'
      },
      {
        title: 'The Lord of the Rings: The Fellowship of the Ring',
        posterPath: 'lotr_fellowship_of_the_ring.jpg',
        releaseDate: new Date('2001-12-19'),
        voteAverage: '8.8'
      },
      {
        title: 'Pirates of the Caribbean: The Curse of the Black Pearl',
        posterPath: 'pirates_of_the_caribbean.jpg',
        releaseDate: new Date('2003-07-09'),
        voteAverage: '7.7'
      },
      {
        title: 'The Lion King',
        posterPath: 'the_lion_king.jpg',
        releaseDate: new Date('1994-06-15'),
        voteAverage: '8.5'
      },
      {
        title: 'The Revenant',
        posterPath: 'the_revenant.jpg',
        releaseDate: new Date('2015-12-25'),
        voteAverage: '7.6'
      },
      {
        title: 'Indiana Jones and the Temple of Doom',
        posterPath: 'indiana_jones_temple_of_doom.jpg',
        releaseDate: new Date('1984-05-23'),
        voteAverage: '7.6'
      }
    ]
  },
  {
    title: 'Fantasy',
    movies: [
      {
        title: "Harry Potter and the Sorcerer's Stone",
        posterPath: 'harry_potter_sorcerers_stone.jpg',
        releaseDate: new Date('2001-11-16'),
        voteAverage: '7.6'
      },
      {
        title: 'The Lord of the Rings: The Two Towers',
        posterPath: 'lotr_two_towers.jpg',
        releaseDate: new Date('2002-12-18'),
        voteAverage: '8.7'
      },
      {
        title: 'Harry Potter and the Prisoner of Azkaban',
        posterPath: 'harry_potter_prisoner_of_azkaban.jpg',
        releaseDate: new Date('2004-05-31'),
        voteAverage: '7.9'
      },
      {
        title: 'Alice in Wonderland',
        posterPath: 'alice_in_wonderland.jpg',
        releaseDate: new Date('2010-03-05'),
        voteAverage: '6.4'
      },
      {
        title: 'Harry Potter and the Goblet of Fire',
        posterPath: 'harry_potter_goblet_of_fire.jpg',
        releaseDate: new Date('2005-11-18'),
        voteAverage: '7.7'
      },
      {
        title: 'Harry Potter and the Deathly Hallows: Part 2',
        posterPath: 'harry_potter_deathly_hallows_part_2.jpg',
        releaseDate: new Date('2011-07-15'),
        voteAverage: '8.1'
      },
      {
        title: 'The Chronicles of Narnia: The Lion, the Witch and the Wardrobe',
        posterPath: 'narnia_lion_witch_wardrobe.jpg',
        releaseDate: new Date('2005-12-09'),
        voteAverage: '6.9'
      },
      {
        title: 'The Lord of the Rings: The Return of the King',
        posterPath: 'lotr_return_of_the_king.jpg',
        releaseDate: new Date('2003-12-17'),
        voteAverage: '8.9'
      },
      {
        title: 'Harry Potter and the Half-Blood Prince',
        posterPath: 'harry_potter_half_blood_prince.jpg',
        releaseDate: new Date('2009-07-15'),
        voteAverage: '7.7'
      },
      {
        title: 'The Chronicles of Narnia: Prince Caspian',
        posterPath: 'narnia_prince_caspian.jpg',
        releaseDate: new Date('2008-05-16'),
        voteAverage: '6.5'
      }
    ]
  },
  {
    title: 'Romance',
    movies: [
      {
        title: 'The Notebook',
        posterPath: 'the_notebook.jpg',
        releaseDate: new Date('2004-06-25'),
        voteAverage: '7.8'
      },
      {
        title: 'La La Land',
        posterPath: 'la_la_land.jpg',
        releaseDate: new Date('2016-12-09'),
        voteAverage: '8.0'
      },
      {
        title: 'Titanic',
        posterPath: 'titanic.jpg',
        releaseDate: new Date('1997-12-19'),
        voteAverage: '7.8'
      },
      {
        title: 'The Fault in Our Stars',
        posterPath: 'the_fault_in_our_stars.jpg',
        releaseDate: new Date('2014-06-06'),
        voteAverage: '7.7'
      },
      {
        title: 'Pride & Prejudice',
        posterPath: 'pride_and_prejudice.jpg',
        releaseDate: new Date('2005-11-11'),
        voteAverage: '7.8'
      },
      {
        title: 'Before Sunrise',
        posterPath: 'before_sunrise.jpg',
        releaseDate: new Date('1995-01-27'),
        voteAverage: '8.1'
      },
      {
        title: 'The Great Gatsby',
        posterPath: 'the_great_gatsby.jpg',
        releaseDate: new Date('2013-05-10'),
        voteAverage: '7.2'
      },
      {
        title: '500 Days of Summer',
        posterPath: '500_days_of_summer.jpg',
        releaseDate: new Date('2009-07-17'),
        voteAverage: '7.7'
      },
      {
        title: 'Love Actually',
        posterPath: 'love_actually.jpg',
        releaseDate: new Date('2003-11-07'),
        voteAverage: '7.6'
      },
      {
        title: 'Eternal Sunshine of the Spotless Mind',
        posterPath: 'eternal_sunshine_of_the_spotless_mind.jpg',
        releaseDate: new Date('2004-03-19'),
        voteAverage: '8.3'
      }
    ]
  },
  {
    title: 'Animation',
    movies: [
      {
        title: 'Toy Story',
        posterPath: 'toy_story.jpg',
        releaseDate: new Date('1995-11-22'),
        voteAverage: '8.3'
      },
      {
        title: 'Finding Nemo',
        posterPath: 'finding_nemo.jpg',
        releaseDate: new Date('2003-05-30'),
        voteAverage: '8.1'
      },
      {
        title: 'The Lion King',
        posterPath: 'the_lion_king.jpg',
        releaseDate: new Date('1994-06-15'),
        voteAverage: '8.5'
      },
      {
        title: 'Inside Out',
        posterPath: 'inside_out.jpg',
        releaseDate: new Date('2015-06-19'),
        voteAverage: '8.0'
      },
      {
        title: 'Frozen',
        posterPath: 'frozen.jpg',
        releaseDate: new Date('2013-11-27'),
        voteAverage: '7.5'
      },
      {
        title: 'Shrek',
        posterPath: 'shrek.jpg',
        releaseDate: new Date('2001-05-18'),
        voteAverage: '7.9'
      },
      {
        title: 'Wall-E',
        posterPath: 'wall_e.jpg',
        releaseDate: new Date('2008-06-27'),
        voteAverage: '8.4'
      },
      {
        title: 'Zootopia',
        posterPath: 'zootopia.jpg',
        releaseDate: new Date('2016-03-04'),
        voteAverage: '7.7'
      },
      {
        title: 'Coco',
        posterPath: 'coco.jpg',
        releaseDate: new Date('2017-11-22'),
        voteAverage: '8.4'
      },
      {
        title: 'Ratatouille',
        posterPath: 'ratatouille.jpg',
        releaseDate: new Date('2007-06-29'),
        voteAverage: '8.0'
      }
    ]
  }
];