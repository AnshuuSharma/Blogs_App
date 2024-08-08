import 'package:blogs_app/features/blogs/bloc/blogs_bloc.dart';
import 'package:blogs_app/features/blogs/favorite/bloc/favorite_bloc.dart';
import 'package:blogs_app/features/blogs/favorite/bloc/ui/favblog_component.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Favorite extends StatefulWidget {
  const Favorite({super.key});

  @override
  State<Favorite> createState() => _FavoriteState();
}

class _FavoriteState extends State<Favorite> {
  final FavoriteBloc favoriteBloc = FavoriteBloc();
  @override
  void initState() {
    favoriteBloc.add(FavoriteBlogInitialEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Favorite Blogs'),
      ),
      body: BlocConsumer<FavoriteBloc, FavoriteStates>(
        bloc: favoriteBloc,
        listener: (context, state) {},
        listenWhen: (previous, current) => current is FavoriteActionState,
        buildWhen: (previous, current) => current is! FavoriteActionState,
        builder: (context, state) {
          switch (state.runtimeType) {
            case FavoriteBlogSuccessState:
              final successState = state as FavoriteBlogSuccessState;
              return ListView.builder(
                  itemCount: successState.favBlogs.length,
                  itemBuilder: (context, index) {
                    return BlogsTileWidget(
                      blogDataModel: successState.favBlogs[index],
                      favoriteBloc: favoriteBloc,
                    );
                  });

            default:
          }
          return Container();
        },
      ),
    );
  }
}
