class RegisterRequestModel {
  String? email;
  String? password;
  String? loginType;
  String? deviceId;
  String? deviceType;
  String? deviceToken;
  String? firstName;
  String? lastName;
  String? socialKey;
  String? userClass;

  RegisterRequestModel(
      {this.email,
        this.password,
        this.loginType,
        this.deviceId,
        this.deviceType,
        this.deviceToken,
        this.firstName,
        this.lastName,
        this.socialKey,
        this.userClass
      });

  RegisterRequestModel.fromJson(Map<String, dynamic> json) {
    email = json['email'];
    password = json['password'];
    loginType = json['login_type'];
    deviceId = json['device_id'];
    deviceType = json['device_type'];
    deviceToken = json['device_token'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    socialKey = json['social_key'];
    userClass = json['user_class'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['email'] = this.email;
    data['password'] = this.password;
    data['login_type'] = this.loginType;
    data['device_id'] = this.deviceId;
    data['device_type'] = this.deviceType;
    data['device_token'] = this.deviceToken;
    data['first_name'] = this.firstName;
    data['last_name'] = this.lastName;
    data['social_key'] = this.socialKey;
    data['user_class'] = this.userClass;
    return data;
  }
}
