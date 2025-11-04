import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_it/get_it.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

import '../network/dio_client.dart';
import '../network/network_info.dart';
import '../../features/product/data/repositories/product_repository_impl.dart';
import '../../features/product/domain/repositories/product_repository.dart';
import '../../features/product/domain/usecases/get_products.dart';
import '../../features/product/presentation/bloc/product_bloc.dart';
import '../../features/product/data/datasources/product_remote_data_source.dart';
import '../../features/vehicle/data/datasources/vehicle_remote_data_source.dart';
import '../../features/vehicle/data/repositories/vehicle_repository_impl.dart';
import '../../features/vehicle/domain/repositories/vehicle_repository.dart';
import '../../features/vehicle/domain/usecases/get_vehicle_categories.dart';
import '../../features/vehicle/domain/usecases/get_vehicle_brands.dart';
import '../../features/vehicle/domain/usecases/get_vehicle_models.dart';
import '../../features/vehicle/domain/usecases/get_vehicle_submodels.dart';
import '../../features/vehicle/domain/usecases/get_vehicle_conditions.dart';
import '../../features/vehicle/domain/usecases/get_vehicle_colors.dart';
import '../../features/vehicle/presentation/bloc/vehicle_bloc.dart';
import '../../features/location/data/datasources/location_remote_data_source.dart';
import '../../features/location/data/repositories/location_repository_impl.dart';
import '../../features/location/domain/repositories/location_repository.dart';
import '../../features/location/domain/usecases/get_countries.dart';
import '../../features/location/domain/usecases/get_cities.dart';
import '../../features/location/presentation/bloc/location_bloc.dart';
import '../../features/todo/data/datasources/todo_local_data_source.dart';
import '../../features/todo/data/datasources/todo_remote_data_source.dart';
import '../../features/todo/data/repositories/todo_repository_impl.dart';
import '../../features/todo/domain/repositories/todo_repository.dart';
import '../../features/todo/presentation/bloc/todo/todo_bloc.dart';
import '../../features/auth/data/datasources/auth_local_data_source.dart';
import '../../features/auth/data/datasources/auth_remote_data_source.dart';
import '../../features/auth/data/repositories/auth_repository_impl.dart';
import '../../features/auth/domain/repositories/auth_repository.dart';
import '../../features/auth/domain/usecases/login.dart';
import '../../features/auth/domain/usecases/signup.dart';
import '../../features/auth/domain/usecases/logout.dart';
import '../../features/auth/domain/usecases/get_current_user.dart';
import '../../features/auth/presentation/bloc/auth/auth_bloc.dart';

/// GetIt service locator instance
final getIt = GetIt.instance;

/// Riverpod provider for TodoBloc
final todoBlocProvider = Provider<TodoBloc>((ref) {
  return TodoBloc(ref.watch(todoRepositoryProvider));
});

/// Riverpod provider for TodoRepository
final todoRepositoryProvider = Provider<TodoRepository>((ref) {
  return getIt<TodoRepository>();
});

/// Riverpod provider for AuthBloc
final authBlocProvider = Provider<AuthBloc>((ref) {
  return getIt<AuthBloc>();
});

/// Riverpod provider for AuthRepository
final authRepositoryProvider = Provider<AuthRepository>((ref) {
  return getIt<AuthRepository>();
});

