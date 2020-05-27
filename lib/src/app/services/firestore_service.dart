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

  DocumentSnapshot _lastDocumentSnapshot;
  // Paged Structure
  List<List<Post>> _allPagedResults = List<List<Post>>();
  bool _hasMorePosts = true;

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
    _requestPosts();
    return _postsController.stream;
  }

  void _requestPosts() {
    var pagePostsQuery = _postsCollectionReference.orderBy('title').limit(20);

    if (_lastDocumentSnapshot != null) {
      pagePostsQuery = pagePostsQuery.startAfterDocument(_lastDocumentSnapshot);
    }

    if (!_hasMorePosts) return;

    var currentRequestIndex = _allPagedResults.length;

    pagePostsQuery.snapshots().listen((postsSnapshot) {
      if (postsSnapshot.documents.isNotEmpty) {
        var posts = postsSnapshot.documents
            .map(
              (snapshot) => Post.fromJson(snapshot.data, snapshot.documentID),
            )
            .where(
              (mappedPost) => mappedPost.title != null,
            )
            .toList();

        // Does the page exist or not
        var pageExists = currentRequestIndex < _allPagedResults.length;

        // If the page exists update the values to the new posts
        if (pageExists) {
          _allPagedResults[currentRequestIndex] = posts;
        }
        // If the page doesn't exist add the page data
        else {
          _allPagedResults.add(posts);
        }

        var allPosts = _allPagedResults.fold<List<Post>>(
          List<Post>(),
          (initialValue, pageItems) => initialValue..addAll(pageItems),
        );

        // Broadcast all posts in the page structure
        _postsController.add(posts);

        // Save the last document form the results. ONLY if it's the current last page
        if (currentRequestIndex == _allPagedResults.length - 1) {
          _lastDocumentSnapshot = postsSnapshot.documents.last;
        }

        // Determine if there's more posts to request
        _hasMorePosts = posts.length == 5;
      }
    });
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

  void requestMoreData() => _requestPosts();
}
