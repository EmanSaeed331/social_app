import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:socialapp/models/social_user_model.dart';
import 'package:socialapp/modules/social_layout/cubit/cubit.dart';
import 'package:socialapp/modules/social_layout/cubit/states.dart';
import 'package:socialapp/shared/components/components.dart';
import 'package:socialapp/shared/style/colors.dart';

class ChatsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SocialCubit,SocialStates>(
      listener: (context,state){},
      builder: (context,state){
        return  ConditionalBuilder(
          condition: SocialCubit.get(context).users.length > 0,
          builder:(context) => ListView.separated(
              physics: BouncingScrollPhysics(),
              itemBuilder: (context,index)=>builChatItem(SocialCubit.get(context).users[index]),
              separatorBuilder: (context,index)=> myDivider(),
              itemCount: SocialCubit.get(context).users.length),
          fallback:(context)=>Center(child: CircularProgressIndicator()) ,
        );
      },

    );

  }
  Widget builChatItem (SocialUserModel model ) => InkWell(
    onTap: (){},
    child: Padding(
      padding: const EdgeInsets.all(20.0),
      child: Row(
        children: [
          CircleAvatar(
            radius: 25.0,
            backgroundImage: NetworkImage(
                '${model.image}'        ),
          ),
          SizedBox(width: 15,),
          Text(
            '${model.name}',
            style: TextStyle(
                height:1.4
            ),
          ),
        ],
      ),
    ),
  );
}
