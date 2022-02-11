import 'package:cirestechnologies/app/sreens/obroad/IntroductionScreen.dart';
import 'package:cirestechnologies/app/sreens/obroad/onbroadingScreenData.dart';
import 'package:cirestechnologies/app/style/app_image.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
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
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  final List<OnbroadingSreenData> list = [
    OnbroadingSreenData(
      subTitle: "Create an account",
      title: "Connect with people around the world",
      imagePath: "assets/images/onbroad/onbroad1.png",
      desc:"Discover restaurants by type of meal, See menus and photos for nearby restaurants and bookmark your favorite places on the go",
    ),
    OnbroadingSreenData(
      subTitle: "Log in to your account",
      title: "Let's build connection with new peoples",
      imagePath: AppImages.onbroading_two,
      desc:"Best restaurants delivering to your doorstep, Browse menus and build your order in seconds",
    ),
    OnbroadingSreenData(
      subTitle: "Log in to your account",
      title: "Feel the happiness",
      imagePath: AppImages.onbroading_three,
      desc:"Explore curated lists of top restaurants, cafes, pubs, and bars in Mumbai, based on trends.",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IntroductionScreen(onbordingDataList: list, pageRoute: MaterialPageRoute(builder: (context) => NextScreen())),// This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

class NextScreen extends StatefulWidget {
  @override
  _NextScreenState createState() => _NextScreenState();
}

class _NextScreenState extends State<NextScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text("HHHHHHHHHHHHHHHHHH Yes i FINSH Onbroading screen "),
      ),
    );
  }
}
