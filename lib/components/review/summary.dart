import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:trivia/constants/spacing.dart';

class Summary extends ConsumerWidget {
  const Summary({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 0.0),
      child: Container(
        height: 130.0,
        padding: const EdgeInsets.fromLTRB(10.0, 20.0, 15.0, 0.0),
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(minRadiuss),
            topRight: Radius.circular(minRadiuss),
            bottomLeft: Radius.circular(minRadiuss),
            bottomRight: Radius.circular(minRadiuss),
          ),
          color: Theme.of(context).colorScheme.secondary,
        ),
        child: SizedBox(
          height: 10.0,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  IconButton(
                      onPressed: () {},
                      style: ButtonStyle(
                        backgroundColor: WidgetStatePropertyAll(
                            Theme.of(context).colorScheme.primary),
                        shape: WidgetStateProperty.all(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(buttonRadius),
                          ),
                        ),
                      ),
                      icon: const Text("5")),
                  const SizedBox(
                    width: 20.0,
                  ),
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text("data"),
                              SizedBox(
                                width: 10.0,
                              ),
                              Icon(
                                Icons.circle,
                                size: 5.0,
                              ),
                              SizedBox(
                                width: 10.0,
                              ),
                              Text("2 hrs ago"),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      Text("data"),
                      Text("data"),
                    ],
                  ),
                ],
              ),
              FilledButton(
                  style: ButtonStyle(
                    iconSize: WidgetStateProperty.all(18),
                  ),
                  onPressed: () {},
                  child: const Icon(
                    Icons.push_pin_outlined,
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
