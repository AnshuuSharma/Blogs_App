import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:blogs_app/data/favorite_data.dart';
import 'package:blogs_app/features/blogs/models/blogs_datamodel.dart';
// import 'package:blogs_app/features/blogs/favorite/bloc/favorite_events.dart';
// import 'package:blogs_app/features/blogs/favorite/bloc/favorite_events.dart';
import 'package:meta/meta.dart';

part 'favorite_events.dart';
part 'favorite_states.dart';

class FavoriteBloc extends Bloc<FavoriteEvents, FavoriteStates> {
  FavoriteBloc() : super(FavoriteInitial()) {
    on<FavoriteBlogInitialEvent>(favoriteBlogInitialEvent);
    on<FavoriteEvents>((event, emit) {
      // TODO: implement event handler
    });
  }

 FutureOr<void> favoriteBlogInitialEvent(
      FavoriteBlogInitialEvent event, Emitter<FavoriteStates> emit) {
    emit(FavoriteBlogSuccessState(favBlogs: favoriteBlogs));
  }
}