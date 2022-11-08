/*
To do:

Move the row in exercise manager so that the buttons can be moved to the bottom of the page
Saving workout
Create some sort of exercise data class/list that will be available in the entire program
I think that I somehow need to get the Row out of List view but I don't know how to do it.

Useful links etc.
https://medium.com/aubergine-solutions/4-types-of-listview-in-flutter-you-should-know-30cf9e7f1739
https://mercyjemosop.medium.com/flutter-list-view-1045969b1799
void _updateMyItems(int oldIndex, int newIndex) {
  if (newIndex > oldIndex) {
    newIndex -= 1;
  }
  final String item = items.removeAt(oldIndex);
  items.insert(newIndex, item);
}

Create an ID for every exercise
Create a time value for exercises for workout
 */
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomWorkout{

  CustomWorkout({
    required this.name,
    required this.workout,
  });

  String name;
  var workout = [];
}

class AbsExercises {

  AbsExercises({
    required this.id,
    required this.value,
    required this.expandedValue,
    required this.headerValue,
  });

  int id;
  bool value;
  String expandedValue;
  String headerValue;


//I may have to move this list somewhere higher so that it would be visible to the other pages of workout creator
  static List<AbsExercises> generateItems(int numberOfItems) {
    bool trigger = false;
    String absTitleOne = "Crunches"; // Here we'd change the "Crunches" to String absTitleOne = (variable from some exercise data page)
    String absTitleTwo = "Plank";
    String absTitleThree = "V-Ups";
    String absTitleFour = "Hollow Holds";
    String absTitleFive = "Medicine Ball Slam";

    String absDescriptionOne = "Crunches is an abdominal endurance training exercise to strengthen, abdominal muscles. It is similar to a crunch but with fuller range of motion and  additional muscles";
    String absDescriptionTwo = "Focus on closing the distance between your ribs and hips by lifting your shoulders off the floor while maintaining contact between the ground and your lower back. Moving the top half up puts more emphasis on your upper abs. Start with sets of five and work towards 15.";
    String absDescriptionThree = "Starting on your back, extend your legs and keep your arms by your side. In one movement, lift your upper-body, arms and legs to balance on your tailbone, forming a V shape. Lower your body down.";
    String absDescriptionFour = "Lie on the floor with your legs stretched out in front of you and your feet together. Extend your arms above your head. Tilt your pelvis forward until your lower back is flush against the floor. Maintaining this position in your lower back, raise your arms and legs a few inches off the floor to create a straight line from fingers to toes.";
    String absDescriptionFive = "Standing up with your knees slightly bent lift the medicine ball directly over your head with your arms extended. Rise up on the balls of your feet and use your core muscles to throw the ball to the ground as you bend forwards at the waist. Catch the ball and repeat. The motion will not only train your abs but will also give you powerful shoulders.";
    return List<AbsExercises>.generate(numberOfItems, (int index) {
      if(index == 0){
        return AbsExercises(
          id: index,
          value: trigger,
          headerValue: absTitleOne,
          expandedValue: absDescriptionOne,
        );
      }
      if(index == 1){
        return AbsExercises(
          id: index,
          value: trigger,
          headerValue: absTitleTwo,
          expandedValue: absDescriptionTwo,
        );
      }
      if(index == 2){
        return AbsExercises(
          id: index,
          value: trigger,
          headerValue: absTitleThree,
          expandedValue: absDescriptionThree,
        );
      }
      if(index == 3){
        return AbsExercises(
          id: index,
          value: trigger,
          headerValue: absTitleFour,
          expandedValue: absDescriptionFour,
        );
      }
      if(index == 4){
        return AbsExercises(
          id: index,
          value: trigger,
          headerValue: absTitleFive,
          expandedValue: absDescriptionFive,
        );
      }
      return AbsExercises(
        id: index,
        value: trigger,
        headerValue: 'Panel $index',
        expandedValue: 'This is item number $index ThThis is item number $index This is item number $index This is item number $index This is item number $index This is item number $index This is item number $index This is item number $index This is item number $index This is item number $index is is item number $index ',
      );
    });
  }
}

class BicepsExercises {

  BicepsExercises({
    required this.id,
    required this.value,
    required this.expandedValue,
    required this.headerValue,
  });

  int id;
  bool value;
  String expandedValue;
  String headerValue;

  static List<BicepsExercises> generateItems(int numberOfItems) {
    bool trigger = false;
    String titleOne = "Barbell Curl";
    String titleTwo = "Cable Curl";
    String titleThree = "Dumbbell Curl";
    String titleFour = "Chin-Up";
    String titleFive = "Reverse-Grip Barbell Row";

    String descriptionOne = "Hit your heavy curls at the beginning of your biceps workout when you can really challenge yourself with weight. For a bit more of a strength stimulus, choose a weight you can handle for about 6-8 reps, or even a classic size-and-strength rep range like 5x5. A common biceps blunder is rocking your body excessively on this movement. Keep it strict for the most part, especially when you're going heavy.";
    String descriptionTwo = "This movement seems a lot like the standing barbell curl at first glance. After all, they're both bilateral movements in which you take a shoulder-width, underhand grip on the bar. What makes it different is that, like all of the best muscle-building cable exercises, the angle of loading gives you constant tension on the muscle through the full range of motion.";
    String descriptionThree = "If you're doing these after barbell or cable curls, emphasize the difference by performing Zottmans, or take bilateral seated curls to fatigue and then extend the set by switching to unilateral curls.";
    String descriptionFour = "If you train back with biceps, this exercise could make a great bridge movement between the two body parts for 3-4 sets of 8-12 reps. It can also be your primary upper-back and biceps move in a home workout if you take a few sets to failure, like in strength coach Paul Carter's program Jacked at Home: Body-weight Muscle-Building Workouts.";
    String descriptionFive = "Include it in your back routine, or as a bridge exercise when training back and biceps together. Go fairly heavy and train in the classic muscle-building rep range of 8-12 reps.";
    return List<BicepsExercises>.generate(numberOfItems, (int index) {
      if(index == 0){
        return BicepsExercises(
          id: index,
          value: trigger,
          headerValue: titleOne,
          expandedValue: descriptionOne,
        );
      }
      if(index == 1){
        return BicepsExercises(
          id: index,
          value: trigger,
          headerValue: titleTwo,
          expandedValue: descriptionTwo,
        );
      }
      if(index == 2){
        return BicepsExercises(
          id: index,
          value: trigger,
          headerValue: titleThree,
          expandedValue: descriptionThree,
        );
      }
      if(index == 3){
        return BicepsExercises(
          id: index,
          value: trigger,
          headerValue: titleFour,
          expandedValue: descriptionFour,
        );
      }
      if(index == 4){
        return BicepsExercises(
          id: index,
          value: trigger,
          headerValue: titleFive,
          expandedValue: descriptionFive,
        );
      }
      return BicepsExercises(
        id: index,
        value: trigger,
        headerValue: 'Panel $index',
        expandedValue: 'This is item number $index ThThis is item number $index This is item number $index This is item number $index This is item number $index This is item number $index This is item number $index This is item number $index This is item number $index This is item number $index is is item number $index ',
      );
    });
  }
}

