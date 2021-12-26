import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:socialapp/modules/social_layout/cubit/cubit.dart';
import 'package:socialapp/modules/social_layout/cubit/states.dart';
import 'package:socialapp/shared/components/components.dart';
import 'package:socialapp/shared/style/icon_broken.dart';
class NewPostScreen extends StatelessWidget {
  var textController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SocialCubit,SocialStates>(
      listener: (context,state){},
      builder: (context,state){
        return Scaffold(
          appBar:defaultAppBar(
            context: context,
            title: 'Create Post',
            actions: [
              defaultTextButton(
                  function: (){
                    var now = DateTime.now();
                    if(SocialCubit.get(context).postImage == null)
                      {
                        SocialCubit
                            .get(context)
                            .createPost(
                            dateTime:now.toString() ,
                            text: textController.text);

                      }
                    else
                      {
                        SocialCubit
                            .get(context)
                            .UploadPostImage(
                            dateTime: now.toString(),
                            text: textController.text);
                      }
                  },
                  text: 'Post')
            ],
          ),
          body: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                if(state is SocialCreatePostLoadingState)
                   LinearProgressIndicator(),
                if(state is SocialCreatePostLoadingState)
                //  LinearProgressIndicator(),
                SizedBox(
                  height: 10.0,
                ),
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
                      child: Text(
                        'Eman Saeed',
                        style: TextStyle(
                            height:1.4
                        ),
                      ),

                    ),
                  ],
                ),
                Expanded(
                  child: TextFormField(
                    controller: textController,
                    decoration: InputDecoration(
                      hintText: 'What is on your mind ...',
                      border: InputBorder.none,
                    ),
                  ),
                ),
                if(SocialCubit.get(context).postImage !=null)

                  Stack(
                  alignment: AlignmentDirectional.topEnd,
                  children: [
                    Container(
                      height: 140,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4.0),
                        image: DecorationImage(
                          image:FileImage(SocialCubit.get(context).postImage),
                          fit:BoxFit.cover,
                        ),
                      ),
                    ),
                    IconButton(
                      onPressed: (){
                       SocialCubit.get(context).removePostImage();
                      },
                      icon: CircleAvatar(
                        radius: 20.0,
                        child: Icon(
                          Icons.close,
                          size:16.0,
                        ),

                      ),

                    ),
                  ],
                ),
                SizedBox(
                  height: 10.0,
                ),
                Row(
                  children: [
                    Expanded(
                      child: TextButton(
                          onPressed: (){
                            SocialCubit.get(context).getpostImage();
                          },
                          child:
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                IconBroken.Image,
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Text(
                                'Add photo'
                              ),
                            ],

                          ),
                      ),
                    ),
                    Expanded(
                      child: TextButton(
                        onPressed: (){},
                        child:
                        Text(
                            '# tags'
                        ),
                      ),
                    ),



                  ],
                ),

              ],
            ),

          ),

        );
      },

    );
  }
}
