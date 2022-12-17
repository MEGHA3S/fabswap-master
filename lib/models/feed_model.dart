class FeedModel {
  List<Response>? response;

  FeedModel({this.response});

  FeedModel.fromJson(Map<String, dynamic> json) {
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
  String? createdAt;
  String? updatedAt;
  String? username;
  String? image;
  String? dressName;
  String? dressSize;
  String? dressPrice;
  String? likes;
  String? comments;
  String? category;
  int? userId;



  Response(
      {this.id,
        this.createdAt,
        this.updatedAt,
        this.username,
        this.image,
        this.dressName,
        this.dressSize,
        this.dressPrice,
        this.likes,
        this.comments,
      this.category,
        this.userId,

      });

  Response.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    username = json['username'];
    image = json['image'];
    dressName = json['dress_name'];
    dressSize = json['dress_size'];
    dressPrice = json['dress_price'];
    likes = json['likes'];
    comments = json['comments'];
    category = json['category'];
    userId = json['userId'];

  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['username'] = username;
    data['image'] = image;
    data['dress_name'] = dressName;
    data['dress_size'] = dressSize;
    data['dress_price'] = dressPrice;
    data['likes'] = likes;
    data['comments'] = comments;
    data['category'] = category;
    data['userId'] = userId;

    return data;
  }
}