import 'package:flutter/material.dart';

typedef IntValueSetter = void Function(int value);

class RangeSelectorForm extends StatelessWidget {
  const RangeSelectorForm({
    Key? key,
    required this.formKey,
    required this.minValueSetter,
    required this.maxValueSetter,
  }) : super(key: key);

  final GlobalKey<FormState> formKey;

  final IntValueSetter minValueSetter;
  final IntValueSetter maxValueSetter;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            RangeSelectorTextFormField(
              labelText: 'Minimum',
              intValueSetter: minValueSetter,
            ),
            const SizedBox(height: 16),
            RangeSelectorTextFormField(
              labelText: 'Maximum',
              intValueSetter: maxValueSetter,
            ),
          ],
        ),
      ),
    );
  }
}

class RangeSelectorTextFormField extends StatelessWidget {
  const RangeSelectorTextFormField({
    Key? key,
    required this.labelText,
    required this.intValueSetter,
  }) : super(key: key);

  final String labelText;
  final IntValueSetter intValueSetter;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        labelText: labelText,
        hintText: 'like 20',
        border: const OutlineInputBorder(),
      ),
      keyboardType: const TextInputType.numberWithOptions(
        decimal: false,
        signed: true,
      ),
      validator: (value) {
        if (value == null || value == '') {
          return 'Please enter a number';
        }
        final int? valueAsInt = int.tryParse(value);
        if (valueAsInt == null) {
          return 'Please enter a valid integer';
        }
        return null;
      },
      onSaved: (newValue) => intValueSetter(int.parse(newValue ?? '')),
    );
  }
}
