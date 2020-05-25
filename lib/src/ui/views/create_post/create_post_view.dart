import 'package:compound/src/app/models/post.dart';
import 'package:compound/src/ui/global/app_colors.dart';
import 'package:compound/src/ui/global/ui_helpers.dart';
import 'package:compound/src/ui/views/create_post/create_post_view_model.dart';
import 'package:compound/src/ui/widgets/dumb/input_field.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class CreatePostView extends StatelessWidget {
  final Post editingPost;
  CreatePostView({
    this.editingPost,
  });

  final TextEditingController titleController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
      viewModelBuilder: () => CreatePostViewModel(),
      onModelReady: (CreatePostViewModel model) {
        if (editingPost != null) {
          titleController.text = editingPost.title ?? '';
          model.setEditingPost(editingPost);
        }
      },
      builder: (
        BuildContext context,
        CreatePostViewModel model,
        Widget child,
      ) {
        return Scaffold(
          floatingActionButton: FloatingActionButton(
            child: !model.isBusy
                ? Icon(
                    Icons.add,
                  )
                : CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation(
                      Colors.white,
                    ),
                  ),
            onPressed: () async {
              if (!model.isBusy) {
                await model.addPost(
                  title: titleController.text,
                );
              }
            },
            backgroundColor: !model.isBusy ? primaryColor : Colors.grey[600],
          ),
          body: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: blockSizeHorizontal(context) * 5,
            ),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  verticalSpaceLarge(context),
                  Text(
                    'Create Post',
                    style: TextStyle(
                      fontSize: blockSizeHorizontal(context) * 5,
                    ),
                  ),
                  verticalSpaceMedium(context),
                  InputField(
                    placeholder: 'Title',
                    controller: titleController,
                  ),
                  verticalSpaceMedium(context),
                  Text(
                    'Post Image',
                  ),
                  verticalSpaceSmall(context),
                  Container(
                    height: 250,
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(
                        10,
                      ),
                    ),
                    alignment: Alignment.center,
                    child: Text(
                      'Tap to add post image',
                      style: TextStyle(
                        color: Colors.grey[400],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
