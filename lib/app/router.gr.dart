// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../ui/views/adult/adult_view.dart';
import '../ui/views/breathe/breathe_view.dart';
import '../ui/views/emotion/emotion_view.dart';
import '../ui/views/ending/ending_view.dart';
import '../ui/views/home/home_view.dart';
import '../ui/views/onboarding/onboarding_view.dart';
import '../ui/views/startup/startup_view.dart';
import '../ui/views/tapping/tapping_view.dart';

class Routes {
  static const String startupView = '/';
  static const String onboardingView = '/onboarding-view';
  static const String homeView = '/home-view';
  static const String adultView = '/adult-view';
  static const String emotionView = '/emotion-view';
  static const String tappingView = '/tapping-view';
  static const String breatheView = '/breathe-view';
  static const String endingView = '/ending-view';
  static const all = <String>{
    startupView,
    onboardingView,
    homeView,
    adultView,
    emotionView,
    tappingView,
    breatheView,
    endingView,
  };
}

class MucyRouter extends RouterBase {
  @override
  List<RouteDef> get routes => _routes;
  final _routes = <RouteDef>[
    RouteDef(Routes.startupView, page: StartupView),
    RouteDef(Routes.onboardingView, page: OnboardingView),
    RouteDef(Routes.homeView, page: HomeView),
    RouteDef(Routes.adultView, page: AdultView),
    RouteDef(Routes.emotionView, page: EmotionView),
    RouteDef(Routes.tappingView, page: TappingView),
    RouteDef(Routes.breatheView, page: BreatheView),
    RouteDef(Routes.endingView, page: EndingView),
  ];
  @override
  Map<Type, AutoRouteFactory> get pagesMap => _pagesMap;
  final _pagesMap = <Type, AutoRouteFactory>{
    StartupView: (data) {
      return PageRouteBuilder<dynamic>(
        pageBuilder: (context, animation, secondaryAnimation) => StartupView(),
        settings: data,
        transitionsBuilder: TransitionsBuilders.fadeIn,
      );
    },
    OnboardingView: (data) {
      return PageRouteBuilder<dynamic>(
        pageBuilder: (context, animation, secondaryAnimation) =>
            OnboardingView(),
        settings: data,
        transitionsBuilder: TransitionsBuilders.fadeIn,
      );
    },
    HomeView: (data) {
      return PageRouteBuilder<dynamic>(
        pageBuilder: (context, animation, secondaryAnimation) => HomeView(),
        settings: data,
        transitionsBuilder: TransitionsBuilders.fadeIn,
      );
    },
    AdultView: (data) {
      return PageRouteBuilder<dynamic>(
        pageBuilder: (context, animation, secondaryAnimation) => AdultView(),
        settings: data,
        transitionsBuilder: TransitionsBuilders.fadeIn,
      );
    },
    EmotionView: (data) {
      return PageRouteBuilder<dynamic>(
        pageBuilder: (context, animation, secondaryAnimation) => EmotionView(),
        settings: data,
        transitionsBuilder: TransitionsBuilders.fadeIn,
      );
    },
    TappingView: (data) {
      return PageRouteBuilder<dynamic>(
        pageBuilder: (context, animation, secondaryAnimation) => TappingView(),
        settings: data,
        transitionsBuilder: TransitionsBuilders.slideLeft,
      );
    },
    BreatheView: (data) {
      return PageRouteBuilder<dynamic>(
        pageBuilder: (context, animation, secondaryAnimation) => BreatheView(),
        settings: data,
        transitionsBuilder: TransitionsBuilders.fadeIn,
      );
    },
    EndingView: (data) {
      return PageRouteBuilder<dynamic>(
        pageBuilder: (context, animation, secondaryAnimation) => EndingView(),
        settings: data,
        transitionsBuilder: TransitionsBuilders.slideLeftWithFade,
      );
    },
  };
}
