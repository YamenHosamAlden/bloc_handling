import 'package:blocstatemangement/core/helper/bloc_helper/base_state_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BlocFutureBuilder<B extends StateStreamable<S>, S extends BaseBlocState>
    extends StatelessWidget {
  final B bloc;
  final ValueGetter<Widget>? loadingWidget;
  final ValueGetter<Widget>? errorWidget;
  final void Function(BuildContext, S)? listener;
  final Widget Function(BuildContext, S) childBulder;
  const BlocFutureBuilder({
    super.key,
    required this.bloc,
    this.loadingWidget,
    this.errorWidget,
    required this.childBulder,
    this.listener,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<B, S>(
        listener: (context, state) {
          if (state.isError) {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text(state.errorMessage!),
            ));
          }
          if (listener != null) {
            listener!(context, state);
          }
        },
        bloc: bloc,
        builder: (context, state) {
          if (state.hasLoading) {
            return loadingWidget?.call() ??
                const Center(
                  child: CircularProgressIndicator(),
                );
          }
          if (state.hasError) {
            return errorWidget?.call() ??
                Center(
                  child: Text(state.errorMessageState),
                );
          }
          return childBulder(context, state);
        });
  }
}
