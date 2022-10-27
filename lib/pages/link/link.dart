
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttericon/font_awesome5_icons.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:okumurastableforowner/utils/dimensions.dart';

import '../../controllers/news_from_the_stable_controller.dart';
import '../../routes/routerhelper.dart';
import '../../utils/app_constants.dart';
import '../../utils/colors.dart';
import '../../widgets/bigtext.dart';
import '../../widgets/expandable_text.dart';
import '../../widgets/icons_and_text.dart';
import '../../widgets/smalltext.dart';
import '../account/account_profile_top_icon.dart';




class LinkPage extends StatefulWidget {
  const LinkPage({Key? key}) : super(key: key);

  @override
  State<LinkPage> createState() => _LinkPageState();
}


class _LinkPageState extends State<LinkPage> {
  @override
  Widget build(BuildContext context) {
    print("current height is "+ MediaQuery.of(context).size.height.toString());
    print("current width is "+ MediaQuery.of(context).size.width.toString());
    return Scaffold(
        appBar: AppBar(
          title: Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SmallText(text:"Link",
                    color: AppColors.whiteColor,
                    size: Dimensions.font20,),
                  AccountProfileIcon(icon: FontAwesome5.user_circle,
                    iconSize: Dimensions.height30,),
                ],
              )),
          backgroundColor: AppColors.maincolor,
        ),
        body: Column(
          children: [
            Expanded(child: SingleChildScrollView(
              child: Container(
                child: ///////////////////////////////////LIST OF FOOD AND IMAGES
                GetBuilder<RecommendedProductController>(builder: (recommendedProduct){
                  return recommendedProduct.isLoaded?ListView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: recommendedProduct.recommendedProductList.length,
                      itemBuilder: (context,index){
                        return GestureDetector(
                          onTap: (){
                            // Get.toNamed(RouteHelper.getRecommendedFood(index));
                          },
                          child: Container(
                            margin: EdgeInsets.only(top: Dimensions.height20,left: Dimensions.width20,right: Dimensions.width20, bottom: Dimensions.height10),
                            child: Row(
                              children: [
                                //image section
                                Container(
                                  width: Dimensions.listViewImgSize,
                                  height: Dimensions.listViewImgSize,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(Dimensions.radius20),
                                    color: Colors.white38,
                                    image: DecorationImage(
                                        fit: BoxFit.cover,
                                        image: ExactAssetImage(
                                            //"assets/image/jew.jpg"
                                          "assets"+AppConstants.UPLOAD_URL+recommendedProduct.recommendedProductList[index].img!
                                        )
                                    ),
                                  ),
                                ),
                                //text container
                                Expanded(child: Container(
                                  // height: Dimensions.listViewTextContSize,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                      topRight: Radius.circular(Dimensions.radius20),
                                      bottomRight: Radius.circular(Dimensions.radius20),
                                    ),
                                    color: Colors.white,
                                  ),
                                  child: Padding(
                                    padding: EdgeInsets.only(left: Dimensions.width10,right: Dimensions.width10),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        BigText(text: recommendedProduct.recommendedProductList[index].name!),
                                        SizedBox(height: Dimensions.height10,),
                                        ExpandableText(size:Dimensions.font16 ,text: recommendedProduct.recommendedProductList[index].description!),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.end,
                                          children: [
                                            Container(
                                              // padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                                              child: ElevatedButton(
                                                  style: ElevatedButton.styleFrom(
                                                    backgroundColor: AppColors.maincolor,
                                                  ),
                                                  child: SmallText(text: 'See this site',
                                                  color: AppColors.whiteColor,), /*Text('See this site',
                                                    style: TextStyle(fontSize: Dimensions.font16),),*/
                                                  onPressed: () => {
                                                    Get.toNamed(RouteHelper.getToHomePage())
                                                  }
                                              ),
                                            ),                                          ],
                                        )

                                      ],
                                    ),
                                  ),
                                ))
                                //text container widget
                                //_buildPageItem2(),
                              ],
                            ),
                          ),
                        );
                      }):CircularProgressIndicator(
                    color: AppColors.maincolor,
                  );
                }),
              ),
            ))
          ],
        ),
        bottomNavigationBar: Container(
            padding: EdgeInsets.only(left: Dimensions.width10, right: Dimensions.width10),
            height: Dimensions.height30 * 2,
            width: double.maxFinite,
            color: AppColors.bottomNavColor,
            child:  Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                    onTap: (){
                      Get.toNamed(RouteHelper.getToHomePage());
                    },
                    child: IconAndTextWidget(icon: Icons.home_filled, text: "Home", iconColor: AppColors.buttonBackgroundColor)),
                GestureDetector(
                    onTap: (){
                      Get.toNamed(RouteHelper.getHorseStablePage());
                    },
                    child: IconAndTextWidget(icon: FontAwesome5.horse_head, text: "Aisha", iconColor: AppColors.buttonBackgroundColor)),
                GestureDetector(
                    onTap: (){
                      Get.toNamed(RouteHelper.getNewsFromStablePage());
                    },
                    child: IconAndTextWidget(icon: Icons.newspaper_rounded, text: "News", iconColor: AppColors.buttonBackgroundColor)),
                GestureDetector(
                    onTap: (){
                      Get.toNamed(RouteHelper.getMessagePage());
                    },
                    child: IconAndTextWidget(icon: Icons.message_rounded, text: "Message", iconColor: AppColors.buttonBackgroundColor)),
                IconAndTextWidget(icon: Icons.link, text: "LINK", iconColor: AppColors.signColor)
              ],
            )
        )//Center
    ); //Scaffold
  }
}
