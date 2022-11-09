import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:body_optimizer/screens/workoutcreator.dart';
import 'package:body_optimizer/screens/homepage.dart';
import 'package:body_optimizer/screens/settings.dart';
import 'package:body_optimizer/screens/workout.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class PublicVariables {
  var mainColor = const Color(0xFF5650DE);
  var accentColor = const Color(0xFFF869D5);
  var cardColor = const Color(0xFFDEDEDE);
  var marginSymmetricVertical = const EdgeInsets.symmetric(vertical: 10);
  var paddingAll = const EdgeInsets.all(10);
  var normalText = GoogleFonts.lato(
    color: Colors.black,
    fontSize: 16,
  );
  var normalWhiteText = GoogleFonts.lato(
    color: Colors.white,
    fontSize: 16,
  );
  var normalGreyText = GoogleFonts.lato(
    color: Colors.black54,
    fontSize: 16,
  );
  var headerText = GoogleFonts.lato(
    color: Colors.black,
    fontSize: 26,
  );
  var subheaderText = GoogleFonts.lato(
    color: Colors.black,
    fontSize: 20,
  );
  var titleText = GoogleFonts.lato(
    color: Colors.black,
    fontSize: 42,
  );
}

class _MainPageState extends State<MainPage> {
  final PersistentTabController _controller =
      PersistentTabController(initialIndex: 0);

  List<Widget> _buildScreens() {
    return [
      const MyHomePage(),
      const Workout(),
      const WorkoutCreator(),
      const Settings(),
    ];
  }

  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        icon: const Icon(CupertinoIcons.home),
        title: ("Home"),
        activeColorPrimary: PublicVariables().mainColor,
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.fitness_center_outlined),
        title: ("Workout"),
        activeColorPrimary: PublicVariables().mainColor,
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.note_add_outlined),
        title: ("Workout Creator"),
        activeColorPrimary: PublicVariables().mainColor,
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.settings_outlined),
        title: ("Settings"),
        activeColorPrimary: PublicVariables().mainColor,
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PersistentTabView(
        context,
        controller: _controller,
        screens: _buildScreens(),
        items: _navBarsItems(),
        confineInSafeArea: true,
        resizeToAvoidBottomInset: true,
        hideNavigationBarWhenKeyboardShows: true,
        decoration: NavBarDecoration(
          borderRadius: BorderRadius.circular(10.0),
          colorBehindNavBar: Colors.white,
        ),
        popAllScreensOnTapOfSelectedTab: true,
        popActionScreens: PopActionScreensType.all,
        itemAnimationProperties: const ItemAnimationProperties(
          duration: Duration(milliseconds: 200),
          curve: Curves.ease,
        ),
        screenTransitionAnimation: const ScreenTransitionAnimation(
          animateTabTransition: true,
          curve: Curves.ease,
          duration: Duration(milliseconds: 200),
        ),
        navBarStyle:
            NavBarStyle.style4,
      ),
    );
  }
}
