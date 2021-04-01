enum Gender { male, female }

extension GenderExtension on Gender {
  String get value {
    switch (this) {
      case Gender.male:
        return "male";
      case Gender.female:
        return "female";
      default:
        throw Exception("Gender is not defined.");
    }
  }
}

class User {
  User({
    this.name,
    this.profileImagePath,
    this.phoneNumber,
    this.socialToken,
    this.gender,
    this.age,
    this.job,
    this.authCode,
    this.authToken,
    this.refreshToken,
    this.deviceToken,
  });

  String gender;
  String name;
  String profileImagePath;
  String phoneNumber;
  String socialToken;
  String job;
  int age;
  String authCode;
  String authToken;
  String refreshToken;
  String deviceToken;
}
