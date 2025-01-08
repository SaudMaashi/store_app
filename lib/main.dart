import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:store_app/providers/general.dart';
import 'package:store_app/providers/theme.dart';
import 'package:store_app/screens/authentication/forgot_password.dart';
import 'package:store_app/screens/authentication/information.dart';
import 'package:store_app/screens/authentication/login.dart';
import 'package:store_app/screens/authentication/password.dart';
import 'package:store_app/screens/authentication/register.dart';
import 'package:store_app/screens/authentication/reset_confirmation.dart';
import 'package:store_app/screens/main/user_main.dart';
import 'package:store_app/screens/sub_screens/accessories.dart';
import 'package:store_app/screens/sub_screens/address_payment.dart';
import 'package:store_app/screens/sub_screens/bags.dart';
import 'package:store_app/screens/sub_screens/cart.dart';
import 'package:store_app/screens/sub_screens/categories.dart';
import 'package:store_app/screens/sub_screens/hoodies.dart';
import 'package:store_app/screens/sub_screens/order_details.dart';
import 'package:store_app/screens/sub_screens/order_placed.dart';
import 'package:store_app/screens/sub_screens/shoes.dart';
import 'package:store_app/screens/sub_screens/shorts.dart';

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
          return MultiProvider(
            providers: [
              ChangeNotifierProvider(
                create: (context) {
                  return GeneralProvider();
                },
              ),
            ],
            child: MaterialApp(
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
                "/categories": (_) => const CategoriesScreen(),
                "/order_details": (_) => const OrderDetailsScreen(),
                "/hoodies": (_) => const HoodiesScreen(),
                "/accessories": (_) => const AccessoriesScreen(),
                "/shorts": (_) => const ShortsScreen(),
                "/shoes": (_) => const ShoesScreen(),
                "/bags": (_) => const BagsScreen(),
                "/cart": (_) => const CartScreen(),
                "/address_payment": (_) => const AddressPaymentScreen(),
                "/order_placed": (_) => const OrderPlacedScreen(),
              },
            ),
          );
        },
      ),
    );
  }
}
