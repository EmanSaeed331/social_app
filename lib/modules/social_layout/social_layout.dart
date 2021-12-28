import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:conditional_builder/conditional_builder.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:socialapp/modules/new_post/new_post_screen.dart';
import 'package:socialapp/modules/social_layout/cubit/cubit.dart';
import 'package:socialapp/modules/social_layout/cubit/states.dart';
import 'package:socialapp/shared/components/components.dart';
import 'package:socialapp/shared/style/icon_broken.dart';

class SocialLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SocialCubit, SocialStates>(
      listener: (context, state) {
        if(state is SocialNewPostState){
          navigateTo(context, NewPostScreen());
        }
      },
      builder: (context, state) {
        var cubit = SocialCubit.get(context);
        return Scaffold(
          //backgroundColor: Colors.white,
          appBar: AppBar(
            title: Text(
              cubit.titles[cubit.currentIndex],
              style: TextStyle(color: Colors.black),
            ),
            actions: [
             IconButton(onPressed: (){},
                icon: Icon(
                  IconBroken.Notification
                )),
              IconButton(onPressed: (){},
                  icon: Icon(
                      IconBroken.Search
                  )),

            ],

          ),
          body: cubit.screens[cubit.currentIndex],
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: cubit.currentIndex,
            onTap: (index) {
              cubit.changeBottomNav(index);
            },
            items: [
              BottomNavigationBarItem(
                icon: Icon(IconBroken.Home),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(IconBroken.Chat),
                label: 'Chat',
              ),
              BottomNavigationBarItem(
                icon: Icon(IconBroken.Paper_Upload),
                label: 'Post ',
              ),
              BottomNavigationBarItem(
                icon: Icon(IconBroken.Setting),
                label: 'Setting',
              ),

            ],
          ),
        );
      },
    );
  }
}
/*email verification
* ConditionalBuilder(
            condition: SocialCubit.get(context).model != null,
            builder: (context){
              var model = SocialCubit.get(context).model;
              return Column(
                children: [
                if(!FirebaseAuth.instance.currentUser.emailVerified)
                    Container(
                    color:Colors.amber.withOpacity(.6),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20.0,
                      ),
                      child: Row(
                        children: [
                          Icon(
                            Icons.info_outline,
                          ),
                          SizedBox(width: 15.0,),
                          Expanded(
                            child: Text(
                              'please verify your email',
                            ),
                          ),
                          SizedBox(width: 20.0,),
                          defaultTextButton(

                            function: (){
                              FirebaseAuth
                                  .instance
                                  .currentUser
                                  .sendEmailVerification().then((value) {

                              }).catchError((error){
                                showToast(text: 'check your mail ', state: ToastStates.SUCCESS);
                              });
                            },
                            text: 'Send ',

                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              );
            },
            fallback: (context) => Center(child: CircularProgressIndicator()),
          ),
*
*
*
* */
