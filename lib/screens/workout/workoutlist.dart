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

class ExercisesList {

  //---------ABS--------

  var excAbsName1 = 'Laying Leg Raises';
  var excAbsInstruction1 = "Lay on your back with your arms palms down on either side. Keep your legs together and as straight as possible. Slowly raise your legs to a 90° angle, pause at this position, or as high as you can reach your legs, and then slowly lower your legs back down. Duration of these movements should be slow so that you do not utilize momentum, enabling you to get the most out of the exercise.";
  var excAbsVideo1 = 'assets/videos/laying-legs-raises.gif';

  var excAbsName2 = 'Hanging Knee Raises';
  var excAbsInstruction2 = "Grab the bar and hang, your body still and your legs straight.Slowly draw your knees up to your chestOnce you have raised your knees as high as possible, lower your legs and repeat. Duration of these movements should be slow so that you do not utilize momentum, enabling you to get the most out of the exercise.Duration of these movements should be slow so that you do not utilize momentum, enabling you to get the most out of the exercise.";
  var excAbsVideo2 = 'assets/videos/hanging-knee-raises.gif';

  var excAbsName3 = 'Forearm Plank';
  var excAbsInstruction3 = "Place forearms on the ground with your elbows bent at a 90° angle aligned beneath your shoulders, with your arms parallel at shoulder-width. Your feet should be together, with only your toes touching the floor. Lift your belly off the floor and form a straight line from your heels to the crown of your head and hold.";
  var excAbsVideo3 = 'assets/videos/forearm-plank.gif';

  //---------BICEPS--------

  var excBicepsName1 = 'Barbell Curl';
  var excBicepsInstruction1 = "While holding the upper arms stationary, curl the weights forward while contracting the biceps as you breathe out. Continue the movement until your biceps are fully contracted and the bar is at shoulder level. Hold the contracted position for a second and squeeze the biceps hard. Slowly bring the weight back down to the starting position.";
  var excBicepsVideo1 = 'assets/videos/barbell-curl.gif';

  var excBicepsName2 = 'Dumbbell Hammer Curl';
  var excBicepsInstruction2 = "Hold the dumbbells with a neutral grip (thumbs facing the ceiling). Slowly lift the dumbbell up to chest height Return to starting position and repeat.";
  var excBicepsVideo2 = 'assets/videos/dumbbell-hammer-curl.gif';

  var excBicepsName3 = 'Goblet Curl';
  var excBicepsInstruction3 = "Stand up straight with a kettlebell in both hands in front of your pelvis. Raise the kettlebell bending your arms at the elbow until the kettlebell is level with your chest. Lower to the starting position and repeat.";
  var excBicepsVideo3 = 'assets/videos/goblet-curl.gif';

  //---------TRICEPS--------

  var excTricepsName1 = 'Cable Push Down';
  var excTricepsInstruction1 = "You can use any attachment for this. The cable should be set all the way at the top of the machine. Make sure to keep your upper arm glued at your side. Extend your elbows until you feel your triceps contract.";
  var excTricepsVideo1 = 'assets/videos/cable-push-down.gif';

  var excTricepsName2 = 'Cross Pushdown';
  var excTricepsInstruction2 = 'Either use two handles or no attachment at all. Both sides of the cable crossover should be set to the top. Stand in the center of the machine holding each Cable in the opposing hand. Your upper arm should be at a 45 degree angle with your torso. Extend your elbows until you feel a contraction and then return to the starting position';
  var excTricepsVideo2 = 'assets/videos/cross-pushdown.gif';

  var excTricepsName3 = 'Cable Overhead Tricep Ext';
  var excTricepsInstruction3 = 'You can use any attachment. The cable should be all the way to the bottom of the machine. Face away from the machine. Point your elbows straight up toward the ceiling. From there, extend your elbows until your fists are pointed straight toward the ceiling.';
  var excTricepsVideo3 = 'assets/videos/cable-overhead-tricep-extension.gif';

  //---------CHEST--------

  var excChestName1 = 'Cable Pec Fly';
  var excChestInstruction1 = 'Use a handle attachment set all the way to the bottom of the machine. Bring both of the handles to your chest and make sure you are in the center of the cable crossover. Walk a few steps forward. Then press the weight forward. From there, your shoulders should horizontally abduct and adduct while your elbows stay in a fixed position.';
  var excChestVideo1 = 'assets/videos/cable-pec-fly.gif';

  var excChestName2 = 'Incline Dumbbell Bench';
  var excChestInstruction2 = 'Raise the bench to a 30 - 45 degree angle. Lay on the bench and set your feet on the ground. Raise the dumbbells with straight arms then slowly lower them to about shoulder width. Raise them again until your arms are locked and at the starting position again.';
  var excChestVideo2 = 'assets/videos/incline-dumbbell-bench-press.gif';

