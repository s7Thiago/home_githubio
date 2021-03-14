import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_html/style.dart';

import '../app/styles.dart' as styles;

class ExpandableSection extends StatefulWidget {
  final String title;
  final String content;
  final double customHeight;
  final List<Widget> representations;

  const ExpandableSection({
    Key key,
    this.title,
    this.content,
    this.representations,
    this.customHeight = 520,
  }) : super(key: key);

  @override
  _ExpandableSectionState createState() => _ExpandableSectionState();
}

class _ExpandableSectionState extends State<ExpandableSection>
    with SingleTickerProviderStateMixin {
  final _duration = Duration(milliseconds: 400);
  bool selected = false;
  Color _containerColor = Colors.white;
  Color _titleColor = styles.AppStyles.introTextStyle.color;
  double _titleSize = styles.AppStyles.introTextStyle.fontSize;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selected = !selected;
          _containerColor = Colors.white;
          _titleSize =
              styles.AppStyles.introTextStyle.fontSize + (selected ? 7 : -7);
        });
      },
      onTapDown: (TapDownDetails details) {
        setState(() {
          _containerColor = Colors.grey[400];
        });
      },
      child: MouseRegion(
        onHover: (PointerHoverEvent phe) {
          setState(() {
            _containerColor = selected ? Colors.white : Colors.grey[100];
            _titleColor = Colors.pink;

            if (!selected) _titleSize = 25;
          });
        },
        onExit: (PointerExitEvent pee) {
          setState(() {
            _containerColor = Colors.white;
            _titleColor = styles.AppStyles.introTextStyle.color;

            if (!selected)
              _titleSize = styles.AppStyles.introTextStyle.fontSize;
          });
        },
        child: AnimatedContainer(
          duration: _duration,
          curve: Curves.easeInOutQuad,
          width: !selected ? 380 : 450,
          height: !selected ? 50 : widget.customHeight,
          padding: EdgeInsets.only(
            top: selected ? 10 : 15,
            bottom: selected ? 16 : 0,
            left: 16,
          ),
          margin: const EdgeInsets.only(top: 50),
          decoration: BoxDecoration(
              color: _containerColor,
              boxShadow: selected
                  ? [
                      BoxShadow(
                        color: Colors.black26,
                        offset: Offset(1.5, 1.5),
                        blurRadius: 2,
                      ),
                    ]
                  : [],
              borderRadius: BorderRadius.circular(!selected ? 20 : 8)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 10),
                child: AnimatedAlign(
                  duration: _duration,
                  curve: Curves.easeInOutQuad,
                  alignment:
                      selected ? Alignment.center : Alignment.centerRight,
                  child: AnimatedSize(
                    duration: _duration,
                    curve: Curves.easeInOutQuad,
                    vsync: this,
                    child: FittedBox(
                      fit: BoxFit.fitHeight,
                      child: Text(
                        widget.title,
                        style: styles.AppStyles.introTextStyle.copyWith(
                            fontSize: _titleSize - 3, color: _titleColor),
                        textAlign: TextAlign.right,
                      ),
                    ),
                  ),
                ),
              ),
              if (selected)
                Expanded(
                  child: Row(
                    children: [
                      Expanded(
                        flex: 6,
                        child: Html(
                          data: widget.content,
                          style: {
                            'div': Style(
                              direction: TextDirection.rtl,
                            ),
                            'li': Style(
                              alignment: Alignment.centerRight,
                              listStylePosition: ListStylePosition.INSIDE,
                            ),
                            'p': Style(textAlign: TextAlign.right)
                          },
                        ),
                      ),
                      widget.representations.length > 0
                          ? Expanded(
                              flex: 1,
                              child: IconTheme(
                                data: IconThemeData(
                                  color: Colors.grey.withOpacity(.5),
                                  size: 25,
                                ),
                                child: Wrap(
                                  runAlignment: WrapAlignment.spaceAround,
                                  alignment: WrapAlignment.start,
                                  spacing: 25,
                                  runSpacing: 100,
                                  direction: Axis.horizontal,
                                  children: widget.representations,
                                ),
                              ),
                            )
                          : Container(),
                    ],
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
