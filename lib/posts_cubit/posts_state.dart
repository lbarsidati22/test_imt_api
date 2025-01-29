part of 'posts_cubit.dart';

abstract class PostsState {}

final class PostsInitial extends PostsState {}

final class PostsLoaded extends PostsState {
  final List posts;

  PostsLoaded({required this.posts});
}

final class PostsLeading extends PostsState {}

final class PostsError extends PostsState {
  final String message;

  PostsError(this.message);
}
