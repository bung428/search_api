import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:search_api/bloc/bloc_provider.dart';
import 'package:search_api/clean_arch/domain/models/responses/topic_item.dart';
import 'package:search_api/clean_arch/domain/repository/api_repository.dart';
import 'package:search_api/dependencies.dart';
import 'package:search_api/page/search_main_bloc.dart';
import 'package:search_api/route/app_links.dart';
import 'package:search_api/widget/box_widget.dart';
import 'package:search_api/widget/search_bar_widget.dart';
import 'package:search_api/widget/stream_builder_widget.dart';
import 'package:search_api/widget/topic_item_widget.dart';

class SearchMainPage extends BLoCProvider<SearchMainBLoC> {
  const SearchMainPage({super.key});

  @override
  SearchMainBLoC createBLoC() =>
      SearchMainBLoC(locator<ApiRepository>());

  @override
  Widget build(BuildContext context, SearchMainBLoC bloc) {
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SearchBarWidget(
                searchTxtCallback: bloc.getSearchTopics,
              ),
              const ColumnBox(12),
              Expanded(
                child: StreamBuilderWidget(
                  initialData: const <TopicItem>[],
                  nullWidget: const Center(
                    child: Text('No data found.'),
                  ),
                  stream: bloc.topicItemsStream,
                  builder: (context, List<TopicItem> items) {
                    return ListView(
                      children: items.map((e) => TopicItemWidget(
                        item: e,
                        onTap: () => context.goNamed(
                          AppLinks.detail.linkPath,
                          extra: e
                        ),
                      )).toList(),
                    );
                  }
                ),
              ),
              // TextButton(onPressed: () => context.go(AppLinks.detail.linkPath), child: Text('go to detail'))
            ],
          ),
        ),
      ),
    );
  }
}

// class SearchMainPage extends StatefulWidget {
//   const SearchMainPage({Key? key}) : super(key: key);
//
//   @override
//   State<SearchMainPage> createState() => _SearchMainPageState();
// }

// class _SearchMainPageState extends State<SearchMainPage> {
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: SafeArea(
//         child: Padding(
//           padding: const EdgeInsets.all(16),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: [
//               SearchBarWidget(
//                 searchTxtCallback: (_) {
//                   /// execute api
//                   context.read<SearchMainController>().getSearchTopics('Q');
//                 },
//               ),
//               const ColumnBox(12),
//
//               TextButton(onPressed: () => context.go(AppLinks.detail.linkPath), child: Text('go to detail'))
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }