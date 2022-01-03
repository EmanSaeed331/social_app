import 'package:flutter/material.dart';
import 'package:socialapp/modules/social_layout/cubit/cubit.dart';
import 'package:socialapp/shared/components/components.dart';
import 'package:socialapp/shared/style/colors.dart';
import 'package:socialapp/shared/style/icon_broken.dart';
class CommentsScreen extends StatelessWidget {
  var commentController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Comments'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Card(
               child: ListView.separated(
                  shrinkWrap: true,
                    itemBuilder: (context,index) => BuildCommentItem(context),
                    separatorBuilder: (context,index)=> SizedBox(height: 20.0),
                    itemCount: 10),



    ),
        ),
      )
    );
  }
  Widget BuildCommentItem(context) =>Card(
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
                  'https://image.freepik.com/free-photo/horizontal-shot-smiling-curly-haired-woman-indicates-free-space-demonstrates-place-your-advertisement-attracts-attention-sale-wears-green-turtleneck-isolated-vibrant-pink-wall_273609-42770.jpg',
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
                          'Eman Saeed',
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
                      '12204984398',
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
              'comment ',
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
          // if(model.postImage != '')
          //   Padding(
          //     padding: const EdgeInsetsDirectional.only(
          //         top:15.0
          //     ),
          //     child: Container(
          //       height: 140,
          //       width: double.infinity,
          //       decoration: BoxDecoration(
          //         borderRadius: BorderRadius.circular(4.0),
          //         image: DecorationImage(
          //           image: NetworkImage(
          //               '${model.postImage}'
          //           ),
          //           fit:BoxFit.cover,
          //
          //
          //         ),
          //       ),
          //     ),
          //   ),

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
                          SizedBox(
                            width: 5,
                          ),
                          // Text(
                          //   '${SocialCubit.get(context).likes[index]}',
                          //   style: Theme.of(context).textTheme.caption,
                          // ),


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

        ],
      ),


    ),
  );

  }

