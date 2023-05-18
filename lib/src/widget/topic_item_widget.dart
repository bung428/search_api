import 'package:flutter/material.dart';
import 'package:search_api/architecture/clean_arch/domain/models/responses/topic_item.dart';
import 'package:search_api/src/widget/box_widget.dart';

class TopicItemWidget extends StatelessWidget {
  final TopicItem item;
  final Function() onTap;

  const TopicItemWidget({Key? key, required this.item, required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final shortDesc = item.short_description;
    final theme = Theme.of(context);
    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      child: InkWell(
        onTap: onTap,
        customBorder: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Expanded(
                flex: 3,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(item.name, style: theme.textTheme.titleLarge,),
                    const ColumnBox(8),
                    if (shortDesc != null) ...[
                      Text(
                        shortDesc,
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                        style: theme.textTheme.bodyMedium,
                      ),
                      const ColumnBox(8),
                    ],
                    Text('Score ${item.score}', style: theme.textTheme.bodyMedium,),
                  ],
                )
              ),
              Text(item.updated_at, style: theme.textTheme.bodySmall,),
            ],
          ),
        ),
      ),
    );
  }
}
