// import 'dart:io';

// import 'package:dio/dio.dart';
// import 'package:nest_finder/app/constants/api_endpoints.dart';
// import 'package:nest_finder/features/auth/data/data_source/auth_data_source.dart';
// import 'package:nest_finder/features/auth/domain/entity/auth_entity.dart';


// class AuthRemoteDataSource implements IAuthDataSource{
//   final Dio _dio;
//   AuthRemoteDataSource (this._dio);

//   @override
//   Future<void> registerUser(AuthEntity user) async{
//     try{
//       Response response = await _dio.post(
//         ApiEndpoints.register,
//         data: {
//           "username": user.username,
//           "email": user.email,
//           "password": user.password,
//           "avatar": user.avatar,
//         }
//       );

//       if (response.statusCode == 201) {
//         return;
//       } else {
//         throw Exception(response.statusMessage);
//       }

//     } on DioException catch(e){
//       throw Exception(e);
//     } catch (e){
//       throw Exception(e);
//     }
//   }

//   @override
//   Future<AuthEntity> getCurrentUser() {
//     throw UnimplementedError();
//   }

//   @override
//   Future<String> loginUser(String username, String password) async{
//     try {
//       Response response = await _dio.post(
//         ApiEndpoints.login,
//         data: {
//           "username": username,
//           "password": password,
//         },
//       );
//       if (response.statusCode == 200) {
//         return response.data['token'];
//       } else {
//         throw Exception("Login failed: ${response.statusMessage}");
//       }
//     } on DioException catch (e) {
//       throw Exception("Dio Error: ${e.message}");
//     } catch (e) {
//       throw Exception("An error occurred: ${e.toString()}");
//     }
//   }

//   @override
//   Future<String> uploadProfilePicture(File file) {
//     throw UnimplementedError();
//   }
// }




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

      if (response.statusCode == 200) {
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
    // TODO: implement getCurrentUser
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
  Future<String> uploadProfilePicture(File file) async {
    throw UnimplementedError();
  }
}
