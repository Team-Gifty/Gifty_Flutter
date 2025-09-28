import 'package:flutter/material.dart';
import 'package:gifty_flutter/core/theme/app_colors.dart';

class GiftyTextField extends StatefulWidget {
  final String hintText;
  final TextAlign textAlign;
  final TextEditingController? controller;

  const GiftyTextField({
    super.key,
    required this.hintText,
    this.textAlign = TextAlign.start,
    this.controller,
  });

  @override
  State<GiftyTextField> createState() => _GiftyTextFieldState();
}

class _GiftyTextFieldState extends State<GiftyTextField> {
  final FocusNode _focusNode = FocusNode();
  String _currentHintText = '';

  @override
  void initState() {
    super.initState();
    _currentHintText = widget.hintText;
    _focusNode.addListener(() {
      if (_focusNode.hasFocus) {
        setState(() {
          _currentHintText = '';
        });
      } else {
        if (widget.controller == null || widget.controller!.text.isEmpty) {
          setState(() {
            _currentHintText = widget.hintText;
          });
        }
      }
    });
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      focusNode: _focusNode,
      controller: widget.controller,
      textAlign: widget.textAlign,
      style: const TextStyle(
        fontFamily: 'MemomentKkukkkuk',
        fontSize: 20,
        color: AppColors.selectedTab,
      ),
      decoration: InputDecoration(
        filled: true,
        fillColor: AppColors.background,
        hintText: _currentHintText,
        hintStyle: const TextStyle(
          fontFamily: 'MemomentKkukkkuk',
          fontSize: 20,
          color: AppColors.hintText,
        ),
        enabledBorder: const UnderlineInputBorder(
          borderSide: BorderSide(
            color: AppColors.selectedTab,
            width: 2.0,
          ),
        ),
        focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(
            color: AppColors.selectedTab,
            width: 2.0,
          ),
        ),
        contentPadding: const EdgeInsets.only(bottom: 8.0),
      ),
      cursorColor: AppColors.selectedTab,
    );
  }
}