  var excChestName3 = 'Barbell Bench Press';
  var excChestInstruction3 = 'Lay flat on the bench with your feet on the ground. With straight arms unrack the bar. Lower the bar to your mid chest. Raise the bar until you have locked your elbows';
  var excChestVideo3 = 'assets/videos/barbell-bench-press.gif';

  //---------BACK--------

  var excBackName1 = 'Pull Ups';
  var excBackInstruction1 = 'Grasp the bar with an overhand grip, arms and shoulders fully extended. Pull your body up until your chin is above the bar. Lower your body back to starting position.';
  var excBackVideo1 = 'assets/videos/pull-ups.gif';

  var excBackName2 = 'Upright Row';
  var excBackInstruction2 = 'Use a handle attachment with the cable set to the bottom of the machine. Pull your elbows straight up toward the ceiling until the attachment is just below your chin then extend until your elbows are fully extended.';
  var excBackVideo2 = 'assets/videos/upright-row.gif';

  var excBackName3 = 'Cable Pullover';
  var excBackInstruction3 = 'You can use any attachment. Cable should be set all the way to the top of the machine. Grab your attachment and walk a few steps back. Push your butt back to where you are leaning forward somewhat. Initiate the movement with your shoulders and not your elbows. Imagine trying to pull the attachment through your thighs at the bottom.';
  var excBackVideo3 = 'assets/videos/cable-pullover.gif';

  var excBackName4 = 'Deadlift';
  var excBackInstruction4 = 'Stand with your mid-foot under the bar and grip the bar with your hands, about a shoulder width apart. Bend your knees, then lift the bar by straightening your back. It is important to keep your back straight. Stand to your full height and hold. Lower the bar to the floor by bending your knees and keeping your back straight.';
  var excBackVideo4 = 'assets/videos/deadlift.gif';

  //---------LEGS--------
  var excLegsName1 = 'Barbell Squat';
  var excLegsInstruction1 = 'Stand with your feet shoulder-width apart. Maintain the natural arch in your back, squeezing your shoulder blades and raising your chest. Grip the bar across your shoulders and support it on your upper back. Unwrack the bar by straightening your legs, and take a step back. Bend your knees as you lower the weight without altering the form of your back until your hips are below your knees. Raise the bar back to starting position, lift with your legs and exhale at the top.';
  var excLegsVideo1 = 'assets/videos/barbell-squat.gif';

  var excLegsName2 = 'Dumbbell Calf Raise';
  var excLegsInstruction2 = 'Stand tall with your feet on the ground. You can put the the balls of your feet on top of a plate to extend the range of motion. Imagine you have a string attached to your heels and pull your heels up toward the ceiling.';
  var excLegsVideo2 = 'assets/videos/dumbbell-calf-raise.gif';

  var excLegsName3 = 'Pull Through';
  var excLegsInstruction3 = 'This exercise works best with a rope attachment but can be done with anything. The attachment should be set to the bottom of the machine. Face away from the cable machine, straddle the cable itself, and grab the attachment. Walk a few steps away. Break at the hips while maintaining a flat back and mostly extended knees. Push hips forward until you are back in a standing position.';
  var excLegsVideo3 = 'assets/videos/pull-through.gif';

  //---------SHOULDERS--------

  var excShouldersName1 = '';
  var excShouldersInstruction1 = '';
  var excShouldersVideo1 = '';

  var excShouldersName2 = '';
  var excShouldersInstruction2 = '';
  var excShouldersVideo2 = '';

  var excShouldersName3 = '';
  var excShouldersInstruction3 = '';
  var excShouldersVideo3 = '';

  //---------REAR--------

  var excRearName1 = '';
  var excRearInstruction1 = '';
  var excRearVideo1 = '';

  var excRearName2 = '';
  var excRearInstruction2 = '';
  var excRearVideo2 = '';

  var excRearName3 = '';
  var excRearInstruction3 = '';
  var excRearVideo3 = '';
}

class WorkoutList {
  final String image, name, instruction, video;

