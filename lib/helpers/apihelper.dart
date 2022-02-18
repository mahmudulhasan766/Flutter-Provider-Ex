import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart';
import 'package:provider_ex/models/httpresponse.dart';
import 'package:provider_ex/models/post.dart';

class APIHelper {
  static Future<HTTPResponse<List<Post>>> getPosts(
      {int page = 1, int limit = 10}) async {
    try {
      var response = await get(
        'https://jsonplaceholder.typicode.com/posts?_limit=$limit&_page=$page',
        //'https://demo.redtvlive.com/moses/api/v100/get_user_tickets?user_id=1&page=1',headers: {"API-KEY":"a98700f5fb00cbdy"}
      );
      if (response.statusCode == 200) {
        var body = jsonDecode(response.body);
        List<Post> posts = [];
        body.forEach((e) {
          Post post = Post.fromJson(e);
          posts.add(post);
        });
        return HTTPResponse<List<Post>>(
          true,
          posts,
          message: 'Request Successful',
          statusCode: response.statusCode,
        );
      } else {
        return HTTPResponse<List<Post>>(
          false,
          null,
          message:
              'Invalid data received from the server! Please try again in a moment.',
          statusCode: response.statusCode,
        );
      }
    } on SocketException {
      print('SOCKET EXCEPTION OCCURRED');
      return HTTPResponse<List<Post>>(
        false,
        null,
        message: 'Unable to reach the internet! Please try again in a moment.',
      );
    } on FormatException {
      print('JSON FORMAT EXCEPTION OCCURRED');
      return HTTPResponse<List<Post>>(
        false,
        null,
        message:
            'Invalid data received from the server! Please try again in a moment.',
      );
    } catch (e) {
      print('UNEXPECTED ERROR');
      print(e.toString());
      return HTTPResponse<List<Post>>(
        false,
        null,
        message: 'Something went wrong! Please try again in a moment!',
      );
    }
  }
}