class TricepsExercises {

  TricepsExercises({
    required this.id,
    required this.value,
    required this.expandedValue,
    required this.headerValue,
  });

  int id;
  bool value;
  String expandedValue;
  String headerValue;


//I may have to move this list somewhere higher so that it would be visible to the other pages of workout creator
  static List<AbsExercises> generateItems(int numberOfItems) {
    bool trigger = false;
    String absTitleOne = "Crunches"; // Here we'd change the "Crunches" to String absTitleOne = (variable from some exercise data page)
    String absTitleTwo = "Plank";
    String absTitleThree = "V-Ups";
    String absTitleFour = "Hollow Holds";
    String absTitleFive = "Medicine Ball Slam";

    String absDescriptionOne = "Crunches is an abdominal endurance training exercise to strengthen, abdominal muscles. It is similar to a crunch but with fuller range of motion and  additional muscles";
    String absDescriptionTwo = "Focus on closing the distance between your ribs and hips by lifting your shoulders off the floor while maintaining contact between the ground and your lower back. Moving the top half up puts more emphasis on your upper abs. Start with sets of five and work towards 15.";
    String absDescriptionThree = "Starting on your back, extend your legs and keep your arms by your side. In one movement, lift your upper-body, arms and legs to balance on your tailbone, forming a V shape. Lower your body down.";
    String absDescriptionFour = "Lie on the floor with your legs stretched out in front of you and your feet together. Extend your arms above your head. Tilt your pelvis forward until your lower back is flush against the floor. Maintaining this position in your lower back, raise your arms and legs a few inches off the floor to create a straight line from fingers to toes.";
    String absDescriptionFive = "Standing up with your knees slightly bent lift the medicine ball directly over your head with your arms extended. Rise up on the balls of your feet and use your core muscles to throw the ball to the ground as you bend forwards at the waist. Catch the ball and repeat. The motion will not only train your abs but will also give you powerful shoulders.";
    return List<AbsExercises>.generate(numberOfItems, (int index) {
      if(index == 0){
        return AbsExercises(
          id: index,
          value: trigger,
          headerValue: absTitleOne,
          expandedValue: absDescriptionOne,
        );
      }
      if(index == 1){
        return AbsExercises(
          id: index,
          value: trigger,
          headerValue: absTitleTwo,
          expandedValue: absDescriptionTwo,
        );
      }
      if(index == 2){
        return AbsExercises(
          id: index,
          value: trigger,
          headerValue: absTitleThree,
          expandedValue: absDescriptionThree,
        );
      }
      if(index == 3){
        return AbsExercises(
          id: index,
          value: trigger,
          headerValue: absTitleFour,
          expandedValue: absDescriptionFour,
        );
      }
      if(index == 4){
        return AbsExercises(
          id: index,
          value: trigger,
          headerValue: absTitleFive,
          expandedValue: absDescriptionFive,
        );
      }
      return AbsExercises(
        id: index,
        value: trigger,
        headerValue: 'Panel $index',
        expandedValue: 'This is item number $index ThThis is item number $index This is item number $index This is item number $index This is item number $index This is item number $index This is item number $index This is item number $index This is item number $index This is item number $index is is item number $index ',
      );
    });
  }
}

class ChestExercises {

  ChestExercises({
    required this.id,
    required this.value,
    required this.expandedValue,
    required this.headerValue,
  });

