// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:sketoo/utils/typograhpy.dart';

class InputText extends StatefulWidget {
  final String hintText;
  final Color backgroundColor;
  final double width;
  final double height;
  final ValueChanged<String>? onChanged;

  const InputText({
    super.key,
    required this.hintText,
    required this.backgroundColor,
    required this.width,
    required this.height,
    this.onChanged,
  });

  @override
  State<InputText> createState() => _InputTextState();
}

class _InputTextState extends State<InputText> {
  final TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width,
      height: widget.height,
      decoration: BoxDecoration(
        color: widget.backgroundColor,
        borderRadius: BorderRadius.circular(20.0),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Center(
        child: TextField(
          controller: _controller,
          style: juaBlack20,
          decoration: InputDecoration(
            border: InputBorder.none,
            prefixIcon: const Padding(
              padding: EdgeInsets.only(left: 10.0, right: 10.0),
              child: Icon(
                Icons.person,
                color: Colors.black,
                size: 25.0,
              ),
            ),
            hintText: widget.hintText,
            hintStyle: inputJua,
            isDense: true,
            contentPadding: const EdgeInsets.symmetric(vertical: 3),
            alignLabelWithHint: true,
          ),
          onChanged: widget.onChanged,
        ),
      ),
    );
  }
}
