import 'package:auto_route/auto_route_annotations.dart';
import 'package:mucy/ui/views/adult/adult_view.dart';
import 'package:mucy/ui/views/breathe/breathe_view.dart';
import 'package:mucy/ui/views/emotion/emotion_view.dart';
import 'package:mucy/ui/views/ending/ending_view.dart';
import 'package:mucy/ui/views/home/home_view.dart';
import 'package:mucy/ui/views/onboarding/onboarding_view.dart';
import 'package:mucy/ui/views/startup/startup_view.dart';
import 'package:mucy/ui/views/tapping/tapping_view.dart';

@AdaptiveAutoRouter(
  routes: <AutoRoute>[
    AdaptiveRoute(page: StartupView, initial: true),
    AdaptiveRoute(page: OnboardingView),
    AdaptiveRoute(page: HomeView),
    AdaptiveRoute(page: AdultView),
    AdaptiveRoute(page: EmotionView),
    AdaptiveRoute(page: TappingView),
    AdaptiveRoute(page: BreatheView),
    AdaptiveRoute(page: EndingView)
  ]
)
class $MucyRouter{}