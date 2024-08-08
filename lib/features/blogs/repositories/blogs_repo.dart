import 'dart:convert';
import 'dart:developer';

import 'package:blogs_app/features/blogs/models/blogs_datamodel.dart';
import 'package:http/http.dart' as http;

class BlogsRepo {
  static Future<List<Blog>> fetchPosts() async {
    var client = http.Client();
    List<Blog> blogsList = [];
    try {
      const String url = 'https://intent-kit-16.hasura.app/api/rest/blogs';
      const String adminSecret =
          '32qR4KmXOIpsGPQKMqEJHGJS27G5s7HdSKO3gdtQd2kv5e852SiYwWNfxkZOBuQ6';
      var response = await client.get(Uri.parse(url), headers: {
        'x-hasura-admin-secret': adminSecret,
      });

      Map<String, dynamic> result = jsonDecode(response.body);
      List<dynamic> blogsJson = result['blogs'];
      for (var blogJson in blogsJson) {
        Blog blog = Blog.fromMap(blogJson as Map<String, dynamic>);
        blogsList.add(blog);
      }
      // print(result);
      return blogsList;
    } catch (e) {
      log(e.toString());
      return [];
    }
  }
}
