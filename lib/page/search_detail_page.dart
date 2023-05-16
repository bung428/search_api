import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:search_api/route/app_links.dart';

class SearchDetailPage extends StatefulWidget {
  const SearchDetailPage({Key? key}) : super(key: key);

  @override
  State<SearchDetailPage> createState() => _SearchDetailPageState();
}

class _SearchDetailPageState extends State<SearchDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Text('detail'),
          TextButton(onPressed: () => context.go(AppLinks.search.linkPath), child: Text('go to main'))
        ],
      ),
    );
  }
}
