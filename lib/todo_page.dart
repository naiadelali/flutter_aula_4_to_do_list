import 'package:flutter/material.dart';

import 'components/task_input_widget.dart';

import 'components/list_task_widget.dart';
import 'models/task_model.dart';
import 'todo_controller.dart';

class TodoPage extends StatefulWidget {
  const TodoPage({Key? key}) : super(key: key);

  @override
  _TodoPageState createState() => _TodoPageState();
}

class _TodoPageState extends State<TodoPage> {
  var controller = TodoController();

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
                textController: controller.textController,
                onPressed: () => setState(() => controller.addToDo()),
                buttonText: 'ADD',
                labelText: 'Nova tarefa',
              )),
          Expanded(
            child: ListTaskWidget(
              itemCount: controller.todoList.length,
              todoList: controller.todoList,
              onChanged: (value, index) => setState(() {
                controller.onUpdateStatusTask(value, index);
              }),
              onDimissed: (direction, index) => setState(() {
                controller.onRemoveTask(index);
              }),
            ),
          ),
        ],
      ),
    );
  }
}
