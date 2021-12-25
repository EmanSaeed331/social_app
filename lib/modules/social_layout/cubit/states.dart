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