  int id;
  bool value;
  String expandedValue;
  String headerValue;


//I may have to move this list somewhere higher so that it would be visible to the other pages of workout creator
  static List<AbsExercises> generateItems(int numberOfItems) {
    bool trigger = false;
    String absTitleOne = "Crunches"; // Here we'd change the "Crunches" to String absTitleOne = (variable from some exercise data page)
    String absTitleTwo = "Plank";
    String absTitleThree = "V-Ups";
    String absTitleFour = "Hollow Holds";
    String absTitleFive = "Medicine Ball Slam";

    String absDescriptionOne = "Crunches is an abdominal endurance training exercise to strengthen, abdominal muscles. It is similar to a crunch but with fuller range of motion and  additional muscles";
    String absDescriptionTwo = "Focus on closing the distance between your ribs and hips by lifting your shoulders off the floor while maintaining contact between the ground and your lower back. Moving the top half up puts more emphasis on your upper abs. Start with sets of five and work towards 15.";
    String absDescriptionThree = "Starting on your back, extend your legs and keep your arms by your side. In one movement, lift your upper-body, arms and legs to balance on your tailbone, forming a V shape. Lower your body down.";
    String absDescriptionFour = "Lie on the floor with your legs stretched out in front of you and your feet together. Extend your arms above your head. Tilt your pelvis forward until your lower back is flush against the floor. Maintaining this position in your lower back, raise your arms and legs a few inches off the floor to create a straight line from fingers to toes.";
    String absDescriptionFive = "Standing up with your knees slightly bent lift the medicine ball directly over your head with your arms extended. Rise up on the balls of your feet and use your core muscles to throw the ball to the ground as you bend forwards at the waist. Catch the ball and repeat. The motion will not only train your abs but will also give you powerful shoulders.";
    return List<AbsExercises>.generate(numberOfItems, (int index) {
      if(index == 0){
        return AbsExercises(
          id: index,
          value: trigger,
          headerValue: absTitleOne,
          expandedValue: absDescriptionOne,
        );
      }
      if(index == 1){
        return AbsExercises(
          id: index,
          value: trigger,
          headerValue: absTitleTwo,
          expandedValue: absDescriptionTwo,
        );
      }
      if(index == 2){
        return AbsExercises(
          id: index,
          value: trigger,
          headerValue: absTitleThree,
          expandedValue: absDescriptionThree,
        );
      }
      if(index == 3){
        return AbsExercises(
          id: index,
          value: trigger,
          headerValue: absTitleFour,
          expandedValue: absDescriptionFour,
        );
      }
      if(index == 4){
        return AbsExercises(
          id: index,
          value: trigger,
          headerValue: absTitleFive,
          expandedValue: absDescriptionFive,
        );
      }
      return AbsExercises(
        id: index,
        value: trigger,
        headerValue: 'Panel $index',
        expandedValue: 'This is item number $index ThThis is item number $index This is item number $index This is item number $index This is item number $index This is item number $index This is item number $index This is item number $index This is item number $index This is item number $index is is item number $index ',
      );
    });
  }
}

class BackExercises {

  BackExercises({
    required this.id,
    required this.value,
    required this.expandedValue,
    required this.headerValue,
  });

  int id;
  bool value;
  String expandedValue;
  String headerValue;


//I may have to move this list somewhere higher so that it would be visible to the other pages of workout creator
  static List<AbsExercises> generateItems(int numberOfItems) {
    bool trigger = false;
    String absTitleOne = "Crunches"; // Here we'd change the "Crunches" to String absTitleOne = (variable from some exercise data page)
    String absTitleTwo = "Plank";
    String absTitleThree = "V-Ups";
    String absTitleFour = "Hollow Holds";
    String absTitleFive = "Medicine Ball Slam";

    String absDescriptionOne = "Crunches is an abdominal endurance training exercise to strengthen, abdominal muscles. It is similar to a crunch but with fuller range of motion and  additional muscles";
    String absDescriptionTwo = "Focus on closing the distance between your ribs and hips by lifting your shoulders off the floor while maintaining contact between the ground and your lower back. Moving the top half up puts more emphasis on your upper abs. Start with sets of five and work towards 15.";
    String absDescriptionThree = "Starting on your back, extend your legs and keep your arms by your side. In one movement, lift your upper-body, arms and legs to balance on your tailbone, forming a V shape. Lower your body down.";
    String absDescriptionFour = "Lie on the floor with your legs stretched out in front of you and your feet together. Extend your arms above your head. Tilt your pelvis forward until your lower back is flush against the floor. Maintaining this position in your lower back, raise your arms and legs a few inches off the floor to create a straight line from fingers to toes.";
    String absDescriptionFive = "Standing up with your knees slightly bent lift the medicine ball directly over your head with your arms extended. Rise up on the balls of your feet and use your core muscles to throw the ball to the ground as you bend forwards at the waist. Catch the ball and repeat. The motion will not only train your abs but will also give you powerful shoulders.";
    return List<AbsExercises>.generate(numberOfItems, (int index) {
      if(index == 0){
        return AbsExercises(
          id: index,
          value: trigger,
          headerValue: absTitleOne,
          expandedValue: absDescriptionOne,
        );
      }
      if(index == 1){
        return AbsExercises(
          id: index,
          value: trigger,
          headerValue: absTitleTwo,
          expandedValue: absDescriptionTwo,
        );
      }
      if(index == 2){
        return AbsExercises(
          id: index,
          value: trigger,
          headerValue: absTitleThree,
          expandedValue: absDescriptionThree,
        );
      }
      if(index == 3){
        return AbsExercises(
          id: index,
          value: trigger,
          headerValue: absTitleFour,
          expandedValue: absDescriptionFour,
        );
      }
      if(index == 4){
        return AbsExercises(
          id: index,
          value: trigger,
          headerValue: absTitleFive,
          expandedValue: absDescriptionFive,
        );
      }
      return AbsExercises(
        id: index,
        value: trigger,
        headerValue: 'Panel $index',
        expandedValue: 'This is item number $index ThThis is item number $index This is item number $index This is item number $index This is item number $index This is item number $index This is item number $index This is item number $index This is item number $index This is item number $index is is item number $index ',
      );
    });
  }
}

class LegsExercises {

  LegsExercises({
    required this.id,
    required this.value,
    required this.expandedValue,
    required this.headerValue,
  });

