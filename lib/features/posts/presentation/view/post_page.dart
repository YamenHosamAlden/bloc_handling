import 'package:blocstatemangement/dependency_Injections.dart';
import 'package:blocstatemangement/features/posts/presentation/bloc/posts_bloc/posts_bloc.dart';
import 'package:blocstatemangement/features/posts/presentation/view/post_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PostPage extends StatelessWidget {
  const PostPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => di<PostsBloc>(),
      child: const PostView(),
    );
  }
}
