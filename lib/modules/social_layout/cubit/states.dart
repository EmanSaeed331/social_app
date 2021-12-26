abstract class SocialStates {}

class SocialIntialState extends SocialStates {}

class SocialGetUserLoadingState extends SocialStates {}

class SocialGetUserSuccessState extends SocialStates {}

class SocialGetUserErrorState extends SocialStates {
  final String error;
  SocialGetUserErrorState(this.error);
}

class SocialChangeBottomNavBarState extends SocialStates {}
class SocialNewPostState extends SocialStates {}
class SocialProfileImagePickedSuccessState extends SocialStates {}
class SocialProfileImagePickedErrorState extends SocialStates {}
class SocialCoverImagePickedSuccessState extends SocialStates {}
class SocialCoverImagePickedErrorState extends SocialStates {}

class SocialUploadProfileImageSuccessState extends SocialStates {}
class SocialUploadProfileImageErrorState extends SocialStates {}

class SocialUploadCoverImageSuccessState extends SocialStates {}
class SocialUploadCoverImageErrorState extends SocialStates {}
class SocialUserUpdateErrorState extends SocialStates{}

class SocialUserUpdateState extends SocialStates {}
class SocialUserLoadingSuccessState extends SocialStates {}
class SocialUserLoadingErrorState extends SocialStates {}

class SocialPostImagePickedSuccessState extends SocialStates {}
class SocialPostImagePickedErrorState extends SocialStates {}

class SocialCreatePostLoadingState extends SocialStates{}
class SocialCreatePostSuccessState extends SocialStates{}

class SocialCreatePostErrorState extends SocialStates {}
class SocialRemovePostImageState extends SocialStates {}

class SocialGetPostsLoadingState extends SocialStates {}

class SocialGetPostsSuccessState extends SocialStates {}

class SocialGetPostsErrorState extends SocialStates {
  final String error;
  SocialGetPostsErrorState(this.error);
}
class SocialLikePostsLoadingState extends SocialStates {}

class SocialLikePostsSuccessState extends SocialStates {}

class SocialLikePostsErrorState extends SocialStates {
  final String error;
  SocialLikePostsErrorState(this.error);
}
