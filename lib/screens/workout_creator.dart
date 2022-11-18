/*
To do:
Move the row in exercise manager so that the buttons can be moved to the bottom of the page
Saving workout
Create some sort of exercise data class/list that will be available in the entire program
I think that I somehow need to get the Row out of List view but I don't know how to do it.
fix elegant notifications
a
EDITING WORKOUT make it so on pressing cancel the program will revert all changes and keep the workout details (right now it's basically a nuke, destroys everything)

Useful links etc.
https://medium.com/aubergine-solutions/4-types-of-listview-in-flutter-you-should-know-30cf9e7f1739
https://mercyjemosop.medium.com/flutter-list-view-1045969b1799

Create an ID for every exercise
Create a time value for exercises for workout.
 */
import 'package:elegant_notification/elegant_notification.dart';
import 'package:elegant_notification/resources/arrays.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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

    String absDescriptionOne = "Crunches is an abdominal endurance training exercise to strengthen, abdominal muscles. It is similar to a crunch but with fuller range of motion and  additional muscles.";
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
  static List<TricepsExercises> generateItems(int numberOfItems) {
    bool trigger = false;
    String titleOne = "Skull-crusher";
    String titleTwo = "Triceps Dip";
    String titleThree = "Triceps Machine Dip";
    String titleFour = "Board Press";
    String titleFive = "Dumbbell Overhead Triceps Extension";

    String descriptionOne = "After warming up your elbows, perform 3-4 sets for 8-12 reps as the first or second exercise in your routine. Don't be a hero and risk your skull! Hit your reps and it'll help you build tris to match your bis.";
    String descriptionTwo = "Dips hit both the chest and triceps, but to favor the tris, keep your body as vertical as possible. Don't lean forward and keep those elbows tight to your sides. Think dips won't work for you? Take a look at any male gymnast; horseshoe triceps come standard issue with all those dips!";
    String descriptionThree = "Do this early or in the middle of your workout for 3-4 sets of 6-10 reps, and you'll be convinced this is one of the best arm muscle-building machines out there. Alternately, up the reps to double digits as an upper-arm burnout.";
    String descriptionFour = "The board press is a partial-rep version of the bench press where you place 2x4s on your chest to preferentially train the lockout. Don't have boards? An easier gym hack may be simply to move a bench inside the rack and set the pins a few inches off your chest.";
    String descriptionFive = "Once your arms go overhead, the long head of the triceps gets prioritized. This head is difficult to target otherwise, which is why it's always a good idea to include some kind of overhead exercise in your triceps workout.";
    return List<TricepsExercises>.generate(numberOfItems, (int index) {
      if(index == 0){
        return TricepsExercises(
          id: index,
          value: trigger,
          headerValue: titleOne,
          expandedValue: descriptionOne,
        );
      }
      if(index == 1){
        return TricepsExercises(
          id: index,
          value: trigger,
          headerValue: titleTwo,
          expandedValue: descriptionTwo,
        );
      }
      if(index == 2){
        return TricepsExercises(
          id: index,
          value: trigger,
          headerValue: titleThree,
          expandedValue: descriptionThree,
        );
      }
      if(index == 3){
        return TricepsExercises(
          id: index,
          value: trigger,
          headerValue: titleFour,
          expandedValue: descriptionFour,
        );
      }
      if(index == 4){
        return TricepsExercises(
          id: index,
          value: trigger,
          headerValue: titleFive,
          expandedValue: descriptionFive,
        );
      }
      return TricepsExercises(
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
  static List<ChestExercises> generateItems(int numberOfItems) {
    bool trigger = false;
    String titleOne = "Barbell Bench Press";
    String titleTwo = "Incline Bench Press";
    String titleThree = "Decline Press";
    String titleFour = "Machine Chest Press";
    String titleFive = "Push-Up";

    String descriptionOne = "Bench toward the start of your chest workout for heavy sets in lower rep ranges, such as 5-8 reps. There are better moves for high-rep chest burnouts. Vary your grip width and style for more complete chest development.";
    String descriptionTwo = "As a primary lift, a few heavy sets of 6-8 can be your bread and butter. As a secondary lift, up it to 8-10. Many chest workouts start with flat-bench movements first, but every so often you should start with inclines, particularly if you're trying to bring up your upper chest.";
    String descriptionThree = "Do free-weight presses early in your chest workout because they require more effort and stabilizer muscles than machines. A machine version could be the final heavy exercise in your workout before switching to lighter pump work.";
    String descriptionFour = "Machine exercises make the most sense at the end of your workout for sets of at least 8-10 reps, plus drop sets or rest-pause sets if you can handle them. This is when you see if that pre-workout you've been taking can live up to its promises! Pump your pecs until they're seriously fatigued and finish your workout strong.";
    String descriptionFive = "Sets of push-ups to failure are a great way to burn out or add volume in the late stages of a workout, and they're awesome in a compound set with dips, a mechanical dropset after flyes or presses, or an antagonist chest-and-back superset with rows. Weighted push-ups and push-ups with resistance bands can even be a primary push movement, if needed.";
    return List<ChestExercises>.generate(numberOfItems, (int index) {
      if(index == 0){
        return ChestExercises(
          id: index,
          value: trigger,
          headerValue: titleOne,
          expandedValue: descriptionOne,
        );
      }
      if(index == 1){
        return ChestExercises(
          id: index,
          value: trigger,
          headerValue: titleTwo,
          expandedValue: descriptionTwo,
        );
      }
      if(index == 2){
        return ChestExercises(
          id: index,
          value: trigger,
          headerValue: titleThree,
          expandedValue: descriptionThree,
        );
      }
      if(index == 3){
        return ChestExercises(
          id: index,
          value: trigger,
          headerValue: titleFour,
          expandedValue: descriptionFour,
        );
      }
      if(index == 4){
        return ChestExercises(
          id: index,
          value: trigger,
          headerValue: titleFive,
          expandedValue: descriptionFive,
        );
      }
      return ChestExercises(
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
  static List<BackExercises> generateItems(int numberOfItems) {
    bool trigger = false;
    String titleOne = "Pull-Up";
    String titleTwo = "T-Bar Row";
    String titleThree = "Seated Row";
    String titleFour = "Single-Arm Smith Machine Row";
    String titleFive = "Lat Pull-Down";

    String descriptionOne = "If you're a pull-up pro, you can do some light sets as a warm-up. If they're tougher for you, you can treat them more as a strength movement toward the start of your workout. Assisted variations make for great burnouts at the end of a back workout.";
    String descriptionTwo = "Do this toward the front half of your workout, especially if you're going to go heavy. Because it's slightly easier on the lower back, you could do it after deadlifts, but stay mindful of using strict form. If you find yourself cheating or struggling to maintain a flat back, a chest-supported row may be a better choice.";
    String descriptionThree = "Like machines, cables can be loaded up pretty heavily without overly taxing you. These are best done toward the end of your workout, so don't be afraid to go slightly higher-rep here, like 10-12 or even 12-15 reps.";
    String descriptionFour = "Do it about midway through your workout, after your heavy overhand pulls. And don't be afraid to throw on some wrist straps! Your goal is to hammer your back, not be constantly limited by your grip strength.";
    String descriptionFive = "When used as a mass-building exercise, it's best placed toward the middle or end of your workout for sets of 8-12 reps. It's great as a pump-focused finishing move, as well.";
    return List<BackExercises>.generate(numberOfItems, (int index) {
      if(index == 0){
        return BackExercises(
          id: index,
          value: trigger,
          headerValue: titleOne,
          expandedValue: descriptionOne,
        );
      }
      if(index == 1){
        return BackExercises(
          id: index,
          value: trigger,
          headerValue: titleTwo,
          expandedValue: descriptionTwo,
        );
      }
      if(index == 2){
        return BackExercises(
          id: index,
          value: trigger,
          headerValue: titleThree,
          expandedValue: descriptionThree,
        );
      }
      if(index == 3){
        return BackExercises(
          id: index,
          value: trigger,
          headerValue: titleFour,
          expandedValue: descriptionFour,
        );
      }
      if(index == 4){
        return BackExercises(
          id: index,
          value: trigger,
          headerValue: titleFive,
          expandedValue: descriptionFive,
        );
      }
      return BackExercises(
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
  static List<LegsExercises> generateItems(int numberOfItems) {
    bool trigger = false;
    String titleOne = "Squats";
    String titleTwo = "Lunges";
    String titleThree = "Plank leg lifts";
    String titleFour = "Single-leg deadlifts";
    String titleFive = "Stability ball knee tucks";

    String descriptionOne = "For balance or extra support, perform your squats standing alongside a wall or next to a chair or the edge of a table with one hand on the object. Resist the urge to pull on it or push off from it.";
    String descriptionTwo = "Lunges work your thighs, butt, and abs. This move uses both legs at the same time, making it a great exercise for strong legs.";
    String descriptionThree = "Regular planks target the upper body, core, and hips. You can add leg lifts to strengthen your butt and upper legs.";
    String descriptionFour = "The single-leg deadlift will sculpt your butt, hips, and upper legs. For balance, place your hands on a wall or chair.";
    String descriptionFive = "Doing knee tucks on a stability ball will tone legs fast. It works your calves, shins, and abs. For this exercise, you’ll need a stability ball that’s properly inflated.";
    return List<LegsExercises>.generate(numberOfItems, (int index) {
      if(index == 0){
        return LegsExercises(
          id: index,
          value: trigger,
          headerValue: titleOne,
          expandedValue: descriptionOne,
        );
      }
      if(index == 1){
        return LegsExercises(
          id: index,
          value: trigger,
          headerValue: titleTwo,
          expandedValue: descriptionTwo,
        );
      }
      if(index == 2){
        return LegsExercises(
          id: index,
          value: trigger,
          headerValue: titleThree,
          expandedValue: descriptionThree,
        );
      }
      if(index == 3){
        return LegsExercises(
          id: index,
          value: trigger,
          headerValue: titleFour,
          expandedValue: descriptionFour,
        );
      }
      if(index == 4){
        return LegsExercises(
          id: index,
          value: trigger,
          headerValue: titleFive,
          expandedValue: descriptionFive,
        );
      }
      return LegsExercises(
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
  //static ValueNotifier<List> workoutList;
  //static ValueNotifier<List<String>> workoutList = ValueNotifier([]);
  static List<String> workoutList = [];
  final myController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  static ValueNotifier<int> notif = ValueNotifier<int>(0);
  /*static void updateState(text){
    setState(() {
      workoutList.add(text);
    });
  }*/

  void _showAlertDialog(BuildContext context) {
    showCupertinoModalPopup<void>(
      context: context,
      builder: (BuildContext context) => CupertinoAlertDialog(
        title: const Text('Delete the workout?'),
        content: const Text('💣This is a nuclear option💣!'),
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
              workoutList = [];
              Navigator.pop(context);
              setState(() {

              });
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
                title: const Text('Create your workout'), centerTitle: true, backgroundColor: const Color(0xFF5650DE),
            ),

            body: Center(
                child: Padding(
                    padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                    child: ListView(
                        children: <Widget>[
                          Form(
                            key: _formKey,
                            child: Column(
                              children: [
                                TextFormField(
                                  controller: myController,
                                  textAlign: TextAlign.center,
                                  decoration: const InputDecoration(
                                      hintText: 'Your workout name'
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
                                const SizedBox(
                                  height: 8,
                                ),
                                SingleChildScrollView(
                                  physics: const ScrollPhysics(),
                                  child: Column(
                                    children: [
                                      ValueListenableBuilder(
                                          builder: (BuildContext context, int value, Widget? child) {
                                        return ListView.builder(
                                            physics: const NeverScrollableScrollPhysics(),
                                            itemCount: workoutList.length,
                                            scrollDirection: Axis.vertical,
                                            shrinkWrap: true,
                                            padding: EdgeInsets.zero,
                                            itemBuilder: (BuildContext context, int index) {
                                              return ListTile(
                                                contentPadding: EdgeInsets.zero,
                                                leading: IconButton(
                                                  onPressed: (){
                                                    setState(() {
                                                  workoutList.removeAt(index);
                                                    });
                                                }, icon: const Icon(Icons.close),
                                                  padding: EdgeInsets.zero,

                                                ),
                                                title: Text(workoutList[index]),
                                                trailing: IconButton(
                                                  style: ButtonStyle(
                                                    padding: MaterialStateProperty.all<EdgeInsets>(const EdgeInsets.all(0)),
                                                    foregroundColor: MaterialStateProperty.all<Color>(Colors.blue),
                                                  ),
                                                  onPressed: () {
                                                    setState(() {


                                                    if(index != 0) {
                                                      var placeholder = workoutList[index - 1];
                                                      workoutList[index - 1] =
                                                      workoutList[index];
                                                      workoutList[index] = placeholder;
                                                    }
                                                    });
                                                  },
                                                  icon: const Icon(
                                                      Icons.menu,
                                                          color: Color(0xFF5650DE)
                                                  ),
                                                ),
                                              );
                                            }
                                        );}, valueListenable: notif,
                                      ),
                                    ],
                                  ),
                                ),
                                Row(
                                  children:<Widget>[
                                  Expanded(
                                    child: OutlinedButton(
                                        style: OutlinedButton.styleFrom(
                                          foregroundColor: const Color(0xFF5650DE),
                                          backgroundColor: Colors.white,
                                          side: const BorderSide(color: Color(0xFF5650DE), width: 1.5),
                                        ),
                                        onPressed: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(builder: (context) => const WorkoutCreatorChooseCategory()),
                                          );
                                        },
                                        child: const Text('Add exercise', style: TextStyle(color: Color(0xFF5650DE)),
                                        )
                                    ),
                                  ),
                                  ]
                                ),
                                //expanded flex 0 obok aligna
                                Expanded(
                                  flex: 0,
                                  child: Align(
                                    alignment: Alignment.bottomCenter,
                                    child: Padding(
                                      padding: const EdgeInsets.only(bottom: 15),
                                      child: Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                          children: <Widget>[
                                            Expanded(
                                              child: Padding(
                                              padding: const EdgeInsets.only(right: 5.0),
                                              child: OutlinedButton(
                                                  onPressed: () => _showAlertDialog(context),
                                                  child: const Text('Cancel', style: TextStyle(color: Color(0xFF5650DE)),
                                                  )
                                              ),
                                              )
                                            ),
                                            Expanded(
                                              child: Padding(
                                                padding: const EdgeInsets.only(left: 5.0),
                                              child: ElevatedButton(
                                                style: const ButtonStyle(
                                                  backgroundColor: MaterialStatePropertyAll<Color>(Color(0xFF5650DE)),
                                                ),
                                                onPressed: () {
                                                  if(_formKey.currentState!.validate() && workoutList.isNotEmpty){
                                                    /*const snackBar = SnackBar(
                                                      content: Text('Created workout!'),
                                                    );
                                                    ScaffoldMessenger.of(context).showSnackBar(snackBar);*/
                                                    ElegantNotification.success(
                                                      width: 360,
                                                      notificationPosition: NotificationPosition.bottomCenter,
                                                      animation: AnimationType.fromBottom,
                                                      title: const Text('Created workout'),
                                                      description: const Text('Your workout has been saved!'),
                                                    ).show(context);
                                                  } else {
                                                    /*const snackBar = SnackBar(
                                                      content: Text('Could not create the workout!'),
                                                    );
                                                    ScaffoldMessenger.of(context).showSnackBar(snackBar);*/
                                                    ElegantNotification.error(
                                                      width: 360,
                                                      notificationPosition: NotificationPosition.bottomCenter,
                                                      animation: AnimationType.fromBottom,
                                                      title: const Text('Failed to save workout'),
                                                      description: const Text('Make sure that you have a correct workout name and workouts.'),
                                                    ).show(context);
                                                  }
                                                },
                                                child: const Text('Create'),
                                              ),
                                              )
                                            ),
                                          ]
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ]
                    )
                )
            ),
            resizeToAvoidBottomInset: false
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
        title: const Text('Select exercise category'), centerTitle: true, backgroundColor: const Color(0xFF5650DE),
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
                            header: Padding(
                              padding: const EdgeInsets.only(top: 10),
                              child: Center(
                                child: SizedBox(
                                    height: 150,
                                    width: 150,
                                    child: Image.asset("assets/images/abs.png", scale: 10)),
                              ),
                            ),

                            child: Padding(
                              padding: const EdgeInsets.only(top: 140, left: 5.0, right: 5.0),
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
                    header: Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: Center(
                        child: SizedBox(
                            height: 150,
                            width: 150,
                            child: Image.asset("assets/images/biceps.png", scale: 10)),
                      ),
                    ),

                    child: Padding(
                      padding: const EdgeInsets.only(top: 140, left: 5.0, right: 5.0),
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
                    header: Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: Center(
                        child: SizedBox(
                            height: 150,
                            width: 150,
                            child: Image.asset("assets/images/triceps.png", scale: 10)),
                      ),
                    ),

                    child: Padding(
                      padding: const EdgeInsets.only(top: 140, left: 5.0, right: 5.0),
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
                    header: Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: Center(
                        child: SizedBox(
                            height: 150,
                            width: 150,
                            child: Image.asset("assets/images/chest.png", scale: 10)),
                      ),
                    ),

                    child: Padding(
                      padding: const EdgeInsets.only(top: 140, left: 5.0, right: 5.0),
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
                    header: Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: Center(
                        child: SizedBox(
                            height: 150,
                            width: 150,
                            child: Image.asset("assets/images/back.png", scale: 10)),
                      ),
                    ),

                    child: Padding(
                      padding: const EdgeInsets.only(top: 140, left: 5.0, right: 5.0),
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
                    header: Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: Center(
                        child: SizedBox(
                            height: 150,
                            width: 150,
                            child: Image.asset("assets/images/legs.png", scale: 10)),
                      ),
                    ),

                    child: Padding(
                      padding: const EdgeInsets.only(top: 140, left: 5.0, right: 5.0),
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
        backgroundColor: const Color(0xFF5650DE),
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
                          activeColor: const Color(0xFF5650DE),
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
                  style: const ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll<Color>(
                        Color(0xFF5650DE)),
                  ),
                  onPressed: () {
                    if (_data[0].value == true) {
                      _WorkoutCreatorState.workoutList.add("Crunches");
                    }
                    if (_data[1].value == true) {
                      _WorkoutCreatorState.workoutList.add("Plank");
                    }
                    if (_data[2].value == true) {
                      _WorkoutCreatorState.workoutList.add("V-Ups");
                    }
                    if (_data[3].value == true) {
                      _WorkoutCreatorState.workoutList.add("Hollow Holds");
                    }
                    if (_data[4].value == true) {
                      _WorkoutCreatorState.workoutList.add("Medicine Ball Slam");
                    }
                    _WorkoutCreatorState.notif.value += 1;
                    const snackBar = SnackBar(
                      content: Text('Added exercises to the workout!'),
                    );
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    Navigator.pop(context);
                    Navigator.pop(context);
                  }, child: const Text('Add', style: TextStyle(color: Colors.white),)),
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
        backgroundColor: const Color(0xFF5650DE),
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
                          activeColor: const Color(0xFF5650DE),
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
                  style: const ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll<Color>(
                        Color(0xFF5650DE)),
                  ),
                  onPressed: () {
                    if (_data[0].value == true) {
                      _WorkoutCreatorState.workoutList.add("Barbell Curl");
                    }
                    if (_data[1].value == true) {
                      _WorkoutCreatorState.workoutList.add("Cable curl");
                    }
                    if (_data[2].value == true) {
                      _WorkoutCreatorState.workoutList.add("Dumbbell Curl");
                    }
                    if (_data[3].value == true) {
                      _WorkoutCreatorState.workoutList.add("Chin-Up");
                    }
                    if (_data[4].value == true) {
                      _WorkoutCreatorState.workoutList.add("Reverse-Grip Barbell Row");
                    }
                    _WorkoutCreatorState.notif.value += 1;
                    const snackBar = SnackBar(
                      content: Text('Added exercises to the workout!'),
                    );
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    Navigator.pop(context);
                    Navigator.pop(context);
                  }, child: const Text('Add', style: TextStyle(color: Colors.white),)),
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
  final List<TricepsExercises> _data = TricepsExercises.generateItems(5);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Select triceps workouts'),
        centerTitle: true,
        backgroundColor: const Color(0xFF5650DE),
      ),
      body: Center(
          child: ListView(
            padding: const EdgeInsets.all(8),
            children: <Widget>[
              ExpansionPanelList.radio(
                expandedHeaderPadding: const EdgeInsets.all(0),
                children: _data.map<ExpansionPanelRadio>((TricepsExercises item) {
                  return ExpansionPanelRadio(
                      value: item.id,
                      headerBuilder: (BuildContext context, bool isExpanded) {
                        return CheckboxListTile(
                          activeColor: const Color(0xFF5650DE),
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
                  style: const ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll<Color>(
                        Color(0xFF5650DE)),
                  ),
                  onPressed: () {
                    if (_data[0].value == true) {
                      _WorkoutCreatorState.workoutList.add("Skull-crusher");
                    }
                    if (_data[1].value == true) {
                      _WorkoutCreatorState.workoutList.add("Triceps Dip");
                    }
                    if (_data[2].value == true) {
                      _WorkoutCreatorState.workoutList.add("Triceps Machine Dip");
                    }
                    if (_data[3].value == true) {
                      _WorkoutCreatorState.workoutList.add("Board Press");
                    }
                    if (_data[4].value == true) {
                      _WorkoutCreatorState.workoutList.add("Dumbbell Overhead Triceps Extension");
                    }
                    _WorkoutCreatorState.notif.value += 1;
                    const snackBar = SnackBar(
                      content: Text('Added exercises to the workout!'),
                    );
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    Navigator.pop(context);
                    Navigator.pop(context);
                  }, child: const Text('Add', style: TextStyle(color: Colors.white),)),
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
  final List<ChestExercises> _data = ChestExercises.generateItems(5);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Select chest workouts'),
        centerTitle: true,
        backgroundColor: const Color(0xFF5650DE),
      ),
      body: Center(
          child: ListView(
            padding: const EdgeInsets.all(8),
            children: <Widget>[
              ExpansionPanelList.radio(
                expandedHeaderPadding: const EdgeInsets.all(0),
                children: _data.map<ExpansionPanelRadio>((ChestExercises item) {
                  return ExpansionPanelRadio(
                      value: item.id,
                      headerBuilder: (BuildContext context, bool isExpanded) {
                        return CheckboxListTile(
                          activeColor: const Color(0xFF5650DE),
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
                  style: const ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll<Color>(
                        Color(0xFF5650DE)),
                  ),
                  onPressed: () {
                    if (_data[0].value == true) {
                      _WorkoutCreatorState.workoutList.add("Barbell Bench Press");
                    }
                    if (_data[1].value == true) {
                      _WorkoutCreatorState.workoutList.add("Incline Bench Press");
                    }
                    if (_data[2].value == true) {
                      _WorkoutCreatorState.workoutList.add("Decline Press");
                    }
                    if (_data[3].value == true) {
                      _WorkoutCreatorState.workoutList.add("Machine Chest Press");
                    }
                    if (_data[4].value == true) {
                      _WorkoutCreatorState.workoutList.add("Push-up");
                    }
                    _WorkoutCreatorState.notif.value += 1;
                    const snackBar = SnackBar(
                      content: Text('Added exercises to the workout!'),
                    );
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    Navigator.pop(context);
                    Navigator.pop(context);
                  }, child: const Text('Add', style: TextStyle(color: Colors.white),)),
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
  final List<BackExercises> _data = BackExercises.generateItems(5);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Select back workouts'),
        centerTitle: true,
        backgroundColor: const Color(0xFF5650DE),
      ),
      body: Center(
          child: ListView(
            padding: const EdgeInsets.all(8),
            children: <Widget>[
              ExpansionPanelList.radio(
                expandedHeaderPadding: const EdgeInsets.all(0),
                children: _data.map<ExpansionPanelRadio>((BackExercises item) {
                  return ExpansionPanelRadio(
                      value: item.id,
                      headerBuilder: (BuildContext context, bool isExpanded) {
                        return CheckboxListTile(
                          activeColor: const Color(0xFF5650DE),
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
                  style: const ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll<Color>(
                        Color(0xFF5650DE)),
                  ),
                  onPressed: () {
                    if (_data[0].value == true) {
                      _WorkoutCreatorState.workoutList.add("Pull-Up");
                    }
                    if (_data[1].value == true) {
                      _WorkoutCreatorState.workoutList.add("T-Bar Row");
                    }
                    if (_data[2].value == true) {
                      _WorkoutCreatorState.workoutList.add("Seated Row");
                    }
                    if (_data[3].value == true) {
                      _WorkoutCreatorState.workoutList.add("Single-Arm Smith Machine Row");
                    }
                    if (_data[4].value == true) {
                      _WorkoutCreatorState.workoutList.add("Lat Pull-Down");
                    }
                    _WorkoutCreatorState.notif.value += 1;
                    const snackBar = SnackBar(
                      content: Text('Added exercises to the workout!'),
                    );
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    Navigator.pop(context);
                    Navigator.pop(context);
                  }, child: const Text('Add', style: TextStyle(color: Colors.white),)),
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
  final List<LegsExercises> _data = LegsExercises.generateItems(5);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Select legs workouts'),
        centerTitle: true,
        backgroundColor: const Color(0xFF5650DE),
      ),
      body: Center(
          child: ListView(
            padding: const EdgeInsets.all(8),
            children: <Widget>[
              ExpansionPanelList.radio(
                expandedHeaderPadding: const EdgeInsets.all(0),
                children: _data.map<ExpansionPanelRadio>((LegsExercises item) {
                  return ExpansionPanelRadio(
                      value: item.id,
                      headerBuilder: (BuildContext context, bool isExpanded) {
                        return CheckboxListTile(
                          activeColor: const Color(0xFF5650DE),
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
                  style: const ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll<Color>(
                        Color(0xFF5650DE)),
                  ),
                  onPressed: () {
                    if (_data[0].value == true) {
                      _WorkoutCreatorState.workoutList.add("Squats");
                    }
                    if (_data[1].value == true) {
                      _WorkoutCreatorState.workoutList.add("Lunges");
                    }
                    if (_data[2].value == true) {
                      _WorkoutCreatorState.workoutList.add("Plank leg lifts");
                    }
                    if (_data[3].value == true) {
                      _WorkoutCreatorState.workoutList.add("Single-leg deadlifts");
                    }
                    if (_data[4].value == true) {
                      _WorkoutCreatorState.workoutList.add("Stability ball knee tucks");
                    }
                    _WorkoutCreatorState.notif.value += 1;
                    const snackBar = SnackBar(
                      content: Text('Added exercises to the workout!'),
                    );
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    Navigator.pop(context);
                    Navigator.pop(context);
                  }, child: const Text('Add', style: TextStyle(color: Colors.white),)),
            ],
          )
      ),
    );
  }
}