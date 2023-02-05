import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:smartx/core/di/locator.dart';
import 'package:smartx/core/error/router_error.dart';
import 'package:smartx/core/router/routes.dart';
import 'package:smartx/features/devices/presentation/bloc/device_bloc.dart';
import 'package:smartx/features/devices/presentation/pages/devices_view.dart';
import 'package:smartx/features/splash/presentation/bloc/user_bloc.dart';
import 'package:smartx/features/splash/presentation/pages/splash_view.dart';

class AppRouter {
  GoRouter router = GoRouter(
    errorPageBuilder: (context, state) {
      return const MaterialPage(child: GoRouterErrorPage());
    },
    routes: [
      GoRoute(
        path: AppRoutersConstants.splashScreen,
        pageBuilder: (context, state) {
          return MaterialPage(
            child: BlocProvider(
              create: (_) => locator<UserBloc>(),
              child: const SplashView(),
            ),
          );
        },
      ),
      GoRoute(
        path: AppRoutersConstants.devicesPage,
        pageBuilder: (context, state) {
          return MaterialPage(
            child: BlocProvider(
              create: (_) => locator<DeviceBloc>(),
              child: const DevicesView(),
            ),
          );
        },
      ),
    ],
  );
}
