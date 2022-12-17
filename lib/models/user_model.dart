class UserModel {
  List<Response>? response;

  UserModel({this.response});

  UserModel.fromJson(Map<String, dynamic> json) {
    if (json['response'] != null) {
      response = <Response>[];
      json['response'].forEach((v) {
        response!.add(Response.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (response != null) {
      data['response'] = response!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Response {
  int? id;
  String? name;
  String? email;
  String? profileImg;
  String? emailVerifiedAt;
  String? createdAt;
  String? updatedAt;
  String? cart;

  Response(
      {this.id,
        this.name,
        this.email,
        this.profileImg,
        this.emailVerifiedAt,
        this.createdAt,
        this.updatedAt,
        this.cart
      });

  Response.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    profileImg = json['profile_img'];
    emailVerifiedAt = json['email_verified_at'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    cart = json['cart'];

  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['email'] = email;
    data['profile_img'] = profileImg;
    data['email_verified_at'] = emailVerifiedAt;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['cart'] = cart;

    return data;
  }
}