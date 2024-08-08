import 'package:blogs_app/features/blogs/favorite/bloc/favorite_bloc.dart';
import 'package:blogs_app/features/blogs/models/blogs_datamodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class BlogsTileWidget extends StatelessWidget {
  final Blog blogDataModel;
  final FavoriteBloc favoriteBloc;
  const BlogsTileWidget(
      {super.key, required this.blogDataModel, required this.favoriteBloc});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.black38)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 200,
            width: double.maxFinite,
            decoration: BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(blogDataModel.imageUrl))),
          ),
          const SizedBox(height: 20),
          Text(blogDataModel.title,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('Blog marked as favorite!'),
                        duration: Duration(seconds: 2),
                      ),
                    );
                  },
                  icon: Icon(
                    Icons.favorite,
                    color: Colors.red,
                  ))
            ],
          ),
        ],
      ),
    );
  }
}
