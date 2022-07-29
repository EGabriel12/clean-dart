import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:git_hub_search/modules/search/presenter/search/search_bloc.dart';
import 'package:git_hub_search/modules/search/presenter/search/states/state.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final bloc = GetIt.instance.get<SearchBloc>();

  @override
  void dispose() {
    super.dispose();
    bloc.close();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Github Search"),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 8.0, top: 8.0, right: 8.0),
            child: TextField(
              onChanged: bloc.add,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(), labelText: 'Search...'),
            ),
          ),
          Expanded(
              child: StreamBuilder(
                  stream: bloc.stream,
                  builder: (context, _) {
                    final state = bloc.state;

                    if (state is SearchStart) {
                      return const Center(
                        child: Text(
                          "Type a text",
                        ),
                      );
                    } else if (state is SearchError) {
                      return const Center(
                        child: Text(
                          "There were an error",
                        ),
                      );
                    } else if (state is SearchLoading) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                    final list = (state as SearchSuccess).list;
                    return ListView.builder(
                        itemCount: list.length,
                        itemBuilder: (_, id) {
                          final item = list[id];
                          return ListTile(
                            leading: CircleAvatar(
                              backgroundImage: NetworkImage(item.image),
                            ),
                            title: Text(item.title),
                            subtitle: Text(item.content),
                          );
                        });
                  }))
        ],
      ),
    );
  }
}
