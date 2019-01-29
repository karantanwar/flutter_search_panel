import 'package:flutter/material.dart';
import 'search_page.dart';
import 'search_item.dart';

class FlutterSearchPanel<TValue> extends StatefulWidget {
  @required
  final Function onChanged;
  @required
  final List<SearchItem<TValue>> data;
  final String title;
  final Icon icon;
  final TextStyle textStyle;
  final Color color;
  final EdgeInsetsGeometry padding;
  final TValue selected;

  FlutterSearchPanel(
      {this.onChanged,
      this.title,
      this.data,
      this.icon,
      this.textStyle,
      this.selected,
      this.padding,
      this.color});

  @override
  State<StatefulWidget> createState() {
    return new _FlutterSearchPanelState<TValue>();
  }
}

class _FlutterSearchPanelState<TValue>
    extends State<FlutterSearchPanel<TValue>> {
  SearchItem<TValue> selection;
  final _defaultIcon = Icons.label;
  final TextStyle _defaultTextStyle =
      new TextStyle(color: Colors.black, fontSize: 12.0);
  final Color _defaultColor = Colors.white;
  final EdgeInsetsGeometry _defaultPadding = EdgeInsets.all(10.0);

  @override
  void initState() {
    super.initState();
    if (widget.selected != null) {
      selection = widget.data.firstWhere(
          (item) => item.value == widget.selected,
          orElse: () => selection = widget.data[0]);
    } else {
      selection = widget.data[0];
    }
  }

  @override
  void dispose() {
    super.dispose();
  }

  _openSearchPage() async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => SearchPage(
              title: widget.title,
              data: widget.data,
              icon: widget.icon ?? _defaultIcon,
              padding: widget.padding ?? _defaultPadding,
              color: widget.color ?? _defaultColor,
              textStyle: widget.textStyle ?? _defaultTextStyle)),
    );

    if (result != null) {
      setState(() {
        selection = result;
      });
      if (widget.onChanged != null) {
        widget.onChanged((result as SearchItem<TValue>).value);
      }
    }
  }

  @override
  Widget build(BuildContext context) => new RaisedButton(
        color: widget.color ?? Colors.blue,
        child: Flex(
          direction: Axis.horizontal,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Flexible(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(
                  selection.text,
                  style: widget.textStyle ?? Theme.of(context).textTheme.button,
                ),
              ),
            ),
          ],
        ),
        padding: widget.padding,
        onPressed: _openSearchPage,
      );
}
