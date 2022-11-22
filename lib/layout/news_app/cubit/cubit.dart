import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:udemyflutter/layout/news_app/cubit/states.dart';
import 'package:udemyflutter/modules/business/business%20_screen.dart';
import 'package:udemyflutter/modules/science/science.dart';
import 'package:udemyflutter/modules/sports/sports.dart';
import 'package:udemyflutter/shared/network/remote/dio_helper.dart';

class Article {
  var title = "";
  String? urlToImage = "";
  String? publishedAt = "";

  Article({
    required this.title,
    required this.urlToImage,
    required this.publishedAt,
  });

  factory Article.fromJson(Map<String, dynamic> json) => Article(
        title: json["title"],
        urlToImage: json["urlToImage"],
        publishedAt: json["publishedAt"],
      );
}

class NewsCubit extends Cubit<NewsStates> {
  NewsCubit() : super(NewsInitialState());

  static NewsCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0;

  List<BottomNavigationBarItem> bottomItems = [
    const BottomNavigationBarItem(
      icon: Icon(
        Icons.business,
      ),
      label: 'Business',
    ),
    const BottomNavigationBarItem(
      icon: Icon(
        Icons.science,
      ),
      label: 'science',
    ),
    const BottomNavigationBarItem(
      icon: Icon(
        Icons.sports,
      ),
      label: 'sports',
    ),
  ];

  List<Widget> screen = [
    const BusinessScreen(),
    const ScienceScreen(),
    const SportsScreen(),
  ];

  void changBottomNavBar(int index) {
    currentIndex = index;
    if (index == 1) {
      getScience();
    }
    if (index == 2) {
      getSports();
    }
    emit(NewsBottomNavState());
  }

  List<Article> business = [];

  void getBusiness() {
    emit(NewsGetBusinessLoadingState());
    DioHelper.getData(
      url: 'v2/top-headlines',
      query: {
        'country': 'eg',
        'category': 'business',
        'apiKey': '3a63c963fbd04520962da86687359226',
      },
    ).then((value) {
      business = (value.data['articles'] as List)
          .map((x) => Article.fromJson(x))
          .toList();
      emit(NewsGetBusinessSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(NewsGetBusinessErrorState(error.toString()));
    });
  }

  List<Article> science = [];

  void getScience() {
    emit(NewsGetBusinessLoadingState());
    DioHelper.getData(
      url: 'v2/top-headlines',
      query: {
        'country': 'eg',
        'category': 'science',
        'apiKey': '3a63c963fbd04520962da86687359226',
      },
    ).then((value) {
      science = (value.data['articles'] as List)
          .map((x) => Article.fromJson(x))
          .toList();
      emit(NewsGetScienceSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(NewsGetScienceErrorState(error.toString()));
    });
  }

  List<Article> sports = [];

  void getSports() {
    emit(NewsGetSportsLoadingState());
    DioHelper.getData(
      url: 'v2/top-headlines',
      query: {
        'country': 'eg',
        'category': 'sports',
        'apiKey': '3a63c963fbd04520962da86687359226',
      },
    ).then((value) {
      sports = (value.data['articles'] as List)
          .map((x) => Article.fromJson(x))
          .toList();
      emit(NewsGetSportsSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(NewsGetSportsErrorState(error.toString()));
    });
  }

  List<Article> search = [];

  void getSearch(String value) {
    emit(NewsGetSportsLoadingState());

    search = [];

    DioHelper.getData(
      url: 'v2/everything',
      query: {
        'q': value,
        'apiKey': '3a63c963fbd04520962da86687359226',
      },
    ).then((value) {
      search = (value.data['articles'] as List)
          .map((x) => Article.fromJson(x))
          .toList();
      emit(NewsGetSearchSuccessState());
    }).catchError((error) {
      if (kDebugMode) {
        print(error.toString());
      }
      emit(NewsGetSearchErrorState(error.toString()));
    });
  }
}
