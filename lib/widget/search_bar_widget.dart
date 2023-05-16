import 'package:flutter/material.dart';

String? textEmptyValidator(String? value) {
  if (value != null) {
    return value.isEmpty ? 'You must enter at least one character.' : null;
  }
  return null;
}

typedef SearchTxtCallback = Function(String text);

class SearchBarWidget extends StatelessWidget {
  SearchBarWidget({
    Key? key,
    required this.searchTxtCallback
  }) : super(key: key);

  final _formKey = GlobalKey<FormState>();
  final SearchTxtCallback searchTxtCallback;
  final hintText = 'Search topics';

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Form(
          key: _formKey,
          child: TextFormField(
            textInputAction: TextInputAction.search,
            validator: textEmptyValidator,
            decoration: InputDecoration(
              prefixIcon: const Icon(
                Icons.search,
                color: Colors.grey,
              ),
              hintText: hintText,
            ),
            onFieldSubmitted: (_) {
              final formKeyState = _formKey.currentState;
              if (formKeyState == null) {
                return;
              }
              if (formKeyState.validate()) {
                formKeyState.save();
              } else {

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


// class SearchBarWidget extends StatefulWidget {
//   const SearchBarWidget({Key? key}) : super(key: key);
//
//   @override
//   State<SearchBarWidget> createState() => _SearchBarWidgetState();
// }
//
// class _SearchBarWidgetState extends State<SearchBarWidget> {
//   final _formKey = GlobalKey<FormState>();
//   final hintText = 'Search topics';
//
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       mainAxisSize: MainAxisSize.min,
//       children: [
//         Form(
//           key: _formKey,
//           child: TextFormField(
//             textInputAction: TextInputAction.search,
//             validator: textEmptyValidator,
//             decoration: InputDecoration(
//               prefixIcon: const Icon(
//                 Icons.search,
//                 color: Colors.grey,
//               ),
//               hintText: hintText,
//             ),
//             onFieldSubmitted: (_) {
//               final formKeyState = _formKey.currentState;
//               if (formKeyState == null) {
//                 return;
//               }
//               if (formKeyState.validate()) {
//                 formKeyState.save();
//               } else {
//
//               }
//             },
//             onSaved: (value) {
//               if (value != null) {
//                 /// Save Complete => execute api
//               }
//             },
//           ),
//         ),
//       ],
//     );
//   }
// }