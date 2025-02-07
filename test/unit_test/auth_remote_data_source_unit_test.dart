// import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:nest_finder/app/constants/api_endpoints.dart';
import 'package:nest_finder/features/auth/data/data_source/remote_data_source/auth_remote_data_source.dart';
import 'package:nest_finder/features/auth/domain/entity/auth_entity.dart';

class MockDio extends Mock implements Dio {}

void main() {
  late AuthRemoteDataSource authRemoteDataSource;
  late MockDio mockDio;

  setUp(() {
    mockDio = MockDio();
    authRemoteDataSource = AuthRemoteDataSource(mockDio);
  });

  group('AuthRemoteDataSource', () {
    const testUser = AuthEntity(
      userId: "1",
      username: "test_user",
      email: "test@example.com",
      password: "password123",
      avatar: "avatar_url",
    );

    test('registerUser should complete when API returns 201', () async {
      when(() => mockDio.post(
            ApiEndpoints.register,
            data: any(named: "data"),
          )).thenAnswer((_) async => Response(
            requestOptions: RequestOptions(path: ApiEndpoints.register),
            statusCode: 201,
          ));

      await authRemoteDataSource.registerUser(testUser);

      verify(() => mockDio.post(
            ApiEndpoints.register,
            data: {
              "username": testUser.username,
              "email": testUser.email,
              "password": testUser.password,
              "avatar": testUser.avatar,
            },
          )).called(1);
    });

    test('registerUser should throw an exception when API fails', () async {
      when(() => mockDio.post(
            ApiEndpoints.register,
            data: any(named: "data"),
          )).thenThrow(DioException(
        requestOptions: RequestOptions(path: ApiEndpoints.register),
      ));

      expect(() => authRemoteDataSource.registerUser(testUser),
          throwsA(isA<Exception>()));
    });

    // test('loginUser should return token when API returns 200', () async {
    //   when(() => mockDio.post(
    //         ApiEndpoints.login,
    //         data: any(named: "data"),
    //       )).thenAnswer((_) async => Response(
    //         requestOptions: RequestOptions(path: ApiEndpoints.login),
    //         statusCode: 200,
    //         data: {"token": "fake_token"},
    //       ));

    //   final result =
    //       await authRemoteDataSource.loginUser("test_user", "password123");

    //   expect(result, "fake_token");

    //   verify(() => mockDio.post(
    //         ApiEndpoints.login,
    //         data: {
    //           "username": "test_user",
    //           "password": "password123",
    //         },
    //       )).called(1);
    // });

    // test('loginUser should throw an exception when API fails', () async {
    //   when(() => mockDio.post(
    //         ApiEndpoints.login,
    //         data: any(named: "data"),
    //       )).thenThrow(DioException(
    //     requestOptions: RequestOptions(path: ApiEndpoints.login),
    //   ));

    //   expect(() => authRemoteDataSource.loginUser("test_user", "password123"),
    //       throwsA(isA<Exception>()));
    // });

    // test('uploadProfilePicture should throw an exception when API fails',
    //     () async {
    //   final testFile = File('path/to/image.png');

    //   when(() => mockDio.post(
    //         ApiEndpoints.uploadImage,
    //         data: any(named: "data"),
    //       )).thenThrow(DioException(
    //     requestOptions: RequestOptions(path: ApiEndpoints.uploadImage),
    //   ));

    //   expect(() => authRemoteDataSource.uploadProfilePicture(testFile),
    //       throwsA(isA<Exception>()));
    // });

    // test('getCurrentUser should throw UnimplementedError', () {
    //   expect(() => authRemoteDataSource.getCurrentUser(),
    //       throwsUnimplementedError);
    // });
  });
}
