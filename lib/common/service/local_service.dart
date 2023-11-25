import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:test_v_tech/common/constant/app_storage_key.dart';

class LocalService extends GetxService {
  GetStorage? _appStorage;

  GetStorage get appStorage {
    _appStorage ??= GetStorage();
    return _appStorage!;
  }

  Future write(String key, String value) {
    return appStorage.write(key, value);
  }

  String? get language => appStorage.read(AppStorageKey.LANGUAGE);

  clear() async => appStorage.erase();

  Future cacheLanguage(String s) {
    return write(AppStorageKey.LANGUAGE, s);
  }
}
