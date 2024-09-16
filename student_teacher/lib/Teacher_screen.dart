import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:student_teacher/Homepage.dart';

import 'TeacherProfile.dart';

class Subject {
  final String name;
  Subject(this.name);
}

class University {
  final String name;
  final List<Subject> subjects;
  University(this.name, this.subjects);
}

class City {
  final String name;
  final List<University> universities;
  City(this.name, this.universities);
}

class Country {
  final String name;
  final List<City> cities;
  Country(this.name, this.cities);
}

class TeacherScreen extends StatefulWidget {
  @override
  _UniversitySearchScreenState createState() => _UniversitySearchScreenState();
}

class _UniversitySearchScreenState extends State<TeacherScreen> {
  List<Country> countries = [


    Country(
      'United Kingdom',
      [
        City(
          'London',
          [
            University('University College London', [
              Subject('Computer Science'),
              Subject('Economics'),
              Subject('Engineering'),
              Subject('Law'),
              Subject('Medicine'),
            ]),
            University('Imperial College London', [
              Subject('Biochemistry'),
              Subject('Physics'),
              Subject('Civil Engineering'),
              Subject('Data Science'),
              Subject('Mechanical Engineering'),
            ]),
          ],
        ),
        City(
          'Oxford',
          [
            University('University of Oxford', [
              Subject('Philosophy'),
              Subject('History'),
              Subject('Physics'),
              Subject('Law'),
              Subject('Mathematics'),
            ]),
          ],
        ),
        City(
          'Cambridge',
          [
            University('University of Cambridge', [
              Subject('Mathematics'),
              Subject('Biology'),
              Subject('Computer Science'),
              Subject('Philosophy'),
              Subject('Law'),
            ]),
          ],
        ),
        City(
          'Manchester',
          [
            University('University of Manchester', [
              Subject('Medicine'),
              Subject('Biochemistry'),
              Subject('Physics'),
              Subject('Economics'),
              Subject('Engineering'),
            ]),
            University('Manchester Metropolitan University', [
              Subject('Architecture'),
              Subject('Business Management'),
              Subject('Fashion Design'),
              Subject('Computer Science'),
              Subject('Media Studies'),
            ]),
          ],
        ),
        City(
          'Edinburgh',
          [
            University('University of Edinburgh', [
              Subject('Artificial Intelligence'),
              Subject('Economics'),
              Subject('Engineering'),
              Subject('Law'),
              Subject('Medicine'),
            ]),
            University('Heriot-Watt University', [
              Subject('Actuarial Science'),
              Subject('Robotics'),
              Subject('Energy Engineering'),
              Subject('Physics'),
              Subject('Architecture'),
            ]),
          ],
        ),
        City(
          'Bristol',
          [
            University('University of Bristol', [
              Subject('Physics'),
              Subject('Engineering'),
              Subject('Law'),
              Subject('Biology'),
              Subject('Mathematics'),
            ]),
          ],
        ),
        City(
          'Glasgow',
          [
            University('University of Glasgow', [
              Subject('Veterinary Medicine'),
              Subject('Law'),
              Subject('Engineering'),
              Subject('Theology'),
              Subject('Dentistry'),
            ]),
            University('Glasgow Caledonian University', [
              Subject('Fashion Marketing'),
              Subject('Optometry'),
              Subject('Computing'),
              Subject('Psychology'),
              Subject('Sports Science'),
            ]),
          ],
        ),
      ],
    ),
    Country(
      'Germany',
      [
        City(
          'Berlin',
          [
            University('Humboldt University of Berlin', [
              Subject('Computer Science'),
              Subject('Political Science'),
              Subject('History'),
              Subject('Biology'),
              Subject('Law'),
            ]),
            University('Technical University of Berlin', [
              Subject('Electrical Engineering'),
              Subject('Architecture'),
              Subject('Computer Engineering'),
              Subject('Physics'),
              Subject('Mathematics'),
            ]),
          ],
        ),
        City(
          'Munich',
          [
            University('Ludwig Maximilian University of Munich', [
              Subject('Medicine'),
              Subject('Physics'),
              Subject('Economics'),
              Subject('Law'),
              Subject('Philosophy'),
            ]),
            University('Technical University of Munich', [
              Subject('Mechanical Engineering'),
              Subject('Informatics'),
              Subject('Architecture'),
              Subject('Chemical Engineering'),
              Subject('Environmental Science'),
            ]),
          ],
        ),
        City(
          'Frankfurt',
          [
            University('Goethe University Frankfurt', [
              Subject('Finance'),
              Subject('Law'),
              Subject('Political Science'),
              Subject('Biology'),
              Subject('Computer Science'),
            ]),
            University('Frankfurt University of Applied Sciences', [
              Subject('Engineering'),
              Subject('Business Administration'),
              Subject('Social Work'),
              Subject('Architecture'),
              Subject('Health Management'),
            ]),
          ],
        ),
        City(
          'Hamburg',
          [
            University('University of Hamburg', [
              Subject('Medicine'),
              Subject('Economics'),
              Subject('Law'),
              Subject('Physics'),
              Subject('Informatics'),
            ]),
            University('Hamburg University of Technology', [
              Subject('Mechanical Engineering'),
              Subject('Biotechnology'),
              Subject('Naval Architecture'),
              Subject('Computer Science'),
              Subject('Logistics'),
            ]),
          ],
        ),
        City(
          'Stuttgart',
          [
            University('University of Stuttgart', [
              Subject('Automotive Engineering'),
              Subject('Aerospace Engineering'),
              Subject('Architecture'),
              Subject('Urban Planning'),
              Subject('Mechanical Engineering'),
            ]),
            University('Stuttgart Media University', [
              Subject('Media Studies'),
              Subject('Digital Publishing'),
              Subject('Advertising'),
              Subject('Photography'),
              Subject('Computer Science'),
            ]),
          ],
        ),
        City(
          'Cologne',
          [
            University('University of Cologne', [
              Subject('Law'),
              Subject('Business Administration'),
              Subject('Physics'),
              Subject('Psychology'),
              Subject('Sociology'),
            ]),
            University('Cologne University of Applied Sciences', [
              Subject('Architecture'),
              Subject('Media Technology'),
              Subject('Renewable Energy'),
              Subject('Social Work'),
              Subject('Automotive Engineering'),
            ]),
          ],
        ),
      ],
    ),
    Country(
      'France',
      [
        City(
          'Paris',
          [
            University('Sorbonne University', [
              Subject('Literature'),
              Subject('Physics'),
              Subject('Chemistry'),
              Subject('Law'),
              Subject('Philosophy'),
            ]),
            University('École Polytechnique', [
              Subject('Applied Mathematics'),
              Subject('Computer Science'),
              Subject('Economics'),
              Subject('Mechanical Engineering'),
              Subject('Data Science'),
            ]),
          ],
        ),
        City(
          'Lyon',
          [
            University('Lyon 1 University', [
              Subject('Biochemistry'),
              Subject('Pharmacy'),
              Subject('Mechanical Engineering'),
              Subject('Physics'),
              Subject('Computer Science'),
            ]),
          ],
        ),
        City(
          'Marseille',
          [
            University('Aix-Marseille University', [
              Subject('Marine Biology'),
              Subject('Law'),
              Subject('Medicine'),
              Subject('Economics'),
              Subject('Physics'),
            ]),
          ],
        ),
        City(
          'Bordeaux',
          [
            University('University of Bordeaux', [
              Subject('Wine Science'),
              Subject('Neuroscience'),
              Subject('Law'),
              Subject('Business Administration'),
              Subject('Psychology'),
            ]),
          ],
        ),
        City(
          'Nice',
          [
            University('University of Nice Sophia Antipolis', [
              Subject('Information Technology'),
              Subject('Economics'),
              Subject('Engineering'),
              Subject('Law'),
              Subject('Arts and Humanities'),
            ]),
          ],
        ),
        City(
          'Toulouse',
          [
            University('Toulouse 1 University Capitole', [
              Subject('Law'),
              Subject('Economics'),
              Subject('Political Science'),
              Subject('Computer Science'),
              Subject('Mathematics'),
            ]),
          ],
        ),
      ],
    ),
    Country(
      'Italy',
      [
        City(
          'Rome',
          [
            University('Sapienza University of Rome', [
              Subject('Architecture'),
              Subject('Engineering'),
              Subject('Philosophy'),
              Subject('Medicine'),
              Subject('Law'),
            ]),
            University('Roma Tre University', [
              Subject('Economics'),
              Subject('Physics'),
              Subject('Psychology'),
              Subject('Political Science'),
              Subject('Mathematics'),
            ]),
          ],
        ),
        City(
          'Milan',
          [
            University('University of Milan', [
              Subject('Law'),
              Subject('Medicine'),
              Subject('Physics'),
              Subject('Computer Science'),
              Subject('Biotechnology'),
            ]),
            University('Politecnico di Milano', [
              Subject('Architecture'),
              Subject('Mechanical Engineering'),
              Subject('Civil Engineering'),
              Subject('Design'),
              Subject('Information Technology'),
            ]),
          ],
        ),
        City(
          'Florence',
          [
            University('University of Florence', [
              Subject('Art History'),
              Subject('Engineering'),
              Subject('Law'),
              Subject('Medicine'),
              Subject('Philosophy'),
            ]),
          ],
        ),
        City(
          'Venice',
          [
            University('Ca\' Foscari University of Venice', [
              Subject('Economics'),
              Subject('Languages'),
              Subject('History'),
              Subject('Environmental Science'),
              Subject('Management'),
            ]),
          ],
        ),
        City(
          'Naples',
          [
            University('University of Naples Federico II', [
              Subject('Physics'),
              Subject('Engineering'),
              Subject('Law'),
              Subject('Medicine'),
              Subject('Mathematics'),
            ]),
          ],
        ),
        City(
          'Turin',
          [
            University('University of Turin', [
              Subject('Philosophy'),
              Subject('Law'),
              Subject('Biology'),
              Subject('Physics'),
              Subject('Economics'),
            ]),
            University('Polytechnic University of Turin', [
              Subject('Architecture'),
              Subject('Automotive Engineering'),
              Subject('Computer Engineering'),
              Subject('Mechanical Engineering'),
              Subject('Urban Planning'),
            ]),
          ],
        ),
      ],
    ),
    Country(
      'Spain',
      [
        City(
          'Madrid',
          [
            University('Complutense University of Madrid', [
              Subject('Law'),
              Subject('Medicine'),
              Subject('Political Science'),
              Subject('Biology'),
              Subject('Economics'),
            ]),
            University('Technical University of Madrid', [
              Subject('Computer Science'),
              Subject('Engineering'),
              Subject('Architecture'),
              Subject('Mathematics'),
              Subject('Industrial Engineering'),
            ]),
          ],
        ),
        City(
          'Barcelona',
          [
            University('University of Barcelona', [
              Subject('Medicine'),
              Subject('Economics'),
              Subject('Psychology'),
              Subject('Law'),
              Subject('Physics'),
            ]),
            University('Polytechnic University of Catalonia', [
              Subject('Engineering'),
              Subject('Architecture'),
              Subject('Computer Science'),
              Subject('Industrial Design'),
              Subject('Telecommunications'),
            ]),
          ],
        ),
        City(
          'Valencia',
          [
            University('University of Valencia', [
              Subject('Biotechnology'),
              Subject('Law'),
              Subject('Computer Science'),
              Subject('Pharmacy'),
              Subject('History'),
            ]),
          ],
        ),
        City(
          'Seville',
          [
            University('University of Seville', [
              Subject('Engineering'),
              Subject('Law'),
              Subject('Psychology'),
              Subject('History'),
              Subject('Mathematics'),
            ]),
            University('Pablo de Olavide University', [
              Subject('Business Administration'),
              Subject('Law'),
              Subject('Environmental Science'),
              Subject('Sociology'),
              Subject('Education'),
            ]),
          ],
        ),
        City(
          'Bilbao',
          [
            University('University of the Basque Country', [
              Subject('Engineering'),
              Subject('Philosophy'),
              Subject('Economics'),
              Subject('Law'),
              Subject('Biology'),
            ]),
          ],
        ),
        City(
          'Granada',
          [
            University('University of Granada', [
              Subject('Computer Science'),
              Subject('Law'),
              Subject('Medicine'),
              Subject('History'),
              Subject('Economics'),
            ]),
          ],
        ),
      ],
    ),
    Country(
      'Netherlands',
      [
        City(
          'Amsterdam',
          [
            University('University of Amsterdam', [
              Subject('Law'),
              Subject('Economics'),
              Subject('Psychology'),
              Subject('Physics'),
              Subject('Computer Science'),
            ]),
            University('Vrije Universiteit Amsterdam', [
              Subject('Artificial Intelligence'),
              Subject('Philosophy'),
              Subject('Business Administration'),
              Subject('Engineering'),
              Subject('Sociology'),
            ]),
          ],
        ),
        City(
          'Rotterdam',
          [
            University('Erasmus University Rotterdam', [
              Subject('Business Administration'),
              Subject('Economics'),
              Subject('Law'),
              Subject('Health Sciences'),
              Subject('Public Administration'),
            ]),
          ],
        ),
        City(
          'Utrecht',
          [
            University('Utrecht University', [
              Subject('Environmental Sciences'),
              Subject('Physics'),
              Subject('Law'),
              Subject('Geography'),
              Subject('Mathematics'),
            ]),
          ],
        ),
        City(
          'Leiden',
          [
            University('Leiden University', [
              Subject('Law'),
              Subject('History'),
              Subject('Medicine'),
              Subject('Linguistics'),
              Subject('Physics'),
            ]),
          ],
        ),
        City(
          'Maastricht',
          [
            University('Maastricht University', [
              Subject('International Business'),
              Subject('Law'),
              Subject('Cultural Studies'),
              Subject('Psychology'),
              Subject('Health Sciences'),
            ]),
          ],
        ),
        City(
          'Groningen',
          [
            University('University of Groningen', [
              Subject('Mathematics'),
              Subject('Physics'),
              Subject('Law'),
              Subject('Economics'),
              Subject('Psychology'),
            ]),
          ],
        ),
      ],
    ),
    Country(
      'Sweden',
      [
        City(
          'Stockholm',
          [
            University('Karolinska Institute', [
              Subject('Medicine'),
              Subject('Biomedicine'),
              Subject('Public Health'),
              Subject('Clinical Research'),
              Subject('Pharmacy'),
            ]),
            University('Stockholm University', [
              Subject('Economics'),
              Subject('Physics'),
              Subject('Chemistry'),
              Subject('Psychology'),
              Subject('Sociology'),
            ]),
          ],
        ),
        City(
          'Gothenburg',
          [
            University('University of Gothenburg', [
              Subject('Education'),
              Subject('International Relations'),
              Subject('Design'),
              Subject('Biology'),
              Subject('Engineering'),
            ]),
          ],
        ),
        City(
          'Uppsala',
          [
            University('Uppsala University', [
              Subject('Medicine'),
              Subject('Law'),
              Subject('Physics'),
              Subject('Biochemistry'),
              Subject('Mathematics'),
            ]),
          ],
        ),
        City(
          'Lund',
          [
            University('Lund University', [
              Subject('Engineering'),
              Subject('Physics'),
              Subject('Mathematics'),
              Subject('Economics'),
              Subject('Computer Science'),
            ]),
          ],
        ),
        City(
          'Linköping',
          [
            University('Linköping University', [
              Subject('Computer Science'),
              Subject('Engineering'),
              Subject('Education'),
              Subject('Medical Science'),
              Subject('Social Science'),
            ]),
          ],
        ),
        City(
          'Örebro',
          [
            University('Örebro University', [
              Subject('Business Administration'),
              Subject('Law'),
              Subject('Health Sciences'),
              Subject('Engineering'),
              Subject('Psychology'),
            ]),
          ],
        ),
      ],
    ),
    Country(
      'Switzerland',
      [
        City(
          'Zurich',
          [
            University('ETH Zurich', [
              Subject('Engineering'),
              Subject('Computer Science'),
              Subject('Physics'),
              Subject('Architecture'),
              Subject('Mathematics'),
            ]),
            University('University of Zurich', [
              Subject('Law'),
              Subject('Economics'),
              Subject('Psychology'),
              Subject('History'),
              Subject('Biology'),
            ]),
          ],
        ),
        City(
          'Geneva',
          [
            University('University of Geneva', [
              Subject('International Relations'),
              Subject('Law'),
              Subject('Philosophy'),
              Subject('Economics'),
              Subject('Medicine'),
            ]),
            University('Geneva School of Economics and Management', [
              Subject('Finance'),
              Subject('Economics'),
              Subject('Business Administration'),
              Subject('Management'),
              Subject('Marketing'),
            ]),
          ],
        ),
        City(
          'Lausanne',
          [
            University('École polytechnique fédérale de Lausanne (EPFL)', [
              Subject('Engineering'),
              Subject('Architecture'),
              Subject('Computer Science'),
              Subject('Biotechnology'),
              Subject('Materials Science'),
            ]),
            University('University of Lausanne', [
              Subject('Law'),
              Subject('Economics'),
              Subject('History'),
              Subject('Psychology'),
              Subject('Sociology'),
            ]),
          ],
        ),
        City(
          'Basel',
          [
            University('University of Basel', [
              Subject('Medicine'),
              Subject('Pharmacy'),
              Subject('Law'),
              Subject('Biology'),
              Subject('Physics'),
            ]),
          ],
        ),
        City(
          'St. Gallen',
          [
            University('University of St. Gallen', [
              Subject('Business Administration'),
              Subject('Economics'),
              Subject('Law'),
              Subject('International Affairs'),
              Subject('Finance'),
            ]),
          ],
        ),
        City(
          'Fribourg',
          [
            University('University of Fribourg', [
              Subject('Law'),
              Subject('Economics'),
              Subject('Social Sciences'),
              Subject('Education'),
              Subject('Psychology'),
            ]),
          ],
        ),
      ],
    ),
    Country(
      'Austria',
      [
        City(
          'Vienna',
          [
            University('University of Vienna', [
              Subject('Law'),
              Subject('Economics'),
              Subject('History'),
              Subject('Political Science'),
              Subject('Physics'),
            ]),
            University('Vienna University of Technology', [
              Subject('Engineering'),
              Subject('Computer Science'),
              Subject('Mathematics'),
              Subject('Architecture'),
              Subject('Civil Engineering'),
            ]),
          ],
        ),
        City(
          'Graz',
          [
            University('University of Graz', [
              Subject('Law'),
              Subject('History'),
              Subject('Biology'),
              Subject('Physics'),
              Subject('Chemistry'),
            ]),
            University('Graz University of Technology', [
              Subject('Engineering'),
              Subject('Computer Science'),
              Subject('Mathematics'),
              Subject('Mechanical Engineering'),
              Subject('Environmental Science'),
            ]),
          ],
        ),
        City(
          'Linz',
          [
            University('Johannes Kepler University Linz', [
              Subject('Computer Science'),
              Subject('Economics'),
              Subject('Law'),
              Subject('Social Sciences'),
              Subject('Engineering'),
            ]),
          ],
        ),
        City(
          'Salzburg',
          [
            University('University of Salzburg', [
              Subject('Cultural Studies'),
              Subject('Law'),
              Subject('Psychology'),
              Subject('History'),
              Subject('Philosophy'),
            ]),
          ],
        ),
        City(
          'Innsbruck',
          [
            University('University of Innsbruck', [
              Subject('Physics'),
              Subject('Law'),
              Subject('Economics'),
              Subject('Geography'),
              Subject('Medicine'),
            ]),
          ],
        ),
        City(
          'Klagenfurt',
          [
            University('University of Klagenfurt', [
              Subject('Business Administration'),
              Subject('Cultural Studies'),
              Subject('IT Management'),
              Subject('Media and Communications'),
              Subject('Environmental Science'),
            ]),
          ],
        ),
      ],
    ),
    Country(
      'Belgium',
      [
        City(
          'Brussels',
          [
            University('Université libre de Bruxelles', [
              Subject('Political Science'),
              Subject('Law'),
              Subject('Engineering'),
              Subject('Economics'),
              Subject('Social Sciences'),
            ]),
            University('Vrije Universiteit Brussel', [
              Subject('Physics'),
              Subject('Engineering'),
              Subject('Business Administration'),
              Subject('Law'),
              Subject('Biomedical Sciences'),
            ]),
          ],
        ),
        City(
          'Antwerp',
          [
            University('University of Antwerp', [
              Subject('Law'),
              Subject('Economics'),
              Subject('Engineering'),
              Subject('Arts'),
              Subject('Social Sciences'),
            ]),
          ],
        ),
        City(
          'Ghent',
          [
            University('Ghent University', [
              Subject('Biology'),
              Subject('Engineering'),
              Subject('Law'),
              Subject('Philosophy'),
              Subject('Economics'),
            ]),
          ],
        ),
        City(
          'Leuven',
          [
            University('KU Leuven', [
              Subject('Engineering'),
              Subject('Theology'),
              Subject('Law'),
              Subject('Medicine'),
              Subject('Philosophy'),
            ]),
          ],
        ),
        City(
          'Liege',
          [
            University('University of Liège', [
              Subject('Economics'),
              Subject('Law'),
              Subject('Engineering'),
              Subject('Mathematics'),
              Subject('Physics'),
            ]),
          ],
        ),
        City(
          'Namur',
          [
            University('University of Namur', [
              Subject('Law'),
              Subject('Psychology'),
              Subject('Management'),
              Subject('Sociology'),
              Subject('Computer Science'),
            ]),
          ],
        ),
      ],
    ),
    Country(
      'Denmark',
      [
        City(
          'Copenhagen',
          [
            University('University of Copenhagen', [
              Subject('Medicine'),
              Subject('Law'),
              Subject('Economics'),
              Subject('Biology'),
              Subject('Psychology'),
            ]),
            University('Technical University of Denmark', [
              Subject('Engineering'),
              Subject('Computer Science'),
              Subject('Physics'),
              Subject('Mathematics'),
              Subject('Sustainable Energy'),
            ]),
          ],
        ),
        City(
          'Aarhus',
          [
            University('Aarhus University', [
              Subject('Business Administration'),
              Subject('Law'),
              Subject('Engineering'),
              Subject('Political Science'),
              Subject('Economics'),
            ]),
          ],
        ),
        City(
          'Odense',
          [
            University('University of Southern Denmark', [
              Subject('Engineering'),
              Subject('Computer Science'),
              Subject('Biology'),
              Subject('Health Sciences'),
              Subject('Sociology'),
            ]),
          ],
        ),
        City(
          'Aalborg',
          [
            University('Aalborg University', [
              Subject('Engineering'),
              Subject('Information Technology'),
              Subject('Architecture'),
              Subject('Social Sciences'),
              Subject('Energy Technology'),
            ]),
          ],
        ),
        City(
          'Esbjerg',
          [
            University('University of Southern Denmark - Esbjerg', [
              Subject('Engineering'),
              Subject('Marine Engineering'),
              Subject('Business Studies'),
              Subject('Health Studies'),
              Subject('Environmental Science'),
            ]),
          ],
        ),
        City(
          'Roskilde',
          [
            University('Roskilde University', [
              Subject('Social Sciences'),
              Subject('Environmental Studies'),
              Subject('Innovation'),
              Subject('Communication'),
              Subject('Cultural Encounters'),
            ]),
          ],
        ),
      ],
    ),
    Country(
      'Finland',
      [
        City(
          'Helsinki',
          [
            University('University of Helsinki', [
              Subject('Law'),
              Subject('Economics'),
              Subject('Medicine'),
              Subject('Arts'),
              Subject('Biology'),
            ]),
            University('Aalto University', [
              Subject('Engineering'),
              Subject('Design'),
              Subject('Business'),
              Subject('Information Technology'),
              Subject('Architecture'),
            ]),
          ],
        ),
        City(
          'Tampere',
          [
            University('Tampere University', [
              Subject('Engineering'),
              Subject('Information Technology'),
              Subject('Education'),
              Subject('Health Sciences'),
              Subject('Social Sciences'),
            ]),
          ],
        ),
        City(
          'Oulu',
          [
            University('University of Oulu', [
              Subject('Engineering'),
              Subject('Business'),
              Subject('Medicine'),
              Subject('Information Technology'),
              Subject('Biology'),
            ]),
          ],
        ),
        City(
          'Turku',
          [
            University('University of Turku', [
              Subject('Law'),
              Subject('Economics'),
              Subject('Education'),
              Subject('Health Sciences'),
              Subject('History'),
            ]),
          ],
        ),
        City(
          'Jyväskylä',
          [
            University('University of Jyväskylä', [
              Subject('Education'),
              Subject('Mathematics'),
              Subject('Psychology'),
              Subject('Computer Science'),
              Subject('Physics'),
            ]),
          ],
        ),
        City(
          'Rovaniemi',
          [
            University('University of Lapland', [
              Subject('Social Sciences'),
              Subject('Art and Design'),
              Subject('Law'),
              Subject('Tourism Studies'),
              Subject('Environmental Studies'),
            ]),
          ],
        ),
      ],
    ),
    Country(
      'Norway',
      [
        City(
          'Oslo',
          [
            University('University of Oslo', [
              Subject('Law'),
              Subject('Medicine'),
              Subject('Philosophy'),
              Subject('Economics'),
              Subject('Political Science'),
            ]),
            University('Norwegian University of Science and Technology (NTNU)', [
              Subject('Engineering'),
              Subject('Information Technology'),
              Subject('Mathematics'),
              Subject('Natural Sciences'),
              Subject('Architecture'),
            ]),
          ],
        ),
        City(
          'Bergen',
          [
            University('University of Bergen', [
              Subject('Marine Research'),
              Subject('Biology'),
              Subject('Geography'),
              Subject('History'),
              Subject('Psychology'),
            ]),
          ],
        ),
        City(
          'Stavanger',
          [
            University('University of Stavanger', [
              Subject('Engineering'),
              Subject('Petroleum Studies'),
              Subject('Business'),
              Subject('Education'),
              Subject('Health Sciences'),
            ]),
          ],
        ),
        City(
          'Trondheim',
          [
            University('Norwegian University of Science and Technology (NTNU)', [
              Subject('Engineering'),
              Subject('Computer Science'),
              Subject('Architecture'),
              Subject('Mathematics'),
              Subject('Natural Sciences'),
            ]),
          ],
        ),
        City(
          'Tromsø',
          [
            University('UiT The Arctic University of Norway', [
              Subject('Arctic Studies'),
              Subject('Biology'),
              Subject('Law'),
              Subject('Geology'),
              Subject('Engineering'),
            ]),
          ],
        ),
        City(
          'Drammen',
          [
            University('University College of Southeast Norway', [
              Subject('Business'),
              Subject('Engineering'),
              Subject('Education'),
              Subject('Health Sciences'),
              Subject('IT'),
            ]),
          ],
        ),
      ],
    ),
    Country(
      'Ireland',
      [
        City(
          'Dublin',
          [
            University('Trinity College Dublin', [
              Subject('Law'),
              Subject('Engineering'),
              Subject('Arts'),
              Subject('Science'),
              Subject('Medicine'),
            ]),
            University('University College Dublin', [
              Subject('Business'),
              Subject('Engineering'),
              Subject('Computer Science'),
              Subject('Law'),
              Subject('Biology'),
            ]),
          ],
        ),
        City(
          'Cork',
          [
            University('University College Cork', [
              Subject('Science'),
              Subject('Engineering'),
              Subject('Medicine'),
              Subject('Business'),
              Subject('Arts'),
            ]),
          ],
        ),
        City(
          'Galway',
          [
            University('University of Galway', [
              Subject('Law'),
              Subject('Business'),
              Subject('Engineering'),
              Subject('Arts'),
              Subject('Medicine'),
            ]),
          ],
        ),
        City(
          'Limerick',
          [
            University('University of Limerick', [
              Subject('Engineering'),
              Subject('Business'),
              Subject('Education'),
              Subject('Music'),
              Subject('Health Sciences'),
            ]),
          ],
        ),
        City(
          'Drogheda',
          [
            University('Drogheda Institute of Further Education', [
              Subject('Business'),
              Subject('IT'),
              Subject('Health Studies'),
              Subject('Social Studies'),
              Subject('Engineering'),
            ]),
          ],
        ),
        City(
          'Waterford',
          [
            University('Waterford Institute of Technology', [
              Subject('Engineering'),
              Subject('Business'),
              Subject('Science'),
              Subject('Computing'),
              Subject('Art and Design'),
            ]),
          ],
        ),
      ],
    ),
    Country(
      'Portugal',
      [
        City(
          'Lisbon',
          [
            University('University of Lisbon', [
              Subject('Law'),
              Subject('Economics'),
              Subject('Medicine'),
              Subject('Engineering'),
              Subject('Arts'),
            ]),
            University('NOVA University Lisbon', [
              Subject('Business Administration'),
              Subject('Social Sciences'),
              Subject('Engineering'),
              Subject('Health Sciences'),
              Subject('Computer Science'),
            ]),
          ],
        ),
        City(
          'Porto',
          [
            University('University of Porto', [
              Subject('Engineering'),
              Subject('Economics'),
              Subject('Law'),
              Subject('Architecture'),
              Subject('Biology'),
            ]),
          ],
        ),
        City(
          'Coimbra',
          [
            University('University of Coimbra', [
              Subject('Law'),
              Subject('History'),
              Subject('Engineering'),
              Subject('Philosophy'),
              Subject('Medicine'),
            ]),
          ],
        ),
        City(
          'Braga',
          [
            University('University of Minho', [
              Subject('Engineering'),
              Subject('Business'),
              Subject('Social Sciences'),
              Subject('Law'),
              Subject('Architecture'),
            ]),
          ],
        ),
        City(
          'Aveiro',
          [
            University('University of Aveiro', [
              Subject('Engineering'),
              Subject('Physics'),
              Subject('Mathematics'),
              Subject('Social Sciences'),
              Subject('Business'),
            ]),
          ],
        ),
        City(
          'Évora',
          [
            University('University of Évora', [
              Subject('History'),
              Subject('Arts'),
              Subject('Biology'),
              Subject('Economics'),
              Subject('Geography'),
            ]),
          ],
        ),
      ],
    ),
    Country(
      'Czech Republic',
      [
        City(
          'Prague',
          [
            University('Charles University', [
              Subject('Law'),
              Subject('Medicine'),
              Subject('Philosophy'),
              Subject('Economics'),
              Subject('Science'),
            ]),
            University('Czech Technical University in Prague', [
              Subject('Engineering'),
              Subject('Architecture'),
              Subject('Mathematics'),
              Subject('Computer Science'),
              Subject('Physics'),
            ]),
          ],
        ),
        City(
          'Brno',
          [
            University('Brno University of Technology', [
              Subject('Engineering'),
              Subject('Architecture'),
              Subject('Information Technology'),
              Subject('Economics'),
              Subject('Business'),
            ]),
            University('Masaryk University', [
              Subject('Law'),
              Subject('Science'),
              Subject('Medicine'),
              Subject('Arts'),
              Subject('Social Sciences'),
            ]),
          ],
        ),
        City(
          'Plzeň',
          [
            University('University of West Bohemia', [
              Subject('Engineering'),
              Subject('Economics'),
              Subject('Applied Sciences'),
              Subject('Art and Design'),
              Subject('Information Technology'),
            ]),
          ],
        ),
        City(
          'Olomouc',
          [
            University('Palacký University', [
              Subject('Medicine'),
              Subject('Arts'),
              Subject('Science'),
              Subject('Education'),
              Subject('Law'),
            ]),
          ],
        ),
        City(
          'Hradec Králové',
          [
            University('University of Hradec Králové', [
              Subject('Education'),
              Subject('Law'),
              Subject('Science'),
              Subject('Economics'),
              Subject('Arts'),
            ]),
          ],
        ),
        City(
          'Liberec',
          [
            University('Technical University of Liberec', [
              Subject('Engineering'),
              Subject('Mathematics'),
              Subject('Computer Science'),
              Subject('Economics'),
              Subject('Architecture'),
            ]),
          ],
        ),
      ],
    ),
    Country(
      'Hungary',
      [
        City(
          'Budapest',
          [
            University('Eötvös Loránd University', [
              Subject('Law'),
              Subject('Economics'),
              Subject('Physics'),
              Subject('Mathematics'),
              Subject('Biology'),
            ]),
            University('Budapest University of Technology and Economics', [
              Subject('Engineering'),
              Subject('Computer Science'),
              Subject('Architecture'),
              Subject('Applied Mathematics'),
              Subject('Information Technology'),
            ]),
          ],
        ),
        City(
          'Debrecen',
          [
            University('University of Debrecen', [
              Subject('Medicine'),
              Subject('Engineering'),
              Subject('Law'),
              Subject('Economics'),
              Subject('Agriculture'),
            ]),
          ],
        ),
        City(
          'Szeged',
          [
            University('University of Szeged', [
              Subject('Law'),
              Subject('Biology'),
              Subject('Physics'),
              Subject('Mathematics'),
              Subject('Chemistry'),
            ]),
          ],
        ),
        City(
          'Pécs',
          [
            University('University of Pécs', [
              Subject('Arts'),
              Subject('Business'),
              Subject('Medicine'),
              Subject('Law'),
              Subject('Education'),
            ]),
          ],
        ),
        City(
          'Miskolc',
          [
            University('University of Miskolc', [
              Subject('Engineering'),
              Subject('Economics'),
              Subject('Law'),
              Subject('Information Technology'),
              Subject('Social Sciences'),
            ]),
          ],
        ),
        City(
          'Veszprém',
          [
            University('University of Pannonia', [
              Subject('Engineering'),
              Subject('Information Technology'),
              Subject('Business'),
              Subject('Economics'),
              Subject('Environmental Science'),
            ]),
          ],
        ),
      ],
    ),
    Country(
      'Slovakia',
      [
        City(
          'Bratislava',
          [
            University('Comenius University', [
              Subject('Law'),
              Subject('Medicine'),
              Subject('Economics'),
              Subject('Philosophy'),
              Subject('Science'),
            ]),
            University('Slovak University of Technology', [
              Subject('Engineering'),
              Subject('Architecture'),
              Subject('Computer Science'),
              Subject('Mathematics'),
              Subject('Physics'),
            ]),
          ],
        ),
        City(
          'Košice',
          [
            University('Technical University of Košice', [
              Subject('Engineering'),
              Subject('Architecture'),
              Subject('Information Technology'),
              Subject('Management'),
              Subject('Civil Engineering'),
            ]),
            University('Pavol Jozef Šafárik University', [
              Subject('Law'),
              Subject('Medicine'),
              Subject('Natural Sciences'),
              Subject('Economics'),
              Subject('Arts'),
            ]),
          ],
        ),
        City(
          'Žilina',
          [
            University('University of Žilina', [
              Subject('Engineering'),
              Subject('Transport'),
              Subject('Information Technology'),
              Subject('Economics'),
              Subject('Management'),
            ]),
          ],
        ),
        City(
          'Nitra',
          [
            University('Slovak University of Agriculture', [
              Subject('Agriculture'),
              Subject('Horticulture'),
              Subject('Biotechnology'),
              Subject('Food Science'),
              Subject('Economics'),
            ]),
          ],
        ),
        City(
          'Trnava',
          [
            University('Trnava University', [
              Subject('Education'),
              Subject('Law'),
              Subject('Philosophy'),
              Subject('History'),
              Subject('Psychology'),
            ]),
          ],
        ),
        City(
          'Prešov',
          [
            University('University of Prešov', [
              Subject('Education'),
              Subject('Social Sciences'),
              Subject('Philosophy'),
              Subject('Law'),
              Subject('Economics'),
            ]),
          ],
        ),
      ],
    ),
    Country(
      'Estonia',
      [
        City(
          'Tallinn',
          [
            University('University of Tallinn', [
              Subject('Engineering'),
              Subject('Information Technology'),
              Subject('Business'),
              Subject('Economics'),
              Subject('Law'),
            ]),
            University('Tallinn University of Technology', [
              Subject('Engineering'),
              Subject('IT'),
              Subject('Business'),
              Subject('Mathematics'),
              Subject('Economics'),
            ]),
          ],
        ),
        City(
          'Tartu',
          [
            University('University of Tartu', [
              Subject('Medicine'),
              Subject('Law'),
              Subject('Physics'),
              Subject('Mathematics'),
              Subject('Social Sciences'),
            ]),
          ],
        ),
        City(
          'Narva',
          [
            University('Narva College', [
              Subject('Education'),
              Subject('Cultural Studies'),
              Subject('Business'),
              Subject('Law'),
              Subject('Social Sciences'),
            ]),
          ],
        ),
        City(
          'Pärnu',
          [
            University('Pärnu College', [
              Subject('Business'),
              Subject('Tourism'),
              Subject('Health Sciences'),
              Subject('Education'),
              Subject('IT'),
            ]),
          ],
        ),
        City(
          'Kohtla-Järve',
          [
            University('Kivikas University', [
              Subject('Engineering'),
              Subject('IT'),
              Subject('Business'),
              Subject('Natural Sciences'),
              Subject('Environmental Studies'),
            ]),
          ],
        ),
        City(
          'Viljandi',
          [
            University('Viljandi Culture Academy', [
              Subject('Arts'),
              Subject('Music'),
              Subject('Design'),
              Subject('Literature'),
              Subject('Performing Arts'),
            ]),
          ],
        ),
      ],
    ),
    Country(
      'Latvia',
      [
        City(
          'Riga',
          [
            University('University of Latvia', [
              Subject('Economics'),
              Subject('Law'),
              Subject('Social Sciences'),
              Subject('Natural Sciences'),
              Subject('Engineering'),
            ]),
            University('Riga Technical University', [
              Subject('Engineering'),
              Subject('Computer Science'),
              Subject('Mathematics'),
              Subject('Architecture'),
              Subject('Management'),
            ]),
          ],
        ),
        City(
          'Daugavpils',
          [
            University('Daugavpils University', [
              Subject('Arts'),
              Subject('Education'),
              Subject('Social Sciences'),
              Subject('Natural Sciences'),
              Subject('Engineering'),
            ]),
          ],
        ),
        City(
          'Liepāja',
          [
            University('Liepāja University', [
              Subject('Humanities'),
              Subject('Natural Sciences'),
              Subject('Social Sciences'),
              Subject('Engineering'),
              Subject('Business'),
            ]),
          ],
        ),
        City(
          'Jelgava',
          [
            University('Latvia University of Life Sciences and Technologies', [
              Subject('Agriculture'),
              Subject('Food Science'),
              Subject('Environmental Studies'),
              Subject('Engineering'),
              Subject('Management'),
            ]),
          ],
        ),
        City(
          'Ventspils',
          [
            University('Ventspils University of Applied Sciences', [
              Subject('IT'),
              Subject('Business'),
              Subject('Engineering'),
              Subject('Social Sciences'),
              Subject('Economics'),
            ]),
          ],
        ),
        City(
          'Rēzekne',
          [
            University('Rēzekne Academy of Technologies', [
              Subject('Engineering'),
              Subject('Business'),
              Subject('Education'),
              Subject('IT'),
              Subject('Social Sciences'),
            ]),
          ],
        ),
      ],
    ),
    Country(
      'Lithuania',
      [
        City(
          'Vilnius',
          [
            University('Vilnius University', [
              Subject('Law'),
              Subject('Economics'),
              Subject('Medicine'),
              Subject('Humanities'),
              Subject('Engineering'),
            ]),
            University('Vilnius Gediminas Technical University', [
              Subject('Engineering'),
              Subject('Architecture'),
              Subject('Information Technology'),
              Subject('Business'),
              Subject('Mathematics'),
            ]),
          ],
        ),
        City(
          'Kaunas',
          [
            University('Kaunas University of Technology', [
              Subject('Engineering'),
              Subject('Computer Science'),
              Subject('Business'),
              Subject('Economics'),
              Subject('Social Sciences'),
            ]),
            University('Vytautas Magnus University', [
              Subject('Arts'),
              Subject('Humanities'),
              Subject('Social Sciences'),
              Subject('Education'),
              Subject('Economics'),
            ]),
          ],
        ),
        City(
          'Klaipeda',
          [
            University('Klaipeda University', [
              Subject('Marine Sciences'),
              Subject('Business'),
              Subject('Humanities'),
              Subject('Engineering'),
              Subject('Social Sciences'),
            ]),
          ],
        ),
        City(
          'Šiauliai',
          [
            University('Šiauliai University', [
              Subject('Education'),
              Subject('Social Sciences'),
              Subject('Business'),
              Subject('Engineering'),
              Subject('Humanities'),
            ]),
          ],
        ),
        City(
          'Panevėžys',
          [
            University('Panevėžys University of Applied Sciences', [
              Subject('Business'),
              Subject('Engineering'),
              Subject('Social Sciences'),
              Subject('IT'),
              Subject('Health Sciences'),
            ]),
          ],
        ),
        City(
          'Marijampolė',
          [
            University('Marijampolė College', [
              Subject('Business'),
              Subject('Engineering'),
              Subject('Health Sciences'),
              Subject('Education'),
              Subject('Social Sciences'),
            ]),
          ],
        ),
      ],
    ),











    Country(
      'United States',
      [
        City(
          'New York',
          [
            University('Columbia University', [
              Subject('Computer Science'),
              Subject('Business Administration'),
              Subject('Law'),
              Subject('Medicine'),
              Subject('Engineering'),
            ]),
            University('New York University', [
              Subject('Arts'),
              Subject('Economics'),
              Subject('Journalism'),
              Subject('Psychology'),
              Subject('Mathematics'),
            ]),
          ],
        ),
        City(
          'California',
          [
            University('Stanford University', [
              Subject('Computer Science'),
              Subject('Engineering'),
              Subject('Business'),
              Subject('Law'),
              Subject('Medicine'),
            ]),
            University('University of California, Berkeley', [
              Subject('Physics'),
              Subject('Chemistry'),
              Subject('Environmental Science'),
              Subject('Economics'),
              Subject('Architecture'),
            ]),
            University('California Institute of Technology', [
              Subject('Astrophysics'),
              Subject('Biology'),
              Subject('Chemical Engineering'),
              Subject('Mathematics'),
              Subject('Geology'),
            ]),
          ],
        ),
        City(
          'Massachusetts',
          [
            University('Harvard University', [
              Subject('Law'),
              Subject('Medicine'),
              Subject('Business'),
              Subject('Political Science'),
              Subject('Philosophy'),
            ]),
            University('Massachusetts Institute of Technology', [
              Subject('Computer Science'),
              Subject('Aerospace Engineering'),
              Subject('Physics'),
              Subject('Mechanical Engineering'),
              Subject('Economics'),
            ]),
          ],
        ),
      ],
    ),
    Country(
      'United Kingdom',
      [
        City(
          'London',
          [
            University('University College London', [
              Subject('Architecture'),
              Subject('Medicine'),
              Subject('Law'),
              Subject('Economics'),
              Subject('Psychology'),
            ]),
            University('Imperial College London', [
              Subject('Computer Science'),
              Subject('Mechanical Engineering'),
              Subject('Electrical Engineering'),
              Subject('Chemical Engineering'),
              Subject('Biomedical Science'),
            ]),
            University('King\'s College London', [
              Subject('Dentistry'),
              Subject('Nursing'),
              Subject('Pharmacy'),
              Subject('History'),
              Subject('English Literature'),
            ]),
          ],
        ),
        City(
          'Cambridge',
          [
            University('University of Cambridge', [
              Subject('Mathematics'),
              Subject('Physics'),
              Subject('Law'),
              Subject('Medicine'),
              Subject('Computer Science'),
            ]),
          ],
        ),
        City(
          'Oxford',
          [
            University('University of Oxford', [
              Subject('Philosophy'),
              Subject('Politics'),
              Subject('Economics'),
              Subject('Law'),
              Subject('Medicine'),
            ]),
          ],
        ),
      ],
    ),
    Country(
      'Australia',
      [
        City(
          'Sydney',
          [
            University('University of Sydney', [
              Subject('Engineering'),
              Subject('Medicine'),
              Subject('Business'),
              Subject('Law'),
              Subject('Arts'),
            ]),
            University('University of New South Wales', [
              Subject('Computer Science'),
              Subject('Architecture'),
              Subject('Psychology'),
              Subject('Environmental Science'),
              Subject('Finance'),
            ]),
          ],
        ),
        City(
          'Melbourne',
          [
            University('University of Melbourne', [
              Subject('Medicine'),
              Subject('Dentistry'),
              Subject('Veterinary Science'),
              Subject('Music'),
              Subject('Economics'),
            ]),
            University('Monash University', [
              Subject('Pharmacy'),
              Subject('Nursing'),
              Subject('Engineering'),
              Subject('Information Technology'),
              Subject('Law'),
            ]),
          ],
        ),
      ],
    ),
    Country(
      'Canada',
      [
        City(
          'Toronto',
          [
            University('University of Toronto', [
              Subject('Computer Science'),
              Subject('Medicine'),
              Subject('Law'),
              Subject('Business'),
              Subject('Engineering'),
            ]),
            University('York University', [
              Subject('Psychology'),
              Subject('Environmental Studies'),
              Subject('Fine Arts'),
              Subject('Health Studies'),
              Subject('Economics'),
            ]),
          ],
        ),
        City(
          'Vancouver',
          [
            University('University of British Columbia', [
              Subject('Forestry'),
              Subject('Oceanography'),
              Subject('Architecture'),
              Subject('Education'),
              Subject('Political Science'),
            ]),
          ],
        ),
      ],
    ),
    // Add more countries, cities, universities, and subjects as needed
  ];

