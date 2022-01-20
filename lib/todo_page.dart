import 'package:flutter/material.dart';

import 'components/task_input_widget.dart';

import 'components/list_task_widget.dart';
import 'models/task_model.dart';

class TodoPage extends StatefulWidget {
  const TodoPage({Key? key}) : super(key: key);

  @override
  _TodoPageState createState() => _TodoPageState();
}

class _TodoPageState extends State<TodoPage> {
  TextEditingController textController = TextEditingController();
  var todoList = <TaskModel>[];

  void addToDo() {
    if (textController.text.isNotEmpty) {
      var newTask = TaskModel(desc: textController.text);
      todoList.add(newTask);
      textController.text = '';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Image.asset('assets/images/logo_home.png'),
            ),
            Text('Lista de Tarefas'),
          ],
        ),
      ),
      body: Column(
        children: [
          Padding(
              padding: const EdgeInsets.fromLTRB(17, 24, 17, 40),
              child: TaskInputWidget(
                textController: textController,
                onPressed: () => setState(() => addToDo()),
                buttonText: 'ADD',
                labelText: 'Nova tarefa',
              )),
          Expanded(
            child: ListTaskWidget(
              itemCount: todoList.length,
              todoList: todoList,
              onChanged: (value, index) => setState(() {
                todoList[index].completed = value ?? false;
              }),
              onDimissed: (direction, index) => setState(() {
                todoList.removeAt(index);
              }),
            ),
          ),
        ],
      ),
    );
  }
}
