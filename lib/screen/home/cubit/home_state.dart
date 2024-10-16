import 'package:wallpaper_app_api/model/wallpaper_model.dart';

abstract class HomeState {}

class HomeInitialState extends HomeState {}

class HomeLoadingState extends HomeState {}

class HomeLoadedState extends HomeState {
  List<Photos> ListPhotos ;
  HomeLoadedState({required this.ListPhotos}) ;
}

class HomeErrorState extends HomeState {
  String errorMsg ;
  HomeErrorState({required this.errorMsg}) ;

}
