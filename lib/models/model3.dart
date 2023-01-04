import 'dart:convert';

PostResponse welcomeFromJson(String str) =>
    PostResponse.fromJson(json.decode(str));

String welcomeToJson(PostResponse data) => json.encode(data.toJson());

class PostResponse {
  PostResponse({
    required this.requestId,
    required this.deeplink,
  });

  String requestId;
  String deeplink;

  factory PostResponse.fromJson(Map<String, dynamic> json) => PostResponse(
        requestId: json["requestId"],
        deeplink: json["deeplink"],
      );

  Map<String, dynamic> toJson() => {
        "requestId": requestId,
        "deeplink": deeplink,
      };
}
