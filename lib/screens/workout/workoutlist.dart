class Parts {
  final String title;
  final String image;
  final String excercises;

  Parts({required this.title, required this.image, required this.excercises});
}

class PartsCreator {
  final List<Parts> partitions = [
    Parts(
        title: "Abs",
        image: "assets/images/abs.png",
        excercises: ''),
    Parts(
        title: "Biceps",
        image: "assets/images/biceps.png",
        excercises: ''),
    Parts(
        title: "Triceps",
        image: "assets/images/triceps.png",
        excercises: ''),
    Parts(
        title: "Chest",
        image: "assets/images/chest.png",
        excercises: ''),
    Parts(
        title: "Back",
        image: "assets/images/back.png",
        excercises: ''),
    Parts(
        title: "Legs",
        image: "assets/images/legs.png",
        excercises: ''),
    Parts(
        title: "Shoulders",
        image: "assets/images/shoulders.png",
        excercises: ''),
    Parts(
        title: "Rear",
        image: "assets/images/rear.png",
        excercises: ''),
  ];
}

class WorkoutList {
  final String image, name, instruction, video;

  WorkoutList(
      {required this.image,
      required this.name,
      required this.instruction,
      required this.video});
}

  List exercisesName = [
    {
      'name': 'Abs',
      'exercise':[
        "abs1",
        "abs2",
        "abs3"
      ]
    },
    {
      'name': 'Biceps',
      'exercise':[
        "biceps1",
        "biceps2",
        "biceps3"
      ]
    },
    {
      'name': 'Triceps',
      'exercise':[
        "triceps1",
        "triceps2",
        "triceps3"
      ]
    },
    {
      'name': 'Chest',
      'exercise':[
        "chest1",
        "chest2",
        "chest3"
      ]
    },
    {
      'name': 'Back',
      'exercise':[
        "back1",
        "back2",
        "back3"
      ]
    },
    {
      'name': 'Legs',
      'exercise':[
        "legs1",
        "legs2",
        "legs3"
      ]
    },
    {
      'name': 'Shoulders',
      'exercise':[
        "shoulders1",
        "shoulders2",
        "shoulders3"
      ]
    },
    {
      'name': 'Rear',
      'exercise':[
        "rear1",
        "rear2",
        "rear3"
      ]
    },
  ];

List exercisesImage = [
  {
    'name': 'Abs',
    'exercise':[
      "assets/images/abs.png",
      "assets/images/abs.png",
      "assets/images/abs.png"
    ]

  },
  {
    'name': 'Biceps',
    'exercise':[
      "assets/images/biceps.png",
      "assets/images/biceps.png",
      "assets/images/biceps.png"
    ]
  },
  {
    'name': 'Triceps',
    'exercise':[
      "assets/images/triceps.png",
      "assets/images/triceps.png",
      "assets/images/triceps.png"
    ]
  },
  {
    'name': 'Chest',
    'exercise':[
      "assets/images/chest.png",
      "assets/images/chest.png",
      "assets/images/chest.png"
    ]
  },
  {
    'name': 'Back',
    'exercise':[
      "assets/images/back.png",
      "assets/images/back.png",
      "assets/images/back.png"
    ]
  },
  {
    'name': 'Legs',
    'exercise':[
      "assets/images/back.png",
      "assets/images/back.png",
      "assets/images/back.png"
    ]
  },
  {
    'name': 'Shoulders',
    'exercise':[
      "assets/images/shoulders.png",
      "assets/images/shoulders.png",
      "assets/images/shoulders.png"
    ]
  },
  {
    'name': 'Rear',
    'exercise':[
      "assets/images/rear.png",
      "assets/images/rear.png",
      "assets/images/rear.png"
    ]
  },
];

