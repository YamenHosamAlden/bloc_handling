import 'package:myproject/core/base_bloc/bloc_future_builder.dart';
import 'package:myproject/features/posts/presentation/bloc/posts_bloc/posts_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PostView extends StatelessWidget {
  const PostView({super.key});

  @override
  Widget build(BuildContext context) {
    PostsBloc postsBloc = context.read<PostsBloc>();
    postsBloc.add(LoadPosts());
    return Scaffold(
      body: Center(
          child: BlocFutureBuilder<PostsBloc, PostState>(
        bloc: postsBloc,
        // loadingWidget: () => const Center(
        //     child: CircularProgressIndicator(
        //   color: Colors.amber,
        // )),
        // errorWidget: () => Center(
        //   child: Text(""),
        // ),
        childBulder: (context, state) => RefreshIndicator(
          onRefresh: () async {
            postsBloc.add(LoadPosts());
          },
          child: ListView.builder(
            itemCount: state.posts.length,
            itemBuilder: (context, index) => ListTile(
                leading: const Icon(Icons.post_add_outlined),
                title: Text(
                  state.posts[index].title,
                )),
          ),
        ),
      )),
    );
  }
}
