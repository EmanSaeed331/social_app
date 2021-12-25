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
        return Scaffold(

          appBar:defaultAppBar(
              context: context,
              title: 'Edit Profile',
              actions:[
                defaultTextButton(
                  function: (){},
                  text: 'update',
                ),
                SizedBox(
                  width: 15.0,
                ),
              ]
          ),
          body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
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
              ],
            ),
          ),
        );
    },
    );
  }
}
