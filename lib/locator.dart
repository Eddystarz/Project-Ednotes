import 'package:edtech/core/graphql.dart';
import 'package:edtech/core/services/auth_service.dart';
import 'package:edtech/core/services/user_service.dart';
import 'package:get_it/get_it.dart';

GetIt locator = GetIt.instance;

Future<void> setUp() async {
  locator.registerLazySingleton(() => AuthService());
  locator.registerLazySingleton(() => UserService());
  locator.registerLazySingleton(() => GraphQLConfiguration());
}