  int id;
  bool value;
  String expandedValue;
  String headerValue;


//I may have to move this list somewhere higher so that it would be visible to the other pages of workout creator
  static List<AbsExercises> generateItems(int numberOfItems) {
    bool trigger = false;
    String absTitleOne = "Crunches"; // Here we'd change the "Crunches" to String absTitleOne = (variable from some exercise data page)
    String absTitleTwo = "Plank";
    String absTitleThree = "V-Ups";
    String absTitleFour = "Hollow Holds";
    String absTitleFive = "Medicine Ball Slam";

    String absDescriptionOne = "Crunches is an abdominal endurance training exercise to strengthen, abdominal muscles. It is similar to a crunch but with fuller range of motion and  additional muscles";
    String absDescriptionTwo = "Focus on closing the distance between your ribs and hips by lifting your shoulders off the floor while maintaining contact between the ground and your lower back. Moving the top half up puts more emphasis on your upper abs. Start with sets of five and work towards 15.";
    String absDescriptionThree = "Starting on your back, extend your legs and keep your arms by your side. In one movement, lift your upper-body, arms and legs to balance on your tailbone, forming a V shape. Lower your body down.";
    String absDescriptionFour = "Lie on the floor with your legs stretched out in front of you and your feet together. Extend your arms above your head. Tilt your pelvis forward until your lower back is flush against the floor. Maintaining this position in your lower back, raise your arms and legs a few inches off the floor to create a straight line from fingers to toes.";
    String absDescriptionFive = "Standing up with your knees slightly bent lift the medicine ball directly over your head with your arms extended. Rise up on the balls of your feet and use your core muscles to throw the ball to the ground as you bend forwards at the waist. Catch the ball and repeat. The motion will not only train your abs but will also give you powerful shoulders.";
    return List<AbsExercises>.generate(numberOfItems, (int index) {
      if(index == 0){
        return AbsExercises(
          id: index,
          value: trigger,
          headerValue: absTitleOne,
          expandedValue: absDescriptionOne,
        );
      }
      if(index == 1){
        return AbsExercises(
          id: index,
          value: trigger,
          headerValue: absTitleTwo,
          expandedValue: absDescriptionTwo,
        );
      }
      if(index == 2){
        return AbsExercises(
          id: index,
          value: trigger,
          headerValue: absTitleThree,
          expandedValue: absDescriptionThree,
        );
      }
      if(index == 3){
        return AbsExercises(
          id: index,
          value: trigger,
          headerValue: absTitleFour,
          expandedValue: absDescriptionFour,
        );
      }
      if(index == 4){
        return AbsExercises(
          id: index,
          value: trigger,
          headerValue: absTitleFive,
          expandedValue: absDescriptionFive,
        );
      }
      return AbsExercises(
        id: index,
        value: trigger,
        headerValue: 'Panel $index',
        expandedValue: 'This is item number $index ThThis is item number $index This is item number $index This is item number $index This is item number $index This is item number $index This is item number $index This is item number $index This is item number $index This is item number $index is is item number $index ',
      );
    });
  }
}

class WorkoutCreator extends StatefulWidget {
  const WorkoutCreator({Key? key}) : super(key: key);

  @override
  State<WorkoutCreator> createState() => _WorkoutCreatorState();
}
class _WorkoutCreatorState extends State<WorkoutCreator>{
  static String workoutName = "";
  static List<String> workoutList = [];

  static int exercises = 0;
  final _formKey = GlobalKey<FormState>();

  void _showAlertDialog(BuildContext context) {
    showCupertinoModalPopup<void>(
      context: context,
      builder: (BuildContext context) => CupertinoAlertDialog(
        title: const Text('Discard changes?'),
        content: const Text('Leave without saving changes?'),
        actions: <CupertinoDialogAction>[
          CupertinoDialogAction(
            isDefaultAction: true,
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text('No'),
          ),
          CupertinoDialogAction(
            isDestructiveAction: true,
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text('Yes'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Body Optimizer',
        home: Scaffold(
            appBar: AppBar(
                title: const Text('Create custom workout'), centerTitle: true, backgroundColor: Colors.deepPurple.shade900,
                actions: <Widget>[
                  IconButton(
                    icon: const Icon(Icons.add),
                    tooltip: 'Add exercise',
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const WorkoutCreatorChooseCategory()),
                      );
                    },
                  ),
                ]
            ),

            body: Center(
                child: Padding(
                    padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                    child: ListView(
                        children: <Widget>[
                          //Text('$Exercises'),
                          Form(
                            key: _formKey,
                            child: Column(
                              children: [
                                TextFormField(
                                  textAlign: TextAlign.center,
                                  decoration: const InputDecoration(
                                      hintText: 'Custom workout name'
                                  ),
                                  onSaved: (String? value) {
                                    // This optional block of code can be used to run
                                    // code when the user saves the form.
                                  },
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Please enter some text';
                                    } else if (value.length>30){
                                      return 'Please keep the title under 30 characters';
                                    }
                                    return null;
                                  },
                                ),
                                SingleChildScrollView(
                                  physics: const ScrollPhysics(),
                                  child: Column(
                                    children: [
                                      ListView.builder(
                                          physics: const NeverScrollableScrollPhysics(),
                                          itemCount: workoutList.length,
                                          scrollDirection: Axis.vertical,
                                          shrinkWrap: true,
                                          itemBuilder: (BuildContext context, int index) {
                                            return ListTile(
                                              leading: TextButton(
                                                style: ButtonStyle(
                                                  padding: MaterialStateProperty.all<EdgeInsets>(const EdgeInsets.all(0)),
                                                  foregroundColor: MaterialStateProperty.all<Color>(Colors.blue),
                                                ),
                                                onPressed: () {
                                                  workoutList.removeAt(index);
                                                  Navigator.pushAndRemoveUntil(
                                                    context,
                                                    MaterialPageRoute(builder: (context) => const WorkoutCreator()),
                                                        (Route<dynamic> route) => false,
                                                  );
                                                },
                                                child: const Icon(Icons.close),
                                              ),
                                              title: Text(workoutList[index]),
                                              trailing: TextButton(
                                                style: ButtonStyle(
                                                  padding: MaterialStateProperty.all<EdgeInsets>(const EdgeInsets.all(0)),
                                                  foregroundColor: MaterialStateProperty.all<Color>(Colors.blue),
                                                ),
                                                onPressed: () {
                                                  if(index != 0) {
                                                    var placeholder = workoutList[index - 1];
                                                    workoutList[index - 1] =
                                                    workoutList[index];
                                                    workoutList[index] =
                                                        placeholder;
                                                  }
                                                  Navigator.pushAndRemoveUntil(
                                                    context,
                                                    MaterialPageRoute(builder: (context) => const WorkoutCreator()),
                                                        (Route<dynamic> route) => false,
                                                  );
                                                },
                                                child: const Icon(Icons.upload),
                                              ),
                                            );
                                          }
                                      ),
                                    ],
                                  ),
                                ),
                                Align(
                                  alignment: Alignment.bottomCenter,
                                  child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                      children: <Widget>[
                                        Expanded(
                                          child: OutlinedButton(
                                              onPressed: () => _showAlertDialog(context),
                                              child: const Text('Cancel', style: TextStyle(color: Colors.deepPurple),
                                              )
                                          ),
                                        ),
                                        Expanded(
                                          child: ElevatedButton(
                                            style: ButtonStyle(
                                              backgroundColor: MaterialStatePropertyAll<Color>(Colors.deepPurple.shade900),
                                            ),
                                            onPressed: () {
                                              if(_formKey.currentState!.validate() && workoutList.isNotEmpty){
                                                const snackBar = SnackBar(
                                                  content: Text('Created workout!'),
                                                );
                                                ScaffoldMessenger.of(context).showSnackBar(snackBar);
                                              } else {
                                                const snackBar = SnackBar(
                                                  content: Text('Could not create workout!'),
                                                );
                                                ScaffoldMessenger.of(context).showSnackBar(snackBar);
                                              }
                                            },
                                            child: const Text('Create'),
                                          ),
                                        ),
                                      ]
                                  ),
                                )
                              ],
                            ),
                          ),
                        ]
                    )
                )
            )
        )
    );
  }
}

