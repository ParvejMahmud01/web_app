import 'package:web_app/core/const/app_export.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    AppSizes().init(context);
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Dashboard',
      theme: ThemeData(scaffoldBackgroundColor: AppColors.scaffoldBgColor),
      // home: HomePage(),
      initialRoute: AppRoutes.login,
      getPages: AppRoutes.routes,
      builder: EasyLoading.init(),
    );
  }
}
