import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart';
import '../models/message_model.dart';

class ApiServices {
  static const String base = "jsonplaceholder.typicode.com";
  static const String posts = "/posts";

  static String deletePost(int id) => "/posts/$id";

  static Map<String, String> headers = {
    'Content-type': 'application/json; charset=UTF-8',
  };

  static Future<MessageModel?> postMessage(MessageModel model) async {
    Uri uri = Uri.https(base, posts);
    final body = jsonEncode(model.toMap());
    final response = await post(uri, headers: headers, body: body);
    if (response.statusCode == 200 || response.statusCode == 201) {
      return MessageModel.fromMap(jsonDecode(response.body));
    }
    return null;
  }

  static Future<MessageModel?> putMessage(MessageModel model) async {
    Uri uri = Uri.https(base, posts);
    final body = jsonEncode(model.toMap());
    final response = await put(uri, headers: headers, body: body);
    if (response.statusCode == 200 || response.statusCode == 201) {
      return MessageModel.fromMap(jsonDecode(response.body));
    }
    return null;
  }



  static Future<List<MessageModel>> getAllMessages() async {
    List<MessageModel> messagesList = [];
    Uri uri = Uri.https(base, posts);
    final response = await get(uri);
    if (response.statusCode == 200) {
      final dataList = jsonDecode(response.body);

      for (final item in dataList) {
        try {
          messagesList.add(MessageModel.fromMap(item));
        } catch (error, st) {
          log("Error:", error: error, stackTrace: st);
        }
      }
    }

    return messagesList;
  }

}
