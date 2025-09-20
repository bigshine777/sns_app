import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sns_app/models/album.dart';
import 'package:sns_app/models/picture.dart';
import 'package:sns_app/models/post.dart';
import 'package:sns_app/models/user.dart';
import 'package:sns_app/repositories/album.dart';
import 'package:sns_app/repositories/picture.dart';
import 'package:sns_app/repositories/post.dart';
import 'package:sns_app/repositories/user.dart';

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

class PostsNotifier extends AsyncNotifier<List<Post>> {
  @override
  Future<List<Post>> build() async {
    final posts = await getPosts();
    return posts;
  }

  void toggleLike(int postId) {
    state = state.whenData(
      (posts) => posts
          .map(
            (post) => post.id == postId
                ? post.copyWith(isLiked: !post.isLiked)
                : post,
          )
          .toList(),
    );
  }

  List<Post> get posts => state.value ?? [];
  set posts(List<Post> posts) {
    state = AsyncData(posts);
  }
}

final postsNotifierProvider = AsyncNotifierProvider<PostsNotifier, List<Post>>(
  PostsNotifier.new,
);

class AlbumsNotifier extends AsyncNotifier<List<Album>> {
  @override
  Future<List<Album>> build() async {
    final albums = await getAlbums();
    return albums;
  }

  void toggleLike(int albumId) {
    state = state.whenData(
      (albums) => albums
          .map(
            (album) => album.id == albumId
                ? album.copyWith(isLiked: !album.isLiked)
                : album,
          )
          .toList(),
    );
  }

  List<Album> get albums => state.value ?? [];
  set albums(List<Album> albums) {
    state = AsyncData(albums);
  }
}

final albumsNotifierProvider =
    AsyncNotifierProvider<AlbumsNotifier, List<Album>>(AlbumsNotifier.new);

class UsersNotifier extends AsyncNotifier<List<User>> {
  @override
  Future<List<User>> build() async {
    final users = await getUsers();
    return users;
  }

  List<User> get users => state.value ?? [];
  set users(List<User> users) {
    state = AsyncData(users);
  }
}

final usersNotifierProvider = AsyncNotifierProvider<UsersNotifier, List<User>>(
  UsersNotifier.new,
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

final picturesNotifierProvider =
    AsyncNotifierProvider<PicturesNotifier, List<Picture>>(
      PicturesNotifier.new,
    );
