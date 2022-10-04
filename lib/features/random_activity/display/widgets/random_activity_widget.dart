import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../core/errors/failures.dart';
import '../../domain/entities/random_activity.dart';
import '../provider/random_activity_provider.dart';

class RandomActivityWidget extends StatelessWidget {
  const RandomActivityWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //Todo: Add the provider RandomActivityProvider

    RandomActivity? randomActivity =
        Provider.of<RandomActivityProvider>(context).randomActivity;

    //Todo: Add the provider RandomActivityProvider

    Failure? failure = Provider.of<RandomActivityProvider>(context).failure;

    if (randomActivity != null) {
      return Expanded(
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            boxShadow: const [
              BoxShadow(
                offset: Offset(3, 3),
                blurRadius: 3.0,
                color: Colors.black26,
              )
            ],
            image: const DecorationImage(
              colorFilter: ColorFilter.mode(Colors.black26, BlendMode.darken),
              fit: BoxFit.cover,
              image: AssetImage(
                'images/water_bg.jpeg',
              ),
            ),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20, top: 10),
                  child: SingleChildScrollView(
                    child: Text(
                      randomActivity.activity,
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        shadows: <Shadow>[
                          Shadow(
                            blurRadius: 100.0,
                            color: Colors.black,
                          ),
                        ],
                        fontSize: 60,
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: Colors.white,
                ),
                padding: const EdgeInsets.symmetric(horizontal: 5),
                child: ListTile(
                  title: const Text(
                    'Number of people',
                    style: TextStyle(fontSize: 20),
                  ),
                  trailing: Chip(
                    backgroundColor: Colors.white,
                    label: Text(
                      randomActivity.participants.toString(),
                      style: const TextStyle(fontSize: 20),
                    ),
                    avatar: const Icon(
                      Icons.person,
                      color: Colors.orangeAccent,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    } else {
      return const Expanded(
        child: Center(
          child: Text(
            // failure.errorMessage!,
            'error',
            style: TextStyle(fontSize: 20),
          ),
        ),
      );
    }

    return const Expanded(
      child: Center(
        child: CircularProgressIndicator(
          backgroundColor: Colors.white,
          color: Colors.orangeAccent,
        ),
      ),
    );
  }
}
