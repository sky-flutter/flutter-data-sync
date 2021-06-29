import 'package:hive/hive.dart';

part 'users_response.g.dart';

@HiveType(typeId: 1)
class UsersResponse {
  @HiveField(1)
  int id;
  @HiveField(2)
  String email;
  @HiveField(3)
  String firstName;
  @HiveField(4)
  String lastName;
  @HiveField(5)
  String avatar;

  UsersResponse({this.id, this.email, this.firstName, this.lastName, this.avatar});

  static List<UsersResponse> fromJson(List<dynamic> json) {
    if (json != null && json.isNotEmpty) {
      return json
          .map((e) => UsersResponse(
                id: e['id'],
                email: e['email'],
                firstName: e['first_name'],
                lastName: e['last_name'],
                avatar: e['avatar'],
              ))
          .toList();
    } else {
      return null;
    }
  }

  getFullName() => "$firstName $lastName";
}
