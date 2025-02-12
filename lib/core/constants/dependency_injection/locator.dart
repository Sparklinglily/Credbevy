import 'package:credbevy/api/api_services.dart';
import 'package:credbevy/core/constants/services/navigation_service.dart';
import 'package:get_it/get_it.dart';

final locator = GetIt.instance;

Future<void> setupLocator() async {
  //Service
  locator.registerLazySingleton(() => NavigationService());
  locator.registerLazySingleton(() => ApiServices());
}

//SERVICES
NavigationService navigationService = locator.get<NavigationService>();
ApiServices apiServices = locator.get<ApiServices>();
