import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_homework/pages/other_page.dart';

import '../providers/home_providers.dart';

class Homepage extends ConsumerWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    final count = ref.watch(countProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('riverpod task'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Center(
            child: Text(
              count.toString(),
              style: const TextStyle(fontSize: 35),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              IconButton(
                onPressed: () {
                  ref.read(countProvider.notifier).state++;
                },
                icon: const Icon(
                  Icons.add,
                  color: Colors.blue,
                  size: 40,
                ),
              ),
              const SizedBox(
                width: 30,
              ),
              IconButton(
                onPressed: () {
                  if (count > 0) {
                    ref.read(countProvider.notifier).state--;
                  }
                },
                icon: const Icon(
                  Icons.remove,
                  color: Colors.red,
                  size: 40,
                ),
              ),
            ],
          ),
          IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>  const OtherPage(),
                  ),
                );
              },
              icon: const Icon(
                Icons.arrow_forward_ios,
                size: 40,
              ))
        ],
      ),
    );

  }
}