class WorkoutCreatorChooseCategory extends StatelessWidget {
  const WorkoutCreatorChooseCategory({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text('Select exercise category'), centerTitle: true, backgroundColor: Colors.deepPurple.shade900,
      ),
      body: Center(
        child: GridView.count(
            primary: false,
            padding: const EdgeInsets.all(20),
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            crossAxisCount: 2,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(bottom: 10, right: 5, left: 5),
                child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  GridTile(
                    child: Expanded(
                      child: GestureDetector(
                        child: Container(
                          height: 190,
                          width: 165,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20),
                              boxShadow:  [
                                BoxShadow(
                                    color: const Color(0xff9d9898).withOpacity(0.1),
                                    blurRadius: 4,
                                    offset: const Offset(2,7)
                                )
                              ]
                          ),
                          child: GridTile(
                            header: const Padding(
                              padding: EdgeInsets.only(top: 10),
                              child: Center(
                                child: SizedBox(
                                    height: 150,
                                    width: 150,
                                    child: Icon(Icons.abc)),
                              ),
                            ),

                            child: Padding(
                              padding: const EdgeInsets.only(top: 140),
                              child: Text('Abs', style: GoogleFonts.lato(fontSize: 19, fontWeight: FontWeight.bold, color: Colors.black), textAlign: TextAlign.center,),
                            ),
                          ),
                        ),
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => const WorkoutCreatorExercisesAbs())
                          );},
                      ),
                    ),
                  ),
                ],
                )
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 10, right: 5, left: 5),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                GridTile(
                child: Expanded(
                child: GestureDetector(
                  child: Container(
                  height: 190,
                  width: 165,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow:  [
                        BoxShadow(
                            color: const Color(0xff9d9898).withOpacity(0.1),
                            blurRadius: 4,
                            offset: const Offset(2,7)
                        )
                      ]
                  ),
                  child: GridTile(
                    header: const Padding(
                      padding: EdgeInsets.only(top: 10),
                      child: Center(
                        child: SizedBox(
                            height: 150,
                            width: 150,
                            child: Icon(Icons.abc)),
                      ),
                    ),

                    child: Padding(
                      padding: const EdgeInsets.only(top: 140),
                      child: Text('Biceps', style: GoogleFonts.lato(fontSize: 19, fontWeight: FontWeight.bold, color: Colors.black), textAlign: TextAlign.center,),
                    ),
                  ),
                ),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const WorkoutCreatorExercisesBiceps())
                  );},
              ),
    ),
                )]
        ),
      ),
              Padding(
                padding: const EdgeInsets.only(bottom: 10, right: 5, left: 5),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                GridTile(
                child: Expanded(
                child: GestureDetector(
                  child: Container(
                  height: 190,
                  width: 165,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow:  [
                        BoxShadow(
                            color: const Color(0xff9d9898).withOpacity(0.1),
                            blurRadius: 4,
                            offset: const Offset(2,7)
                        )
                      ]
                  ),
                  child: GridTile(
                    header: const Padding(
                      padding: EdgeInsets.only(top: 10),
                      child: Center(
                        child: SizedBox(
                            height: 150,
                            width: 150,
                            child: Icon(Icons.abc)),
                      ),
                    ),

                    child: Padding(
                      padding: const EdgeInsets.only(top: 140),
                      child: Text('Triceps', style: GoogleFonts.lato(fontSize: 19, fontWeight: FontWeight.bold, color: Colors.black), textAlign: TextAlign.center,),
                    ),
                  ),
                ),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const WorkoutCreatorExercisesTriceps())
                  );},
              ),
    ),
                )],
    ),
    ),
              Padding(
                padding: const EdgeInsets.only(bottom: 10, right: 5, left: 5),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                GridTile(
                child: Expanded(
                child: GestureDetector(
                  child: Container(
                  height: 190,
                  width: 165,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow:  [
                        BoxShadow(
                            color: const Color(0xff9d9898).withOpacity(0.1),
                            blurRadius: 4,
                            offset: const Offset(2,7)
                        )
                      ]
                  ),
                  child: GridTile(
                    header: const Padding(
                      padding: EdgeInsets.only(top: 10),
                      child: Center(
                        child: SizedBox(
                            height: 150,
                            width: 150,
                            child: Icon(Icons.abc)),
                      ),
                    ),

                    child: Padding(
                      padding: const EdgeInsets.only(top: 140),
                      child: Text('Chest', style: GoogleFonts.lato(fontSize: 19, fontWeight: FontWeight.bold, color: Colors.black), textAlign: TextAlign.center,),
                    ),
                  ),
                ),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const WorkoutCreatorExercisesChest())
                  );},
              ),
    ),
                )],
    ),
    ),
              Padding(
                padding: const EdgeInsets.only(bottom: 10, right: 5, left: 5),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                GridTile(
                child: Expanded(
                child: GestureDetector(
                  child: Container(
                  height: 190,
                  width: 165,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow:  [
                        BoxShadow(
                            color: const Color(0xff9d9898).withOpacity(0.1),
                            blurRadius: 4,
                            offset: const Offset(2,7)
                        )
                      ]
                  ),
                  child: GridTile(
                    header: const Padding(
                      padding: EdgeInsets.only(top: 10),
                      child: Center(
                        child: SizedBox(
                            height: 150,
                            width: 150,
                            child: Icon(Icons.abc)),
                      ),
                    ),

                    child: Padding(
                      padding: const EdgeInsets.only(top: 140),
                      child: Text('Back', style: GoogleFonts.lato(fontSize: 19, fontWeight: FontWeight.bold, color: Colors.black), textAlign: TextAlign.center,),
                    ),
                  ),
                ),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const WorkoutCreatorExercisesBack())
                  );},
              ),
    ),
                )],
    ),
      ),
              Padding(
                padding: const EdgeInsets.only(bottom: 10, right: 5, left: 5),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                GridTile(
                child: Expanded(
                child: GestureDetector(
                  child: Container(
                  height: 190,
                  width: 165,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow:  [
                        BoxShadow(
                            color: const Color(0xff9d9898).withOpacity(0.1),
                            blurRadius: 4,
                            offset: const Offset(2,7)
                        )
                      ]
                  ),
                  child: GridTile(
                    header: const Padding(
                      padding: EdgeInsets.only(top: 10),
                      child: Center(
                        child: SizedBox(
                            height: 150,
                            width: 150,
                            child: Icon(Icons.abc)),
                      ),
                    ),

                    child: Padding(
                      padding: const EdgeInsets.only(top: 140),
                      child: Text('Legs', style: GoogleFonts.lato(fontSize: 19, fontWeight: FontWeight.bold, color: Colors.black), textAlign: TextAlign.center,),
                    ),
                  ),
                ),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const WorkoutCreatorExercisesLegs())
                  );},
              ),
    ),
                )],
    ),
      ),
      ],
    ),
      ),
    );

  }
}

