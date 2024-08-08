part of 'blogs_bloc.dart';



@immutable
abstract class BlogsState {}

abstract class PostsActionState extends BlogsState {}

class PostsInitial extends BlogsState {}

class PostsFetchingLoadingState extends BlogsState {}

class PostsFetchingErrorState extends BlogsState {}

class PostFetchingSuccessfulState extends BlogsState {
  final List<Blog> posts;
  PostFetchingSuccessfulState({
    required this.posts,
  });
}
class FavoriteBlogAdded extends PostsActionState{}
class HomeNavigateToFavoritePageActionState extends PostsActionState {}


class BlogAddedToFavoriteActionState extends PostsActionState {
  final Blog blog;

  BlogAddedToFavoriteActionState({
    required this.blog,
  });
}

class BlogRemovedFromFavoritesActionState extends PostsActionState {
  final Blog blog;

  BlogRemovedFromFavoritesActionState({
    required this.blog,
  });
}
