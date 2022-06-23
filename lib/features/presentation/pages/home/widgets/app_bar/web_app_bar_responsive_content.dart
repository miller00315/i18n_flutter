import 'package:flutter/material.dart';

class WebAppBarResponsiveContent extends StatelessWidget {
  const WebAppBarResponsiveContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: LayoutBuilder(
        builder: (context, constraints) {
          return Row(
            children: [
              Expanded(
                child: Container(
                  height: 45,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade300,
                    border: Border.all(color: Colors.grey.shade300),
                  ),
                  child: Row(
                    children: [
                      IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.search,
                          color: Colors.grey.shade500,
                        ),
                      ),
                      const SizedBox(
                        width: 4,
                      ),
                      const Expanded(
                        child: TextField(
                          style: TextStyle(color: Colors.black),
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            enabledBorder: InputBorder.none,
                            focusedBorder: InputBorder.none,
                            hintText: 'Pesquisar',
                            isCollapsed: true,
                            hintStyle: TextStyle(
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              if (constraints.maxWidth >= 400) ...[
                const SizedBox(
                  width: 32,
                ),
                TextButton(
                  onPressed: () {},
                  child: const Text(
                    'Saiba mais',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
              if (constraints.maxWidth >= 500) ...[
                const SizedBox(
                  width: 32,
                ),
                TextButton(
                  onPressed: () {},
                  child: const Text(
                    'Tecnologias',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ]
            ],
          );
        },
      ),
    );
  }
}
