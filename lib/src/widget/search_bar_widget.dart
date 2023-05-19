import 'package:flutter/material.dart';

typedef SearchTxtCallback = Function(String text);

const hintText = 'Enter a search term related to the topics.';
const emptyMsg = 'You must enter at least one character.';

String? textEmptyValidator(String? value) {
  if (value != null) {
    return value.isEmpty ? emptyMsg : null;
  }
  return null;
}

class SearchBarWidget extends StatelessWidget {
  SearchBarWidget({
    Key? key,
    required this.searchTxtCallback
  }) : super(key: key);

  final _formKey = GlobalKey<FormState>();
  final SearchTxtCallback searchTxtCallback;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Form(
          key: _formKey,
          child: TextFormField(
            textInputAction: TextInputAction.search,
            validator: textEmptyValidator,
            decoration: InputDecoration(
              hintText: hintText,
              hintStyle: textTheme.labelMedium?.copyWith(color: Colors.grey),
              focusedBorder: const UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.black)
              )
            ),
            onFieldSubmitted: (_) {
              final formKeyState = _formKey.currentState;
              if (formKeyState == null) {
                return;
              }
              if (formKeyState.validate()) {
                formKeyState.save();
              }
            },
            onSaved: (value) {
              if (value != null) {
                searchTxtCallback(value);
              }
            },
          ),
        ),
      ],
    );
  }
}