  WorkoutList(
      {
        required this.image,
        required this.name,
        required this.instruction,
        required this.video
      }
      );
}

  List exercisesName = [
    {
      'name': 'Abs',
      'exercise':[
        ExercisesList().excAbsName1,
        ExercisesList().excAbsName2,
        ExercisesList().excAbsName3
      ]
    },
    {
      'name': 'Biceps',
      'exercise':[
        ExercisesList().excBicepsName1,
        ExercisesList().excBicepsName2,
        ExercisesList().excBicepsName3
      ]
    },
    {
      'name': 'Triceps',
      'exercise':[
        ExercisesList().excTricepsName1,
        ExercisesList().excTricepsName2,
        ExercisesList().excTricepsName3
      ]
    },
    {
      'name': 'Chest',
      'exercise':[
        ExercisesList().excChestName1,
        ExercisesList().excChestName2,
        ExercisesList().excChestName3
      ]
    },
    {
      'name': 'Back',
      'exercise':[
        ExercisesList().excBackName1,
        ExercisesList().excBackName2,
        ExercisesList().excBackName3,
        ExercisesList().excBackName4
      ]
    },
    {
      'name': 'Legs',
      'exercise':[
        ExercisesList().excLegsName1,
        ExercisesList().excLegsName2,
        ExercisesList().excLegsName3
      ]
    },
    {
      'name': 'Shoulders',
      'exercise':[
        ExercisesList().excShouldersName1,
        ExercisesList().excShouldersName2,
        ExercisesList().excShouldersName3
      ]
    },
    {
      'name': 'Rear',
      'exercise':[
        ExercisesList().excRearName1,
        ExercisesList().excRearName2,
        ExercisesList().excRearName3
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
      "assets/images/back.png",
      "assets/images/back.png"
    ]
  },
  {
    'name': 'Legs',
    'exercise':[
      "assets/images/legs.png",
      "assets/images/legs.png",
      "assets/images/legs.png"
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
      ExercisesList().excAbsInstruction1,
      ExercisesList().excAbsInstruction2,
      ExercisesList().excAbsInstruction3
    ]
  },
  {
    'name': 'Biceps',
    'exercise':[
      ExercisesList().excBicepsInstruction1,
      ExercisesList().excBicepsInstruction2,
      ExercisesList().excBicepsInstruction3
    ]
  },
  {
    'name': 'Triceps',
    'exercise':[
      ExercisesList().excTricepsInstruction1,
      ExercisesList().excTricepsInstruction2,
      ExercisesList().excTricepsInstruction3
    ]
  },
  {
    'name': 'Chest',
    'exercise':[
      ExercisesList().excChestInstruction1,
      ExercisesList().excChestInstruction2,
      ExercisesList().excChestInstruction3
    ]
  },
  {
    'name': 'Back',
    'exercise':[
      ExercisesList().excBackInstruction1,
      ExercisesList().excBackInstruction2,
      ExercisesList().excBackInstruction3,
      ExercisesList().excBackInstruction4
    ]
  },
  {
    'name': 'Legs',
    'exercise':[
      ExercisesList().excLegsInstruction1,
      ExercisesList().excLegsInstruction2,
      ExercisesList().excLegsInstruction3
    ]
  },
  {
    'name': 'Shoulders',
    'exercise':[
      ExercisesList().excShouldersInstruction1,
      ExercisesList().excShouldersInstruction2,
      ExercisesList().excShouldersInstruction3
    ]
  },
  {
    'name': 'Rear',
    'exercise':[
      ExercisesList().excRearInstruction1,
      ExercisesList().excRearInstruction2,
      ExercisesList().excRearInstruction3
    ]
  },
];

List exercisesVideo = [
  {
    'name': 'Abs',
    'exercise':[
      ExercisesList().excAbsVideo1,
      ExercisesList().excAbsVideo2,
      ExercisesList().excAbsVideo3
    ]
  },
  {
    'name': 'Biceps',
    'exercise':[
      ExercisesList().excBicepsVideo1,
      ExercisesList().excBicepsVideo2,
      ExercisesList().excBicepsVideo3
    ]
  },
  {
    'name': 'Triceps',
    'exercise':[
      ExercisesList().excTricepsVideo1,
      ExercisesList().excTricepsVideo2,
      ExercisesList().excTricepsVideo3
    ]
  },
  {
    'name': 'Chest',
    'exercise':[
      ExercisesList().excChestVideo1,
      ExercisesList().excChestVideo2,
      ExercisesList().excChestVideo3
    ]
  },
  {
    'name': 'Back',
    'exercise':[
      ExercisesList().excBackVideo1,
      ExercisesList().excBackVideo2,
      ExercisesList().excBackVideo3,
      ExercisesList().excBackVideo4
    ]
  },
  {
    'name': 'Legs',
    'exercise':[
      ExercisesList().excLegsVideo1,
      ExercisesList().excLegsVideo2,
      ExercisesList().excLegsVideo3
    ]
  },
  {
    'name': 'Shoulders',
    'exercise':[
      ExercisesList().excShouldersVideo1,
      ExercisesList().excShouldersVideo2,
      ExercisesList().excShouldersVideo3
    ]
  },
  {
    'name': 'Rear',
    'exercise':[
      ExercisesList().excRearVideo1,
      ExercisesList().excRearVideo2,
      ExercisesList().excRearVideo3
    ]
  },
];
