import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_imt_api/posts_cubit/posts_cubit.dart';

class PostPage extends StatelessWidget {
  const PostPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Posts ',
          style: Theme.of(context).textTheme.titleLarge!.copyWith(
                fontWeight: FontWeight.w500,
              ),
        ),
      ),
      body: BlocBuilder<PostsCubit, PostsState>(
        bloc: BlocProvider.of<PostsCubit>(context),
        buildWhen: (previous, current) =>
            current is PostsError ||
            current is PostsLeading ||
            current is PostsLoaded,
        builder: (context, state) {
          if (state is PostsLeading) {
            return Center(
              child: CircularProgressIndicator.adaptive(),
            );
          } else if (state is PostsError) {
            return Center(
              child: Text(state.message),
            );
          } else if (state is PostsLoaded) {
            final posts = state.posts;

            return ListView.builder(
                itemCount: posts.length,
                itemBuilder: (context, index) {
                  final post = posts[index];
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Card(
                      elevation: 4,
                      child: ListTile(
                        leading: Text(
                          post['id'].toString(),
                          style:
                              Theme.of(context).textTheme.titleMedium!.copyWith(
                                    fontWeight: FontWeight.w500,
                                  ),
                        ),
                        title: Text(
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          post['title'],
                          style:
                              Theme.of(context).textTheme.titleMedium!.copyWith(
                                    fontWeight: FontWeight.w600,
                                  ),
                        ),
                        subtitle: Text(
                          post['body'],
                          style:
                              Theme.of(context).textTheme.titleSmall!.copyWith(
                                    fontWeight: FontWeight.w500,
                                    color: Colors.grey,
                                  ),
                        ),
                      ),
                    ),
                  );
                });
          }
          return SizedBox.shrink();
        },
      ),
    );
  }
}
