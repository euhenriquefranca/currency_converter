import 'package:flutter/material.dart';
import 'package:conversor_moeda/app/models/currency_model.dart';

class CurrencyBox extends StatelessWidget {
  final List<CurrencyModel>? items;
  final CurrencyModel? selectedItem;
  final TextEditingController? controller;
  final void Function(CurrencyModel? model)? onChanged;

  const CurrencyBox(
      {Key? key,
      this.items,
      this.controller,
      this.onChanged,
      this.selectedItem})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: SizedBox(
            height: 56,
            child: DropdownButton<CurrencyModel>(
              iconEnabledColor: Colors.amber,
              isExpanded: true,
              value: selectedItem,
              underline: Container(height: 1, color: Colors.amber),
              items: items
                  ?.map((e) => DropdownMenuItem(value: e, child: Text(e.name)))
                  .toList(),
              onChanged: onChanged,
            ),
          ),
        ),
        const SizedBox(width: 10),
        Expanded(
          flex: 2,
          child: TextField(
            controller: controller,
            decoration: const InputDecoration(
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.amber),
              ),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.amber),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
