import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
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
  File coverImage;
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
}
