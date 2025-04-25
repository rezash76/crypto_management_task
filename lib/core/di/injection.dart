import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'injection.config.dart';

/// The global [GetIt] service locator instance for dependency injection.
final sl = GetIt.instance;

/// Initializes all registered dependencies using injectable code generation.
///
/// Call this function at app startup to ensure all services, repositories,
/// blocs, and data sources are properly registered and ready for use.
@InjectableInit()
void configureDependencies() {
  sl.init();
}
