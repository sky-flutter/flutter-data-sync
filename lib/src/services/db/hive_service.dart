import 'package:flutter_app/src/model/users_response.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

class HiveService {
  static final HiveService instance = HiveService._internal();

  HiveService._internal();

  isExists({String boxName}) async {
    final openBox = await Hive.openBox(boxName);
    int length = openBox.length;
    return length != 0;
  }

  Future<Box> openBox(String boxName) async {
    return await Hive.openBox(boxName);
  }

  addBoxes<T>(List<T> items, String boxName) async {
    final box = await openBox(boxName);
    items.forEach((element) {
      box.add(element);
    });
  }

  updateValue<T>(T value, int index, String boxName) async {
    final box = await openBox(boxName);
    return box.putAt(index, value);
  }

  Future<List<T>> getBoxes<T>(String boxName) async {
    List<T> boxList = [];
    final box = await openBox(boxName);
    int length = box.length;
    for (int i = 0; i < length; i++) {
      boxList.add(box.getAt(i));
    }
    return boxList;
  }

  clear(String boxName) async {
    await (await Hive.openBox(boxName)).clear();
  }

  void setAdapter() async {
    final appDirectory = await getApplicationDocumentsDirectory();
    Hive
      ..init(appDirectory.path)
      ..registerAdapter(UsersResponseAdapter());
  }
}
