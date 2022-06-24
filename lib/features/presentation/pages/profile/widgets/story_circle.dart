import 'package:flutter/material.dart';

class StoryCircle extends StatelessWidget {
  const StoryCircle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 66,
          width: 66,
          alignment: Alignment.center,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            gradient: LinearGradient(
              colors: [
                Colors.blue,
                Colors.green,
              ],
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
            ),
          ),
          child: Container(
            height: 62,
            width: 62,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Theme.of(context).backgroundColor,
            ),
            child: const CircleAvatar(
              radius: 28,
              backgroundImage: NetworkImage(
                'https://images.pexels.com/photos/3996545/pexels-photo-3996545.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 12,
        ),
        const Text(
          'alguem@alguem',
          style: TextStyle(fontSize: 12),
        ),
      ],
    );
  }
}
