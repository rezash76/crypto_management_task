// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:crypto_management_task/application/transactions/check_user_is_login_transaction.dart'
    as _i247;
import 'package:crypto_management_task/application/transactions/get_all_coins_transaction.dart'
    as _i403;
import 'package:crypto_management_task/application/transactions/get_favorite_coins_transaction.dart'
    as _i593;
import 'package:crypto_management_task/application/transactions/get_user_profile_transaction.dart'
    as _i91;
import 'package:crypto_management_task/application/transactions/login_transaction.dart'
    as _i661;
import 'package:crypto_management_task/application/transactions/toggle_favorite_coin_transaction.dart'
    as _i968;
import 'package:crypto_management_task/application/transactions/update_user_phone_number_transaction.dart'
    as _i355;
import 'package:crypto_management_task/core/di/di_module.dart' as _i980;
import 'package:crypto_management_task/core/network/api_service.dart' as _i814;
import 'package:crypto_management_task/core/network/dio/dio_client.dart'
    as _i540;
import 'package:crypto_management_task/core/network/dio/interceptors/auth_interceptor.dart'
    as _i457;
import 'package:crypto_management_task/core/storage/secure_storage/secure_storage_client.dart'
    as _i32;
import 'package:crypto_management_task/core/storage/storage_service.dart'
    as _i47;
import 'package:crypto_management_task/domain/repositories/auth_repository.dart'
    as _i235;
import 'package:crypto_management_task/domain/repositories/coin_ropository.dart'
    as _i982;
import 'package:crypto_management_task/domain/repositories/user_repository.dart'
    as _i66;
import 'package:crypto_management_task/infrastructure/datasources/local/auth_storage.dart'
    as _i907;
import 'package:crypto_management_task/infrastructure/datasources/remote/auth_api.dart'
    as _i699;
import 'package:crypto_management_task/infrastructure/datasources/remote/coin_api.dart'
    as _i257;
import 'package:crypto_management_task/infrastructure/datasources/remote/user_api.dart'
    as _i185;
import 'package:crypto_management_task/infrastructure/repositories/auth_repository_impl.dart'
    as _i906;
import 'package:crypto_management_task/infrastructure/repositories/coin_repository_impl.dart'
    as _i461;
import 'package:crypto_management_task/infrastructure/repositories/user_repository_impl.dart'
    as _i221;
import 'package:crypto_management_task/presentation/blocs/app_them/app_theme_cubit.dart'
    as _i606;
import 'package:crypto_management_task/presentation/blocs/auth/auth_bloc.dart'
    as _i482;
import 'package:crypto_management_task/presentation/blocs/coin/coin_cubit.dart'
    as _i708;
import 'package:crypto_management_task/presentation/blocs/profile/profile_cubit.dart'
    as _i418;
import 'package:dio/dio.dart' as _i361;
import 'package:flutter_secure_storage/flutter_secure_storage.dart' as _i558;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final registerModule = _$RegisterModule();
    gh.factory<_i606.AppThemeCubit>(() => _i606.AppThemeCubit());
    gh.lazySingleton<_i558.FlutterSecureStorage>(
      () => registerModule.secureStorage(),
    );
    gh.factory<_i814.ApiService<dynamic>>(
      () => _i540.DioClient(
        baseUrl: gh<String>(),
        intercepros: gh<List<_i361.Interceptor>>(),
      ),
    );
    gh.lazySingleton<_i47.StorageService<String>>(
      () => _i32.SecureStorageClient(),
    );
    gh.lazySingleton<_i457.AuthInterceptor>(
      () => _i457.AuthInterceptor(gh<_i47.StorageService<String>>()),
    );
    gh.lazySingleton<_i907.AuthStorage>(
      () => _i907.AuthStorage(gh<_i47.StorageService<String>>()),
    );
    gh.lazySingleton<_i814.ApiService<dynamic>>(
      () => registerModule.dioAuth(gh<_i457.AuthInterceptor>()),
      instanceName: 'auth',
    );
    gh.lazySingleton<_i814.ApiService<dynamic>>(
      () => registerModule.dioCoin(gh<_i457.AuthInterceptor>()),
      instanceName: 'coin',
    );
    gh.factory<_i699.AuthApi>(
      () => _i699.AuthApi(gh<_i814.ApiService<dynamic>>(instanceName: 'auth')),
    );
    gh.factory<_i185.UserApi>(
      () => _i185.UserApi(gh<_i814.ApiService<dynamic>>(instanceName: 'auth')),
    );
    gh.factory<_i257.CoinApi>(
      () => _i257.CoinApi(gh<_i814.ApiService<dynamic>>(instanceName: 'coin')),
    );
    gh.lazySingleton<_i66.UserRepository>(
      () => _i221.UserRepositoryImpl(gh<_i185.UserApi>()),
    );
    gh.lazySingleton<_i235.AuthRepository>(
      () => _i906.AuthRepositoryImpl(
        gh<_i699.AuthApi>(),
        gh<_i907.AuthStorage>(),
      ),
    );
    gh.lazySingleton<_i982.CoinRepository>(
      () => _i461.CoinRepositoryImpl(gh<_i257.CoinApi>()),
    );
    gh.lazySingleton<_i355.UpdateUserPhoneNumberTransaction>(
      () => _i355.UpdateUserPhoneNumberTransaction(
        userRepository: gh<_i66.UserRepository>(),
      ),
    );
    gh.lazySingleton<_i403.GetAllCoinsTransaction>(
      () => _i403.GetAllCoinsTransaction(
        coinRepository: gh<_i982.CoinRepository>(),
      ),
    );
    gh.lazySingleton<_i968.ToggleFavoriteCoinTransaction>(
      () => _i968.ToggleFavoriteCoinTransaction(
        coinRepository: gh<_i982.CoinRepository>(),
      ),
    );
    gh.lazySingleton<_i593.GetFavoriteCoinsTransaction>(
      () => _i593.GetFavoriteCoinsTransaction(
        coinRepository: gh<_i982.CoinRepository>(),
      ),
    );
    gh.lazySingleton<_i91.GetUserProfileTransaction>(
      () => _i91.GetUserProfileTransaction(
        authRepository: gh<_i235.AuthRepository>(),
      ),
    );
    gh.lazySingleton<_i661.LoginTransaction>(
      () => _i661.LoginTransaction(authRepository: gh<_i235.AuthRepository>()),
    );
    gh.lazySingleton<_i247.CheckUserIsLoginTransaction>(
      () => _i247.CheckUserIsLoginTransaction(
        authRepository: gh<_i235.AuthRepository>(),
      ),
    );
    gh.factory<_i482.AuthBloc>(
      () => _i482.AuthBloc(
        gh<_i661.LoginTransaction>(),
        gh<_i247.CheckUserIsLoginTransaction>(),
      ),
    );
    gh.factory<_i708.CoinCubit>(
      () => _i708.CoinCubit(
        gh<_i403.GetAllCoinsTransaction>(),
        gh<_i968.ToggleFavoriteCoinTransaction>(),
      ),
    );
    gh.factory<_i418.ProfileCubit>(
      () => _i418.ProfileCubit(
        gh<_i91.GetUserProfileTransaction>(),
        gh<_i355.UpdateUserPhoneNumberTransaction>(),
      ),
    );
    return this;
  }
}

class _$RegisterModule extends _i980.RegisterModule {}
