import 'package:flutter/material.dart';
import 'package:mcerebrum_main_flutter/ui/page/home/home_page.dart';
import 'package:mcerebrum_main_flutter/ui/page/settings/settings.dart';
import 'package:mcerebrum_main_flutter/ui/page/notfound/notfound_page.dart';
import 'package:mcerebrum_main_flutter/ui/widgets/common_drawer.dart';

class NavigationIconView {
  NavigationIconView({
    Widget icon,
    Widget activeIcon,
    String title,
    Color color,
    TickerProvider vsync,
  })  : _icon = icon,
        _title = title,
        _color = color,
        item = BottomNavigationBarItem(
          icon: icon,
          activeIcon: activeIcon,
          title: Text(title),
        ),
        controller = AnimationController(
          duration: kThemeAnimationDuration,
          vsync: vsync,
        ) {
    _animation = controller.drive(CurveTween(
      curve: const Interval(0.5, 1.0, curve: Curves.fastOutSlowIn),
    ));
  }

  final Widget _icon;
  final Color _color;
  final String _title;
  final BottomNavigationBarItem item;
  final AnimationController controller;
  Animation<double> _animation;

  FadeTransition transition(
      BottomNavigationBarType type, BuildContext context) {
    Color iconColor;
    if (type == BottomNavigationBarType.shifting) {
      iconColor = _color;
    } else {
      final ThemeData themeData = Theme.of(context);
      iconColor = themeData.brightness == Brightness.light
          ? themeData.primaryColor
          : themeData.accentColor;
    }

    return FadeTransition(
      opacity: _animation,
      child: SlideTransition(
        position: _animation.drive(
          Tween<Offset>(
            begin: const Offset(0.0, 0.02), // Slightly down.
            end: Offset.zero,
          ),
        ),
        child: IconTheme(
          data: IconThemeData(
            color: iconColor,
            size: 120.0,
          ),
          child: Semantics(
            label: 'Placeholder for $_title tab',
            child: _icon,
          ),
        ),
      ),
    );
  }
}

class MainPage extends StatefulWidget {
  static const String routeName = '/material/bottom_navigation';

  @override
  _BottomNavigationDemoState createState() => _BottomNavigationDemoState();
}

class _BottomNavigationDemoState extends State<MainPage>
    with TickerProviderStateMixin {
  int _currentIndex = 3;
  BottomNavigationBarType _type = BottomNavigationBarType.fixed;

  final List<Widget> _children = [
    HomePage(),
    NotFoundPage(),
    NotFoundPage(),
    Settings(),
    NotFoundPage(),
  ];
  List<NavigationIconView> _navigationViews;

  @override
  void initState() {
    super.initState();
    _navigationViews = <NavigationIconView>[
      NavigationIconView(
        icon: const Icon(Icons.home),
        title: 'Home',
        vsync: this,
      ),
      NavigationIconView(
        icon: const Icon(Icons.dashboard),
        title: 'Dashboard',
        vsync: this,
      ),
      NavigationIconView(
        icon: const Icon(Icons.system_update),
        title: 'System Info',
        vsync: this,
      ),
      NavigationIconView(
        icon: const Icon(Icons.settings),
        title: 'Settings',
        vsync: this,
      ),
      NavigationIconView(
        activeIcon: const Icon(Icons.info),
        icon: const Icon(Icons.notifications),
        title: 'Notification',
        vsync: this,
      )
    ];

    _navigationViews[_currentIndex].controller.value = 1.0;
  }
  @override
  void dispose() {
    for (NavigationIconView view in _navigationViews)
      view.controller.dispose();
    super.dispose();
  }

  Widget _buildTransitionsStack() {
    final List<FadeTransition> transitions = <FadeTransition>[];

    for (NavigationIconView view in _navigationViews)
      transitions.add(view.transition(_type, context));

    // We want to have the newly animating (fading in) views on top.
    transitions.sort((FadeTransition a, FadeTransition b) {
      final Animation<double> aAnimation = a.opacity;
      final Animation<double> bAnimation = b.opacity;
      final double aValue = aAnimation.value;
      final double bValue = bAnimation.value;
      return aValue.compareTo(bValue);
    });

    return Stack(children: transitions);
  }

  @override
  Widget build(BuildContext context) {
    final Widget botNavBar = new Theme(
      data: Theme.of(context).copyWith(
        // sets the background color of the `BottomNavigationBar`
          canvasColor: Colors.black87,
          // sets the active color of the `BottomNavigationBar` if `Brightness` is light
          primaryColor: Colors.lightBlueAccent.shade200,
          textTheme: Theme.of(context)
              .textTheme
              .copyWith(caption: new TextStyle(color: Colors.white70))),
      // sets the inactive color of the `BottomNavigationBar`
      child: new BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _currentIndex,
        items: _navigationViews
            .map<BottomNavigationBarItem>(
                (NavigationIconView navigationView) => navigationView.item)
            .toList(),
        onTap: (int index) {
          setState(() {
            _navigationViews[_currentIndex].controller.reverse();
            _currentIndex = index;
            _navigationViews[_currentIndex].controller.forward();
          });
        },
      ),
    );
    return Scaffold(
//      appBar: AppBar(
//        elevation: 4.0,
//        backgroundColor: Colors.black87,
//        title: Text("mCerebrum"),
//        actions: <Widget>[
//          SizedBox(
//            width: 5.0,
//          ),
//          IconButton(
//            onPressed: () {},
//            icon: Icon(Icons.refresh),
//          ),
//          IconButton(
//            onPressed: () {},
//            icon: Icon(Icons.more_vert),
//          )
//        ],
//      ),
      body: _children[_currentIndex], // new
      drawer: CommonDrawer(),

//      body: Center(
//        child: _buildTransitionsStack()

//      ),
      bottomNavigationBar: botNavBar,
    );
  }
}