List exercisesDescription = [
  {
    'name': 'Abs',
    'exercise':[
      "absdescription1",
      "absdescription2",
      "absdescription3"
    ]
  },
  {
    'name': 'Biceps',
    'exercise':[
      "bicepsdescription1",
      "bicepsdescription2",
      "bicepsdescription3"
    ]
  },
  {
    'name': 'Triceps',
    'exercise':[
      "tricepsdescription1",
      "tricepsdescription2",
      "tricepsdescription3"
    ]
  },
  {
    'name': 'Chest',
    'exercise':[
      "chestdescription1",
      "chestdescription2",
      "chestdescription3"
    ]
  },
  {
    'name': 'Back',
    'exercise':[
      "backdescription1",
      "backdescription2",
      "backdescription3"
    ]
  },
  {
    'name': 'Legs',
    'exercise':[
      "legsdescription1",
      "legsdescription2",
      "legsdescription3"
    ]
  },
  {
    'name': 'Shoulders',
    'exercise':[
      "shouldersdescription1",
      "shouldersdescription2",
      "shouldersdescription3"
    ]
  },
  {
    'name': 'Rear',
    'exercise':[
      "reardescription1",
      "reardescription2",
      "reardescription3"
    ]
  },
];
/*
      'image': "assets/images/abs.png",
      'name': "absExcercise1",
      'instruction': "Lorem input",
      'video': "Video"
    }
    ],
    1: [{

      'image': "assets/images/biceps.png",
      'name': "absExcercise1",
      'instruction': "Lorem input",
      'video': "Video"
    }, {


      'image': "assets/images/biceps.png",
      'name': "absExcercise1",
      'instruction': "Lorem input",
      'video': "Video"
    }
    ]
  };
    1: [
      WorkoutList(
          image: "assets/images/biceps.png",
          name: "bicepsExcercise1",
          instruction: "Lorem input",
          video: "Video"),
      WorkoutList(
          image: "assets/images/biceps.png",
          name: "bicepsExcercise2",
          instruction: "Lorem input2",
          video: "Video2")
    ],
    2: [
      WorkoutList(
          image: "assets/images/triceps.png",
          name: "tricepsExcercise1",
          instruction: "Lorem input",
          video: "Video"),
      WorkoutList(
          image: "assets/images/triceps.png",
          name: "tricepsExcercise2",
          instruction: "Lorem input2",
          video: "Video2")
    ],
    3: [
      WorkoutList(
          image: "assets/images/chest.png",
          name: "chestExcercise1",
          instruction: "Lorem input",
          video: "Video"),
      WorkoutList(
          image: "assets/images/chest.png",
          name: "chestExcercise2",
          instruction: "Lorem input2",
          video: "Video2")
    ],
    4: [
      WorkoutList(
          image: "assets/images/back.png",
          name: "backExcercise1",
          instruction: "Lorem input",
          video: "Video"),
      WorkoutList(
          image: "assets/images/back.png",
          name: "backExcercise2",
          instruction: "Lorem input2",
          video: "Video2")
    ],
    5: [
      WorkoutList(
          image: "assets/images/legs.png",
          name: "legsExcercise1",
          instruction: "Lorem input",
          video: "Video"),
      WorkoutList(
          image: "assets/images/legs.png",
          name: "legsExcercise2",
          instruction: "Lorem input2",
          video: "Video2")
    ],
    6: [
      WorkoutList(
          image: "assets/images/shoulders.png",
          name: "shouldersExcercise1",
          instruction: "Lorem input",
          video: "Video"),
      WorkoutList(
          image: "assets/images/shoulders.png",
          name: "shouldersExcercise2",
          instruction: "Lorem input2",
          video: "Video2")
    ],
    7: [
      WorkoutList(
          image: "assets/images/rear.png",
          name: "rearExcercise1",
          instruction: "Lorem input",
          video: "Video"),
      WorkoutList(
          image: "assets/images/rear.png",
          name: "rearExcercise2",
          instruction: "Lorem input2",
          video: "Video2")
    ],

 */