import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:compound/src/app/models/post.dart';
import 'package:compound/src/app/models/user.dart';
import 'package:flutter/services.dart';

class FirestoreService {
  final CollectionReference _usersCollectionReference =
      Firestore.instance.collection('users');
  final CollectionReference _postsCollectionReference =
      Firestore.instance.collection('posts');

  final StreamController _postsController =
      StreamController<List<Post>>.broadcast();

  Future createUser(User user) async {
    try {
      await _usersCollectionReference.document(user.id).setData(
            user.toJson(),
          );
    } catch (e) {
      if (e is PlatformException) {
        return e.message;
      }
      return e.toString();
    }
  }

  Future getUser(String uid) async {
    try {
      var userData = await _usersCollectionReference.document(uid).get();

      return User.fromJson(userData.data);
    } catch (e) {
      if (e is PlatformException) {
        return e.message;
      }
      return e.toString();
    }
  }

  Future addPost(Post post) async {
    try {
      await _postsCollectionReference.add(post.toJson());
    } catch (e) {
      if (e is PlatformException) {
        return e.message;
      }
      return e.toString();
    }
  }

  Future getPostsOnceOff() async {
    try {
      var postDocumentSnapshot = await _postsCollectionReference.getDocuments();

      if (postDocumentSnapshot.documents.isNotEmpty) {
        return postDocumentSnapshot.documents
            .map(
              (snapshot) => Post.fromJson(snapshot.data, snapshot.documentID),
            )
            .where(
              (mappedPost) => mappedPost.title != null,
            )
            .toList();
      }
    } catch (e) {
      if (e is PlatformException) {
        return e.message;
      }
      return e.toString();
    }
  }

  Stream listenToPostsRealTime() {
    _postsCollectionReference.snapshots().listen((postsSnapshot) {
      if (postsSnapshot.documents.isNotEmpty) {
        var posts = postsSnapshot.documents
            .map(
              (snapshot) => Post.fromJson(snapshot.data, snapshot.documentID),
            )
            .where(
              (mappedPost) => mappedPost.title != null,
            )
            .toList();
        _postsController.add(posts);
      }
    });

    return _postsController.stream;
  }

  Future deletePost(String documentId) async {
    await _postsCollectionReference.document(documentId).delete();
  }

  Future updatePost(Post post) async {
    try {
      await _postsCollectionReference
          .document(post.documentId)
          .updateData(post.toJson());
    } catch (e) {
      if (e is PlatformException) {
        return e.message;
      }
      return e.toString();
    }
  }
}
