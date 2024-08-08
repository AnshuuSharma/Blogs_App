import 'dart:convert';

class Blog {
    String id;
    String imageUrl;
    String title;

    Blog({
        required this.id,
        required this.imageUrl,
        required this.title,
    });

     Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'imageUrl': imageUrl,
    };
  }

  factory Blog.fromMap(Map<String, dynamic> map) {
    return Blog(
      id: map['id'] ?? 0,
      title: map['title'] ?? '',
      imageUrl: map['imageUrl'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory Blog.fromJson(String source) => Blog.fromMap(json.decode(source));
}

