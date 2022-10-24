import 'dart:isolate';

import 'package:get/get.dart';

import '../data/repository/news_from_the_stable_repo.dart';
import '../model/news_from_the_stable_model.dart';


class RecommendedProductController extends GetxController{
  final RecommendedProductRepo recommendedProductRepo;
  //constructor
  RecommendedProductController({required this.recommendedProductRepo});
  List<dynamic> _recommendedProductRepoList = [];
  List<dynamic> get recommendedProductList => _recommendedProductRepoList;

  bool _isLoaded = false;
  bool get isLoaded=>_isLoaded;
  Future<void> getRecommendedProductList() async{//async if it returns a future data
    Response response = await recommendedProductRepo.getRecommendedProductList();
    if(response.statusCode==200){
      _recommendedProductRepoList=[];
      _recommendedProductRepoList.addAll(News.fromJson(response.body).news);
      //print(_popularProductList);
      _isLoaded = true;
      update();//same as setState()
    }else{
      print("not got products");

    }
  }
}