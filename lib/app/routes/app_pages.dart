import 'package:get/get.dart';

import 'package:tiktok/app/modules/home/bindings/home_binding.dart';
import 'package:tiktok/app/modules/home/views/home_view.dart';
import 'package:tiktok/app/modules/login/bindings/login_binding.dart';
import 'package:tiktok/app/modules/login/views/login_view.dart';

import 'package:tiktok/app/modules/signup/bindings/signup_binding.dart';
import 'package:tiktok/app/modules/signup/views/signup_view.dart';
import 'package:tiktok/app/modules/video/bindings/video_binding.dart';
import 'package:tiktok/app/modules/video/views/add_video_screen.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.SIGNUP,
      page: () => SignupView(),
      binding: SignupBinding(),
    ),
    GetPage(
      name: _Paths.VIDEO,
      page: () => AddVideoScreen(),
      binding: VideoBinding(),
    ),

  ];
}
