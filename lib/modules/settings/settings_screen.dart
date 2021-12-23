import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:socialapp/modules/social_layout/cubit/cubit.dart';
import 'package:socialapp/modules/social_layout/cubit/states.dart';
import 'package:socialapp/shared/components/components.dart';
import 'package:socialapp/shared/style/icon_broken.dart';

class SettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SocialCubit,SocialStates>(
      listener: (context,state){},
      builder: (context,state){
        var userModel = SocialCubit.get(context).model;
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Container(
                height: 180,
                child: Stack(
                  alignment: AlignmentDirectional.bottomCenter,
                  children: [
                    Align(

                      child: Container(
                        height: 140,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(4.0),
                            topRight: Radius.circular(4.0),
                          ),
                          image: DecorationImage(
                            image: NetworkImage(
                                '${userModel.cover}',                            ),
                            fit:BoxFit.cover,


                          ),
                        ),
                      ),
                      alignment: AlignmentDirectional.topCenter,
                    ),

                    CircleAvatar(
                      radius: 54,
                      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                      child: CircleAvatar(
                        radius: 50.0,
                        backgroundImage: NetworkImage(
                          '${userModel.image}',                         ),
                      ),
                    ),

                  ],
                ),
              ),
              SizedBox(
                height: 5.0,
              ),
              Text('${userModel.name}',
                style: Theme.of(context).textTheme.bodyText1,
              ),
              Text('${userModel.bio}' ,
                style: Theme.of(context).textTheme.caption,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 20.0,

                ),
                child: Row(
                  children: [
                    Expanded(

                      child: InkWell(
                        onTap:(){},
                        child: Column(
                          children: [
                            Text('100',
                              style: Theme.of(context).textTheme.subtitle2,
                            ),
                            Text('posts',
                              style: Theme.of(context).textTheme.caption,
                            ),
                          ],
                        ),
                      ),
                    ),
                    Expanded(

                      child: InkWell(
                        onTap:(){},
                        child: Column(
                          children: [
                            Text('220',
                              style: Theme.of(context).textTheme.subtitle2,
                            ),
                            Text('Photos',
                              style: Theme.of(context).textTheme.caption,
                            ),
                          ],
                        ),
                      ),
                    ),
                    Expanded(

                      child: InkWell(
                        onTap:(){},
                        child: Column(
                          children: [
                            Text('10k',
                              style: Theme.of(context).textTheme.subtitle2,
                            ),
                            Text('Followers',
                              style: Theme.of(context).textTheme.caption,
                            ),
                          ],
                        ),
                      ),
                    ),
                    Expanded(

                      child: InkWell(
                        onTap:(){},
                        child: Column(
                          children: [
                            Text('64',
                              style: Theme.of(context).textTheme.subtitle2,
                            ),
                            Text('Followings',
                              style: Theme.of(context).textTheme.caption,
                            ),
                          ],
                        ),
                      ),
                    ),


                  ],
                ),
              ),
              Row(
                children: [
                  Expanded(
                    child: OutlinedButton(
                      onPressed:(){},
                      child: Text(
                        'Add Photos'
                      ),
                    ),
                  ),
                  SizedBox(width: 10,),
                  OutlinedButton(
                    onPressed:(){},

                    child: Icon(
                      IconBroken.Edit,
                      size: 16.0,
                    ),
                  ),
                ],
              ),

            ],


          ),
        );
      },
    );


  }
}
