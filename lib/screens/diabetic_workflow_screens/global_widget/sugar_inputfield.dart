import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:habbiton_diabetic_workflow/helpers/app_colors.dart';
import 'package:habbiton_diabetic_workflow/helpers/screen_config.dart';

class SugarInputField extends StatefulWidget {
  final String label;
  final String? subtitle;
  final void Function(int)? onChanged;

  const SugarInputField({
    required this.label,
    this.subtitle,
    this.onChanged,
    super.key,
  });

  @override
  State<SugarInputField> createState() => _SugarInputFieldState();
}

class _SugarInputFieldState extends State<SugarInputField> {
  int value = 0;
  final TextEditingController _controller = TextEditingController(text: '0');

  void _updateValue(int newValue) {
    setState(() {
      value = newValue.clamp(0, 999);
      _controller.text = value.toString();
    });
    if (widget.onChanged != null) {
      widget.onChanged!(value);
    }
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.getInstance().init(context);
    return Container(
      height: 70,
      margin: EdgeInsets.symmetric(vertical: 8),
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Center(
        child: Row(
          children: [
            Expanded(
              flex: 3,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(widget.label,
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  if (widget.subtitle != null)
                    Text(widget.subtitle!,
                        style: TextStyle(
                            fontSize: 12, color: ColorConstants.grey)),
                ],
              ),
            ),
            Expanded(
              flex: 2,
              child: Center(
                child: Row(
                  children: [
                    Expanded(
                      child: TextField(
                        controller: _controller,
                        keyboardType: TextInputType.number,
                        textAlign: TextAlign.center,
                        onChanged: (val) {
                          final parsed = int.tryParse(val);
                          if (parsed != null) {
                            _updateValue(parsed);
                          }
                        },
                        decoration: InputDecoration(
                          suffixText: "mg/dL",
                          isDense: true,
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ),
                    SizedBox(width: 8),
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        InkWell(
                          onTap: () {
                            _updateValue(value + 1);
                          },
                          child: Container(
                            height: 24,
                            width: 24,
                            child: SvgPicture.asset(
                              'assets/images/greaterthan_button.svg',
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        SizedBox(height: 1),
                        InkWell(
                          onTap: () {
                            _updateValue(value - 1);
                          },
                          child: Container(
                            height: 24,
                            width: 24,
                            child: SvgPicture.asset(
                              'assets/images/lessthan_button.svg',
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
