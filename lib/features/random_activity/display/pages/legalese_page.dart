import 'package:flutter/material.dart';

class LegalesePage extends StatelessWidget {
  const LegalesePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Divider(),
        ListTile(
          title: const Text(
            'Legalese',
            style: TextStyle(
              fontSize: 25,
              color: Colors.red,
            ),
          ),
          onTap: () {
            showLicensePage(context: context);
          },
        ),
        const Divider(),
      ],
    );
  }
}
