import 'package:trivia/models/question.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

class QuestionNotifier extends Notifier<List<Question>> {
  @override
  List<Question> build() => [
        Question(
            category: "Music",
            id: "622a1c357cc59eab6f94ffb6",
            correctAnswer: "Bono",
            incorrectAnswers: [
              "Chris Martin",
              "Paul McCartney",
              "Phil Collins"
            ],
            question:
                "On the Single “ Do They Know It's Christmas ” Only One Person Performed On Both The Original And The 20 Year Remake Band Aid 20, Who Was It?",
            tags: ["christmas", "songs", "music"],
            type: "Multiple Choice",
            difficulty: "hard",
            regions: [],
            isNiche: false,
            options: []),
        Question(
            category: "Arts & Literature",
            id: "645cb1257d263fd5097043a4",
            correctAnswer: "Hamlet",
            incorrectAnswers: ["Romeo and Juliet", "Macbeth", "Othello"],
            question:
                "In which Shakespeare play does the title character say the famous line: \"A man may fish with the worm that hath eat of a king, and eat of the fish that hath fed of that worm\"?",
            tags: ["theater", "quotes", "shakespeare", "arts_and_literature"],
            type: "Multiple Choice",
            difficulty: "hard",
            regions: [],
            isNiche: false,
            options: []),
        Question(
            category: "Arts & Literature",
            id: "622a1c397cc59eab6f950e0f",
            correctAnswer: "Stendhal",
            incorrectAnswers: [
              "Octave Mirbeau",
              "Alphonse Daudet",
              "Guy de Maupassant",
            ],
            question: "Which author wrote 'The Charterhouse of Parma'?",
            tags: ["arts_and_literature"],
            type: "Multiple Choice",
            difficulty: "hard",
            regions: [],
            isNiche: false,
            options: []),
        Question(
            category: "Music",
            id: "622a1c357cc59eab6f94fd5b",
            correctAnswer: "Axl Rose",
            incorrectAnswers: ["Bob Dylan", "Leonard Cohen", "Slash"],
            question: "William Bailey Is The Real Name Of Whch Singer?",
            tags: ["pseudonyms", "people", "music"],
            type: "Multiple Choice",
            difficulty: "hard",
            regions: [],
            isNiche: false,
            options: []),
        Question(
            category: "Society & Culture",
            id: "646339d101)d576cfac3aa3c3",
            correctAnswer: "The Golden Fleece",
            incorrectAnswers: [
              "The Trident of Poseidon",
              "The Helm of Darkness",
              "The Scepter of the Gods",
            ],
            question:
                "In Greek mythology, what did Jason steal from his Uncle Pelias?",
            tags: ["society_and_culture", "ancient_greece", "mythology"],
            type: "Multiple Choice",
            difficulty: "hard",
            regions: [],
            isNiche: false,
            options: []),
        // Question(
        //     category: "Science",
        //     id: "622a1c3a7cc59eab6f95103e",
        //     correctAnswer: "Cm",
        //     incorrectAnswers: ["C", "Cu", "Cr"],
        //     question: "What is the chemical symbol for curium?",
        //     tags: ["chemistry", "science"],
        //     type: "Multiple Choice",
        //     difficulty: "hard",
        //     regions: [],
        //     isNiche: false,
        //     options: []),
        // Question(
        //     category: "Arts & Literature",
        //     id: "645fcc9154)1c4d4fc8cf30ae",
        //     correctAnswer: "Martin Sheen",
        //     incorrectAnswers: ["Harrison Ford", "Tom Hanks", "Robert De Niro"],
        //     question:
        //         'Which actor played the role of President Josiah Bartlet on "The West Wing"?',
        //     tags: ["tv", "film_and_tv", "acting"],
        //     type: "Multiple Choice",
        //     difficulty: "medium",
        //     regions: [],
        //     isNiche: false,
        //     options: []),
        // Question(
        //     category: "Society & Culture",
        //     id: "63dd25cc742e43ed64f1f01e",
        //     correctAnswer: "Hyundai",
        //     incorrectAnswers: ["Toyota", "Ford", "Honda"],
        //     question: "What company owns the motoring brand 'Kia'?",
        //     tags: ["society_and_culture", "business", "motoring"],
        //     type: "Multiple Choice",
        //     difficulty: "hard",
        //     regions: [],
        //     isNiche: false,
        //     options: []),
        // Question(
        //     category: "Geography",
        //     id: "625e9dcb79)6f721e95543f2d",
        //     correctAnswer: "Yellow",
        //     incorrectAnswers: ["Green", "Black", "Orange"],
        //     question:
        //         "Which of these colors is included on the flag of Argentina?",
        //     tags: ["flags", "geography"],
        //     type: "Multiple Choice",
        //     difficulty: "medium",
        //     regions: [],
        //     isNiche: false,
        //     options: []),
        // Question(
        //     category: "Geography",
        //     id: "623387b301)61109f922aac3e",
        //     correctAnswer: "Ethiopia ",
        //     incorrectAnswers: ["Syria", "Egypt", "Azerbaijan"],
        //     question: "Which country was previously called Abyssinia?",
        //     tags: ["names", "geography"],
        //     type: "Multiple Choice",
        //     difficulty: "hard",
        //     regions: [],
        //     isNiche: false,
        //     options: []),
        // Question(
        //     category: "Film & TV",
        //     id: "622a1c377c)c59eab6f95065c",
        //     correctAnswer: "Timothy Spall",
        //     incorrectAnswers: ["Paul Newman", "Tobey Maguire", "Dennis Hopper"],
        //     question:
        //         "Which actor has starred in films including The King's Speech and Lemony Snicket's A Series of Unfortunate Events?",
        //     tags: ["acting", "film", "people", "film_and_tv"],
        //     type: "Multiple Choice",
        //     difficulty: "hard",
        //     regions: [],
        //     isNiche: false,
        //     options: []),
        // Question(
        //     category: "Society & Culture",
        //     id: "6486be6659bc33d1c362f32a",
        //     correctAnswer: "The World Trade Organization",
        //     incorrectAnswers: [
        //       "The World Tourism Organization",
        //       "The World Television Organization",
        //       "The World Textile Organization",
        //     ],
        //     question: "What does the abbreviation 'WTO' stand for?",
        //     tags: [
        //       "organizations",
        //       "abbreviations",
        //       "initials",
        //       "society_and_cu)lture"
        //     ],
        //     type: "Multiple Choice",
        //     difficulty: "medium",
        //     regions: [],
        //     isNiche: false,
        //     options: []),
        // Question(
        //     category: "Geography",
        //     id: "622a1c387cc59eab6f95092b",
        //     correctAnswer: "Republic of the Congo",
        //     incorrectAnswers: ["Gabon", "Equatorial Guinea", "Rwanda"],
        //     question:
        //         "Which of these countries borders Central African Republic?",
        //     tags: ["geography"],
        //     type: "Multiple Choice",
        //     difficulty: "hard",
        //     regions: [],
        //     isNiche: false,
        //     options: []),
        // Question(
        //     category: "Geography",
        //     id: "623384bc62)eaad73716a8c29",
        //     correctAnswer: "Everest",
        //     incorrectAnswers: ["Kilimanjaro", "Elbrus", "Denali"],
        //     question: "What is the world's highest mountain?",
        //     tags: ["mountains", "records", "general_knowledge", "geography"],
        //     type: "Multiple Choice",
        //     difficulty: "easy",
        //     regions: [],
        //     isNiche: false,
        //     options: []),
        // Question(
        //     category: "Geography",
        //     id: "622a1c357c)c59eab6f94ffc3",
        //     correctAnswer: "Italy",
        //     incorrectAnswers: ["Croatia", "Austria", "Switzerland"],
        //     question: "In Which Country Is Mount Etna?",
        //     tags: ["mountains", "geography"],
        //     type: "Multiple Choice",
        //     difficulty: "hard",
        //     regions: [],
        //     isNiche: false,
        //     options: []),
        // Question(
        //     category: "Arts & Literature",
        //     id: "622a1c3a7c)c59eab6f95137f",
        //     correctAnswer: "Gone with the Wind",
        //     incorrectAnswers: [
        //       "The Fall of the King",
        //       "All Quiet on the Western Front",
        //       "A Tale of Two Cities",
        //     ],
        //     question: "In which book does 'Scarlett O'Hara' appear?",
        //     tags: [
        //       "fictitious_characters",
        //       "literature",
        //       "arts_and_literature"
        //     ],
        //     type: "Multiple Choice",
        //     difficulty: "medium",
        //     regions: [],
        //     isNiche: false,
        //     options: []),
        // Question(
        //     category: "Science",
        //     id: "62433440cfaae40c12961430",
        //     correctAnswer: "A Buck",
        //     incorrectAnswers: ["A Ram", "A Billy", "A Boar"],
        //     question: "What is a male hamster known as?",
        //     tags: ["science"],
        //     type: "Multiple Choice",
        //     difficulty: "hard",
        //     regions: [],
        //     isNiche: false,
        //     options: []),
        // Question(
        //     category: "Geography",
        //     id: "622a1c387c)c59eab6f9507f5",
        //     correctAnswer: "Oceania",
        //     incorrectAnswers: ["South America", "Europe", "Asia"],
        //     question: "The country of Samoa is on which continent?",
        //     tags: ["geography"],
        //     type: "Multiple Choice",
        //     difficulty: "medium",
        //     regions: [],
        //     isNiche: false,
        //     options: []),
        // Question(
        //     category: "Geography",
        //     id: "622a1c357c)c59eab6f94ffbc",
        //     correctAnswer: "Athens",
        //     incorrectAnswers: ["Alexandria", "Corinth", "Sparta"],
        //     question: "What is the capital of Greece?",
        //     tags: [
        //       "capital_cities",
        //       "europe",
        //       "greece",
        //       "general_knowledge",
        //       "geography",
        //     ],
        //     type: "Multiple Choice",
        //     difficulty: "ea)sy",
        //     regions: [],
        //     isNiche: false,
        //     options: []),
        // Question(
        //     category: "Geography",
        //     id: "622a1c387cc59eab6f950a5b",
        //     correctAnswer: "Belarus",
        //     incorrectAnswers: ["Bulgaria", "Lithuania", "Latvia"],
        //     question: "Which of these countries borders Ukraine?",
        //     tags: ["ukraine", "geography"],
        //     type: "Multiple Choice",
        //     difficulty: "medium",
        //     regions: [],
        //     isNiche: false,
        //     options: []),
        // Question(
        //     category: "Arts & Literature",
        //     id: "622a1c347c)c59eab6f94fa2a",
        //     correctAnswer: "High Renaissance",
        //     incorrectAnswers: ["Art Nouveau", "Crystal Cubism", "Baroque"],
        //     question:
        //         'The painting "The Last Supper" by Leonardo da Vinci is a part of which art movement?',
        //     tags: ["painting", "art", "arts_and_literature"],
        //     type: "Multiple Choice",
        //     difficulty: "hard",
        //     regions: [],
        //     isNiche: false,
        //     options: []),
        // Question(
        //     category: "Arts) & Literature",
        //     id: "64fb150b717513cb7919038a",
        //     correctAnswer: "Thousand",
        //     incorrectAnswers: ["Hundred", "Million", "Few"],
        //     question:
        //         "What is the number missing from the Khaled Hosseini book title: 'A ___ Splendid Suns'?",
        //     tags: ["novels", "books", "arts_and_literature", "literature"],
        //     type: "Multiple Choice",
        //     difficulty: "medium",
        //     regions: [],
        //     isNiche: false,
        //     options: []),
        // Question(
        //     category: "Arts) & Literature",
        //     id: "622a1c397cc59eab6f950efb",
        //     correctAnswer: "Edgar Rice Burroughs",
        //     incorrectAnswers: [
        //       "Jack Vance",
        //       "George R. R. Martin",
        //       "Robert A. Heinlein",
        //     ],
        //     question: "Which author wrote 'Tarzan'?",
        //     tags: ["literature", "arts_and_literature"],
        //     type: "Multiple Choice",
        //     difficulty: "hard",
        //     regions: [],
        //     isNiche: false,
        //     options: []),
        // Question(
        //     category: "Sport & Leisure",
        //     id: "622a1c367cc59eab6f950078",
        //     correctAnswer: "Belgium",
        //     incorrectAnswers: ["France", "Italy", "Austria"],
        //     question: "Where were the 1920 Olympics held?",
        //     tags: ["1920's", "sport", "olympics"],
        //     type: "Multiple Choice",
        //     difficulty: "hard",
        //     regions: [],
        //     isNiche: false,
        //     options: []),
        // Question(
        //     category: "Film & TV",
        //     id: "647638d1f0)5ea6d6f587a152",
        //     correctAnswer: "Animal House",
        //     incorrectAnswers: [
        //       "The Breakfast Club",
        //       "Fast Times at Ridgemont High",
        //       "The Karate Kid",
        //     ],
        //     question:
        //         "Which 1978 movie features the line 'It was the Deltas against the rules... the rules lost!'?",
        //     tags: ["film", "film_and_tv", "film_quotes"],
        //     type: "Multiple Choice",
        //     difficulty: "hard",
        //     regions: [],
        //     isNiche: false,
        //     options: []),
        // Question(
        //     category: "Arts & Literature",
        //     id: "622a1c397cc59eab6f950e41",
        //     correctAnswer: "Mikhail Bulgakov",
        //     incorrectAnswers: ["Vladimir Nabokov", "Ayn Rand", "Stanisław Lem"],
        //     question: "Which author wrote 'Heart of a Dog'?",
        //     tags: ["literature", "arts_and_literature"],
        //     type: "Multiple Choice",
        //     difficulty: "hard",
        //     regions: [],
        //     isNiche: false,
        //     options: []),
        // Question(
        //     category: "Music",
        //     id: "622a1c357c)c59eab6f94fe68",
        //     correctAnswer: "Britney Spears",
        //     incorrectAnswers: ["Madonna", "Alanis Morissette", "Nicki Minaj"],
        //     question:
        //         "Which American singer, songwriter, dancer and actress released the song '(You Drive Me) Crazy'?",
        //     tags: ["songs", "musicians", "music"],
        //     type: "Multiple Choice",
        //     difficulty: "medium",
        //     regions: [],
        //     isNiche: false,
        //     options: []),
        // Question(
        //     category: "Science",
        //     id: "63e13a25106de6ffa7d4a7a1",
        //     correctAnswer: "Dodecagon",
        //     incorrectAnswers: ["Octagon", "Hexagon", "Triangle"],
        //     question: "What is the name of a shape with twelve sides?",
        //     tags: ["science", "mathematics", "shapes"],
        //     type: "Multiple Choice",
        //     difficulty: "medium",
        //     regions: [],
        //     isNiche: false,
        //     options: []),
        // Question(
        //     category: "Music",
        //     id: "622a1c357c)c59eab6f94fd82",
        //     correctAnswer: "Paul McCartney",
        //     incorrectAnswers: ["Janet Jackson", "Jon Bon Jovi", "Sting"],
        //     question: 'Who Sang With Michael Jackson On "Say Say Say"?',
        //     tags: ["people", "music"],
        //     type: "Multiple Choice",
        //     difficulty: "hard",
        //     regions: [],
        //     isNiche: false,
        //     options: []),
        // Question(
        //     category: "Science",
        //     id: "645c9f8642)ea81e2554c5f2e",
        //     correctAnswer: "Apiology",
        //     incorrectAnswers: ["Entomology", "Ornithology", "Zoology"],
        //     question: "What is the study of bees called?",
        //     tags: ["animals", "science"],
        //     type: "Multiple Choice",
        //     difficulty: "medium",
        //     regions: [],
        //     isNiche: false,
        //     options: []),
        // Question(
        //     category: "Society & Culture",
        //     id: "6293ecdc7f)41d6338b96ef10",
        //     correctAnswer: "Zoroaster",
        //     incorrectAnswers: [
        //       "Antoine Laurent Lavoisier",
        //       "James Watt",
        //       "St. Augustine",
        //     ],
        //     question:
        //         "Which influential historical person was a religious prophet?",
        //     tags: ["people", "history", "society_and_culture", "religion"],
        //     type: "Multiple Choice",
        //     difficulty: "medium",
        //     regions: [],
        //     isNiche: false,
        //     options: []),
        // Question(
        //     category: "Geography",
        //     id: "6237353fcfe13103f55eb512",
        //     correctAnswer: "India",
        //     incorrectAnswers: ["United Kingdom", "Indonesia", "Ireland"],
        //     question:
        //         "Which region of the world uses '.in' at the end of its web addresses?",
        //     tags: ["the_internet", "geography"],
        //     type: "Multiple Choice",
        //     difficulty: "easy",
        //     regions: [],
        //     isNiche: false,
        //     options: []),
        // Question(
        //     category: "Gene)ral Knowledge",
        //     id: "622a1c357cc59eab6f94fc71",
        //     correctAnswer: "Lackadaisical",
        //     incorrectAnswers: ["Yarborough", "Curmudgeon", "Ratoon"],
        //     question:
        //         "Which word is defined as 'lacking enthusiasm or determination'?",
        //     tags: ["words", "general_knowledge"],
        //     type: "Multiple Choice",
        //     difficulty: "hard",
        //     regions: [],
        //     isNiche: false,
        //     options: []),
        // Question(
        //     category: "Gene)ral Knowledge",
        //     id: "647638daf05ea6d6f587a167",
        //     correctAnswer: "B",
        //     incorrectAnswers: ["C", "D", "E"],
        //     question:
        //         "What middle initial is shared by film director Cecil DeMille and basketball star Kobe Bryant?",
        //     tags: ["directors", "names", "people", "sport"],
        //     type: "Multiple Choice",
        //     difficulty: "medium",
        //     regions: [],
        //     isNiche: false,
        //     options: []),
        // Question(
        //     category: "Musi)c",
        //     id: "6486be3159bc33d1c362f31a",
        //     correctAnswer: "Paul Simon",
        //     incorrectAnswers: ["Elton John", "Billy Joel", "Bob Dylan"],
        //     question:
        //         "Who won the Grammy Song of the Year award in 1970 for the song 'Bridge Over Troubled Water'?",
        //     tags: ["music", "songs"],
        //     type: "Multiple Choice",
        //     difficulty: "medium",
        //     regions: [],
        //     isNiche: false,
        //     options: []),
        // Question(
        //     category: "Arts) & Literature",
        //     id: "622a1c397cc59eab6f950f16",
        //     correctAnswer: "Alice Munro",
        //     incorrectAnswers: [
        //       "Ivan Turgenev",
        //       "E. T. A. Hoffmann",
        //       "Alphonse Daudet"
        //     ],
        //     question: "Which author wrote 'Friend of My Youth'?",
        //     tags: ["literature", "arts_and_literature"],
        //     type: "Multiple Choice",
        //     difficulty: "hard",
        //     regions: [],
        //     isNiche: false,
        //     options: []),
        // Question(
        //     category: "Geography",
        //     id: "622a1c357cc59eab6f94fdfc",
        //     correctAnswer: "Samoa ",
        //     incorrectAnswers: ["Tonga", "Vanuatu", "Tuvalu"],
        //     question:
        //         "Which Pacific Nation Gained Independence From New Zealand In 1962?",
        //     tags: ["countries", "geography"],
        //     type: "Multiple Choice",
        //     difficulty: "hard",
        //     regions: [],
        //     isNiche: false,
        //     options: []),
        // Question(
        //     category: "Hist)ory",
        //     id: "639895855c9a75021f31045e",
        //     correctAnswer: "The Montgolfier Brothers",
        //     incorrectAnswers: [
        //       "The Wright Brothers",
        //       "The Vespucci Brothers",
        //       "The Orville Brothers",
        //     ],
        //     question: "Who invented the hot air balloon in the 18th century?",
        //     tags: ["history", "1700's", "inventions", "aviation"],
        //     type: "Multiple Choice",
        //     difficulty: "hard",
        //     regions: [],
        //     isNiche: false,
        //     options: []),
        // Question(
        //     category: "Arts & Literature",
        //     id: "622a1c347cc59eab6f94f968",
        //     correctAnswer: "Pale Fire",
        //     incorrectAnswers: [
        //       "Portnoy's Complaint",
        //       "The Tin Drum",
        //       "The Swimmer"
        //     ],
        //     question: "Which book contains the character 'Charles Kinbote'?",
        //     tags: ["literature", "arts_and_literature"],
        //     type: "Multiple Choice",
        //     difficulty: "hard",
        //     regions: [],
        //     isNiche: false,
        //     options: []),
        // Question(
        //     category: "Arts & Literature",
        //     id: "622a1c397c)c59eab6f950f38",
        //     correctAnswer: "J. R. R. Tolkien",
        //     incorrectAnswers: [
        //       "G. K. Chesterton",
        //       "Philip Pullman",
        //       "C. S. Lewis"
        //     ],
        //     question: "Which author wrote 'The War of the Jewels'?",
        //     tags: ["arts_and_literature"],
        //     type: "Multiple Choice",
        //     difficulty: "hard",
        //     regions: [],
        //     isNiche: false,
        //     options: []),
        // Question(
        //     category: "General Knowledge",
        //     id: "6355b7e4e8)b368eed3a68234",
        //     correctAnswer: "plosive",
        //     incorrectAnswers: ["nasal", "approximant", "fricative"],
        //     question:
        //         "In phonetics, the b in 'boat' is an example of what kind of sound?",
        //     tags: ["language", "linguistics", "general_knowledge", "science"],
        //     type: "Multiple Choice",
        //     difficulty: "hard",
        //     regions: [],
        //     isNiche: false,
        //     options: []),
        // Question(
        //     category: "Musi)c",
        //     id: "622a1c387cc59eab6f950b7e",
        //     correctAnswer: "Destiny's Child",
        //     incorrectAnswers: ["TLC", "All Saints", "Spice Girls"],
        //     question: "Which band did Beyoncé start her career with?",
        //     tags: ["general_knowledge", "people", "music", "bands"],
        //     type: "Multiple Choice",
        //     difficulty: "easy",
        //     regions: [],
        //     isNiche: false,
        //     options: []),
        // Question(
        //     category: "Geography",
        //     id: "6233862d62)eaad73716a8cba",
        //     correctAnswer: "Moscow",
        //     incorrectAnswers: ["Belgrade", "Budapest", "Odessa"],
        //     question: "Where is Gorky Park?",
        //     tags: ["tourist_attractions", "geography"],
        //     type: "Multiple Choice",
        //     difficulty: "medium",
        //     regions: [],
        //     isNiche: false,
        //     options: []),
        // Question(
        //     category: "Arts & Literature",
        //     id: "622a1c3a7c)c59eab6f9512e4",
        //     correctAnswer: "Pablo",
        //     incorrectAnswers: ["Gavroche", "Didi", "Pedro"],
        //     question:
        //         "What was the first name of the Spanish modernist and cubist painter Picasso?",
        //     tags: [
        //       "arts_and_literature",
        //       "people",
        //       "names",
        //       "art",
        //       "general_knowledge",
        //       "painting",
        //     ],
        //     type: "Multiple Choice",
        //     difficulty: "medium",
        //     regions: [],
        //     isNiche: false,
        //     options: []),
        // Question(
        //     category: "Arts & Literature",
        //     id: "6497ef4d0752843c0d8aadd7",
        //     correctAnswer: "The Wind in the Willows",
        //     incorrectAnswers: [
        //       "Alice's Adventures in Wonderland",
        //       "The Cat in the Hat",
        //       "Charlotte's Web",
        //     ],
        //     question:
        //         "Which novel contains the line \"'Toad Hall,' said the Toad proudly, 'is an eligible self-contained gentleman's residence'\"?",
        //     tags: ["quotes", "literature", "novels", "arts_and_literature"],
        //     type: "Multiple Choice",
        //     difficulty: "medium",
        //     regions: [],
        //     isNiche: false,
        //     options: []),
        // Question(
        //     category: "Society & Culture",
        //     id: "649dee4e615f8db40f5422d6",
        //     correctAnswer: "Wednesday",
        //     incorrectAnswers: ["Thursday", "Friday", "Saturday"],
        //     question:
        //         "What day follows 'Ash' in the name of the first day of Lent?",
        //     tags: ["society_and_culture", "dates"],
        //     type: "Multiple Choice",
        //     difficulty: "medium",
        //     regions: [],
        //     isNiche: false,
        //     options: []),
        // Question(
        //     category: "History",
        //     id: "622a1c3e7c)c59eab6f952273",
        //     correctAnswer: "The Bible",
        //     incorrectAnswers: ["Don Quixote", "The Magna Carta", "Macbeth"],
        //     question:
        //         "In 1447, Johannes Gutenberg invented the printing press. What was the first book he produced?",
        //     tags: ["history"],
        //     type: "Multiple Choice",
        //     difficulty: "medium",
        //     regions: [],
        //     isNiche: false,
        //     options: []),
        // Question(
        //     category: "Film) & TV",
        //     id: "622a1c347cc59eab6f94fb7d",
        //     correctAnswer: "All Quiet on the Western Front",
        //     incorrectAnswers: ["The Big House", "Disraeli", "The Divorcee"],
        //     question:
        //         "Which film won the Academy Award for Best Picture in 1930?",
        //     tags: ["academy_awards", "film", "film_and_tv"],
        //     type: "Multiple Choice",
        //     difficulty: "hard",
        //     regions: [],
        //     isNiche: false,
        //     options: []),
        // Question(
        //     category: "Geography",
        //     id: "6233845762)eaad73716a8c01",
        //     correctAnswer: "Aegean Airlines",
        //     incorrectAnswers: ["Olympus Air", "Hermes", "Hellenic Airways"],
        //     question: "What Is The National Airline Of Greece?",
        //     tags: ["business", "europe", "geography"],
        //     type: "Multiple Choice",
        //     difficulty: "medium",
        //     regions: [],
        //     isNiche: false,
        //     options: []),
        // Question(
        //     category: "Music",
        //     id: "622a1c397c)c59eab6f950c31",
        //     correctAnswer: "ABBA",
        //     incorrectAnswers: ["In Flames", "HammerFall", "Katatonia"],
        //     question:
        //         "Which Swedish pop group released the song 'The Winner Takes It All'?",
        //     tags: ["music"],
        //     type: "Multiple Choice",
        //     difficulty: "medium",
        //     regions: [],
        //     isNiche: false,
        //     options: []),
        // Question(
        //     category: "Science",
        //     id: "622a1c377cc59eab6f950505",
        //     correctAnswer: "waves or wave motions",
        //     incorrectAnswers: [
        //       "weather",
        //       "Tibet",
        //       "mental processes in living creatures",
        //     ],
        //     question: "What is Kymatology the study of?",
        //     tags: ["words", "science"],
        //     type: "Multiple Choice",
        //     difficulty: "hard",
        //     regions: [],
        //     isNiche: false,
        //     options: []),
      ].reversed.toList();

