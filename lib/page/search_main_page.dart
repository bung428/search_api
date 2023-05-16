import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:search_api/bloc/bloc_provider.dart';
import 'package:search_api/clean_arch/domain/models/requests/search_topics_request.dart';
import 'package:search_api/clean_arch/domain/repository/api_repository.dart';
import 'package:search_api/dependencies.dart';
import 'package:search_api/page/search_main_controller.dart';
import 'package:search_api/route/app_links.dart';
import 'package:search_api/widget/box_widget.dart';
import 'package:search_api/widget/search_bar_widget.dart';

class SearchMainPage extends BLoCProvider<SearchMainController> {
  @override
  SearchMainController createBLoC() =>
      SearchMainController(locator<ApiRepository>());

  @override
  Widget build(BuildContext context, SearchMainController bloc) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SearchBarWidget(
                searchTxtCallback: (_) {
                  /// execute api
                  bloc.getSearchTopics(_);
                },
              ),
              const ColumnBox(12),

              TextButton(onPressed: () => context.go(AppLinks.detail.linkPath), child: Text('go to detail'))
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