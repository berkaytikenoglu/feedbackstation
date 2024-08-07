import '../models/user_model.dart';
import '../providers/user_provider.dart';

class UserRepository {
  final UserProvider userProvider;

  UserRepository({required this.userProvider});

  Future<List<User>> getAllUsers() {
    return userProvider.getUsers();
  }

  Future<User> getUser(int id) {
    return userProvider.getUserById(id);
  }
}
