import 'package:template/src/features/authentication/data/user.dart';

typedef UserID = String;

class AppUser {
  const AppUser({required this.uid, required this.email});

  final UserID uid;
  final String email;

  @override
  bool operator ==(covariant AppUser other) {
    if (identical(this, other)) return true;

    return other.uid == uid && other.email == email;
  }

  @override
  int get hashCode => uid.hashCode ^ email.hashCode;
}

extension AppUserExt on AppUser {
  User toDto() => User(uid: uid, email: email);
}
