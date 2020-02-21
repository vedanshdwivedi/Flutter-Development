// TODO Implement this library.
import 'package:flutter/material.dart';

import '../model/nodo_item.dart';
import './database_helper.dart';
import './date_formatter.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final TextEditingController _textEditingController =
      new TextEditingController();
  var db = new DatabaseHelper();
  final List<NoDoItem> _itemList = <NoDoItem>[];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _readNotodoItem();
  }

  void _handleSubmit(String text) async {
    _textEditingController.clear();
    NoDoItem item = new NoDoItem(text, dateFormatted());
    int savedItemId = await db.saveItem(item);

    NoDoItem addedItem = await db.getItem(savedItemId);

    setState(() {
      _itemList.insert(0, addedItem);
    });
    print("Item Saved Id : $savedItemId");
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        backgroundColor: Colors.black87,
        appBar: new AppBar(
          title: new Text("No TO-DO App"),
          centerTitle: true,
          backgroundColor: Colors.black54,
        ),
        body: new Column(
          children: <Widget>[
            new Flexible(
                child: new ListView.builder(
                    padding: new EdgeInsets.all(8.0),
                    reverse: false,
                    itemCount: _itemList.length,
                    itemBuilder: (_, int index) {
                      return new Card(
                        color: Colors.white10,
                        child: new ListTile(
                          title: _itemList[index],
                          onLongPress: () {
                            var alert = AlertDialog(
                              title: new Text("Update Item"),
                              content: new Row(
                                children: <Widget>[
                                  Expanded(
                                    child: new TextField(
                                      controller: _textEditingController,
                                      autofocus: true,
                                      decoration: new InputDecoration(
                                          labelText: "Item",
                                          hintText: "Dont Buy Item",
                                          icon: new Icon(Icons.update)),
                                    ),
                                  ),
                                ],
                              ),
                              actions: <Widget>[
                                new FlatButton(
                                    onPressed: () async {
                                      NoDoItem newItemUpdated = NoDoItem.fromMap({
                                        "itemName": _textEditingController.text,
                                        "dateCreated": dateFormatted(),
                                        "id": _itemList[index].id
                                      });

                                      _handleSubmitUpdate(index, newItemUpdated);
                                      await db.updateItem(newItemUpdated);
                                      setState(() {
                                        _readNotodoItem();
                                      });
                                      _textEditingController.clear();
                                      Navigator.pop(context);

                                    }, child: new Text("Update")),
                                new FlatButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    }, child: new Text("Cancel")),
                              ], 
                            );

                            showDialog(context: context, builder: (_){
                              return alert;
                            });

                          },
                          trailing: new Listener(
                            key: new Key(_itemList[index].itemName),
                            child: new Icon(
                              Icons.remove_circle,
                              color: Colors.redAccent,
                            ),
                            onPointerDown: (pointerEvent) {
                              db.removeItem(_itemList[index].id);
                              setState(() {
                                _itemList.removeAt(index);
                              });
                            },
                          ),
                        ),
                      );
                    })),
            new Divider(
              height: 1.0,
            ),
          ],
        ),
        floatingActionButton: new FloatingActionButton(
          backgroundColor: Colors.redAccent,
          tooltip: "Add Item",
          child: new ListTile(
            title: new Icon(Icons.add),
          ),
          onPressed: _showFormDialog,
        ));
  }

  void _showFormDialog() {
    var alert = new AlertDialog(
      content: new Row(
        children: <Widget>[
          new Expanded(
              child: new TextField(
            controller: _textEditingController,
            autofocus: true,
            decoration: new InputDecoration(
              labelText: "Item",
              hintText: "eg. Don't Buy Stuff",
              icon: new Icon(Icons.note_add),
            ),
          )),
        ],
      ),
      actions: <Widget>[
        new FlatButton(
            onPressed: () {
              _handleSubmit(_textEditingController.text);
              _textEditingController.clear();
              Navigator.pop(context);
            },
            child: Text("Save")),
        new FlatButton(
            onPressed: () => Navigator.pop(context), child: Text("Cancel")),
      ],
    );

    showDialog(
        context: context,
        builder: (_) {
          return alert;
        });
  }

  _readNotodoItem() async {
    List items = await db.getAllItems();
    items.forEach((item) {
      // NoDoItem noDoItem = NoDoItem.fromMap(item);
      setState(() {
        _itemList.add(NoDoItem.map(item));
      });
      // print("Db items : ${noDoItem.itemName}");
    });
  }


  _handleSubmitUpdate(int index, NoDoItem item){
    setState(() {
      _itemList.removeWhere((element){
        _itemList[index].itemName == item.itemName;
      });
    });
  }
}
