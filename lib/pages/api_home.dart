import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_homework/providers/home_providers.dart';

class ApiHome extends ConsumerWidget {
  const ApiHome({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final allMessages = ref.watch(messageProvider);
    return Scaffold(
      appBar: AppBar(
        title: Text('Riverpod with API'),
      ),
      backgroundColor: Colors.white,
      body: allMessages.when(
        data: (data) {
          return RefreshIndicator(
            onRefresh: () async {
              ref.refresh(messageProvider);
              return Future.value();
            },
            child: ListView.builder(
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(
                    data[index].title,
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                    ),
                  ),
                  subtitle: Text(
                    data[index].body,
                    style: const TextStyle(
                      color: Colors.black54,
                      fontSize: 14,
                    ),
                  ),
                );
              },
            ),
          );
        },
        error: (error, stackTrace) {
          return Text("$error");
        },
        loading: () => const Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }
}
