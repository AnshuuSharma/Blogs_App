import 'package:blogs_app/features/blogs/bloc/blogs_bloc.dart';
import 'package:blogs_app/features/blogs/favorite/bloc/ui/favorite_blogs.dart';
import 'package:blogs_app/features/blogs/ui/blogs_component.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_bloc_with_apis/features/posts/bloc/posts_bloc.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomePageState();
}

class _HomePageState extends State<Homepage> {
  final BlogsBloc blogsBloc = BlogsBloc();

  @override
  void initState() {
    blogsBloc.add(PostsInitialFetchEvent());
    super.initState();
  }

  // bool isclicked = false;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<BlogsBloc, BlogsState>(
      bloc: blogsBloc,
      listenWhen: (previous, current) => current is PostsActionState,
      buildWhen: (previous, current) => current is! PostsActionState,
      listener: (context, state) {
        if (state is HomeNavigateToFavoritePageActionState) {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => Favorite()));
        } else if (state is BlogAddedToFavoriteActionState) {
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text('Blog marked as favorite')));
        }
      },
      builder: (context, state) {
        switch (state.runtimeType) {
          case PostsFetchingLoadingState:
            return const Center(
              child: CircularProgressIndicator(),
            );

          case PostFetchingSuccessfulState:
            final successState = state as PostFetchingSuccessfulState;

            return Scaffold(
              appBar: AppBar(
                  elevation: 5,
                  // backgroundColor: Colors.grey,
                  title: const Text(
                    'Blogs',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  centerTitle: true,
                  actions: [
                    IconButton(
                        onPressed: () {
                          blogsBloc.add(FavoriteButtonNavigateEvent());
                        },
                        icon: Icon(
                          Icons.favorite,
                          color: Colors.red,
                        )),
                  ]),
              body: ListView.builder(
                  itemCount: successState.posts.length,
                  itemBuilder: (context, index) {
                    return BlogsComponent(
                        blogsBloc: blogsBloc,
                        blogsDataModel: successState.posts[index]);
                  }),
            );
          default:
            return Container(
              color: Colors.blue,
              child: Text('Something Went Wrong'),
            );
        }
      },
    );
  }
}
