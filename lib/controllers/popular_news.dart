
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../data/repository/popular_news_repo.dart';
import '../model/news_from_the_stable_model.dart';
import '../utils/colors.dart';

class PopularProductController extends GetxController{
  final PopularProductRepo popularProductRepo;
  //constructor
  PopularProductController({required this.popularProductRepo});
  List<dynamic> _popularProductList = [];
  List<dynamic> get popularProductList => _popularProductList;
  // late CartController _cart;

  bool _isLoaded = false;
  bool get isLoaded=>_isLoaded;

  int _quantity = 0;
  int get quantity=>_quantity;
  int _inCartItems = 0;
  int get intCartItems=>_inCartItems+_quantity;
  Future<void> getPopularProductList() async{//async if it returns a future data
    Response response = await popularProductRepo.getPopularProductList();
    if(response.statusCode==200){
      _popularProductList=[];
      _popularProductList.addAll(News.fromJson(response.body).news);
      _isLoaded = true;
      update();//same as setState()
    }else{
      //print(_popularProductList);
    }
  }

  void setQuantity(bool isIncrement){
    if(isIncrement){
      _quantity = checkQuantity(_quantity+1);
    }else{
      _quantity = checkQuantity(_quantity-1);
    }
    update();
  }
  int checkQuantity(int quantity){
    if((_inCartItems+quantity)<0){
      Get.snackbar("Item count", "You can't reduce more!",
        backgroundColor: AppColors.maincolor,
        colorText: Colors.white,
      );
      return 0;
    }
    else if((_inCartItems+quantity)>20){
      Get.snackbar("Item count", "You can't add more!",
        backgroundColor: AppColors.maincolor,
        colorText: Colors.white,
      );
      return 20;
    }
    else{
      return quantity;
    }

  }
  /*void initProduct(ProductModel product,CartController cart){
    _quantity = 0;
    _inCartItems=0;
    _cart=cart;
    var exist = false;
    exist = _cart.existInCart(product);
    if(exist){
      _inCartItems=_cart.getQuantity(product);
    }
  }
  void addItem(ProductModel product,){
    _cart.addItem(product, quantity);
    _quantity=0;
    _inCartItems=_cart.getQuantity(product);
    _cart.items.forEach((key, value) {
      print("value");
    });
    update();
  }
  int get totalItems{
    return _cart.totalItems;
  }*/
}