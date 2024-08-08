import 'dart:async';
import 'dart:convert';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:blogs_app/data/favorite_data.dart';
import 'package:blogs_app/features/blogs/favorite/bloc/ui/favorite_blogs.dart';
import 'package:blogs_app/features/blogs/models/blogs_datamodel.dart';
import 'package:blogs_app/features/blogs/repositories/blogs_repo.dart';
// import 'package:flutter_bloc_with_apis/features/blogs/models/blogs_datamodel.dart';
// import 'package:flutter_bloc_with_apis/features/posts/repos/posts_repo.dart';
import 'package:meta/meta.dart';
// import 'package:http/http.dart' as http;

part 'blogs_events.dart';
part 'blogs_state.dart';

class BlogsBloc extends Bloc<PostsEvent, BlogsState> {
  BlogsBloc() : super(PostsInitial()) {
    on<PostsInitialFetchEvent>(postsInitialFetchEvent);
    on<AddFavouriteBlogEvent>(addFavouriteBlogEvent);
    on<FavoriteButtonNavigateEvent>(favoriteButtonNavigateEvent);
  }

  FutureOr<void> postsInitialFetchEvent(
      PostsInitialFetchEvent event, Emitter<BlogsState> emit) async {
    emit(PostsFetchingLoadingState());
    List<Blog> posts = await BlogsRepo.fetchPosts();

    emit(PostFetchingSuccessfulState(posts: posts));
  }

  FutureOr<void> addFavouriteBlogEvent(
      AddFavouriteBlogEvent event, Emitter<BlogsState> emit) {
    favoriteBlogs.add(event.clickedBlog);
    print('favorite button clicked');
    emit(FavoriteBlogAdded());
  }

  FutureOr<void> favoriteButtonNavigateEvent(
      FavoriteButtonNavigateEvent event, Emitter<BlogsState> emit) {
    print('Favorite Navigate clicked');
    emit(HomeNavigateToFavoritePageActionState());
  }
}
FutureOr<void> toggleFavoriteBlogEvent(
      ToggleFavoriteBlogEvent event, Emitter<BlogsState> emit) {
    if (favoriteBlogs.contains(event.blog)) {
      favoriteBlogs.remove(event.blog);
      emit(BlogRemovedFromFavoritesActionState(blog: event.blog));
    } else {
      favoriteBlogs.add(event.blog);
      emit(BlogAddedToFavoriteActionState(blog: event.blog));
    }
    
    emit(PostFetchingSuccessfulState(posts: favoriteBlogs));
  }