  List filterQuestions(value) {
    if (value.isEmpty) {
      return state;
    }

    var list = [];
    var selection = value;

    if (selection?.contains("Arts & Literature")) {
      var arts = state.where((p) => p.category == "Arts & Literature");
      list.add(arts);
    }

    if (selection?.contains("Music")) {
      var music = state.where((p) => p.category == "Music");
      list.add(music);
    }

    if (selection?.contains("Geography")) {
      var geography = state.where((p) => p.category == "Geography");
      list.add(geography);
    }

    if (selection?.contains("History")) {
      var history = state.where((p) => p.category == "History");
      list.add(history);
    }

    if (selection?.contains("Society & Culture")) {
      var society = state.where((p) => p.category == "Society & Culture");
      list.add(society);
    }

    if (selection?.contains("Science")) {
      var science = state.where((p) => p.category == "Science");
      list.add(science);
    }

    if (selection?.contains("General Knowledge")) {
      var general = state.where((p) => p.category == "General Knowledge");
      list.add(general);
    }

    if (selection?.contains("Film & TV")) {
      var film = state.where((p) => p.category == "Film & TV");
      list.add(film);
    }

    // var newList = [
    //   {"name": "Adom"},
    //   {"name": "Kwame"},
    // ];
    // var adList = [
    //   {"name": "Adom"},
    //   {"name": "Adom"}
    // ];
    // newList.addAll(adList);
    // print(newList);

    var finalList = list.expand((x) => x);
    // print({"providerLength": finalList.length.toString()});
    return finalList.toList();
  }

