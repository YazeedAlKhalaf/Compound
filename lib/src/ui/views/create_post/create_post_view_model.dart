import 'package:compound/src/app/models/post.dart';
import 'package:compound/src/app/router/router.gr.dart';
import 'package:compound/src/ui/global/custom_base_view_model.dart';
import 'package:flutter/foundation.dart';

class CreatePostViewModel extends CustomBaseViewModel {
  Post _editingPost;

  bool get _editing => _editingPost != null;

  Future addPost({
    @required String title,
  }) async {
    setBusy(true);
    var result;
    if (!_editing) {
      result = await firestoreService.addPost(
        Post(
          title: title,
          userId: currentUser.id,
        ),
      );
    } else {
      result = await firestoreService.updatePost(
        Post(
          title: title,
          userId: _editingPost.userId,
          documentId: _editingPost.documentId,
        ),
      );
    }

    if (result is String) {
      await dialogService.showDialog(
        title: 'Could not create post',
        description: result,
      );
    } else {
      await dialogService.showDialog(
        title: 'Post Successfully Added',
        description: 'Your post has been created!',
      );
      await navigationService.pushNamedAndRemoveUntil(Routes.homeViewRoute);
    }

    setBusy(false);
  }

  void setEditingPost(Post editingPost) {
    _editingPost = editingPost;
  }
}
