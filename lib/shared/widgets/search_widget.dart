import 'package:flutter/material.dart';

class SearchWidget extends StatelessWidget {
  final ValueChanged<String>? onChanged;

  const SearchWidget({Key? key, this.onChanged}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: onChanged,
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.search),
        hintText: 'Pesquisa por empresa',
      ),
    );
  }
}
