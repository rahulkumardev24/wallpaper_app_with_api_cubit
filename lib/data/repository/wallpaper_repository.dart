import 'package:wallpaper_app_api/data/remote/api_helper.dart';
import 'package:wallpaper_app_api/data/remote/urls.dart';

class WallpaperRepository{
  ApiHelper apiHelper ;
  WallpaperRepository({required this.apiHelper}) ;

  Future<dynamic> getTrendingWallpapers() async{
    try{
     return apiHelper.getApi(url: AppUrls.TRANDING_URL) ;
    } catch(e){
      throw(e) ;
    }

  }
}