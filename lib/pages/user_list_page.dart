import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import '/stores/user_list_store.dart';
import 'base_page.dart';

class UserListPage extends StatelessWidget {
  final UserListStore store = UserListStore();

  UserListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BasePage(
      applyBackground: true,
      appBar: AppBar(
        title: Text(
          'Lista de usuários',
          style: Theme.of(context).textTheme.titleLarge,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: store.addRandomName,
        child: const Icon(Icons.add),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Usuários:',
            style: Theme.of(context).textTheme.bodyLarge!.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          Expanded(
            child: Observer(
              builder: (_) => ListView.builder(
                itemCount: store.names.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(
                      store.names[index],
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}