import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wallpaper_app_api/data/repository/wallpaper_repository.dart';
import 'package:wallpaper_app_api/model/wallpaper_model.dart';
import 'package:wallpaper_app_api/screen/home/cubit/home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  WallpaperRepository wallpaperRepository ;
  HomeCubit({required this.wallpaperRepository}): super(HomeInitialState()) ;

  void getTrendingWallpaper() async {
    emit(HomeLoadingState()) ;
    try{

      var data = await wallpaperRepository.getTrendingWallpapers();
      var wallpaperModel = WallpaperModel.fromJson(data) ;
      emit(HomeLoadedState(ListPhotos: wallpaperModel.photos!));
    }catch(e){
      emit(HomeErrorState(errorMsg: e.toString()));
    }

  }

}