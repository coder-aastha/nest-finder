import 'package:hive_flutter/adapters.dart';
import 'package:nest_finder/app/constants/hive_constant.dart';
import 'package:nest_finder/features/auth/data/model/auth_hive_model.dart';
import 'package:path_provider/path_provider.dart';


class HiveService {
  static Future<void> init() async {
    //Initialize the database
    var directory = await getApplicationDocumentsDirectory();
    var path = '${directory.path}nestfinder.db';

    Hive.init(path);

    //Register Adapters
    Hive.registerAdapter(AuthHiveModelAdapter());
  }

  //Auth Queries
  Future<void> register(AuthHiveModel auth) async {
    var box = await Hive.openBox<AuthHiveModel>(HiveTableConstant.userBox);
    await box.put(auth.userId, auth);
  }

  Future<void> deleteAuth(String id) async {
    var box = await Hive.openBox<AuthHiveModel>(HiveTableConstant.userBox);
    await box.delete(id);
  }

  Future<List<AuthHiveModel>> getAllAuth() async {
    var box = await Hive.openBox<AuthHiveModel>(HiveTableConstant.userBox);
    return box.values.toList();
  }

  // Login using username and password
  Future<AuthHiveModel?> login(String email, String password) async {
    // var box = await Hive.openBox<AuthHiveModel>(HiveTableConstant.studentBox);
    // var auth = box.values.firstWhere(
    //     (element) =>
    //         element.username == username && element.password == password,
    //     orElse: () => AuthHiveModel.initial());
    // return auth;

    var box = await Hive.openBox<AuthHiveModel>(HiveTableConstant.userBox);
    var student = box.values.firstWhere((element) =>
        element.username == email && element.password == password);
    box.close();
    return student;
  }

  Future<void> clearAll() async {
    await Hive.deleteBoxFromDisk(HiveTableConstant.userBox);
  }

  // Clear Student Box
  Future<void> clearStudentBox() async {
    await Hive.deleteBoxFromDisk(HiveTableConstant.userBox);
  }

  Future<void> close() async {
    await Hive.close();
  }
}