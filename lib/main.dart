import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:web_project/views/conversion_screen.dart';
import 'package:web_project/views/crypto_list_path_provider_screen.dart';
import 'package:web_project/views/crypto_list_shared_pref_screen.dart';
import 'package:web_project/views/home_screen.dart';
import 'package:web_project/views/profile_screen.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(415, 845),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return MaterialApp(
              initialRoute: '/home',
              routes: {
                '/home': (context) => const HomeScreen(),
                '/home/record_data': (context) => const ProfileScreen(),
                '/home/conversion_screen': (context) =>
                    const ConversionScreen(),
                '/home/crypto_list_pp': (context) => const CryptoListScreen(),
                '/home/crypto_list_sp': (context) =>
                    const CryptoListSharedPref(),
              },
              title: 'Flutter Demo',
              theme: ThemeData(
                useMaterial3: true,
                fontFamily: 'Poppins_Light',
              ),
              home: const HomeScreen());
        });
  }
}
