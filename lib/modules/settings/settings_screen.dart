import 'package:flutter/material.dart';

class SettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
                          'https://image.freepik.com/free-photo/horizontal-shot-smiling-curly-haired-woman-indicates-free-space-demonstrates-place-your-advertisement-attracts-attention-sale-wears-green-turtleneck-isolated-vibrant-pink-wall_273609-42770.jpg',
                        ),
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
                        'https://image.freepik.com/free-photo/horizontal-shot-smiling-curly-haired-woman-indicates-free-space-demonstrates-place-your-advertisement-attracts-attention-sale-wears-green-turtleneck-isolated-vibrant-pink-wall_273609-42770.jpg',
                      ),
                    ),
                 ),

              ],
            ),
          ),
          Text('Eman Saeed',
            style: Theme.of(context).textTheme.bodyText1,
          ),
          Text('bio ...',
            style: Theme.of(context).textTheme.caption,
          )

        ],


      ),
    );
  }
}
