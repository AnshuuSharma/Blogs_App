// import 'package:flutter/material.dart';
part of 'blogs_bloc.dart';

@immutable
abstract class PostsEvent {}


class PostsInitialFetchEvent extends PostsEvent{}
class AddFavouriteBlogEvent extends PostsEvent {
  final Blog clickedBlog;
  AddFavouriteBlogEvent({
    required this.clickedBlog,
  });
}
class FavoriteButtonNavigateEvent extends PostsEvent {}
class ToggleFavoriteBlogEvent extends PostsEvent {
  final Blog blog;
  ToggleFavoriteBlogEvent({
    required this.blog,
  });
}


