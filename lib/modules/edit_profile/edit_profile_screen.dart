import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:socialapp/modules/social_layout/cubit/cubit.dart';
import 'package:socialapp/modules/social_layout/cubit/states.dart';
import 'package:socialapp/shared/components/components.dart';
import 'package:socialapp/shared/style/icon_broken.dart';
class EditProfileScreen extends StatelessWidget {
  var NameController = TextEditingController();
  var BioController = TextEditingController();

  var PhoneController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SocialCubit,SocialStates>(
      listener:(context,state){} ,
      builder: (context,state){
        var userModel = SocialCubit.get(context).userModel;
        var profileImage = SocialCubit.get(context).profileImage;
        var CoverImage = SocialCubit.get(context).coverImage;
        NameController.text = userModel.name;
        BioController.text  =userModel.bio;
        PhoneController.text = userModel.phone;
        return Scaffold(
          appBar:defaultAppBar(
              context: context,
              title: 'Edit Profile',
              actions:[
                defaultTextButton(
                  function: (){
                    SocialCubit.get(context).updateUserData(
                        name: NameController.text,
                        phone: PhoneController.text,
                        bio: BioController.text);
                  },
                  text: 'update',
                ),
                SizedBox(
                  width: 15.0,
                ),
              ]
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  if(state is SocialUserLoadingSuccessState)
                    LinearProgressIndicator(),

                  SizedBox(
                    height:10.0,
                  ),
                  Container(
                    height: 180,
                    child: Stack(
                      alignment: AlignmentDirectional.bottomCenter,
                      children: [
                        Align(
                          child: Stack(
                            alignment: AlignmentDirectional.topEnd,
                            children: [
                              Container(
                                height: 140,
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(4.0),
                                    topRight: Radius.circular(4.0),
                                  ),
                                  image: DecorationImage(
                                    image:CoverImage == null ? NetworkImage(

                                      '${userModel.cover}',                            ) :FileImage(CoverImage) ,
                                    fit:BoxFit.cover,


                                  ),
                                ),
                              ),
                              IconButton(
                                  onPressed: (){
                                    SocialCubit.get(context).getCoverImage();
                                  },
                                  icon: CircleAvatar(
                                    radius: 20.0,
                                      child: Icon(
                                          IconBroken.Camera,
                                        size:16.0,
                                      ),
                                  ),
                              ),
                            ],
                          ),
                          alignment: AlignmentDirectional.topCenter,
                        ),

                        Stack(
                          alignment: AlignmentDirectional.bottomEnd,

                          children: [
                            CircleAvatar(
                              radius: 54,
                              backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                              child: CircleAvatar(
                                radius: 50.0,
                                backgroundImage: profileImage== null ? NetworkImage('${userModel.image}'):FileImage(profileImage),
                              ),
                            ),
                            IconButton(
                              onPressed: (){
                                SocialCubit.get(context).getProfileImage();
                              },
                              icon: CircleAvatar(
                                radius: 20.0,
                                child: Icon(
                                  IconBroken.Camera,
                                  size:16.0,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  if(SocialCubit.get(context).profileImage != null || SocialCubit.get(context).coverImage != null)
                     Row(
                     children:
                     [
                      if(SocialCubit.get(context).profileImage != null)
                        Expanded(
                        child: Column(
                          children: [
                            defaultButton(function: (){
                              SocialCubit.get(context).uploadProfileImage(
                                  name: NameController.text,
                                  phone: PhoneController.text,
                                  bio: BioController.text);
                            }
                            , text:'upload profile '
                            ),
                            SizedBox(
                              height: 5.0,
                            ),
                            if(state is SocialUserLoadingSuccessState)
                               LinearProgressIndicator(),

                          ],
                        ),


                      ),
                      SizedBox(
                        width: 5.0,
                      ),
                      if(SocialCubit.get(context).coverImage != null)

                         Expanded(
                        child: Column(
                          children: [
                            defaultButton(function: (){
                              SocialCubit.get(context).uploadCoverImage(
                                  name: NameController.text,
                                  phone: PhoneController.text,
                                  bio: BioController.text);
                            }
                                , text:'upload cover '
                            ),
                            SizedBox(
                              height: 5.0,
                            ),

                            if(state is SocialUserLoadingSuccessState)
                              LinearProgressIndicator(),
                          ],
                        ),
                      ),
                    ],
                  ),
                     SizedBox(
                    height: 20.0,
                  ),

                  defaultFormField(
                    controller: NameController,
                    type: TextInputType.name,
                    validate: (String value){
                      if (value.isEmpty){
                        return 'name must not be empty';
                      }
                      return null ;
                    },
                    label: 'Name',
                    prefix: IconBroken.User,
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  defaultFormField(
                    controller: BioController,
                    type: TextInputType.text,
                    validate: (String value){
                      if (value.isEmpty){
                        return 'Bio must not be empty';
                      }
                      return null ;
                    },
                    label: 'Bio',
                    prefix: IconBroken.Info_Circle,
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  defaultFormField(
                    controller: PhoneController,
                    type: TextInputType.phone,
                    validate: (String value){
                      if (value.isEmpty){
                        return 'phone must not be empty';
                      }
                      return null;
                    },
                    label: 'Phone',
                    prefix: IconBroken.Call,
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
