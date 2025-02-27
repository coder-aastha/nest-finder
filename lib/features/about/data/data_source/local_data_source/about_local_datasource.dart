import 'dart:convert';
import 'package:nest_finder/features/about/data/model/about_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class AboutLocalDataSource {
  Future<AboutModel?> getCachedAboutData();
  Future<void> cacheAboutData(AboutModel aboutModel);
}

class AboutLocalDataSourceImpl implements AboutLocalDataSource {
  final SharedPreferences sharedPreferences;

  AboutLocalDataSourceImpl({required this.sharedPreferences});

  static const cachedAboutKey = 'CACHED_ABOUT_DATA';

  @override
  Future<AboutModel?> getCachedAboutData() async {
    final jsonString = sharedPreferences.getString(cachedAboutKey);
    if (jsonString != null) {
      return AboutModel.fromJson(json.decode(jsonString));
    }
    return null;
  }

  @override
  Future<void> cacheAboutData(AboutModel aboutModel) async {
    await sharedPreferences.setString(
      cachedAboutKey,
      json.encode(aboutModel.toJson()),
    );
  }
}
