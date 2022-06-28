// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

import 'package:auto_route/auto_route.dart' as _i9;
import 'package:flutter/material.dart' as _i10;

import '../ui/views/adult/adult_view.dart' as _i4;
import '../ui/views/breathe/breathe_view.dart' as _i7;
import '../ui/views/emotion/emotion_view.dart' as _i5;
import '../ui/views/ending/ending_view.dart' as _i8;
import '../ui/views/home/home_view.dart' as _i3;
import '../ui/views/onboarding/onboarding_view.dart' as _i2;
import '../ui/views/startup/startup_view.dart' as _i1;
import '../ui/views/tapping/tapping_view.dart' as _i6;

class MucyRouter extends _i9.RootStackRouter {
  MucyRouter([_i10.GlobalKey<_i10.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i9.PageFactory> pagesMap = {
    StartupViewRoute.name: (routeData) {
      return _i9.CustomPage<dynamic>(
          routeData: routeData,
          child: _i1.StartupView(),
          transitionsBuilder: _i9.TransitionsBuilders.fadeIn,
          opaque: true,
          barrierDismissible: false);
    },
    OnboardingViewRoute.name: (routeData) {
      return _i9.CustomPage<dynamic>(
          routeData: routeData,
          child: _i2.OnboardingView(),
          transitionsBuilder: _i9.TransitionsBuilders.fadeIn,
          opaque: true,
          barrierDismissible: false);
    },
    HomeViewRoute.name: (routeData) {
      return _i9.CustomPage<dynamic>(
          routeData: routeData,
          child: _i3.HomeView(),
          transitionsBuilder: _i9.TransitionsBuilders.fadeIn,
          opaque: true,
          barrierDismissible: false);
    },
    AdultViewRoute.name: (routeData) {
      return _i9.CustomPage<dynamic>(
          routeData: routeData,
          child: _i4.AdultView(),
          transitionsBuilder: _i9.TransitionsBuilders.fadeIn,
          opaque: true,
          barrierDismissible: false);
    },
    EmotionViewRoute.name: (routeData) {
      return _i9.CustomPage<dynamic>(
          routeData: routeData,
          child: _i5.EmotionView(),
          transitionsBuilder: _i9.TransitionsBuilders.fadeIn,
          opaque: true,
          barrierDismissible: false);
    },
    TappingViewRoute.name: (routeData) {
      return _i9.CustomPage<dynamic>(
          routeData: routeData,
          child: _i6.TappingView(),
          transitionsBuilder: _i9.TransitionsBuilders.slideLeft,
          opaque: true,
          barrierDismissible: false);
    },
    BreatheViewRoute.name: (routeData) {
      return _i9.CustomPage<dynamic>(
          routeData: routeData,
          child: _i7.BreatheView(),
          transitionsBuilder: _i9.TransitionsBuilders.fadeIn,
          opaque: true,
          barrierDismissible: false);
    },
    EndingViewRoute.name: (routeData) {
      return _i9.CustomPage<dynamic>(
          routeData: routeData,
          child: _i8.EndingView(),
          transitionsBuilder: _i9.TransitionsBuilders.slideLeftWithFade,
          opaque: true,
          barrierDismissible: false);
    }
  };

  @override
  List<_i9.RouteConfig> get routes => [
        _i9.RouteConfig(StartupViewRoute.name, path: '/'),
        _i9.RouteConfig(OnboardingViewRoute.name, path: '/onboarding-view'),
        _i9.RouteConfig(HomeViewRoute.name, path: '/home-view'),
        _i9.RouteConfig(AdultViewRoute.name, path: '/adult-view'),
        _i9.RouteConfig(EmotionViewRoute.name, path: '/emotion-view'),
        _i9.RouteConfig(TappingViewRoute.name, path: '/tapping-view'),
        _i9.RouteConfig(BreatheViewRoute.name, path: '/breathe-view'),
        _i9.RouteConfig(EndingViewRoute.name, path: '/ending-view')
      ];
}

/// generated route for
/// [_i1.StartupView]
class StartupViewRoute extends _i9.PageRouteInfo<void> {
  const StartupViewRoute() : super(StartupViewRoute.name, path: '/');

  static const String name = 'StartupViewRoute';
}

/// generated route for
/// [_i2.OnboardingView]
class OnboardingViewRoute extends _i9.PageRouteInfo<void> {
  const OnboardingViewRoute()
      : super(OnboardingViewRoute.name, path: '/onboarding-view');

  static const String name = 'OnboardingViewRoute';
}

/// generated route for
/// [_i3.HomeView]
class HomeViewRoute extends _i9.PageRouteInfo<void> {
  const HomeViewRoute() : super(HomeViewRoute.name, path: '/home-view');

  static const String name = 'HomeViewRoute';
}

/// generated route for
/// [_i4.AdultView]
class AdultViewRoute extends _i9.PageRouteInfo<void> {
  const AdultViewRoute() : super(AdultViewRoute.name, path: '/adult-view');

  static const String name = 'AdultViewRoute';
}

/// generated route for
/// [_i5.EmotionView]
class EmotionViewRoute extends _i9.PageRouteInfo<void> {
  const EmotionViewRoute()
      : super(EmotionViewRoute.name, path: '/emotion-view');

  static const String name = 'EmotionViewRoute';
}

/// generated route for
/// [_i6.TappingView]
class TappingViewRoute extends _i9.PageRouteInfo<void> {
  const TappingViewRoute()
      : super(TappingViewRoute.name, path: '/tapping-view');

  static const String name = 'TappingViewRoute';
}

/// generated route for
/// [_i7.BreatheView]
class BreatheViewRoute extends _i9.PageRouteInfo<void> {
  const BreatheViewRoute()
      : super(BreatheViewRoute.name, path: '/breathe-view');

  static const String name = 'BreatheViewRoute';
}

/// generated route for
/// [_i8.EndingView]
class EndingViewRoute extends _i9.PageRouteInfo<void> {
  const EndingViewRoute() : super(EndingViewRoute.name, path: '/ending-view');

  static const String name = 'EndingViewRoute';
}
