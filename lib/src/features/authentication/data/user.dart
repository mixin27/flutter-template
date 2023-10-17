import 'package:template/src/features/authentication/authentication.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

@JsonSerializable()
class User {
  const User({required this.uid, required this.email});

  final String uid;
  final String email;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);

  User copyWith({
    String? uid,
    String? email,
  }) {
    return User(
      uid: uid ?? this.uid,
      email: email ?? this.email,
    );
  }

  @override
  bool operator ==(covariant User other) {
    if (identical(this, other)) return true;

    return other.uid == uid && other.email == email;
  }

  @override
  int get hashCode => uid.hashCode ^ email.hashCode;

  @override
  String toString() => 'User(uid: $uid, email: $email)';
}

extension UserExt on User {
  AppUser toDomain() => AppUser(uid: uid, email: email);
}
