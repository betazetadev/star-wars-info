import 'package:flutter/material.dart';

Widget detailsSubheaderWidget(BuildContext context, String title) {
  return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.min,
        children: [
          Expanded(
            child: Text(
              title,
              style: Theme.of(context).textTheme.titleSmall!.copyWith(
                    color: Theme.of(context).primaryColorDark,
                  ),
            ),
          ),
        ],
      ));
}
