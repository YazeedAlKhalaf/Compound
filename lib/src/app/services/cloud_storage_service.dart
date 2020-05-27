import 'dart:io';

import 'package:compound/src/app/locator/locator.dart';
import 'package:compound/src/app/models/cloud_storage_result.dart';
import 'package:compound/src/app/services/authentication_service.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';

class CloudStorageService {
  final AuthenticationService _authenticationService =
      locator<AuthenticationService>();

  Future<CloudStorageResult> uploadImage({
    @required File imageToUpload,
    @required String title,
  }) async {
    String imageFileName =
        "$title-${DateTime.now().millisecondsSinceEpoch.toString()}";
    String imageFilePath =
        "${_authenticationService.currentUser.id}/$imageFileName";

    // Get the refernece to the file we want to create
    final StorageReference firebaseStorageRef =
        FirebaseStorage.instance.ref().child(imageFilePath);

    StorageUploadTask uploadTask = firebaseStorageRef.putFile(imageToUpload);
    StorageTaskSnapshot storageTaskSnapshot = await uploadTask.onComplete;

    var downloadUrl = await storageTaskSnapshot.ref.getDownloadURL();

    if (uploadTask.isComplete) {
      String url = downloadUrl.toString();
      return CloudStorageResult(
        imageUrl: url,
        imageFileName: imageFileName,
        imageFilePath: imageFilePath,
      );
    }

    return null;
  }

  Future<void> deleteImage(String imageFilePath) async {
    final StorageReference firebaseStorageRef =
        FirebaseStorage.instance.ref().child(imageFilePath);

    try {
      await firebaseStorageRef.delete();
    } catch (e) {
      return e.toString();
    }
  }
}
