import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:smartx/features/devices/data/datasource/temp_data_source.dart';
import 'package:smartx/features/devices/data/repository_impl/repository_impl.dart';
import 'package:smartx/features/devices/domain/entity/device.dart';

import 'repository_impl_test.mocks.dart';

class TempDataSourceImplTest extends Mock implements TempDataSourceImpl {}

@GenerateMocks([TempDataSourceImplTest])
void main() {
  late DeviceRepositoryImpl repositoryImpl;
  late MockTempDataSourceImplTest mockUserLocalDataSource;

  setUp(() {
    mockUserLocalDataSource = MockTempDataSourceImplTest();
    repositoryImpl = DeviceRepositoryImpl(
      dataSource: mockUserLocalDataSource,
    );
  });

  List<Device> devices = [
    const Device(description: "", image: "", id: 1, name: "", routines: [])
  ];

  test(
    'should return UserModel when getUser calling',
    () async {
      // arrange
      when(mockUserLocalDataSource.getAllDevices())
          .thenAnswer((realInvocation) async => Future.value(devices));
      // act
      final result = await repositoryImpl.getAllDevices();
      // assert

      expect(result, equals(Right(devices)));
    },
  );
}
