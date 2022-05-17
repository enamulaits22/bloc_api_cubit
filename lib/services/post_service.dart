import 'dart:convert';
import 'dart:developer';
import 'package:flutter_bloc_concepts/models/post_model.dart';
import 'package:http/http.dart' as http;

class PostService {
  Future<List<PostModel>> fetchData() async {
    Uri url = Uri.parse('https://jsonplaceholder.typicode.com/posts');

    final response = await http.get(
      url,
      headers: {"Content-Type": "application/json"},
    );
    log(response.body);
    if (response.statusCode == 200) {
      // log(response.body);
      log('Data retrived successful!!!');
      return postModelFromJson(response.body);
    } else {
      log('Data retrived failed!!!');
      // log(response.statusCode.toString());
      return jsonDecode(response.body);
    }
  }
}