import 'package:compound/src/app/models/post.dart';
import 'package:compound/src/app/router/router.gr.dart';
import 'package:compound/src/ui/global/custom_base_view_model.dart';

class HomeViewModel extends CustomBaseViewModel {
  Future initialize() async {
    listenToPosts();
  }

  List<Post> _posts;
  List<Post> get posts => _posts;

  void listenToPosts() {
    setBusy(true);
    firestoreService.listenToPostsRealTime().listen((postsData) {
      List<Post> updatedPosts = postsData;

      if (updatedPosts != null && updatedPosts.length > 0) {
        _posts = updatedPosts;
        notifyListeners();
      }
    });
    setBusy(false);
  }

  Future deletePost(int index) async {
    setBusy(true);

    var dialogResponse = await dialogService.showConfirmationDialog(
      title: 'Are you sure?',
      description: 'Do you really want to delete the post?',
      confirmationTitle: 'Yes',
      cancelTitle: 'Nope',
    );

    if (dialogResponse.confirmed) {
      Post postToDelete = _posts[index];
      await firestoreService.deletePost(postToDelete.documentId);
      await cloudStorageService.deleteImage(postToDelete.imageFilePath);
    }

    setBusy(false);
  }

  Future<void> editPost(int index) async {
    await navigateToCreatePostView(
      arguments: CreatePostViewArguments(
        editingPost: _posts[index],
      ),
    );
  }

  Future navigateToCreatePostView({Object arguments}) async {
    arguments != null
        ? await navigationService.navigateTo(
            Routes.createPostViewRoute,
            arguments: arguments,
          )
        : await navigationService.navigateTo(
            Routes.createPostViewRoute,
          );
    ;
  }

  Future<void> signOut() async {
    setBusy(true);
    await authenticationService.signOut();
    await navigationService.pushNamedAndRemoveUntil(Routes.signUpViewRoute);
  }
}
