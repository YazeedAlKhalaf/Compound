import 'dart:io';

import 'package:compound/src/app/models/cloud_storage_result.dart';
import 'package:compound/src/app/models/post.dart';
import 'package:compound/src/app/router/router.gr.dart';
import 'package:compound/src/ui/global/custom_base_view_model.dart';
import 'package:flutter/foundation.dart';

class CreatePostViewModel extends CustomBaseViewModel {
  Post _editingPost;

  bool get _editing => _editingPost != null;

  File _selectedImage;
  File get selectedImage => _selectedImage;

  Future<void> selectImage() async {
    setBusy(true);
    var tempImage = await imageSelector.selectImage();
    if (tempImage != null) {
      _selectedImage = tempImage;
      notifyListeners();
    }
    setBusy(false);
  }

  Future addPost({
    @required String title,
  }) async {
    setBusy(true);

    CloudStorageResult cloudStorageResult;

    if (!_editing) {
      cloudStorageResult = await cloudStorageService.uploadImage(
        imageToUpload: _selectedImage,
        title: title,
      );
    }

    var result;
    if (!_editing) {
      result = await firestoreService.addPost(
        Post(
          title: title,
          userId: currentUser.id,
          imageUrl: cloudStorageResult.imageUrl,
          imageFileName: cloudStorageResult.imageFileName,
          imageFilePath: cloudStorageResult.imageFilePath,
        ),
      );
    } else {
      result = await firestoreService.updatePost(
        Post(
          title: title,
          userId: _editingPost.userId,
          documentId: _editingPost.documentId,
          imageUrl: _editingPost.imageUrl,
          imageFileName: _editingPost.imageFileName,
          imageFilePath: _editingPost.imageFilePath,
        ),
      );
    }

    if (result is String) {
      await dialogService.showDialog(
        title: 'Could not create post',
        description: result,
      );
    } else {
      await analyticsService.logPostCreated(
        hasImage: _selectedImage != null,
      );
      await dialogService.showDialog(
        title: 'Post Successfully Added',
        description: 'Your post has been created!',
      );
      navigationService.popRepeated(1);
    }

    setBusy(false);
  }

  void setEditingPost(Post editingPost) {
    _editingPost = editingPost;
  }
}
