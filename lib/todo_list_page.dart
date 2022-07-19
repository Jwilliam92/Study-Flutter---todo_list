import 'package:flutter/material.dart';

class ToDoListPage extends StatefulWidget {
  const ToDoListPage({Key? key}) : super(key: key);

  @override
  _TodoListPageState createState() => _TodoListPageState();
}

class _TodoListPageState extends State<ToDoListPage> {
  TextEditingController _textEditingController = TextEditingController();

  List<String> tarefas = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('Lista de Tarefas')),
      ),
      body: Container(
        padding: EdgeInsets.all(24),
        child: Column(
          children: [
            TextField(
              controller: _textEditingController,
            ),
            Container(
              height: 300,
              child: ListView.separated(
                separatorBuilder: (context, index) => Divider(),
                itemCount: tarefas.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(tarefas[index]),
                    onLongPress: () {
                      setState(() {
                        tarefas.removeAt(index);
                      });
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            backgroundColor: Colors.blue[200],
            onPressed: () {
              if (_textEditingController.text.length > 0) {
                setState(() {
                  tarefas.add(_textEditingController.text);
                });
                _textEditingController.clear();
              }
            },
            child: Icon(Icons.add),
          ),
          FloatingActionButton(
            backgroundColor: Colors.blue[200],
            onPressed: () {
              setState(() {
                tarefas = [];
              });
              _textEditingController.clear();
            },
            child: Icon(Icons.remove),
          ),
        ],
      ),
    );
  }
}