  List<Country> filteredCountries = [];
  List<City> filteredCities = [];
  List<University> filteredUniversities = [];
  List<Subject> filteredSubjects = [];
  TextEditingController controller = TextEditingController();
  String selectedLevel = 'Country';
  Country? selectedCountry;
  City? selectedCity;
  University? selectedUniversity;
  Subject? selectedSubject;

  @override
  void initState() {
    super.initState();
    filteredCountries = countries;
    controller.addListener(_onSearchChanged);
  }

  void _onSearchChanged() {
    final query = controller.text.toLowerCase();
    setState(() {
      switch (selectedLevel) {
        case 'Country':
          filteredCountries = countries
              .where((country) => country.name.toLowerCase().contains(query))
              .toList();
          break;
        case 'City':
          filteredCities = selectedCountry!.cities
              .where((city) => city.name.toLowerCase().contains(query))
              .toList();
          break;
        case 'University':
          filteredUniversities = selectedCity!.universities
              .where((university) =>
              university.name.toLowerCase().contains(query))
              .toList();
          break;
        case 'Subject':
          filteredSubjects = selectedUniversity!.subjects
              .where((subject) => subject.name.toLowerCase().contains(query))
              .toList();
          break;
      }
    });
  }

  void _onCountrySelected(Country country) {
    setState(() {
      selectedCountry = country;
      filteredCities = country.cities;
      selectedLevel = 'City';
      controller.clear();
    });
  }

