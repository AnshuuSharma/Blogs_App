part of 'favorite_bloc.dart';

@immutable
abstract class FavoriteStates {}

abstract class FavoriteActionState extends FavoriteStates {}

class FavoriteInitial extends FavoriteStates {}

class FavoriteBlogSuccessState extends FavoriteStates {
  final List<Blog> favBlogs;
  FavoriteBlogSuccessState({
    required this.favBlogs,
  });
  
}
