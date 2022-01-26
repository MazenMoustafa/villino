import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vallino/util/size_config.dart';
import 'package:vallino/view/screens/about_us_screen.dart';
import 'package:vallino/view/screens/guest_form_screen.dart';
import 'package:vallino/view/screens/home_screen.dart';
import 'package:vallino/view/screens/login_screen.dart';
import 'package:vallino/view/screens/notifications_screen.dart';
import 'package:vallino/view/screens/register_screen.dart';
import 'package:vallino/view/screens/splash_screen.dart';
import 'package:flutter_localizations/flutter_localizations.dart';


void main() {

  WidgetsFlutterBinding.ensureInitialized();

  // One Signal
  //Remove this method to stop OneSignal Debugging
  OneSignal.shared.setLogLevel(OSLogLevel.verbose, OSLogLevel.none);

  OneSignal.shared.setAppId("9d93a153-9072-4ce0-b6f6-7e4e9b7aaac7");

// The promptForPushNotificationsWithUserResponse function will show the iOS push notification prompt. We recommend removing the following code and instead using an In-App Message to prompt for notification permission
  OneSignal.shared.promptUserForPushNotificationPermission().then((accepted) {
    print("Accepted permission: $accepted");
    log("setNotificationWillShowInForegroundHandler");
  });

  OneSignal.shared.setNotificationWillShowInForegroundHandler((OSNotificationReceivedEvent event) {
    // Will be called whenever a notification is received in foreground
    // Display Notification, pass null param for not displaying the notification
    event.complete(event.notification);
    log("setNotificationWillShowInForegroundHandler");
  });



  OneSignal.shared.setPermissionObserver((OSPermissionStateChanges changes) {
    // Will be called whenever the permission changes
    // (ie. user taps Allow on the permission prompt in iOS)
    log("setSubscriptionObserver");
  });

  OneSignal.shared.setSubscriptionObserver((OSSubscriptionStateChanges changes) {
    // Will be called whenever the subscription changes
    // (ie. user gets registered with OneSignal and gets a user ID)
    String? onesignalUserId = changes.to.userId;
    //log("setSubscriptionObserver");
    SharedPreferences.getInstance().then((value){
      value.setString("device_token",onesignalUserId!);
    });
  });

  OneSignal.shared.setNotificationOpenedHandler((OSNotificationOpenedResult result) {
    _MyAppState.handleClickNotification(result);
    log("Opened");
  });
  OneSignal.shared.setEmailSubscriptionObserver((OSEmailSubscriptionStateChanges emailChanges) {
    // Will be called whenever then user's email subscription changes
    // (ie. OneSignal.setEmail(email) is called and the user gets registered
  });
  OneSignal.shared.getDeviceState().then((deviceState) {
    print("DeviceState: ${deviceState?.jsonRepresentation()}");
    SharedPreferences.getInstance().then((value){
      value.setString("device_token",deviceState!.userId!);
      log("Token " + deviceState.userId!);
    });
    //log(deviceState!.pushToken!);
  });

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  static final navKey = new GlobalKey<NavigatorState>();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: navKey,
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      localizationsDelegates: [
        GlobalCupertinoLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: [
        Locale("ar", "AE"), // OR Locale('ar', 'AE') OR Other RTL locales
      ],
      locale: Locale("ar", "AE"), // OR Locale('ar', 'AE') OR Other RTL locales,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: "Cairo"
      ),
      home: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Main(),
      ),
    );
  }

  static void handleClickNotification(OSNotificationOpenedResult result) {
    log( result.notification.additionalData!.toString());
    navKey.currentState?.push(MaterialPageRoute(
        builder: (_) => NotificationsScreen()
    ));


    //SharedPreferences.getInstance().then((prefs){
    // });

      // if(result.notification.additionalData?.containsKey('ad_id') == true){
      //
      // }
      // else{
      //
      // }



  }
}



class Main extends StatefulWidget {
  const Main({Key? key}) : super(key: key);

  @override
  _MainState createState() => _MainState();
}

class _MainState extends State<Main> {
  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return SplashScreen();
  }
}


