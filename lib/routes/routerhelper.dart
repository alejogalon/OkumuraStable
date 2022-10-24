import 'package:get/get.dart';

import '../loginpage.dart';
import '../pages/home/home.dart';
import '../pages/home/main_home.dart';
import '../pages/home/news_from_stable.dart';
import '../pages/home/news_stable_carousel.dart';
import '../pages/horses/horses.dart';
import '../pages/link/link.dart';
import '../pages/message/message.dart';
import '../successlogin.dart';

class RouteHelper{
  static const String initial ="/";
  static const String login ="/login";
  static const String successpage = "/successlogin";
  static const String homepage = "/home";
  static const String newsfromstablepage = "/newsfromstable";
  static const String newsfromstablecarouselpage = "/newsfromstablecarousel";
  //MESSAGE PAGE
  static const String messagepage = "/message";
  //LINK PAGE
  static const String linkpage = "/link";
  //HORSE STABLE PAGE
  static const String horsestablepage = "/horsestable";
  /*static const String abouthorsespage = "/abouthorses";
  static const String aboutstablespage = "/aboutstables";
  static const String aboutmasterspage = "/aboutmasters";
*/
  static String getInitial()=>'$initial';
  static String getToLogin()=>'$login';
  static String getToSuccessPage()=>'$successpage';
  static String getToHomePage()=>'$homepage';
  static String getNewsFromStablePage()=>'$newsfromstablepage';
  static String getNewsFromStableCarouselPage()=>'$newsfromstablecarouselpage';
  //MESSAGE
  static String getMessagePage()=>'$messagepage';
  //LINK
  static String getLinkPage()=>'$linkpage';
  //HORSESTABLE
  static String getHorseStablePage()=>'$horsestablepage';
  /*static String getToAboutHorsesPage()=>'$abouthorsespage';
  static String getToAboutStablesPage()=>'$aboutstablespage';
  static String getToAboutMastersPage()=>'$aboutmasterspage';
*/
  static List<GetPage> routes =[
    GetPage(name:login, page: ()=>LoginPage(),
        transition: Transition.fadeIn
    ),
    GetPage(name:successpage, page: ()=>SuccessPage(),
        transition: Transition.fadeIn
    ),
    GetPage(name:homepage, page: ()=>MainFoodPage(),//HomePage(),
        transition: Transition.fadeIn
    ),
    GetPage(name:newsfromstablepage, page: ()=>NewsFromStablePage(),//HomePage(),
        transition: Transition.fadeIn
    ),
    GetPage(name:newsfromstablecarouselpage, page: ()=>NewsFromStableCarouselPage(),//HomePage(),
        transition: Transition.fadeIn
    ),
    /////////////////////////////////MESSAGE
    GetPage(name:messagepage, page: ()=>MessagePage(),//HomePage(),
        transition: Transition.fadeIn
    ),
    /////////////////////////////////LINK
    GetPage(name:linkpage, page: ()=>LinkPage(),//HomePage(),
        transition: Transition.fadeIn
    ),
    /////////////////////////////////LINK
    GetPage(name:horsestablepage, page: ()=>HorsesStablePage(),//HomePage(),
        transition: Transition.fadeIn
    ),
    /*GetPage(name:abouthorsespage, page: ()=>AboutHorsesPage(),
        transition: Transition.fadeIn
    ),
    GetPage(name:aboutstablespage, page: ()=>AboutStablesPage(),
        transition: Transition.fadeIn
    ),
    GetPage(name:aboutmasterspage, page: ()=>AboutMastersPage(),
        transition: Transition.fadeIn
    ),*/
    // GetPage(name: popularFood, page:(){
    //   //print("popular food get called");
    //   var pageId=Get.parameters['pageId'];
    //   return PopularFoodDetail(pageId:int.parse(pageId!));
    // },
    //     transition: Transition.fadeIn
    //
    // ),
    // GetPage(name: recommendedFood, page:(){
    //   //print("popular food get called");
    //   var pageId=Get.parameters['pageId'];
    //   return RecommendedFoodDetail(pageId:int.parse(pageId!));
    // },
    //     transition: Transition.fadeIn
    // ),
  ];
}