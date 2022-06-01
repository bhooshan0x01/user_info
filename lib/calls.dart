import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'model.dart';

class HttpService {
  Future<Album> fetchAlbum() async {
    final response = await http
        .get(Uri.parse('https://jsonplaceholder.typicode.com/albums'));
    if (response.statusCode == 200) {
      return Album.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load Albums.');
    }
  }

  Future<List<User>> fetchUsers() async {
    final response =
        await http.get(Uri.parse('https://jsonplaceholder.typicode.com/users'));
    if (response.statusCode == 200) {
      List<dynamic> body = jsonDecode(response.body);
      List<User> users = body
          .map(
            (dynamic item) => User.fromJson(item),
          )
          .toList();
      return users;
    } else {
      throw Exception('Failed to load Users.');
    }
  }

  Future<Posts> fetchPosts() async {
    final response =
        await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));
    if (response.statusCode == 200) {
      return Posts.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load Posts.');
    }
  }

  Future<Comment> fetchComments() async {
    final response = await http
        .get(Uri.parse('https://jsonplaceholder.typicode.com/comments'));
    if (response.statusCode == 200) {
      return Comment.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load Comments.');
    }
  }

  Future<ToDos> fetchTodos() async {
    final response =
        await http.get(Uri.parse('https://jsonplaceholder.typicode.com/todos'));
    if (response.statusCode == 200) {
      return ToDos.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load Todos.');
    }
  }
}
