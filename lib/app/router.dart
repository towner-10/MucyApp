import 'package:auto_route/auto_route.dart';
import 'package:auto_route/auto_route_annotations.dart';
import 'package:mucy/ui/views/adult/adult_view.dart';
import 'package:mucy/ui/views/breathe/breathe_view.dart';
import 'package:mucy/ui/views/emotion/emotion_view.dart';
import 'package:mucy/ui/views/ending/ending_view.dart';
import 'package:mucy/ui/views/home/home_view.dart';
import 'package:mucy/ui/views/onboarding/onboarding_view.dart';
import 'package:mucy/ui/views/startup/startup_view.dart';
import 'package:mucy/ui/views/tapping/tapping_view.dart';

@CustomAutoRouter(
  routes: <AutoRoute>[
    CustomRoute(page: StartupView, initial: true, transitionsBuilder: TransitionsBuilders.fadeIn),
    CustomRoute(page: OnboardingView, transitionsBuilder: TransitionsBuilders.fadeIn),
    CustomRoute(page: HomeView, transitionsBuilder: TransitionsBuilders.fadeIn),
    CustomRoute(page: AdultView, transitionsBuilder: TransitionsBuilders.fadeIn),
    CustomRoute(page: EmotionView, transitionsBuilder: TransitionsBuilders.fadeIn),
    CustomRoute(page: TappingView, transitionsBuilder: TransitionsBuilders.slideLeft),
    CustomRoute(page: BreatheView, transitionsBuilder: TransitionsBuilders.fadeIn),
    CustomRoute(page: EndingView, transitionsBuilder: TransitionsBuilders.slideLeftWithFade)
  ]
)
class $MucyRouter{}