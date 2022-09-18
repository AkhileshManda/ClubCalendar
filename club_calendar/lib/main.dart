import 'package:club_calendar/features/app_review/view/app_feedback_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:provider/provider.dart';
import 'features/app_review/controller/app_feedback_provider.dart';
import 'features/auth/view/login_screen.dart';
import 'features/events/controller/event_provider.dart';
import 'features/events/view/event_screen.dart';
import 'features/events/view/past_event_screen.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart'
    as locNots;

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  // If you're going to use other Firebase services in the background, such as Firestore,
  // make sure you call `initializeApp` before using other Firebase services.
  await Firebase.initializeApp();

  print("Handling a background message: ${message.messageId}");
}

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  // FirebaseMessaging messaging = FirebaseMessaging.instance;

  // NotificationSettings settings = await messaging.requestPermission(
  //   alert: true,
  //   announcement: false,
  //   badge: true,
  //   carPlay: false,
  //   criticalAlert: false,
  //   provisional: false,
  //   sound: true,
  // );

  // print('User granted permission: ${settings.authorizationStatus}');
  // FirebaseMessaging.onMessage.listen((RemoteMessage message) {
  //   print('Got a message whilst in the foreground!');
  //   print('Message data: ${message.data}');

  //   if (message.notification != null) {
  //     print('Message also contained a notification: ${message.notification}');
  //   }
  // });
  // FirebaseMessaging.instance.getToken().then((value) => print(value));
  // await FirebaseMessaging.instance.setAutoInitEnabled(true);
  // FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  @override
  void initState() {
    super.initState();
    final fbm = FirebaseMessaging.instance;

    // IOS Configurations
    fbm.setForegroundNotificationPresentationOptions(
        alert: true, badge: true, sound: true);
    fbm.requestPermission();
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      print('IOS Listener');
      print('Got a message whilst in the foreground!');
      print('Message data: ${message.data}');

      if (message.notification != null) {
        print('Message also contained a notification: ${message.notification}');
      }
    });

    //Android Configurations
    const AndroidNotificationChannel channel = AndroidNotificationChannel(
      'high_importance_channel', // id
      'High Importance Notifications', // title

      importance: Importance.max,
    );
    final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
        FlutterLocalNotificationsPlugin();
    flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>()
        ?.createNotificationChannel(channel);
    FirebaseMessaging.instance
        .getInitialMessage()
        .then((RemoteMessage? message) {
      print('message recived');
    });
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      print('Android Listener');
      RemoteNotification? notification = message.notification;
      AndroidNotification? android = message.notification?.android;
      print('Android Notification:');
      if (notification != null && android != null) {
        flutterLocalNotificationsPlugin.show(
            notification.hashCode,
            notification.title,
            notification.body,
            NotificationDetails(
              android: AndroidNotificationDetails(channel.id, channel.name,
                  icon: "@mipmap/ic_launcher",
                  showWhen: false,
                  importance: Importance.max,
                  priority: locNots.Priority.high),
            ));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return NeumorphicApp(
      debugShowCheckedModeBanner: false,
      //home: ,//EventScreen(),
      home: StreamBuilder<User?>(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.active) {
              if (snapshot.hasData) {
                return ChangeNotifierProvider<EventsProvider>(
                    create: (_) => EventsProvider(), child: EventScreen());
                //return UserInfoScreen(user: snapshot.data);
              }
            }
            return LoginScreen();
          }),
      routes: {
        LoginScreen.routeName: (context) => LoginScreen(),
        EventScreen.routeName: (context) =>
            ChangeNotifierProvider<EventsProvider>(
                create: (_) => EventsProvider(), child: EventScreen()),
        AppFeedBackScreen.routeName: (context) =>
            ChangeNotifierProvider<ReviewProvider>(
                create: (_) => ReviewProvider(), child: AppFeedBackScreen()),
        PastEventsScreen.routeName: (context) =>
            ChangeNotifierProvider<EventsProvider>(
                create: (_) => EventsProvider(), child: PastEventsScreen())
      },
      title: 'Flutter Demo',
    );
  }
}
