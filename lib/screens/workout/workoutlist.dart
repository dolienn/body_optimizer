class Parts {
  final String title;
  final String image;
  final String excercises;

  Parts({
    required this.title, required this.image, required this.excercises
  });
}

class PartsCreator {

  final List<Parts> partitions = [
    Parts(title: "Abs", image: "assets/images/abs.png", excercises: ''),
    Parts(title: "Biceps", image: "assets/images/biceps.png", excercises: ''),
    Parts(title: "Triceps", image: "assets/images/triceps.png", excercises: ''),
    Parts(title: "Chest", image: "assets/images/chest.png", excercises: ''),
    Parts(title: "Back", image: "assets/images/back.png", excercises: ''),
    Parts(title: "Legs", image: "assets/images/legs.png", excercises: ''),
    Parts(title: "Shoulders", image: "assets/images/shoulders.png", excercises: ''),
    Parts(title: "Rear", image: "assets/images/rear.png", excercises: ''),
  ];
}

class WorkoutList {
  final String image, name, instruction, video;

  WorkoutList({required this.image, required this.name, required this.instruction, required this.video
  });
}
class WorkoutListCreator {

  final List<WorkoutList> absExc =[
  WorkoutList(image: "assets/images/abs.png", name: "absExcercise1", instruction: "Lorem input", video: "Video"),
  WorkoutList(image: "assets/images/abs.png", name: "absExcercise2", instruction: "Lorem input2", video: "Video2")
  ];

  final List<WorkoutList> bicepsExc =[
    WorkoutList(image: "assets/images/biceps.png", name: "bicepsExcercise1", instruction: "Lorem input", video: "Video"),
    WorkoutList(image: "assets/images/biceps.png", name: "bicepsExcercise2", instruction: "Lorem input2", video: "Video2")
  ];

  final List<WorkoutList> tricepsExc =[
    WorkoutList(image: "assets/images/triceps.png", name: "tricepsExcercise1", instruction: "Lorem input", video: "Video"),
    WorkoutList(image: "assets/images/triceps.png", name: "tricepsExcercise2", instruction: "Lorem input2", video: "Video2")
  ];

  final List<WorkoutList> chestExc =[
    WorkoutList(image: "assets/images/chest.png", name: "chestExcercise1", instruction: "Lorem input", video: "Video"),
    WorkoutList(image: "assets/images/chest.png", name: "chestExcercise2", instruction: "Lorem input2", video: "Video2")
  ];

  final List<WorkoutList> backExc =[
    WorkoutList(image: "assets/images/back.png", name: "backExcercise1", instruction: "Lorem input", video: "Video"),
    WorkoutList(image: "assets/images/back.png", name: "backExcercise2", instruction: "Lorem input2", video: "Video2")
  ];

  final List<WorkoutList> legsExc =[
    WorkoutList(image: "assets/images/legs.png", name: "legsExcercise1", instruction: "Lorem input", video: "Video"),
    WorkoutList(image: "assets/images/legs.png", name: "legsExcercise2", instruction: "Lorem input2", video: "Video2")
  ];

  final List<WorkoutList> shouldersExc =[
    WorkoutList(image: "assets/images/shoulders.png", name: "shouldersExcercise1", instruction: "Lorem input", video: "Video"),
    WorkoutList(image: "assets/images/shoulders.png", name: "shouldersExcercise2", instruction: "Lorem input2", video: "Video2")
  ];

  final List<WorkoutList> rearExc =[
    WorkoutList(image: "assets/images/rear.png", name: "rearExcercise1", instruction: "Lorem input", video: "Video"),
    WorkoutList(image: "assets/images/rear.png", name: "rearExcercise2", instruction: "Lorem input2", video: "Video2")
  ];
}