/// Initialize the dependency injection container
Future<void> initDependencies() async {
  // Core - Network
  getIt.registerLazySingleton<Connectivity>(() => Connectivity());
  getIt.registerLazySingleton<NetworkInfo>(
    () => NetworkInfoImpl(getIt<Connectivity>()),
  );

  // Core - HTTP Client
  getIt.registerLazySingleton<DioClient>(
    () => DioClient(baseUrl: 'https://www.automoto54.com/api'),
  );

  // Todo Feature - Data Sources
  getIt.registerLazySingleton<TodoDatabase>(() => TodoDatabase());
  getIt.registerLazySingleton<TodoRemoteDataSource>(
    () => TodoRemoteDataSourceImpl(getIt<DioClient>()),
  );

  // Todo Feature - Repository
  getIt.registerLazySingleton<TodoRepository>(
    () => TodoRepositoryImpl(
      localDataSource: getIt<TodoDatabase>(),
      remoteDataSource: getIt<TodoRemoteDataSource>(),
      networkInfo: getIt<NetworkInfo>(),
    ),
  );

  // Auth Feature - Data Sources
  getIt.registerLazySingleton<AuthDatabase>(() => AuthDatabase());
  getIt.registerLazySingleton<AuthRemoteDataSource>(
    () => AuthRemoteDataSourceImpl(getIt<DioClient>()),
  );

  // Auth Feature - Repository
  getIt.registerLazySingleton<AuthRepository>(
    () => AuthRepositoryImpl(
      remoteDataSource: getIt<AuthRemoteDataSource>(),
      localDataSource: getIt<AuthDatabase>(),
      networkInfo: getIt<NetworkInfo>(),
    ),
  );

  // Product Feature - Data Source
  getIt.registerLazySingleton<ProductRemoteDataSource>(
    () => ProductRemoteDataSource(getIt<DioClient>().dio),
  );

  // Product Feature - Repository
  getIt.registerLazySingleton<ProductRepository>(
    () => ProductRepositoryImpl(getIt<ProductRemoteDataSource>()),
  );

  // Product Feature - Use Case
  getIt.registerLazySingleton<GetProducts>(
    () => GetProducts(getIt<ProductRepository>()),
  );

  // Product Feature - BLoC
  getIt.registerFactory<ProductBloc>(() => ProductBloc(getIt<GetProducts>()));

  // Vehicle Feature - Data Source
  getIt.registerLazySingleton<VehicleRemoteDataSource>(
    () => VehicleRemoteDataSource(getIt<DioClient>().dio),
  );

  // Vehicle Feature - Repository
  getIt.registerLazySingleton<VehicleRepository>(
    () => VehicleRepositoryImpl(getIt<VehicleRemoteDataSource>()),
  );

  // Vehicle Feature - Use Cases
  getIt.registerLazySingleton<GetVehicleCategories>(
    () => GetVehicleCategories(getIt<VehicleRepository>()),
  );
  getIt.registerLazySingleton<GetVehicleBrands>(
    () => GetVehicleBrands(getIt<VehicleRepository>()),
  );
  getIt.registerLazySingleton<GetVehicleModels>(
    () => GetVehicleModels(getIt<VehicleRepository>()),
  );
  getIt.registerLazySingleton<GetVehicleSubModels>(
    () => GetVehicleSubModels(getIt<VehicleRepository>()),
  );
  getIt.registerLazySingleton<GetVehicleConditions>(
    () => GetVehicleConditions(getIt<VehicleRepository>()),
  );
  getIt.registerLazySingleton<GetVehicleColors>(
    () => GetVehicleColors(getIt<VehicleRepository>()),
  );

  // Vehicle Feature - BLoC
  getIt.registerFactory<VehicleBloc>(
    () => VehicleBloc(
      getCategories: getIt<GetVehicleCategories>(),
      getBrands: getIt<GetVehicleBrands>(),
      getModels: getIt<GetVehicleModels>(),
      getSubModels: getIt<GetVehicleSubModels>(),
      getConditions: getIt<GetVehicleConditions>(),
      getColors: getIt<GetVehicleColors>(),
    ),
  );

  // Location Feature - Data Source
  getIt.registerLazySingleton<LocationRemoteDataSource>(
    () => LocationRemoteDataSource(getIt<DioClient>().dio),
  );

  // Location Feature - Repository
  getIt.registerLazySingleton<LocationRepository>(
    () => LocationRepositoryImpl(getIt<LocationRemoteDataSource>()),
  );

  // Location Feature - Use Cases
  getIt.registerLazySingleton<GetCountries>(
    () => GetCountries(getIt<LocationRepository>()),
  );
  getIt.registerLazySingleton<GetCities>(
    () => GetCities(getIt<LocationRepository>()),
  );

  // Location Feature - BLoC
  getIt.registerFactory<LocationBloc>(
    () => LocationBloc(
      getCountries: getIt<GetCountries>(),
      getCities: getIt<GetCities>(),
    ),
  );

  // Auth Feature - Use Cases
  getIt.registerLazySingleton<Login>(() => Login(getIt<AuthRepository>()));
  getIt.registerLazySingleton<SignUp>(() => SignUp(getIt<AuthRepository>()));
  getIt.registerLazySingleton<Logout>(() => Logout(getIt<AuthRepository>()));
  getIt.registerLazySingleton<GetCurrentUser>(
    () => GetCurrentUser(getIt<AuthRepository>()),
  );

  // Auth Feature - BLoC
  getIt.registerFactory<AuthBloc>(
    () => AuthBloc(
      loginUseCase: getIt<Login>(),
      signUpUseCase: getIt<SignUp>(),
      logoutUseCase: getIt<Logout>(),
      getCurrentUserUseCase: getIt<GetCurrentUser>(),
    ),
  );
}
