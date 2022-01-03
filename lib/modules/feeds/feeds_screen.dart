import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:socialapp/models/post_model.dart';
import 'package:socialapp/modules/comments/comments_screen.dart';
import 'package:socialapp/modules/social_layout/cubit/cubit.dart';
import 'package:socialapp/modules/social_layout/cubit/states.dart';
import 'package:socialapp/shared/components/components.dart';
import 'package:socialapp/shared/style/colors.dart';
import 'package:socialapp/shared/style/icon_broken.dart';

class FeedsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer <SocialCubit,SocialStates>(
      listener: (context,state){},
      builder: (context,state){
        return ConditionalBuilder(
          condition:SocialCubit.get(context).posts.length  > 0
              && SocialCubit.get(context).userModel != null ,
          builder: (context)=> SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Column(
              children: [
                Card(
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  elevation: 5.0,
                  margin: EdgeInsets.all(8.0),
                  child: Stack(
                    alignment: AlignmentDirectional.bottomEnd,
                    children: [
                      Image(
                        image:NetworkImage(
                          'https://image.freepik.com/free-photo/horizontal-shot-smiling-curly-haired-woman-indicates-free-space-demonstrates-place-your-advertisement-attracts-attention-sale-wears-green-turtleneck-isolated-vibrant-pink-wall_273609-42770.jpg',
                        ),
                        fit: BoxFit.cover,
                        height: 200.0,
                        width: double.infinity,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text('Communicate with friends ',
                          style: Theme.of(context).textTheme.subtitle1,
                        ),
                      ),
                    ],
                  ),
                ),
                ListView.separated(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder:(context,index)=>
                      buildPostItem(SocialCubit.get(context).posts[index],context,index),
                  itemCount: SocialCubit.get(context).posts.length,
                  separatorBuilder: (context,index) => SizedBox(
                    height: 8.0,
                  ),

                ),
                SizedBox(
                  height: 8.0,
                ),

              ],
            ),
          ),
          fallback: (context)=> Center(child: CircularProgressIndicator()),

        );
      },

    );

  }
  Widget buildPostItem(PostModel model,context , index) =>Card(
    clipBehavior: Clip.antiAliasWithSaveLayer,
    elevation: 5.0,
    margin: EdgeInsets.symmetric(
      horizontal: 8.0,
    ),
    child: Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,

        children: [
          Row(
            children: [
              CircleAvatar(
                radius: 25.0,
                backgroundImage: NetworkImage(
                    '${model.image}'
                ),
              ),
              SizedBox(width: 15,),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          '${model.name}',
                          style: TextStyle(
                              height:1.4
                          ),
                        ),
                        SizedBox(
                          width: 5.0,
                        ),
                        Icon(
                          Icons.check_circle,
                          color: defaultColor,
                          size: 16.0,
                        ),
                      ],
                    ),
                    Text(
                      '${model.dateTime}',
                      style: Theme.of(context).textTheme.caption.copyWith(height: 1.4),
                    ),
                  ],
                ),
              ),
              SizedBox(width: 15,),
              IconButton(
                onPressed: (){},
                icon: Icon(
                  Icons.more_horiz,
                  size: 16.0,
                ),
              ),

            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 15.0,
            ),
            child: Container(
              width: double.infinity,
              height: 1.0,
              color:Colors.grey[300],
            ),
          ),
          Text(
            '${model.text}',
              style: Theme.of(context).textTheme.subtitle1
          ),
          Padding(
            padding: const EdgeInsets.only(
              bottom: 10.0,
              top:5,
            ),
            child: Container(
              width: double.infinity,
              child: Wrap(
                children:
                [
                  Padding(
                    padding: const EdgeInsetsDirectional.only(
                      end:6.0,
                    ),
                    child: Container(
                      height: 25.0,
                      child: MaterialButton(
                        child: Text('#Software',
                            style:Theme.of(context).textTheme.caption.copyWith(
                              color: defaultColor,

                            )
                        ),
                        height: 20,
                        padding: EdgeInsets.zero,
                        minWidth: 1.0,
                        onPressed: (){},

                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          if(model.postImage != '')
            Padding(
            padding: const EdgeInsetsDirectional.only(
              top:15.0
            ),
            child: Container(
              height: 140,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4.0),
                image: DecorationImage(
                  image: NetworkImage(
                    '${model.postImage}'
                  ),
                  fit:BoxFit.cover,


                ),
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 5.0,
            ),
            child: Row(
              children: [
                Expanded(
                  child: InkWell(

                    child:Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 5,
                      ),
                      child: Row(
                        children: [
                          Icon(
                              IconBroken.Heart,
                              size: 16.0,
                              color:Colors.red
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            '${SocialCubit.get(context).likes[index]}',
                            style: Theme.of(context).textTheme.caption,
                          ),


                        ],
                      ),
                    ),
                    onTap:(){

                    },
                  ),
                ),
                Expanded(
                  child: InkWell(
                    child:Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 5.0,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Icon(
                              IconBroken.Chat,
                              size: 16.0,
                              color:Colors.amber
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          GestureDetector(
                            onTap: (){
                              navigateTo(context, CommentsScreen());
                            },
                            child: Text(
                              'Comments',
                              style: Theme.of(context).textTheme.caption,
                            ),
                          ),


                        ],
                      ),
                    ),
                    onTap:(){},

                  ),
                ),

              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              bottom: 10.0,
            ),
            child: Container(
              width: double.infinity,
              height: 1.0,
              color:Colors.grey[300],
            ),
          ),
          Row(
            children: [
              Expanded(
                child: InkWell(
                  child: Row(
                    children: [
                      CircleAvatar(
                        radius: 18.0,
                        backgroundImage: NetworkImage(
                          '${SocialCubit.get(context).userModel.image}'
                        ),
                      ),
                      SizedBox(width: 15,),
                      Text('write a comment...',
                        style:Theme.of(context).textTheme.caption,
                      ),
                    ],
                  ),
                  onTap: (){},
                ),
              ),
              InkWell(

                child:Row(
                  children: [
                    Icon(
                        IconBroken.Heart,
                        size: 16.0,
                        color:Colors.red
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      'Like',
                      style: Theme.of(context).textTheme.caption,
                    ),


                  ],
                ),
                onTap:(){
                  SocialCubit
                      .get(context)
                      .likePost(
                      SocialCubit
                          .get(context)
                          .postsId[index]
                  );
                },

              ),

            ],
          ),

        ],
      ),


    ),
  );

}