class WorkoutCreatorExercisesAbs extends StatefulWidget {
  const WorkoutCreatorExercisesAbs({super.key}); //Safer without const

  @override
  State<WorkoutCreatorExercisesAbs> createState() => _WorkoutCreatorExercisesAbsState();
}

class _WorkoutCreatorExercisesAbsState extends State<WorkoutCreatorExercisesAbs> {
  final List<AbsExercises> _data = AbsExercises.generateItems(5);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Select abs workouts'),
        centerTitle: true,
        backgroundColor: Colors.deepPurple.shade900,
      ),
      body: Center(
          child: ListView(
            padding: const EdgeInsets.all(8),
            children: <Widget>[
              ExpansionPanelList.radio(
                expandedHeaderPadding: const EdgeInsets.all(0),
                children: _data.map<ExpansionPanelRadio>((AbsExercises item) {
                  return ExpansionPanelRadio(
                      value: item.id,
                      headerBuilder: (BuildContext context, bool isExpanded) {
                        return CheckboxListTile(
                          title: Text(item.headerValue),
                          controlAffinity: ListTileControlAffinity.leading,
                          value: item.value,
                          onChanged: (bool? value) {
                            setState(() {
                              item.value = value!;
                            });
                          },
                        );
                      },
                      body: ListTile(
                        subtitle: Text(item.expandedValue),
                      ));
                }).toList(),
              ),
              TextButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll<Color>(
                        Colors.deepPurple.shade900),
                  ),
                  onPressed: () {
                    if (_data[0].value == true) {
                      _WorkoutCreatorState.workoutList.add("Crunches");
                      _WorkoutCreatorState.exercises += 1;
                    }
                    if (_data[1].value == true) {
                      _WorkoutCreatorState.workoutList.add("Plank");
                      _WorkoutCreatorState.exercises += 1;
                    }
                    if (_data[2].value == true) {
                      _WorkoutCreatorState.workoutList.add("V-Ups");
                      _WorkoutCreatorState.exercises += 1;
                    }
                    if (_data[3].value == true) {
                      _WorkoutCreatorState.workoutList.add("Hollow Holds");
                      _WorkoutCreatorState.exercises += 1;
                    }
                    if (_data[4].value == true) {
                      _WorkoutCreatorState.workoutList.add("Medicine Ball Slam");
                      _WorkoutCreatorState.exercises += 1;
                    }
                    const snackBar = SnackBar(
                      content: Text('Added exercises to the workout!'),
                    );
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  }, child: const Text('Add', style: TextStyle(color: Colors.white),)),
              //Text('Exercise counter: ${_WorkoutCreatorState.exercises}')
            ],
          )
      ),
    );
  }
}

class WorkoutCreatorExercisesBiceps extends StatefulWidget {
  const WorkoutCreatorExercisesBiceps({super.key}); //Safer without const

  @override
  State<WorkoutCreatorExercisesBiceps> createState() => _WorkoutCreatorExercisesBicepsState();
}

