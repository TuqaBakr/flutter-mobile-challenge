import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'core/cubits/app_cubit.dart';
import 'core/cubits/app_state.dart';
import 'core/data/data_sources/local.dart';
import 'core/domain/services/locator.dart';
import 'core/logger/bloc_logger.dart';
import 'core/routing/app_router.dart';

void main() async {
  await initApp();
  await locatorSetUp();
  await LocalStorage.init();


  //todo:
  // final token = LocalStorage.getData(key: 'token');
  // AuthState.isLoggedIn.value = token != null && token.isNotEmpty;

  runApp(const MyApp());
}

initApp() async {
  await ScreenUtil.ensureScreenSize();
  Bloc.observer = blocLogger;
  await LocalStorage.init();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AppCubit>(
          create: (_) => AppCubit(),
        ),
      ],
      child: ScreenUtilInit(
        designSize: const Size(375, 812),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (buildContext, widget){
          return BlocBuilder<AppCubit, MyAppState>(
            builder: (context, state){
              final cubit = context.read<AppCubit>();
              final locale = cubit.currentLocal;
              return MaterialApp.router(
                locale: locale,
                debugShowCheckedModeBanner: false,
                routerConfig: appRouter,
              );
            },
          );
        },
      ),
    );
  }
}