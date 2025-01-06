import 'package:blog_app/core/theme/theme.dart';
import 'package:blog_app/features/auth/presentation/pages/signin_page.dart';
import 'package:blog_app/features/auth/presentation/pages/signup_page.dart';
import 'package:blog_app/features/auth/presentation/pages/splash_page.dart';
import 'package:blog_app/features/blog/presentation/pages/home_page.dart';
import 'package:flutter/material.dart';

class BlogApp extends StatelessWidget {
  const BlogApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Blog App',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.darkThemeMode,
      initialRoute: SplashPage.name,
      onGenerateRoute: (settings) {
        late Widget widget;
        if (settings.name == SplashPage.name) {
          widget = const SplashPage();
        } else if (settings.name == SigninPage.name) {
          widget = const SigninPage();
        } else if (settings.name == SignupPage.name) {
          widget = const SignupPage();
        } else if (settings.name == HomePage.name) {
          widget = const HomePage();
        }
        return MaterialPageRoute(builder: (ctx) {
          return widget;
        });
      },
    );
  }
}