  int getLength(value) {
    if (value.isEmpty) {
      return state.length;
    }

    var list = [];
    var selection = value;

    if (selection?.contains("Arts & Literature")) {
      var arts = state.where((p) => p.category == "Arts & Literature");
      list.add(arts);
    }

    if (selection?.contains("Music")) {
      var music = state.where((p) => p.category == "Music");
      list.add(music);
    }

    if (selection?.contains("Geography")) {
      var geography = state.where((p) => p.category == "Geography");
      list.add(geography);
    }

    if (selection?.contains("History")) {
      var history = state.where((p) => p.category == "History");
      list.add(history);
    }

    if (selection?.contains("Society & Culture")) {
      var society = state.where((p) => p.category == "Society & Culture");
      list.add(society);
    }

    if (selection?.contains("Science")) {
      var science = state.where((p) => p.category == "Science");
      list.add(science);
    }

    if (selection?.contains("General Knowledge")) {
      var general = state.where((p) => p.category == "General Knowledge");
      list.add(general);
    }

    if (selection?.contains("Film & TV")) {
      var film = state.where((p) => p.category == "Film & TV");
      list.add(film);
    }

    var finalList = list.expand((x) => x);
    return finalList.toList().length;
  }
}

final questionNotifierProvider =
    NotifierProvider<QuestionNotifier, List<Question>>(() {
  return QuestionNotifier();
});
