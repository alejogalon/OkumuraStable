import 'package:get/get.dart';

import '../controllers/news_from_the_stable_controller.dart';
import '../controllers/popular_news.dart';
import '../data/api/api_client.dart';
import '../data/repository/news_from_the_stable_repo.dart';
import '../data/repository/popular_news_repo.dart';
import '../utils/app_constants.dart';


Future<void> init()async{
  //api client
  Get.lazyPut(()=>ApiClient(appBaseUrl: AppConstants.BASE_URL));
  //repos
  Get.lazyPut(() => PopularProductRepo(apiClient: Get.find()));
  Get.lazyPut(() => RecommendedProductRepo(apiClient: Get.find()));
  // Get.lazyPut(() => CartRepo());
  //controllers
  Get.lazyPut(() => PopularProductController(popularProductRepo: Get.find()));
  Get.lazyPut(() => RecommendedProductController(recommendedProductRepo: Get.find()));
  // Get.lazyPut(() => CartController(cartRepo: Get.find()));
}