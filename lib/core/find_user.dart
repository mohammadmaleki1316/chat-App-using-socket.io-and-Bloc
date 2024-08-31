
import '../models/user.dart';

int findUserIndex(List<User> users, String userId) {
  return users.indexWhere((user) => user.id == userId);
}