  void _onCitySelected(City city) {
    setState(() {
      selectedCity = city;
      filteredUniversities = city.universities;
      selectedLevel = 'University';
      controller.clear();
    });
  }

  void _onUniversitySelected(University university) {
    setState(() {
      selectedUniversity = university;
      filteredSubjects = university.subjects;
      selectedLevel = 'Subject';
      controller.clear();
    });
  }

  void _onSubjectSelected(Subject subject) {
    setState(() {
      selectedSubject = subject;
      controller.text = subject.name;
    });
  }

  void _clearSelection() {
    setState(() {
      selectedLevel = 'Country';
      selectedCountry = null;
      selectedCity = null;
      selectedUniversity = null;
      selectedSubject = null;
      filteredCountries = countries;
      filteredCities.clear();
      filteredUniversities.clear();
      filteredSubjects.clear();
      controller.clear();
    });
  }

  @override
  void dispose() {
    controller.removeListener(_onSearchChanged);
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Color cardColor;
    Color textColor;
    Color buttonColor;
    Color buttonTextColor;

    switch (selectedLevel) {
      case 'City':
        cardColor = Colors.lightGreen[100]!;
        textColor = Colors.black;
        buttonColor = Colors.lightGreen[300]!;
        buttonTextColor = Colors.white;
        break;
      case 'University':
        cardColor = Colors.orange[100]!;
        textColor = Colors.black;
        buttonColor = Colors.orange[300]!;
        buttonTextColor = Colors.white;
        break;
      case 'Subject':
        cardColor = Colors.purple[100]!;
        textColor = Colors.black;
        buttonColor = Colors.purple[300]!;
        buttonTextColor = Colors.white;
        break;
      default:
        cardColor = Colors.lightBlue[100]!;
        textColor = Colors.black;
        buttonColor = Colors.blueAccent;
        buttonTextColor = Colors.white;
        break;
    }

    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            'Select Your Path',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20.0,
            ),
          ),
        ),
        backgroundColor: Colors.blueAccent,
        actions: [
          IconButton(
            icon: Icon(Icons.refresh),
            onPressed: _clearSelection,
          ),
        ],
      ),
      body: Container(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            AnimatedContainer(
              duration: Duration(milliseconds: 300),
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(12.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 8.0,
                    offset: Offset(0, 4),
                  ),
                ],
              ),
              child: TextField(
                controller: controller,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Search for ${selectedLevel.toLowerCase()}...',
                  prefixIcon: Icon(Icons.search, color: Colors.blueAccent),
                  suffixIcon: controller.text.isNotEmpty
                      ? IconButton(
                    icon: Icon(Icons.clear, color: Colors.redAccent),
                    onPressed: () => controller.clear(),
                  )
                      : null,
                ),
              ),
            ),
            SizedBox(height: 10),
            Expanded(
              child: ListView(
                children: [
                  if (selectedLevel == 'Country') ...[
                    ...filteredCountries.map((country) => Card(
                      color: cardColor,
                      margin: EdgeInsets.symmetric(vertical: 8.0),
                      elevation: 4.0,
                      child: ListTile(
                        title: Text(
                          country.name,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18.0,
                            color: textColor,
                          ),
                        ),
                        trailing: Icon(Icons.arrow_forward_ios,
                            color: textColor),
                        onTap: () => _onCountrySelected(country),
                        contentPadding: EdgeInsets.all(16.0),
                      ),
                    )),
                  ],
                  if (selectedLevel == 'City') ...[
                    ...filteredCities.map((city) => Card(
                      color: cardColor,
                      margin: EdgeInsets.symmetric(vertical: 8.0),
                      elevation: 4.0,
                      child: ListTile(
                        title: Text(
                          city.name,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18.0,
                            color: textColor,
                          ),
                        ),
                        trailing: Icon(Icons.arrow_forward_ios,
                            color: textColor),
                        onTap: () => _onCitySelected(city),
                        contentPadding: EdgeInsets.all(16.0),
                      ),
                    )),
                  ],
                  if (selectedLevel == 'University') ...[
                    ...filteredUniversities.map((university) => Card(
                      color: cardColor,
                      margin: EdgeInsets.symmetric(vertical: 8.0),
                      elevation: 4.0,
                      child: ListTile(
                        title: Text(
                          university.name,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18.0,
                            color: textColor,
                          ),
                        ),
                        trailing: Icon(Icons.arrow_forward_ios,
                            color: textColor),
                        onTap: () => _onUniversitySelected(university),
                        contentPadding: EdgeInsets.all(16.0),
                      ),
                    )),
                  ],
                  if (selectedLevel == 'Subject') ...[
                    ...filteredSubjects.map((subject) => Card(
                      color: cardColor,
                      margin: EdgeInsets.symmetric(vertical: 8.0),
                      elevation: 4.0,
                      child: ListTile(
                        title: Text(
                          subject.name,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18.0,
                            color: textColor,
                          ),
                        ),
                        leading: Icon(Icons.book, color: textColor),
                        onTap: () => _onSubjectSelected(subject),
                        contentPadding: EdgeInsets.all(16.0),
                      ),
                    )),
                  ],
                ],
              ),
            ),
            SizedBox(height: 10),
            if (selectedSubject != null)
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => MyHomePage(
                        selectedCountry: selectedCountry,
                        selectedCity: selectedCity,
                        selectedUniversity: selectedUniversity,
                        selectedSubject: selectedSubject,
                      ),
                    ),
                  );
                },
                child: Text(
                  'Find Teacher',
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blueAccent,
                  padding: EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                ),
              )

          ],
        ),
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final Country? selectedCountry;
  final City? selectedCity;
  final University? selectedUniversity;
  final Subject? selectedSubject;

  MyHomePage({
    required this.selectedCountry,
    required this.selectedCity,
    required this.selectedUniversity,
    required this.selectedSubject,
  });

  void _saveSelectionToFirebase() {
    final databaseReference = FirebaseDatabase.instance.ref();

    databaseReference.child('student_selections').push().set({
      'country': selectedCountry?.name,
      'city': selectedCity?.name,
      'university': selectedUniversity?.name,
      'subject': selectedSubject?.name,
      'timestamp': DateTime.now().toIso8601String(),
    }).then((_) {
      print("Data saved successfully!");
    }).catchError((error) {
      print("Failed to save data: $error");
    });
  }

  @override
  Widget build(BuildContext context) {
    final title = '${selectedCountry?.name ?? 'Unknown Country'} > '
        '${selectedCity?.name ?? 'Unknown City'} > '
        '${selectedUniversity?.name ?? 'Unknown University'} > '
        '${selectedSubject?.name ?? 'Unknown Subject'}';

    // Save data to Firebase when this page is built
    _saveSelectionToFirebase();

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Teacher Search Result',
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.green,
        elevation: 4.0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Text(
                'You have selected:',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.w600,
                  color: Colors.black87,
                ),
              ),
            ),
            SizedBox(height: 10.0),
            Text(
              title,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 28.0,
                fontWeight: FontWeight.bold,
                color: Colors.blueAccent,
              ),
            ),
            SizedBox(height: 40.0),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => TeacherProfileScreen()),
                );
              },
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: Colors.green,
                padding: EdgeInsets.symmetric(vertical: 14.0, horizontal: 28.0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.0),
                ),
                elevation: 5.0,
              ),
              child: Text(
                "Proceed",
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
