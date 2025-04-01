import 'package:api_calling/Models/user_model.dart';
import 'package:firebase_database/firebase_database.dart';

class FirebaseService {
  final DatabaseReference _dbRef =
      FirebaseDatabase.instance.ref().child("User");
  Stream<List<UserModel>> streamUsers() {
    return _dbRef.onValue.map((event) {
      final data = event.snapshot.value as Map<dynamic, dynamic>? ?? {};
      return data.entries.map((entry) {
        return UserModel.fromMap(
            Map<String, dynamic>.from(entry.value), entry.key);
      }).toList();
    });
  }

  Future<void> addUser(UserModel user) async {
    await _dbRef.push().set(user.toMap());
  }

  Future<void> deleteUser(String id) async {
    await _dbRef.child(id).remove();
  }
}
