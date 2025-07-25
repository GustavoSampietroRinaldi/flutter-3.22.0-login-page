import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'base_page.dart';
import '/stores/user_json_store.dart';

class UserJsonPage extends StatefulWidget {
  const UserJsonPage({super.key});

  @override
  State<UserJsonPage> createState() => _UserJsonPageState();
}

class _UserJsonPageState extends State<UserJsonPage> {
  final UserStore store = Modular.get<UserStore>();

  @override
  void initState() {
    super.initState();
    store.fetchUsers();
  }

  @override
  Widget build(BuildContext context) {
    return BasePage(
      applyBackground: true,
      appBar: AppBar(
        title: Text(
          'Dados dos usuários',
          style: Theme.of(context).textTheme.titleLarge,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Busca pela API JSON',
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          const SizedBox(height: 16),
          Expanded(
            child: Observer(
              builder: (_) {
                if (store.isLoading) {
                  return const Center(child: CircularProgressIndicator());
                }

                if (store.users.isEmpty) {
                  return Center(
                    child: Text(
                      'Nenhum usuário encontrado',
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                  );
                }

                return ListView.builder(
                  itemCount: store.users.length,
                  itemBuilder: (_, index) {
                    final user = store.users[index];
                    return ListTile(
                      title: Text(
                        user.name,
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                      subtitle: Text(
                        user.email,
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}