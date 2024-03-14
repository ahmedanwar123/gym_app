// import 'package:app/controllers/auth_controller.dart';
// import 'package:app/controllers/cart_controller.dart';
// import 'package:app/controllers/image_search_controller.dart';
// import 'package:app/controllers/product_controller.dart';
// import 'package:app/controllers/text_search_controller.dart';
// import 'package:app/controllers/user_controller.dart';
import 'package:app/shared/routes.dart';
import 'package:app/shared/themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';

void main() async {
  // Get.put(UserController());
  // Get.put(AuthController());
  // Get.put(ProductController());
  // Get.put(ImageSearchController());
  // Get.put(CartController());
  // Get.put(TextSearchController());

  try {
    await dotenv.load(fileName: ".env");
  } on Exception catch (e) {
    throw Exception('Failed to load .env file: $e');
  }
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // return const MaterialApp(home: const Test());
    return SafeArea(
      child: GetMaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: Routes
            .loginScreenRoute, // Restore it to default after finishing testing
        //getPages: getPages,
        themeMode: ThemeMode.light,
        theme: kLightTheme,
        darkTheme: kDarkTheme,
      ),
    );
  }
}





  // WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp(
  //   options: DefaultFirebaseOptions.currentPlatform,
  // );