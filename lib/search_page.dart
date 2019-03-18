import 'package:flutter/material.dart';
import 'search_item.dart';

class SearchPage extends StatefulWidget {
  final List<SearchItem> data;
  final Icon icon;
  final TextStyle textStyle;
  final Color color;
  final EdgeInsetsGeometry padding;
  final String title;

  SearchPage(
      {this.data,
      this.icon,
      this.textStyle,
      this.padding,
      this.color,
      this.title});

  @override
  State<StatefulWidget> createState() {
    return new _SearchPageState();
  }
}

class _SearchPageState extends State<SearchPage> {
  TextEditingController controller = new TextEditingController();
  List<SearchItem> _searchList = [];

  List<SearchItem> _dataList = [];
  @override
  void initState() {
    super.initState();
    _dataList = widget.data;
  }

  @override
  void dispose() {
    _searchList.clear();
    controller.dispose();
    super.dispose();
  }

  _onChange(SearchItem selection) {
    Navigator.pop(context, selection);
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        backgroundColor: widget.color,
        title: new Text(widget.title ?? 'Search Page'),
        elevation: 0.0,
      ),
      body: new Column(
        children: <Widget>[
          new Container(
            color: widget.color,
            child: new Padding(
              padding: widget.padding,
              child: new Card(
                child: new ListTile(
                  leading: new Icon(Icons.search),
                  title: new TextField(
                    controller: controller,
                    decoration: new InputDecoration(
                        hintText: 'Search', border: InputBorder.none),
                    onChanged: onSearchTextChanged,
                  ),
                  trailing: new IconButton(
                    icon: new Icon(Icons.cancel),
                    onPressed: () {
                      controller.clear();
                      onSearchTextChanged('');
                    },
                  ),
                ),
              ),
            ),
          ),
          new Expanded(
            child: _searchList.length != 0 || controller.text.isNotEmpty
                ? new ListView.builder(
                    itemCount: _searchList.length,
                    itemBuilder: (context, i) {
                      return new Card(
                        color: widget.color,
                        child: FlatButton(
                          onPressed: () {
                            Navigator.pop(context, _searchList[i]);
                          },
                          child: new ListTile(
                            leading: widget.icon,
                            title: new Text(_searchList[i].text,
                                style: widget.textStyle),
                          ),
                        ),
                        margin: const EdgeInsets.all(0.0),
                      );
                    },
                  )
                : new ListView.builder(
                    itemCount: _dataList.length,
                    itemBuilder: (context, index) {
                      return new Card(
                        color: widget.color,
                        child: FlatButton(
                            onPressed: () {
                              _onChange(_dataList[index]);
                            },
                            child: new ListTile(
                              leading: widget.icon,
                              title: new Text(
                                _dataList[index].text,
                                style: widget.textStyle,
                              ),
                            )),
                        margin: const EdgeInsets.all(0.0),
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }

  onSearchTextChanged(String text) async {
    _searchList.clear();
    if (text.isEmpty) {
      setState(() {});
      return;
    }

    _dataList.forEach((userDetail) {
      if (userDetail.text.startsWith(text.toLowerCase()) ||
          userDetail.text.toLowerCase().startsWith(
              text.toLowerCase())) if (_searchList.contains(userDetail) ==
          false) {
        _searchList.add(userDetail);
      }
    });

    setState(() {});
  }
}
