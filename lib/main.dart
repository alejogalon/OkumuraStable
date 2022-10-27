import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:okumurastableforowner/routes/routerhelper.dart';
import 'package:okumurastableforowner/splashscreen.dart';
import 'package:okumurastableforowner/translator.dart';
import 'controllers/news_from_the_stable_controller.dart';
import 'controllers/popular_news.dart';
import 'helper/dependencies.dart' as dep;

Future<void> main() async{
  WidgetsFlutterBinding.ensureInitialized();//ensures loaded correctly
  await dep.init();
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    Get.find<PopularProductController>().getPopularProductList();
    Get.find<RecommendedProductController>().getRecommendedProductList();
    return GetMaterialApp(
      title: 'Okumura Stable for owners',
      debugShowCheckedModeBanner: false,
      locale: Get.deviceLocale,
      fallbackLocale: Locale('en'),
      home: SplashScreen(),//MyHomeTranslatorPage(),
      initialRoute: RouteHelper.initial,
      getPages: RouteHelper.routes,
    );
  }
}
