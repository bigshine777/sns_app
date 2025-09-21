import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sns_app/models/album.dart';
import 'package:sns_app/models/picture.dart';
import 'package:sns_app/models/post.dart';
import 'package:sns_app/models/user.dart';
import 'package:sns_app/repositories/album.dart';
import 'package:sns_app/repositories/picture.dart';
import 'package:sns_app/repositories/post.dart';
import 'package:sns_app/repositories/user.dart';

class IsDarkNotifier extends Notifier<bool> {
  @override
  bool build() => false;

  bool get isDark => state;
  set isDark(bool isDark) => state = isDark;
}

final isDarkProvider = NotifierProvider<IsDarkNotifier, bool>(
  IsDarkNotifier.new,
);

class UsernameNotifier extends Notifier<String> {
  @override
  String build() => 'guest';

  String get username => state;
  set username(String username) => state = username;
}

final usernameProvider = NotifierProvider<UsernameNotifier, String>(
  UsernameNotifier.new,
);

class PageIndexNotifier extends Notifier<int> {
  @override
  int build() => 0;

  int get index => state;
  set index(int index) => state = index;
}

final pageIndexProvider = NotifierProvider<PageIndexNotifier, int>(
  PageIndexNotifier.new,
);

class PicturesNotifier extends AsyncNotifier<List<Picture>> {
  @override
  Future<List<Picture>> build() async {
    final pictures = await getPictures();
    return pictures;
  }

  void toggleLike(int pictureId) {
    state = state.whenData(
      (pictures) => pictures
          .map(
            (picture) => picture.id == pictureId
                ? picture.copyWith(isLiked: !picture.isLiked)
                : picture,
          )
          .toList(),
    );
  }

  List<Picture> get pictures => state.value ?? [];
  set pictures(List<Picture> pictures) {
    state = AsyncData(pictures);
  }
}

final picturesProvider = AsyncNotifierProvider<PicturesNotifier, List<Picture>>(
  PicturesNotifier.new,
);

class PostsPageData {
  final List<Post> posts;
  final List<User> users;

  PostsPageData({required this.posts, required this.users});
}

class PostsPageNotifier extends AsyncNotifier<PostsPageData> {
  @override
  Future<PostsPageData> build() async {
    final results = await Future.wait([getPosts(), getUsers()]);

    final posts = results[0] as List<Post>;
    final users = results[1] as List<User>;

    return PostsPageData(posts: posts, users: users);
  }

  void toggleLike(int postId) {
    state = state.whenData((data) {
      final updatedPosts = data.posts
          .map(
            (post) => post.id == postId
                ? post.copyWith(isLiked: !post.isLiked)
                : post,
          )
          .toList();
      return PostsPageData(posts: updatedPosts, users: data.users);
    });
  }
}

final postsPageProvider =
    AsyncNotifierProvider<PostsPageNotifier, PostsPageData>(
      PostsPageNotifier.new,
    );

class AlbumsPageData {
  final List<Album> albums;
  final List<User> users;
  final List<Picture> pictures;

  AlbumsPageData({
    required this.albums,
    required this.users,
    required this.pictures,
  });
}

class AlbumsPageNotifier extends AsyncNotifier<AlbumsPageData> {
  @override
  Future<AlbumsPageData> build() async {
    final results = await Future.wait([getAlbums(), getUsers(), getPictures()]);

    final albums = results[0] as List<Album>;
    final users = results[1] as List<User>;
    final pictures = results[2] as List<Picture>;

    return AlbumsPageData(albums: albums, users: users, pictures: pictures);
  }

  void toggleLike(int postId) {
    state = state.whenData((data) {
      final updatedAlbums = data.albums
          .map(
            (post) => post.id == postId
                ? post.copyWith(isLiked: !post.isLiked)
                : post,
          )
          .toList();
      return AlbumsPageData(
        albums: updatedAlbums,
        users: data.users,
        pictures: data.pictures,
      );
    });
  }
}

final albumsPageProvider =
    AsyncNotifierProvider<AlbumsPageNotifier, AlbumsPageData>(
      AlbumsPageNotifier.new,
    );
