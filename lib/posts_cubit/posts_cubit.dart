import 'dart:convert';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

part 'posts_state.dart';

class PostsCubit extends Cubit<PostsState> {
  PostsCubit() : super(PostsInitial());

  Future<void> getPosts() async {
    emit(PostsLeading());
    try {
      final Response response = await http.get(
        Uri.parse('https://jsonplaceholder.typicode.com/posts'),
      );
      if (response.statusCode == 200) {
        final posts = jsonDecode(response.body);
        //  debugPrint('your posts is $posts');
        emit(PostsLoaded(posts: posts));
      } else {
        emit(PostsError('Error to get posts'));
      }
    } catch (e) {
      emit(PostsError(e.toString()));
    }
  }
}
