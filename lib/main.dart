import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:store_app/providers/theme.dart';
import 'package:store_app/screens/authentication/forgot_password.dart';
import 'package:store_app/screens/authentication/information.dart';
import 'package:store_app/screens/authentication/login.dart';
import 'package:store_app/screens/authentication/password.dart';
import 'package:store_app/screens/authentication/register.dart';
import 'package:store_app/screens/authentication/reset_confirmation.dart';
import 'package:store_app/screens/main/user_main.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]).then((_) {
    runApp(const StoreApp());
  });
}

class StoreApp extends StatelessWidget {
  const StoreApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => ThemeProvider(),
        ),
      ],
      child: Consumer<ThemeProvider>(
        builder: (context, themeProvider, child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: themeProvider.theme,
            initialRoute: "/login",
            routes: {
              "/login": (_) => const LoginScreen(),
              "/register": (_) => const RegisterScreen(),
              "/password": (_) => const PasswordScreen(),
              "/forgot_password": (_) => const ForgotPasswordScreen(),
              "/user_main": (_) => const UserMainScreen(),
              "/reset": (_) => const ResetConfirmationScreen(),
              "/information": (_) => const UserInformation(),
            },
          );
        },
      ),
    );
  }
}
