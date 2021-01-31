import 'package:flutter/material.dart';
import 'package:hello_word_android_studio/navigation/route_path.dart';
import 'package:hello_word_android_studio/screens/home_screen.dart';
import 'package:hello_word_android_studio/screens/profile/PROFILE_screen.dart';
import 'package:hello_word_android_studio/screens/unknown.dart';

class PathRouterDelegate extends RouterDelegate<ProfileRoutePath>
    with ChangeNotifier, PopNavigatorRouterDelegateMixin<ProfileRoutePath> {
  final GlobalKey<NavigatorState> _navigatorKey;

  bool show404 = false;
  bool showProfile = false;
  bool showCart = false;

  PathRouterDelegate() : _navigatorKey = GlobalKey<NavigatorState>();

  ProfileRoutePath get currentConfiguration {
    if (show404) {
      return ProfileRoutePath.unknown();
    }
    if (showProfile) {
      return ProfileRoutePath.profile();
    }
  }
  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: navigatorKey,
      pages: [
        MaterialPage(
          key: ValueKey('HomeScreen'),

          child: HomeScreen(
            onShowProfile: _handleShowProfile,
          ),
        ),
        if (show404)
          MaterialPage(
            key: ValueKey('UnknownPage'),
            child: Unknown(),
          )
        else if (showProfile)
          MaterialPage(
            key: ValueKey('ProfilePage'),
            child: Page2(),
          )
      ],
      onPopPage: (route, result) {
        if (!route.didPop(result)) {
          return false;
        }

        show404 = false;
        showProfile = false;

        notifyListeners();

        return true;
      },
    );
  }

  @override
  GlobalKey<NavigatorState> get navigatorKey => _navigatorKey;

  @override
  Future<void> setNewRoutePath(ProfileRoutePath path) async {
    if (path.isUnknown) {
      show404 = true;
      return;
    }

    if (path.isProfile) {
      showProfile = true;
    }

    show404 = false;
  }

  void _handleShowProfile() {
    showProfile = true;
    notifyListeners();
  }
}
