// import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:nest_finder/core/error/failure.dart';
import 'package:nest_finder/features/auth/domain/entity/auth_entity.dart';
import 'package:nest_finder/features/auth/domain/repository/auth_repository.dart';

class MockAuthRepository extends Mock implements IAuthRepository {}

void main() {
  late MockAuthRepository mockAuthRepository;

  setUp(() {
    mockAuthRepository = MockAuthRepository();
  });

  group('AuthRepository', () {
    const testUser = AuthEntity(
      userId: "1",
      username: "test_user",
      email: "test@example.com",
      password: "password123",
      avatar: "avatar_url",
    );

    test('registerUser should return void on success', () async {
      when(() => mockAuthRepository.registerUser(testUser))
          .thenAnswer((_) async => const Right(null));

      final result = await mockAuthRepository.registerUser(testUser);

      expect(result, equals(const Right(null)));
      verify(() => mockAuthRepository.registerUser(testUser)).called(1);
    });

    test('registerUser should return Failure on error', () async {
      when(() => mockAuthRepository.registerUser(testUser))
          .thenAnswer((_) async => const Left(ApiFailure(message: 'Invalid ')));

      final result = await mockAuthRepository.registerUser(testUser);

      expect(result, isA<Left<Failure, void>>());
    });

    // test('loginUser should return token on success', () async {
    //   when(() => mockAuthRepository.loginUser("test_user", "password123"))
    //       .thenAnswer((_) async => const Right("fake_token"));

    //   final result =
    //       await mockAuthRepository.loginUser("test_user", "password123");

    //   expect(result, equals(const Right("fake_token")));
    //   verify(() => mockAuthRepository.loginUser("test_user", "password123"))
    //       .called(1);
    // });

    // test('loginUser should return Failure on error', () async {
    //   when(() => mockAuthRepository.loginUser("test_user", "password123"))
    //       .thenAnswer((_) async => const Left(ApiFailure(message: 'Error')));

    //   final result =
    //       await mockAuthRepository.loginUser("test_user", "password123");

    //   expect(result, isA<Left<Failure, String>>());
    // });

    // test('uploadProfilePicture should return image URL on success', () async {
    //   final testFile = File('path/to/image.png');

    //   when(() => mockAuthRepository.uploadProfilePicture(testFile))
    //       .thenAnswer((_) async => const Right("uploaded_image_url"));

    //   final result = await mockAuthRepository.uploadProfilePicture(testFile);

    //   expect(result, equals(const Right("uploaded_image_url")));
    //   verify(() => mockAuthRepository.uploadProfilePicture(testFile)).called(1);
    // });

    // test('uploadProfilePicture should return Failure on error', () async {
    //   final testFile = File('path/to/image.png');

    //   when(() => mockAuthRepository.uploadProfilePicture(testFile))
    //       .thenAnswer((_) async => const Left(ApiFailure(message: 'Invalid')));

    //   final result = await mockAuthRepository.uploadProfilePicture(testFile);

    //   expect(result, isA<Left<Failure, String>>());
    // });

    // test('getCurrentUser should return AuthEntity on success', () async {
    //   when(() => mockAuthRepository.getCurrentUser())
    //       .thenAnswer((_) async => const Right(testUser));

    //   final result = await mockAuthRepository.getCurrentUser();

    //   expect(result, const Right(testUser));
    //   verify(() => mockAuthRepository.getCurrentUser()).called(1);
    // });

    // test('getCurrentUser should return Failure on error', () async {
    //   when(() => mockAuthRepository.getCurrentUser())
    //       .thenAnswer((_) async => const Left(ApiFailure(message: 'Error')));

    //   final result = await mockAuthRepository.getCurrentUser();

    //   expect(result, isA<Left<Failure, AuthEntity>>());
    // });
  });
}
