import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nike/api/firebase_notification_push.dart';
import 'package:nike/home_page.dart';
import 'package:nike/notification_page.dart';
import 'package:nike/profile_page.dart';
import 'package:simple_shadow/simple_shadow.dart';
import 'package:flutter_statusbarcolor_ns/flutter_statusbarcolor_ns.dart';
import 'firebase_options.dart';
Future<void> main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform
  );
  await FirebaseNotificationPush().initNotifications();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int pageIndex = 0;

  final pages = [
    const HomePage(),
    const NotificationPage(),
    const Page3(),
    const ProfilePage(),
  ];


  @override
  void initState() {
    super.initState();
    initialization();
  }

  void initialization() async {
    // This is where you can initialize the resources needed by your app while
    // the splash screen is displayed.  Remove the following example because
    // delaying the user experience is a bad design practice!
    // ignore_for_file: avoid_print
    print('ready in 3...');
    await Future.delayed(const Duration(seconds: 1));
    print('ready in 2...');
    await Future.delayed(const Duration(seconds: 1));
    print('go!');
    FlutterNativeSplash.remove();
  }

  @override
  Widget build(BuildContext context) {
    FlutterStatusbarcolor.setStatusBarColor(const Color(0xffF7F7F9));
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        statusBarColor: Color(0xffF7F7F9)
    ));

    return Scaffold(
      extendBody: true,
      extendBodyBehindAppBar: true,
      backgroundColor: const Color(0xffF7F7F9),
      body: pages[pageIndex],
      bottomNavigationBar: buildMyNavBar(context),
    );
  }

  Stack buildMyNavBar(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: <Widget>[
        Container(
          height: 115,
          width: double.infinity,
          alignment: Alignment.center,
          padding: EdgeInsets.only(top: 10),
          child: SimpleShadow(
            child: SvgPicture.asset(
              'assets/images/bg_bottom_nav.svg',
              alignment: Alignment.center,
              width: MediaQuery.of(context).size.width,
              fit: BoxFit.fitWidth,
            ),
            opacity: 0.6,
            color: Colors.grey,
            offset: Offset(5, 5),
            sigma: 7,
          ),
        ),
        Container(
          height: 115,
          width: double.infinity,
          color: Colors.transparent,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(
                  enableFeedback: false,
                  onPressed: () {
                    setState(() {
                      pageIndex = 0;
                    });
                  },
                  icon: SvgPicture.asset(
                    'assets/images/ic_bottom_home.svg',
                    alignment: Alignment.center,
                    width: MediaQuery.of(context).size.width,
                    height: 28,
                    fit: BoxFit.cover,
                    colorFilter: pageIndex == 0
                        ? ColorFilter.mode(Color(0xff0D6EFD), BlendMode.srcIn)
                        : ColorFilter.mode(Colors.black, BlendMode.srcIn),
                  )),
              IconButton(
                  enableFeedback: false,
                  onPressed: () {
                    setState(() {
                      pageIndex = 1;
                    });
                  },
                  icon: SvgPicture.asset(
                    'assets/images/ic_bottom_favorite.svg',
                    alignment: Alignment.center,
                    width: MediaQuery.of(context).size.width,
                    height: 28,
                    fit: BoxFit.cover,
                    colorFilter: pageIndex == 1
                        ? ColorFilter.mode(Color(0xff0D6EFD), BlendMode.srcIn)
                        : ColorFilter.mode(Colors.black, BlendMode.srcIn),
                  )),
              Container(
                height: 56,
                width: 56,
                margin: EdgeInsets.only(bottom: 59),
                padding: EdgeInsets.all(15),
                decoration: BoxDecoration(
                  color: Color(0xff0D6EFD),
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(100),
                      topRight: Radius.circular(100),
                      bottomLeft: Radius.circular(100),
                      bottomRight: Radius.circular(100)),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.blueAccent.withOpacity(0.3),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: Offset(0, 3), // changes position of shadow
                    ),
                  ],
                ),
                child: SvgPicture.asset('assets/images/ic_bag.svg'),
              ),
              IconButton(
                  enableFeedback: false,
                  onPressed: () {
                    setState(() {
                      pageIndex = 2;
                    });
                  },
                  icon: SvgPicture.asset(
                    'assets/images/ic_bottom_notification.svg',
                    alignment: Alignment.center,
                    width: MediaQuery.of(context).size.width,
                    height: 28,
                    fit: BoxFit.cover,
                    colorFilter: pageIndex == 2
                        ? ColorFilter.mode(Color(0xff0D6EFD), BlendMode.srcIn)
                        : ColorFilter.mode(Colors.black, BlendMode.srcIn),
                  )),
              IconButton(
                  enableFeedback: false,
                  onPressed: () {
                    setState(() {
                      pageIndex = 3;
                    });
                  },
                  icon: SvgPicture.asset(
                    'assets/images/ic_bottom_profile.svg',
                    alignment: Alignment.center,
                    width: MediaQuery.of(context).size.width,
                    height: 28,
                    fit: BoxFit.cover,
                    colorFilter: pageIndex == 3
                        ? ColorFilter.mode(Color(0xff0D6EFD), BlendMode.srcIn)
                        : ColorFilter.mode(Colors.black, BlendMode.srcIn),
                  )),
            ],
          ),
        )
      ],
    );
  }
}

class Page2 extends StatelessWidget {
  const Page2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xffF7F7F9),
      child: Center(
        child: Text(
          "Page Number 2",
          style: TextStyle(
            color: Colors.green[900],
            fontSize: 45,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}

class Page3 extends StatelessWidget {
  const Page3({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xffF7F7F9),
      child: Center(
        child: Text(
          "Page Number 3",
          style: TextStyle(
            color: Colors.green[900],
            fontSize: 45,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
