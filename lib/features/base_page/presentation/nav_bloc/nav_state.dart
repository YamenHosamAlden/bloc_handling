part of 'nav_bloc.dart';

@freezed
class NavState with _$NavState {
  const factory NavState({
    required PageIndex pageIndex,
    required Map<PageIndex, GlobalKey<NavigatorState>> navigatorKeys,
  }) = _NavState;
  factory NavState.initial() =>
       NavState(pageIndex: PageIndex.posts, navigatorKeys: {
        PageIndex.posts: GlobalKey<NavigatorState>(debugLabel: "Posts"),
        PageIndex.profile: GlobalKey<NavigatorState>(debugLabel: "Profile"),
      });
}

enum PageIndex {
  posts,
  profile,
}
