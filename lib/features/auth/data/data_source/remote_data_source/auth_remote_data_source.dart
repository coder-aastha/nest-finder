import 'dart:io';

import 'package:dio/dio.dart';
import 'package:nest_finder/app/constants/api_endpoints.dart';
import 'package:nest_finder/features/auth/data/data_source/auth_data_source.dart';
import 'package:nest_finder/features/auth/domain/entity/auth_entity.dart';

class AuthRemoteDataSource implements IAuthDataSource {
  final Dio _dio;

  AuthRemoteDataSource(this._dio);

  @override
  Future<void> registerUser(AuthEntity user) async {
    try {
      Response response = await _dio.post(
        ApiEndpoints.register,
        data: {
          "username": user.username,
          "email": user.email,
          "password": user.password,
          "avatar": user.avatar,
        },
      );

      if (response.statusCode == 201) {
        return;
      } else {
        throw Exception(response.statusMessage);
      }
    } on DioException catch (e) {
      throw Exception(e);
    } catch (e) {
      throw Exception(e);
    }
  }

  @override
  Future<AuthEntity> getCurrentUser() {
    throw UnimplementedError();
  }

  @override
  Future<String> loginUser(String username, String password) async {
    try {
      Response response = await _dio.post(
        ApiEndpoints.login,
        data: {
          "username": username,
          "password": password,
        },
      );

      if (response.statusCode == 200) {
        final str = response.data['token'];
        return str;
      } else {
        throw Exception(response.statusMessage);
      }
    } on DioException catch (e) {
      throw Exception(e);
    } catch (e) {
      throw Exception(e);
    }
  }
  
  @override
  Future<String> uploadProfilePicture(File file) {
    // TODO: implement uploadProfilePicture
    throw UnimplementedError();
  }
}

//   @override
//   Future<String> uploadProfilePicture(File file) async {
//     try {
//       String fileName = file.path.split('/').last;
//       FormData formData = FormData.fromMap(
//         {
//           'profilePicture': await MultipartFile.fromFile(
//             file.path,
//             filename: fileName,
//           ),
//         },
//       );

//       Response response = await _dio.post(
//         // ApiEndpoints.uploadImage,
//         // data: formData,
//       );

//       if (response.statusCode == 200) {
//         // Extract the image name from the response
//         final str = response.data['data'];

//         return str;
//       } else {
//         throw Exception(response.statusMessage);
//       }
//     } on DioException catch (e) {
//       throw Exception(e);
//     } catch (e) {
//       throw Exception(e);
//     }
//   }
// }
