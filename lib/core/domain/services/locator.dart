import 'package:get_it/get_it.dart';import '../../constants/app_constants.dart';
import '../../cubits/app_cubit.dart';
import '../../helpers/dio_helper.dart';
import '../../interceptors/token_interceptor.dart';
import 'api_service.dart';
import 'api_services_impl.dart';

final getIt = GetIt.I;

Future locatorSetUp() async {

  if (getIt.isRegistered<AppCubit>()) {
    return;
  }


  getIt.registerLazySingleton<AppCubit>(() => AppCubit());

  getIt.registerLazySingleton<ApiServices>(
        () => ApiServicesImp(
      DioProvider.provide(
        baseUrl: AppConstants.baseUrl,
        interceptor: TokenInterceptor(),
      ),
    ),
  );

}


