// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:mix/mix.dart';

enum CalendarCellMode {
  selected,
  blocked;

  Variant<Attribute> get variant {
    switch (this) {
      case selected:
        return _selected;
      case blocked:
        return _blocked;
    }
  }
}

final _selected = Variant('selected');
final _blocked = Variant('blocked');

class CalendarCell extends StatelessWidget {
  const CalendarCell({
    Key? key,
    this.mode,
    required this.month,
    required this.day,
    required this.weekday,
  }) : super(key: key);

  final CalendarCellMode? mode;
  final String month;
  final String day;
  final String weekday;

  @override
  Widget build(BuildContext context) {
    final style = Mix(
      rounded(4),
      height(80),
      width(43),
      mainAxisSize(MainAxisSize.min),
      mainAxis(MainAxisAlignment.center),
      crossAxis(CrossAxisAlignment.center),
      fontWeight(FontWeight.bold),
      fontSize(12),
      bgColor(Colors.white),
      textColor(const Color(0xFFA4A4A9)),
      _selected(
        bgColor(const Color(0xFF295CF6)),
        textColor(Colors.white),
      ),
      _blocked(
        bgColor(const Color(0xFFEDEDEE)),
        textColor(const Color(0xFFA4A4A9)),
      ),
    ).apply(
      Mix(
        iconSize(20),
        iconColor(const Color(0xFFA4A4A9)),
      ),
    );

    return Box(
      mix: style.withMaybeVariant(mode?.variant),
      child: VBox(
        inherit: true,
        children: [
          TextMix(
            month,
            inherit: true,
            mix: Mix(
              fontWeight(FontWeight.normal),
            ),
          ),
          TextMix(
            day,
            inherit: true,
            mix: Mix(fontSize(20)),
          ),
          (mode != CalendarCellMode.blocked)
              ? TextMix(
                  weekday,
                  inherit: true,
                )
              : const IconMix(
                  Icons.lock,
                  inherit: true,
                )
        ],
      ),
    );
  }
}
