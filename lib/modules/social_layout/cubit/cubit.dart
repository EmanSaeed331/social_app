import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:socialapp/models/post_model.dart';
import 'package:socialapp/models/social_user_model.dart';
import 'package:socialapp/modules/chats/chats_screen.dart';
import 'package:socialapp/modules/feeds/feeds_screen.dart';
import 'package:socialapp/modules/new_post/new_post_screen.dart';
import 'package:socialapp/modules/settings/settings_screen.dart';
import 'package:socialapp/modules/social_layout/cubit/states.dart';
import 'package:socialapp/modules/users/users_screen.dart';
import 'package:socialapp/shared/components/constants.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

class SocialCubit extends Cubit<SocialStates> {
  SocialCubit() : super(SocialIntialState());
  static SocialCubit get(context) => BlocProvider.of(context);
  SocialUserModel userModel;
  int currentIndex = 0;
  List<Widget> screens = [
    FeedsScreen(),
    ChatsScreen(),
    NewPostScreen(),
    UsersScreen(),
    SettingsScreen(),
  ];
  List <String> titles = [
    'News Feeds',
    'Chat',
    'Post ',
    'Users',
    'Settings'
  ];
  void changeBottomNav(int index) {
    if(index == 2){
      emit(SocialNewPostState());

    }
    else{
      currentIndex = index;
      emit(SocialChangeBottomNavBarState());

    }

  }

  void getUserData() {
    emit(SocialGetUserLoadingState());
    FirebaseFirestore.instance.collection('Users').doc(uId).get().then((value) {
      print(value.data());
      userModel = SocialUserModel.fromJson(value.data());
      emit(SocialGetUserSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(SocialGetUserErrorState(error.toString()));
    });
  }

  File profileImage ;
  var picker = ImagePicker();
  Future<void> getProfileImage () async{
    final pickedFile = await picker.getImage(source: ImageSource.gallery);
    if (pickedFile != null){
      profileImage = File(pickedFile.path);
      emit(SocialProfileImagePickedSuccessState());
    }
    else{
      emit(SocialProfileImagePickedErrorState());
      print('No Image Selected');
    }

  }
  File coverImage;

  Future<void> getCoverImage () async{
    final pickedFile = await picker.getImage(source: ImageSource.gallery);
    if (pickedFile != null){
      coverImage = File(pickedFile.path);
      emit(SocialCoverImagePickedSuccessState());
    }
    else{
      emit(SocialCoverImagePickedErrorState());
      print('No Image Selected');
    }

  }

  File postImage;
  Future<void> getpostImage () async{
    final pickedFile = await picker.getImage(source: ImageSource.gallery);
    if (pickedFile != null){
      postImage = File(pickedFile.path);
      emit(SocialPostImagePickedSuccessState());
    }
    else{
      emit(SocialPostImagePickedErrorState());
      print('No Image Selected');
    }

  }

  void removePostImage(){
    postImage = null;
    emit(SocialRemovePostImageState());
  }
  void uploadProfileImage ({
    @required String name,
    @required String phone,
    @required String bio,
})
  {
    emit(SocialUserLoadingSuccessState());
    firebase_storage
    .FirebaseStorage
    .instance
    .ref()
    .child('users/${Uri.file(profileImage.path)
    .pathSegments.last}')
    .putFile(profileImage)
    .then((value) {
      value
      .ref
      .getDownloadURL()
      .then((value) {
       // emit(SocialUploadProfileImageSuccessState());
        print(value);
        updateUserData(
            name: name,
            phone: phone,
            bio: bio,
            image: value,
        );


      })
      .catchError((error){
        emit(SocialUploadProfileImageErrorState());

      });
    })
    .catchError((error){
      emit(SocialUploadProfileImageErrorState());

    });
  }

  void uploadCoverImage ({
    @required String name,
    @required String phone,
    @required String bio,
})
  {
    emit(SocialUserLoadingSuccessState());

    firebase_storage
        .FirebaseStorage
        .instance
        .ref()
        .child('users/${Uri.file(coverImage.path)
        .pathSegments.last}')
        .putFile(coverImage)
        .then((value) {
          value
          .ref
          .getDownloadURL()
          .then((value) {
            updateUserData(
                name: name,
                phone: phone,
                bio: bio ,
                cover : value,
            );
        print(value);
      })
          .catchError((error){
        emit(SocialUploadCoverImageErrorState());

      });
    })
        .catchError((error){
      emit(SocialUploadCoverImageErrorState());

    });
  }


void updateUserData({
  @required String name,
  @required String phone,
  @required String bio,
  String image,
  String cover,
})
{
  SocialUserModel model = SocialUserModel(
    email: userModel.email,
    name: name,
    phone: phone,
    uId: userModel.uId,
    bio:bio,
    isEmailVerified: false,
    cover:cover??userModel.cover,
    image:image??userModel.image,
  );
  FirebaseFirestore
      .instance
      .collection('Users')
      .doc(userModel.uId)
      .update(model.toMap())
      .then((value)
  {
    getUserData();
  } )
      .catchError((error){
    emit(SocialUserUpdateErrorState());
  });
  }

  void createPost({

    @required String dateTime,
    @required String text,
    String postImage
  })
  {
    emit(SocialCreatePostLoadingState());
    PostModel model = PostModel(
      name:  userModel.name,
      uId:   userModel.uId,
      image: userModel.image,
      dateTime: dateTime,
      text:text,
      postImage: postImage??'',

    );
    FirebaseFirestore
        .instance
        .collection('posts')
        .add(model.toMap())
        .then((value)
    {
      emit(SocialCreatePostSuccessState());
    } )
        .catchError((error){
      emit(SocialCreatePostErrorState());
    });
  }


  void UploadPostImage ({
    @required String dateTime,
    @required String text,


  })
  {
    emit(SocialCreatePostLoadingState());

    firebase_storage
        .FirebaseStorage
        .instance
        .ref()
        .child('posts/${Uri.file(postImage.path)
        .pathSegments.last}')
        .putFile(postImage)
        .then((value) {
      value
          .ref
          .getDownloadURL()
          .then((value) {
            createPost(
                dateTime: dateTime,
                text: text,
                postImage: value,
            );

        print(value);
      })
          .catchError((error){
        emit(SocialCreatePostErrorState());

      });
    })
        .catchError((error){
      emit(SocialCreatePostErrorState());

    });
  }


}
