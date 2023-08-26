// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:driver_app/data/data_module.dart' as _i12;
import 'package:driver_app/data/datasource/message_local_data_source.dart'
    as _i5;
import 'package:driver_app/data/datasource/schedule_local_data_source.dart'
    as _i8;
import 'package:driver_app/data/repository/message_impl.dart' as _i7;
import 'package:driver_app/data/repository/schedule_impl.dart' as _i10;
import 'package:driver_app/data/source/local/app_database.dart' as _i3;
import 'package:driver_app/domain/repository/messages.dart' as _i6;
import 'package:driver_app/domain/repository/schedules.dart' as _i9;
import 'package:driver_app/features/home/controllers/home_controller.dart'
    as _i4;
import 'package:driver_app/features/home/controllers/schedule_controller.dart'
    as _i11;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  Future<_i1.GetIt> init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final dataModule = _$DataModule();
    await gh.factoryAsync<_i3.AppDatabase>(
      () => dataModule.database,
      preResolve: true,
    );
    gh.singleton<_i4.HomeController>(_i4.HomeController());
    gh.singleton<_i5.MessageLocalDataSource>(
        _i5.MessageLocalDataSource(gh<_i3.AppDatabase>()));
    gh.singleton<_i6.MessageRepository>(
        _i7.MessageRepositoryImpl(gh<_i5.MessageLocalDataSource>()));
    gh.singleton<_i8.ScheduleLocalDataSource>(
        _i8.ScheduleLocalDataSource(gh<_i3.AppDatabase>()));
    gh.singleton<_i9.ScheduleRepository>(
        _i10.ScheduleRepositoryImpl(gh<_i8.ScheduleLocalDataSource>()));
    gh.singleton<_i11.ScheduleController>(_i11.ScheduleController(
      gh<_i9.ScheduleRepository>(),
      gh<_i6.MessageRepository>(),
    ));
    return this;
  }
}

class _$DataModule extends _i12.DataModule {}
