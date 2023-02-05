import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:smartx/core/error/failures.dart';
import 'package:smartx/features/devices/data/datasource/temp_data_source.dart';
import 'package:smartx/features/devices/domain/entity/device.dart';

import 'temp_datasource_test.mocks.dart';

class DataSourceImplTest extends Mock implements TempDataSourceImpl {}

@GenerateMocks([DataSourceImplTest])
void main() {
  late MockDataSourceImplTest mockDataSourceImpl;

  setUp(() {
    mockDataSourceImpl = MockDataSourceImplTest();
  });
  List<Device> devices = [
    const Device(id: 1, name: "Bed", description: "", image: "", routines: []),
    const Device(
        id: 2, name: "Coffe Machine", description: "", image: "", routines: []),
  ];

  test("should list return right", () async {
    //arrange

    when(mockDataSourceImpl.getAllDevices())
        .thenAnswer((_) async => Future.value(devices));
    //act

    final result = await mockDataSourceImpl.getAllDevices();

    //assert

    verify(mockDataSourceImpl.getAllDevices());
    expect(result, equals(devices));
  });

  test('should throw a UnExpectedException when there is some problem', () {
    // arrange
    when(mockDataSourceImpl.getAllDevices())
        .thenThrow(UnExpected("Something went wrong"));
    // act

    final call = mockDataSourceImpl.getAllDevices;
    // assert
    expect(() => call(), throwsA(const TypeMatcher<UnExpected>()));
  });
}
