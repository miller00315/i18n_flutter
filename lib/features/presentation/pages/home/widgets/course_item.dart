import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/widgets.dart';

class CourseItem extends StatelessWidget {
  const CourseItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Image.network(
          'https://images.pexels.com/photos/3996545/pexels-photo-3996545.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
          fit: BoxFit.fitWidth,
        ),
        const SizedBox(
          height: 4,
        ),
        const Flexible(
          child: AutoSizeText(
            'Olá estamos todos felizes em avaliar a sua presença nesta nova unidade',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
            minFontSize: 3,
          ),
        ),
        const Text(
          'Meu caro',
          style: TextStyle(
            fontSize: 12,
          ),
        ),
        const Text(
          'Meu caro',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 12,
          ),
        ),
      ],
    );
  }
}
