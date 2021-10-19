class Error {
  String? code;
  String? type;
  String? description;

  Error({this.code, this.type, this.description});

  Error.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    type = json['type'];
    description = json['description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = this.code;
    data['type'] = this.type;
    data['description'] = this.description;
    return data;
  }
}
