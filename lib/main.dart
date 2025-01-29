import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_imt_api/pages/post_page.dart';
import 'package:test_imt_api/posts_cubit/posts_cubit.dart';

void main() {
  runApp(const TestApi());
}

class TestApi extends StatelessWidget {
  const TestApi({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PostsCubit()..getPosts(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Test Api',
        theme: ThemeData(
          //  colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const PostPage(),
      ),
    );
  }
}
