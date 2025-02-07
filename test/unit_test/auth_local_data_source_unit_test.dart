// import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:nest_finder/core/network/hive_service.dart';
import 'package:nest_finder/features/auth/data/data_source/local_data_source/auth_local_datasource.dart';
import 'package:nest_finder/features/auth/domain/entity/auth_entity.dart';

class MockHiveService extends Mock implements HiveService {}

void main() {
  late AuthLocalDatasource authLocalDatasource;
  late MockHiveService mockHiveService;

  setUp(() {
    mockHiveService = MockHiveService();
    authLocalDatasource = AuthLocalDatasource(mockHiveService);
  });

  group('AuthLocalDatasource', () {
    test('getCurrentUser should return an empty AuthEntity', () async {
      final result = await authLocalDatasource.getCurrentUser();
      expect(result, isA<AuthEntity>());
      expect(result.userId, "1");
      expect(result.username, "");
    });

    test('loginUser should return "Success" when login is successful',
        () async {
      when(() => mockHiveService.login(any(), any())).thenAnswer((_) async {
        return null;
      });

      final result =
          await authLocalDatasource.loginUser("test_user", "password");
      expect(result, "Success");
      verify(() => mockHiveService.login("test_user", "password")).called(1);
    });

    // test('loginUser should throw an error when login fails', () async {
    //   when(() => mockHiveService.login(any(), any()))
    //       .thenThrow(Exception("Login failed"));

    //   expect(
    //     () => authLocalDatasource.loginUser("test_user", "password"),
    //     throwsA(isA<Exception>()),
    //   );
    //   verify(() => mockHiveService.login("test_user", "password")).called(1);
    // });

    // test('uploadProfilePicture should throw UnimplementedError', () {
    //   final file = File('path/to/file.png');
    //   expect(() => authLocalDatasource.uploadProfilePicture(file),
    //       throwsUnimplementedError);
    // });
  });
}
