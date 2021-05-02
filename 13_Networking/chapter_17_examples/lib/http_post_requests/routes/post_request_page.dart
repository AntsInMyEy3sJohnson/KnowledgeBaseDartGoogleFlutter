import 'package:chapter_17_examples/http_post_requests/data/post.dart';
import 'package:chapter_17_examples/http_post_requests/routes/result_page.dart';
import 'package:flutter/material.dart';

class PostRequestPage extends StatelessWidget {
  // This is the starting page.
  static const String ROUTE_ID = "/";

  final TextEditingController _titleController = TextEditingController();

  final TextEditingController _bodyController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          TextFormField(
            decoration: const InputDecoration(hintText: "Post title"),
            controller: _titleController,
          ),
          TextFormField(
            decoration: const InputDecoration(hintText: "Post content"),
            controller: _bodyController,
          ),
          ElevatedButton(
            child: Text("Submit"),
            onPressed: () => _submit(context, _titleController.text, _bodyController.text),
          ),
        ],
      ),
    );
  }

  void _submit(BuildContext buildContext, String title, String body) {
    Navigator.pushNamed(buildContext, ResultPage.ROUTE_ID, arguments: Post.fromPropertiesToJson(42, title, body));
  }
}
