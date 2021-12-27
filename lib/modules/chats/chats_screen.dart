import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
        return  ListView.separated(
          physics: BouncingScrollPhysics(),
            itemBuilder: (context,index)=>builChatItem(),
            separatorBuilder: (context,index)=> myDivider(),
            itemCount: 10);
      },

    );

  }
  Widget builChatItem () => InkWell(
    onTap: (){},
    child: Padding(
      padding: const EdgeInsets.all(20.0),
      child: Row(
        children: [
          CircleAvatar(
            radius: 25.0,
            backgroundImage: NetworkImage(
                'https://image.freepik.com/free-photo/image-young-business-woman-apologizing-shrugging-shoulders-looking-confused-dont-know-standing-white_176420-41076.jpg'          ),
          ),
          SizedBox(width: 15,),
          Text(
            'Eman Saeed',
            style: TextStyle(
                height:1.4
            ),
          ),
        ],
      ),
    ),
  );
}
