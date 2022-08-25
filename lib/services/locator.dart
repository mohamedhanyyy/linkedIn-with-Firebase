import 'package:get_it/get_it.dart';
import 'package:linkedin/presentation/widgets/dialogues.dart';

final GetIt locator = GetIt.instance;

void setUpLocator() {
  locator.registerLazySingleton(() => Dialogues());
}
