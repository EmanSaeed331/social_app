
import 'package:flutter/material.dart';
import 'package:socialapp/models/social_user_model.dart';
import 'package:socialapp/shared/style/colors.dart';
import 'package:socialapp/shared/style/icon_broken.dart';
class ChatDetailsScreen extends StatelessWidget {
  SocialUserModel userModel ;
  ChatDetailsScreen({this.userModel});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        titleSpacing: 0.0,
        title: Row(
          children: [
            CircleAvatar(
              radius:20.0 ,
              backgroundImage: NetworkImage(
                '${userModel.image}',
              ),
            ),
            SizedBox(
              width: 15.0,
            ),
            Text(
              userModel.name,
            ),
          ],
        ),
      ),
      body : Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Align(
              alignment: AlignmentDirectional.centerStart,
              child: Container(
                decoration: BoxDecoration(
                  color:Colors.grey[300],
                  borderRadius: BorderRadiusDirectional.only(
                    bottomEnd: Radius.circular(10.0),
                    topStart: Radius.circular(10.0),
                    topEnd: Radius.circular(10.0),
                  ),
                ),
                padding: EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
                child: Text(
                  'Hello World '
                ),
              ),
            ),
            Align(
              alignment: AlignmentDirectional.centerEnd,
              child: Container(
                decoration: BoxDecoration(
                  color:defaultColor.withOpacity(0.2),
                  borderRadius: BorderRadiusDirectional.only(
                    bottomStart: Radius.circular(10.0),
                    topStart: Radius.circular(10.0),
                    topEnd: Radius.circular(10.0),
                  ),
                ),
                padding: EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
                child: Text(
                    'Hello World '
                ),
              ),
            ),
            Spacer(),
            Container(
              decoration: BoxDecoration(
                border:Border.all(
                  color: Colors.grey[300],
                  width: 1.0,
                ),
                borderRadius: BorderRadius.circular(15.0,),
              ),
              clipBehavior: Clip.antiAliasWithSaveLayer,
              child: Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 15.0,
                      ),
                      child: TextFormField(
                        decoration: InputDecoration(
                          border:InputBorder.none,
                          hintText:'type Your message here....'
                        ),
                      ),
                    ),
                  ),
                  Container(
                    height: 50.0,
                    color: defaultColor,
                    child: MaterialButton(
                      minWidth: 1.0,

                      onPressed: (){

                      },
                      child: Icon(
                        IconBroken.Send,
                        size: 16.0,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),

          ],
        ),
      ),

    );
  }
}