class _WorkoutCreatorExercisesBicepsState extends State<WorkoutCreatorExercisesBiceps> {
  final List<BicepsExercises> _data = BicepsExercises.generateItems(5);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Select biceps workouts'),
        centerTitle: true,
        backgroundColor: Colors.deepPurple.shade900,
      ),
      body: Center(
          child: ListView(
            padding: const EdgeInsets.all(8),
            children: <Widget>[
              ExpansionPanelList.radio(
                expandedHeaderPadding: const EdgeInsets.all(0),
                children: _data.map<ExpansionPanelRadio>((BicepsExercises item) {
                  return ExpansionPanelRadio(
                      value: item.id,
                      headerBuilder: (BuildContext context, bool isExpanded) {
                        return CheckboxListTile(
                          title: Text(item.headerValue),
                          controlAffinity: ListTileControlAffinity.leading,
                          value: item.value,
                          onChanged: (bool? value) {
                            setState(() {
                              item.value = value!;
                            });
                          },
                        );
                      },
                      body: ListTile(
                        subtitle: Text(item.expandedValue),
                      ));
                }).toList(),
              ),
              TextButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll<Color>(
                        Colors.deepPurple.shade900),
                  ),
                  onPressed: () {
                    if (_data[0].value == true) {
                      _WorkoutCreatorState.workoutList.add("Barbell Curl");
                      _WorkoutCreatorState.exercises += 1;
                    }
                    if (_data[1].value == true) {
                      _WorkoutCreatorState.workoutList.add("Cable curl");
                      _WorkoutCreatorState.exercises += 1;
                    }
                    if (_data[2].value == true) {
                      _WorkoutCreatorState.workoutList.add("Dumbbell Curl");
                      _WorkoutCreatorState.exercises += 1;
                    }
                    if (_data[3].value == true) {
                      _WorkoutCreatorState.workoutList.add("Chin-Up");
                      _WorkoutCreatorState.exercises += 1;
                    }
                    if (_data[4].value == true) {
                      _WorkoutCreatorState.workoutList.add("Reverse-Grip Barbell Row");
                      _WorkoutCreatorState.exercises += 1;
                    }
                    const snackBar = SnackBar(
                      content: Text('Added exercises to the workout!'),
                    );
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  }, child: const Text('Add', style: TextStyle(color: Colors.white),)),
              //Text('Exercise counter: ${_WorkoutCreatorState.exercises}')
            ],
          )
      ),
    );
  }
}

class WorkoutCreatorExercisesTriceps extends StatefulWidget {
  const WorkoutCreatorExercisesTriceps({super.key}); //Safer without const

  @override
  State<WorkoutCreatorExercisesTriceps> createState() => _WorkoutCreatorExercisesTricepsState();
}

class _WorkoutCreatorExercisesTricepsState extends State<WorkoutCreatorExercisesTriceps> {
  final List<AbsExercises> _data = AbsExercises.generateItems(5);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Select triceps workouts'),
        centerTitle: true,
        backgroundColor: Colors.deepPurple.shade900,
      ),
      body: Center(
          child: ListView(
            padding: const EdgeInsets.all(8),
            children: <Widget>[
              ExpansionPanelList.radio(
                expandedHeaderPadding: const EdgeInsets.all(0),
                children: _data.map<ExpansionPanelRadio>((AbsExercises item) {
                  return ExpansionPanelRadio(
                      value: item.id,
                      headerBuilder: (BuildContext context, bool isExpanded) {
                        return CheckboxListTile(
                          title: Text(item.headerValue),
                          controlAffinity: ListTileControlAffinity.leading,
                          value: item.value,
                          onChanged: (bool? value) {
                            setState(() {
                              item.value = value!;
                            });
                          },
                        );
                      },
                      body: ListTile(
                        subtitle: Text(item.expandedValue),
                      ));
                }).toList(),
              ),
              TextButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll<Color>(
                        Colors.deepPurple.shade900),
                  ),
                  onPressed: () {
                    if (_data[0].value == true) {
                      _WorkoutCreatorState.workoutList.add("Crunches");
                      _WorkoutCreatorState.exercises += 1;
                    }
                    if (_data[1].value == true) {
                      _WorkoutCreatorState.workoutList.add("Plank");
                      _WorkoutCreatorState.exercises += 1;
                    }
                    if (_data[2].value == true) {
                      _WorkoutCreatorState.workoutList.add("V-Ups");
                      _WorkoutCreatorState.exercises += 1;
                    }
                    if (_data[3].value == true) {
                      _WorkoutCreatorState.workoutList.add("Hollow Holds");
                      _WorkoutCreatorState.exercises += 1;
                    }
                    if (_data[4].value == true) {
                      _WorkoutCreatorState.workoutList.add("Medicine Ball Slam");
                      _WorkoutCreatorState.exercises += 1;
                    }
                    const snackBar = SnackBar(
                      content: Text('Added exercises to the workout!'),
                    );
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  }, child: const Text('Add', style: TextStyle(color: Colors.white),)),
              //Text('Exercise counter: ${_WorkoutCreatorState.exercises}')
            ],
          )
      ),
    );
  }
}

class WorkoutCreatorExercisesChest extends StatefulWidget {
  const WorkoutCreatorExercisesChest({super.key}); //Safer without const

  @override
  State<WorkoutCreatorExercisesChest> createState() => _WorkoutCreatorExercisesChestState();
}

class _WorkoutCreatorExercisesChestState extends State<WorkoutCreatorExercisesChest> {
  final List<AbsExercises> _data = AbsExercises.generateItems(5);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Select chest workouts'),
        centerTitle: true,
        backgroundColor: Colors.deepPurple.shade900,
      ),
      body: Center(
          child: ListView(
            padding: const EdgeInsets.all(8),
            children: <Widget>[
              ExpansionPanelList.radio(
                expandedHeaderPadding: const EdgeInsets.all(0),
                children: _data.map<ExpansionPanelRadio>((AbsExercises item) {
                  return ExpansionPanelRadio(
                      value: item.id,
                      headerBuilder: (BuildContext context, bool isExpanded) {
                        return CheckboxListTile(
                          title: Text(item.headerValue),
                          controlAffinity: ListTileControlAffinity.leading,
                          value: item.value,
                          onChanged: (bool? value) {
                            setState(() {
                              item.value = value!;
                            });
                          },
                        );
                      },
                      body: ListTile(
                        subtitle: Text(item.expandedValue),
                      ));
                }).toList(),
              ),
              TextButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll<Color>(
                        Colors.deepPurple.shade900),
                  ),
                  onPressed: () {
                    if (_data[0].value == true) {
                      _WorkoutCreatorState.workoutList.add("Crunches");
                      _WorkoutCreatorState.exercises += 1;
                    }
                    if (_data[1].value == true) {
                      _WorkoutCreatorState.workoutList.add("Plank");
                      _WorkoutCreatorState.exercises += 1;
                    }
                    if (_data[2].value == true) {
                      _WorkoutCreatorState.workoutList.add("V-Ups");
                      _WorkoutCreatorState.exercises += 1;
                    }
                    if (_data[3].value == true) {
                      _WorkoutCreatorState.workoutList.add("Hollow Holds");
                      _WorkoutCreatorState.exercises += 1;
                    }
                    if (_data[4].value == true) {
                      _WorkoutCreatorState.workoutList.add("Medicine Ball Slam");
                      _WorkoutCreatorState.exercises += 1;
                    }
                    const snackBar = SnackBar(
                      content: Text('Added exercises to the workout!'),
                    );
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  }, child: const Text('Add', style: TextStyle(color: Colors.white),)),
              //Text('Exercise counter: ${_WorkoutCreatorState.exercises}')
            ],
          )
      ),
    );
  }
}

