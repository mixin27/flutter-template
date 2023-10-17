import 'package:auto_route/auto_route.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'app_router.gr.dart';

part 'app_router.g.dart';

@AutoRouterConfig()
class AppRouter extends $AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: SplashRoute.page, path: '/'),
        AutoRoute(page: SkeletonRoute.page, path: '/start'),

        AutoRoute(page: HomeRoute.page, path: '/home'),

        // Authentication
        AutoRoute(page: LoginRoute.page, path: '/auth/login'),
        AutoRoute(page: RegisterRoute.page, path: '/auth/register'),
        AutoRoute(page: OtpVerifyRoute.page, path: '/auth/otp-verify'),
        AutoRoute(
          page: ForgotPasswordRoute.page,
          path: '/auth/forgot-password',
        ),
        AutoRoute(page: ResetPasswordRoute.page, path: '/auth/reset-password'),

        // Settings
        AutoRoute(page: SettingsRoute.page, path: '/settings'),

        // SystemLogs
        AutoRoute(page: SystemLogsRoute.page, path: '/system/logs'),
        AutoRoute(page: SysLogsDetailRoute.page, path: '/system/logs/details'),
      ];
}

@riverpod
// ignore: unsupported_provider_value
AppRouter appRouter(AppRouterRef ref) {
  return AppRouter();
}
