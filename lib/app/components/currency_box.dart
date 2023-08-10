import 'package:conversor_moeda/app/models/currency_model.dart';
import 'package:flutter/material.dart';

class CurrencyBox extends StatelessWidget {

  final List<CurrencyModel> items;
  final CurrencyModel selectedItem;
  final TextEditingController controller;

  final void Function(CurrencyModel? model) onChanged;

  const CurrencyBox(
    {
      super.key, 
      required this.items, 
      required this.selectedItem,
      required this.controller, 
      required this.onChanged, 
    }
  );

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          flex: 1,
          child: SizedBox(
            height: 56,
            child: DropdownButton(
              iconEnabledColor: Colors.amber,
              isExpanded: true,
              value: selectedItem,
              underline: Container(
                height: 1, color: Colors.amber,
              ),
              items: items
                .map((e) => DropdownMenuItem(value: e, child: Text(e.name)))
                .toList(),
              onChanged: onChanged
            ),
          ),
        ),
        const SizedBox(width: 15),
        Expanded(
          flex: 2,
          child: TextField(
            controller: controller,
            decoration: const InputDecoration(
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.amber)
              ),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.amber)
              ),
            ),
          )
        ),
      ],
    );
  }
}