class WorkoutCreatorExercisesBack extends StatefulWidget {
  const WorkoutCreatorExercisesBack({super.key}); //Safer without const

  @override
  State<WorkoutCreatorExercisesBack> createState() => _WorkoutCreatorExercisesBackState();
}

class _WorkoutCreatorExercisesBackState extends State<WorkoutCreatorExercisesBack> {
  final List<AbsExercises> _data = AbsExercises.generateItems(5);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Select back workouts'),
        centerTitle: true,
        backgroundColor: Colors.deepPurple.shade900,
      ),
      body: Center(
          child: ListView(
            padding: const EdgeInsets.all(8),
            children: <Widget>[
              ExpansionPanelList.radio(
                expandedHeaderPadding: const EdgeInsets.all(0),
                children: _data.map<ExpansionPanelRadio>((AbsExercises item) {
                  return ExpansionPanelRadio(
                      value: item.id,
                      headerBuilder: (BuildContext context, bool isExpanded) {
                        return CheckboxListTile(
                          title: Text(item.headerValue),
                          controlAffinity: ListTileControlAffinity.leading,
                          value: item.value,
                          onChanged: (bool? value) {
                            setState(() {
                              item.value = value!;
                            });
                          },
                        );
                      },
                      body: ListTile(
                        subtitle: Text(item.expandedValue),
                      ));
                }).toList(),
              ),
              TextButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll<Color>(
                        Colors.deepPurple.shade900),
                  ),
                  onPressed: () {
                    if (_data[0].value == true) {
                      _WorkoutCreatorState.workoutList.add("Crunches");
                      _WorkoutCreatorState.exercises += 1;
                    }
                    if (_data[1].value == true) {
                      _WorkoutCreatorState.workoutList.add("Plank");
                      _WorkoutCreatorState.exercises += 1;
                    }
                    if (_data[2].value == true) {
                      _WorkoutCreatorState.workoutList.add("V-Ups");
                      _WorkoutCreatorState.exercises += 1;
                    }
                    if (_data[3].value == true) {
                      _WorkoutCreatorState.workoutList.add("Hollow Holds");
                      _WorkoutCreatorState.exercises += 1;
                    }
                    if (_data[4].value == true) {
                      _WorkoutCreatorState.workoutList.add("Medicine Ball Slam");
                      _WorkoutCreatorState.exercises += 1;
                    }
                    const snackBar = SnackBar(
                      content: Text('Added exercises to the workout!'),
                    );
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  }, child: const Text('Add', style: TextStyle(color: Colors.white),)),
              //Text('Exercise counter: ${_WorkoutCreatorState.exercises}')
            ],
          )
      ),
    );
  }
}

class WorkoutCreatorExercisesLegs extends StatefulWidget {
  const WorkoutCreatorExercisesLegs({super.key}); //Safer without const

  @override
  State<WorkoutCreatorExercisesLegs> createState() => _WorkoutCreatorExercisesLegsState();
}

class _WorkoutCreatorExercisesLegsState extends State<WorkoutCreatorExercisesLegs> {
  final List<AbsExercises> _data = AbsExercises.generateItems(5);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Select legs workouts'),
        centerTitle: true,
        backgroundColor: Colors.deepPurple.shade900,
      ),
      body: Center(
          child: ListView(
            padding: const EdgeInsets.all(8),
            children: <Widget>[
              ExpansionPanelList.radio(
                expandedHeaderPadding: const EdgeInsets.all(0),
                children: _data.map<ExpansionPanelRadio>((AbsExercises item) {
                  return ExpansionPanelRadio(
                      value: item.id,
                      headerBuilder: (BuildContext context, bool isExpanded) {
                        return CheckboxListTile(
                          title: Text(item.headerValue),
                          controlAffinity: ListTileControlAffinity.leading,
                          value: item.value,
                          onChanged: (bool? value) {
                            setState(() {
                              item.value = value!;
                            });
                          },
                        );
                      },
                      body: ListTile(
                        subtitle: Text(item.expandedValue),
                      ));
                }).toList(),
              ),
              TextButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll<Color>(
                        Colors.deepPurple.shade900),
                  ),
                  onPressed: () {
                    if (_data[0].value == true) {
                      _WorkoutCreatorState.workoutList.add("Crunches");
                      _WorkoutCreatorState.exercises += 1;
                    }
                    if (_data[1].value == true) {
                      _WorkoutCreatorState.workoutList.add("Plank");
                      _WorkoutCreatorState.exercises += 1;
                    }
                    if (_data[2].value == true) {
                      _WorkoutCreatorState.workoutList.add("V-Ups");
                      _WorkoutCreatorState.exercises += 1;
                    }
                    if (_data[3].value == true) {
                      _WorkoutCreatorState.workoutList.add("Hollow Holds");
                      _WorkoutCreatorState.exercises += 1;
                    }
                    if (_data[4].value == true) {
                      _WorkoutCreatorState.workoutList.add("Medicine Ball Slam");
                      _WorkoutCreatorState.exercises += 1;
                    }
                    const snackBar = SnackBar(
                      content: Text('Added exercises to the workout!'),
                    );
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  }, child: const Text('Add', style: TextStyle(color: Colors.white),)),
              //Text('Exercise counter: ${_WorkoutCreatorState.exercises}')
            ],
          )
      ),
    );
  }
}