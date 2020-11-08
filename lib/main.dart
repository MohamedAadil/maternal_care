import 'package:diabetic_maternal_care/authentication/login.dart';
import 'package:diabetic_maternal_care/common.dart';
import 'package:diabetic_maternal_care/common/widgets/home_screen_card.dart';
import 'package:diabetic_maternal_care/screens/home_screen_clipper.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Diabetic Maternal Care',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primaryColor: Color(0Xffe30167),
        primarySwatch: Colors.blue,
        // This makes the visual density adapt to the platform that you run
        // the app on. For desktop platforms, the controls will be smaller and
        // closer together (more dense) than on mobile platforms.
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: LoginScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<dynamic> _homeScreenIcons = <dynamic>[];

  void changeScreen(String name) async {
    switch (name) {
      case 'profile':
        Navigator.of(context).pop();
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => HomeScreen()));
        break;
      case 'settings':
        Navigator.of(context).pop();
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => HomeScreen()));
        break;
      case 'contact':
        Navigator.of(context).pop();
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => HomeScreen()));
        break;
      case 'logout':
        Navigator.of(context).pop();
        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (context) => LoginScreen()),
            (route) => false);
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    _homeScreenIcons = [
      {
        'key': 'patient_details',
        'name': 'Patient Details',
        'img': 'assets/images/patient.png'
      },
      {
        'key': 'doctor_details',
        'name': 'Doctor Details',
        'img': 'assets/images/doctor.png'
      },
      {
        'key': 'calorie_counter',
        'name': 'Calorie Counter',
        'img': 'assets/images/calorie.png'
      },
      {
        'key': 'report',
        'name': 'Upload Reports',
        'img': 'assets/images/lab-report.png'
      }
    ];

    return Scaffold(
      appBar: createAppBar(context, ''),
      body: Stack(
        children: <Widget>[
          ClipPath(
            clipper: HomeScreenClipper(),
            child: Container(
              color: Color(0Xffffbddb),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Column(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(top: 25.0),
                    child: Image.asset(
                      'assets/images/logo.png',
                      height: 100,
                    ),
                  ),
                ],
              ),
            ],
          ),
          Column(
            children: <Widget>[
              Padding(padding: EdgeInsets.only(top: 130.0)),
              Expanded(
                flex: 2,
                child: GridView.count(
                  crossAxisCount: 2,
                  padding: EdgeInsets.all(20.0),
                  shrinkWrap: true,
                  children: _homeScreenIcons
                      .map((e) => createCard(e, context))
                      .toList(),
                ),
              ),
            ],
          ),
        ],
      ),
      drawer: Drawer(
        child: Column(
          children: <Widget>[
            DrawerHeader(
              curve: Curves.easeInCubic,
              child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    CircleAvatar(
                        radius: 50,
                        backgroundColor: Colors.transparent,
                        foregroundColor: Theme.of(context).primaryColor,
                        child: Image.asset(
                          'assets/images/img_avatar.png',
                          color: Theme.of(context).primaryColor,
                        )),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 2),
                      child: Text('User Name'),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Column(
                children: <Widget>[
                  ListTile(
                    onTap: () => changeScreen('profile'),
                    title: Text('Profile'),
                    leading: Icon(
                      Icons.person,
                    ),
                  ),
                  ListTile(
                    onTap: () => changeScreen('settings'),
                    title: Text('Settings'),
                    leading: Icon(
                      Icons.settings,
                    ),
                  ),
                  ListTile(
                    onTap: () => changeScreen('contact'),
                    title: Text('Contact'),
                    leading: Icon(
                      Icons.contact_phone,
                    ),
                  ),
                  Expanded(
                    child: Container(),
                  ),
                  SafeArea(
                    child: ListTile(
                      leading: Icon(Icons.power_settings_new),
                      title: Text('Logout'),
                      onTap: () => changeScreen('logout'),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
