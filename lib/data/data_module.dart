import 'package:driver_app/data/source/local/app_database.dart';
import 'package:injectable/injectable.dart';

@module
abstract class DataModule {
  @preResolve
  Future<AppDatabase> get database => $FloorAppDatabase
      .databaseBuilder("driver.db")
      .addCallback(dbCallback)
      .build();
}
