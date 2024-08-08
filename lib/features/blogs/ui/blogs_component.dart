import 'package:blogs_app/features/blogs/bloc/blogs_bloc.dart';
import 'package:blogs_app/features/blogs/models/blogs_datamodel.dart';
import 'package:flutter/material.dart';

class BlogsComponent extends StatelessWidget {
  final Blog blogsDataModel;
  final BlogsBloc blogsBloc;
  bool isClicked = false;
  BlogsComponent(
      {super.key, required this.blogsDataModel, required this.blogsBloc});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.black)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.25,
            width: double.maxFinite,
            decoration: BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(blogsDataModel.imageUrl))),
          ),
          const SizedBox(height: 5),
          Text(blogsDataModel.title,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          // const SizedBox(height: 10),
          IconButton(
              onPressed: () {
                isClicked = isClicked ? false : true;
                blogsBloc
                    .add(AddFavouriteBlogEvent(clickedBlog: blogsDataModel));
              },
              icon: isClicked
                  ? const Icon(
                      Icons.favorite,
                      color: Colors.red,
                    )
                  : const Icon(Icons.favorite_border)),
        ],
      ),
    );
  }
}
