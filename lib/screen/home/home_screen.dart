import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wallpaper_app_api/app_widgets/wallpaper_bg_widgets.dart';
import 'package:wallpaper_app_api/constants/app_constrants_apikey.dart';
import 'package:wallpaper_app_api/screen/home/cubit/home_cubit.dart';
import 'package:wallpaper_app_api/screen/home/cubit/home_state.dart';
import 'package:wallpaper_app_api/utils/app_color.dart';
import 'package:wallpaper_app_api/utils/custom_text_style.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    BlocProvider.of<HomeCubit>(context).getTrendingWallpaper();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(
      scrollDirection: Axis.vertical,
      children: [
        const SizedBox(
          height: 50,
        ),

        /// -------------------SEARCH------------------///
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: SizedBox(
            height: 50,
            child: TextField(
              controller: searchController,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none,
                ),
                hintText: "Find Wallpapers...",
                hintStyle: mTextStyle12(mColor: Colors.black38),
                filled: true,
                fillColor: AppColors.primaryLightColor,
                suffixIcon: const Icon(Icons.search_outlined),
                suffixIconColor: Colors.black45,
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 11,
        ),

        /// ------------BEST OF THE MONTH --------------///
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Text(
            "Best of the Month",
            style: mTextStyle16(),
          ),
        ),
        const SizedBox(
          height: 11,
        ),

        /// ---------------wallpaper-----------------///
        SizedBox(
          height: 200,
          child: BlocBuilder<HomeCubit, HomeState>(
            builder: (context, state) {
              if (state is HomeLoadingState) {
                return const Center(child: CircularProgressIndicator());
              } else if (state is HomeErrorState) {
                return Center(child: Text(state.errorMsg, style: const TextStyle(color: Colors.red)));
              } else if (state is HomeLoadedState) {
                return ListView.builder(
                  itemCount: state.ListPhotos.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    var eachPhoto = state.ListPhotos[index];
                    return Padding(
                      padding: EdgeInsets.only(
                        left: 11.0,
                        right: index == state.ListPhotos.length - 1 ? 11 : 0,
                      ),
                      child: WallpaperBgWidgets(
                        imgUrls: eachPhoto.src!.portrait.toString(),
                      ),
                    );
                  },
                );
              }
              return const Center(child: Text("Unexpected state"));
            },
          ),
        ),


        const SizedBox(
          height: 10,
        ),

        /// ------------------------- COLOR TONE -----------------------
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Text("Color Tone", style: mTextStyle16()),
        ),
        const SizedBox(
          height: 11,
        ),

        /// -------------------------color box----------------------///
        SizedBox(
          height: 50,
          child: ListView.builder(
            itemCount: AppColors.mColors.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return Padding(
                padding: EdgeInsets.only(
                    left: 11.0,
                    right: index == AppColors.mColors.length - 1 ? 11 : 0),
                child: getColorToneWidget(AppColors.mColors[index]),
              );
            },
          ),
        ),

        const SizedBox(
          height: 10,
        ),

        /// ------------------------- COLOR TONE -----------------------
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Text("Category", style: mTextStyle16()),
        ),
        const SizedBox(
          height: 11,
        ),

        /// -------------------------color box----------------------///
        Container(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 9 / 5,
                crossAxisSpacing: 11,
                mainAxisSpacing: 11),
            itemCount: AppConstant.mCategory.length,
            itemBuilder: (context, index) {
              return getCategoryWidgets(AppConstant.mCategory[index]['image'],
                  AppConstant.mCategory[index]['title']);
            },
          ),
        ),
      ],
    ));
  }

  /// ----------------------- FUNCTION ----------------------------///
  /// function -> widgets color box
  Widget getColorToneWidget(Color mColor) {
    return Container(
      height: 50,
      width: 50,
      decoration:
          BoxDecoration(color: mColor, borderRadius: BorderRadius.circular(11)),
    );
  }

  ///  category
  Widget getCategoryWidgets(String imgUrl, String title) {
    return Container(
      width: 200,
      height: 100,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(21),
        image: DecorationImage(image: AssetImage(imgUrl), fit: BoxFit.fill),
      ),
      child: Center(
          child: Text(
        title,
        style: mTextStyle14(mColor: Colors.white),
      )),
    );
  }
}
