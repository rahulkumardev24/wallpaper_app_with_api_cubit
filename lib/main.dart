import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wallpaper_app_api/data/remote/api_helper.dart';
import 'package:wallpaper_app_api/data/repository/wallpaper_repository.dart';
import 'package:wallpaper_app_api/screen/home/cubit/home_cubit.dart';
import 'package:wallpaper_app_api/screen/home/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: BlocProvider(
            create: (context) => HomeCubit(
                wallpaperRepository:
                    WallpaperRepository(apiHelper: ApiHelper())) , child: HomeScreen(),));
  }
}
