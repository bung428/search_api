import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:search_api/architecture/clean_arch/domain/models/responses/topic_item.dart';
import 'package:search_api/src/bloc/bloc_provider.dart';
import 'package:search_api/src/page/detail/search_detail_bloc.dart';
import 'package:search_api/src/widget/box_widget.dart';

class SearchDetailPage extends BLoCProvider<SearchDetailBLoC> {
  final TopicItem item;

  const SearchDetailPage({super.key, required this.item});

  @override
  SearchDetailBLoC createBLoC() => SearchDetailBLoC();

  @override
  Widget build(BuildContext context, SearchDetailBLoC bloc) {
    final theme = Theme.of(context);
    final dpName = item.display_name;
    final desc = item.description;
    final score = item.score;
    final release = item.released;
    final createdDate = item.created_at;
    final updatedDate = item.updated_at;

    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.black,),
          onPressed: context.pop,
        ),
        title: Text(item.name, style: theme.textTheme.titleLarge?.copyWith(
            fontWeight: FontWeight.bold
        ),),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Card(
            elevation: 3,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (dpName != null) ...[
                    TopicDataRowWidget(infoName: 'Display name', infoValue: dpName),
                    const ColumnBox(12),
                  ],
                  if (desc != null) ...[
                    TopicDataRowWidget(infoName: 'Description', infoValue: desc),
                    const ColumnBox(12),
                  ],
                  TopicDataRowWidget(infoName: 'Score', infoValue: '$score'),
                  const ColumnBox(12),
                  if (release != null) ...[
                    TopicDataRowWidget(infoName: 'Release', infoValue: release),
                    const ColumnBox(12),
                  ],
                  TopicDataRowWidget(infoName: 'Created', infoValue: createdDate),
                  const ColumnBox(12),
                  TopicDataRowWidget(infoName: 'Updated', infoValue: updatedDate),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class TopicDataRowWidget extends StatelessWidget {
  final String infoName;
  final String infoValue;

  const TopicDataRowWidget({
    Key? key, required this.infoName, required this.infoValue
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          flex: 1,
          child: Text(
            infoName,
            style: theme.textTheme.labelMedium?.copyWith(
              fontWeight: FontWeight.bold
            ),
          ),
        ),
        const RowBox(4),
        Expanded(
          flex: 3,
          child: Text(infoValue, style: theme.textTheme.labelMedium,),
        )
      ],
    );
  }
}
