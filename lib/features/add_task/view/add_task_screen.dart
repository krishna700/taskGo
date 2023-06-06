import 'package:bottom_picker/bottom_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:taskgo/config/config.dart';
import 'package:taskgo/features/add_task/add_task.dart';
import 'package:taskgo/util/constants.dart';
import 'package:taskgo/util/extension.dart';
import 'package:taskgo/util/text_field_item.dart';
import 'package:taskgo/util/util.dart';

class AddTaskScreen extends StatefulWidget {
  final Task? task;
  const AddTaskScreen({
    super.key,
    this.task,
  });

  @override
  State<AddTaskScreen> createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {
  late Task task;
  late String pageTitle;
  //Text editing controller for task name
  final TextEditingController taskNameController = TextEditingController();
  //Text editing controller for task description
  final TextEditingController taskDescriptionController =
      TextEditingController();
  //Text editing controller for task due date time field
  final TextEditingController taskDateController = TextEditingController();
  //Text editing controller for task priority field
  final TextEditingController taskPriorityController = TextEditingController();

  //init if the task recieved in constructor or set it
  @override
  void initState() {
    super.initState();

    //Task is not null in contrustor
    //user will update the task
    if (widget.task != null) {
      task = widget.task!;
      pageTitle = "Update ";
      //Set the task name value in taskNameController
      taskNameController.text = task.taskName;
      //Set the task description value in taskDescriptionController
      taskDescriptionController.text = task.description ?? "";
      //Set the due on value in taskDateController
      taskDateController.text =
          task.dueDateTime?.format(Constants.deadline) ?? "";
      //Set the task priority value in taskPriorityController
      taskPriorityController.text = Constants.taskPriorities[task.priority - 1];

      return;
    }

    //Task is null in construtor
    //user will add a new task
    task = Task();

    //init the late variables in task model
    task.taskName = '';
    task.isReminderEnabled = false;
    task.priority = Constants.taskLowPriority;
    //Set the task priority value in taskPriorityController
    taskPriorityController.text = Constants.taskPriorities[task.priority - 1];
    pageTitle = "Add ";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      persistentFooterButtons: [
        _saveTaskButton(),
      ],
      appBar: AppBar(
        elevation: 0.5,
        centerTitle: true,
        backgroundColor: Colors.white,
        title: Text.rich(
          TextSpan(
            children: [
              TextSpan(
                text: pageTitle,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: primaryColor,
                  fontSize: 28,
                ),
              ),
              const TextSpan(
                text: 'Task',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.grey,
                  fontSize: 18,
                ),
              ),
            ],
          ),
        ),
        actions: [
          _buildDeleteTaskButton(),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: _buildBody(),
          ),
        ),
      ),
    );
  }

//Builds the main body of the add/update task page
  Widget _buildBody() {
    return Column(
      children: [
        _textFieldVerticalGap(),

        //Task name
        TextFieldItem(
          controller: taskNameController,
          onTextChanged: (text) {
            task.taskName = text;
          },
          labelText: "Name",
        ),
        _textFieldVerticalGap(),
        //task description
        TextFieldItem(
          labelText: "Description",
          controller: taskDescriptionController,
          onTextChanged: (text) {
            task.description = text;
          },
          minLine: 1,
          maxLine: 6,
        ),
        _textFieldVerticalGap(),
        //task due on picker
        TextFieldItem(
          onTap: () {
            _openDateTimePicker();
          },
          isEnabled: false,
          controller: taskDateController,
          hintText: "Select Task Due Date & Time",
          labelText: "Due on",
          minLine: 1,
          maxLine: 6,
        ),
        _textFieldVerticalGap(),
        //task priority picker
        TextFieldItem(
          onTap: () {
            _openTaskPriorityPicker();
          },
          isEnabled: false,
          controller: taskPriorityController,
          labelText: "Priority",
          minLine: 1,
          maxLine: 6,
        ),
        _textFieldVerticalGap(),
        //enable task reminder
        _buildTaskReminder(),
      ],
    );
  }

  //Builds save task button
  Widget _saveTaskButton() {
    return Container(
      height: 60,
      width: MediaQuery.of(context).size.width,
      //For keeping the save button above the keyboard
      margin: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ElevatedButton(
          onPressed: () {
            //Hide the keyboard first
            hideKeyboard(context);

            final addTaskProvider =
                Provider.of<AddTaskProvider>(context, listen: false);
            //call save function in provider
            addTaskProvider.saveTask(task, context);
          },
          style: ElevatedButton.styleFrom(
              backgroundColor: primaryColor,
              side: const BorderSide(width: 0.2, color: Colors.white)),
          child: const Text(
            "Save Task",
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }

  //Builds task reminder cupertino switch
  Widget _buildTaskReminder() {
    return Row(
      children: [
        const SizedBox(
          width: 6,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text(
              "Reminder",
              style: TextStyle(
                fontSize: 18,
                color: Colors.black,
              ),
            ),
            Text(
              "We will remind you 30 mins prior",
              style: TextStyle(
                fontSize: 12,
                color: Colors.grey,
              ),
            ),
          ],
        ),
        const Spacer(),
        CupertinoSwitch(
          value: task.isReminderEnabled,
          onChanged: (value) {
            setState(() {
              task.isReminderEnabled = value;
            });
          },
        ),
      ],
    );
  }

  //Builds task priority picker
  void _openTaskPriorityPicker() {
    BottomPicker(
      items:
          Constants.taskPriorities.map((priority) => Text(priority)).toList(),
      title: "Select task priority",
      buttonText: 'Confirm',
      //Subtract 1 from the value, as index starts from 0
      selectedItemIndex: task.priority - 1,
      dismissable: true,
      onSubmit: (index) {
        //we're adding 1, as index starts from 0
        //And our task priority starts from 1
        task.priority = index + 1;
        //set the controller text from priorities list
        taskPriorityController.text = Constants.taskPriorities[index];
        //setState to update the UI
        setState(() {});
      },
      pickerTextStyle: const TextStyle(
        fontSize: 22,
        color: Colors.black,
      ),
      buttonTextStyle: const TextStyle(color: Colors.white),
      buttonSingleColor: primaryColor,
      titleStyle: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
    ).show(context);
  }

//Builds task due date time picker
  void _openDateTimePicker() {
    BottomPicker.dateTime(
      title: 'Set the task exact time and date',
      dismissable: true,
      //Set the initial selected date time to the task date time or current time
      initialDateTime: task.dueDateTime ?? DateTime.now(),
      titleStyle: const TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 15,
        color: Colors.black,
      ),
      onSubmit: (date) {
        //set the date for the task due on
        task.dueDateTime = date;
        //set the taskDateController value after formatting
        taskDateController.text = task.dueDateTime!.format(Constants.deadline);
        //setState to update the UI
        setState(() {});
      },
      onClose: () {
        //   print('Picker closed');
      },
      iconColor: Colors.black,
      minDateTime: DateTime(2021, 5, 1),
      maxDateTime: DateTime(2029, 12, 12),
      buttonText: 'Confirm',
      buttonTextStyle: const TextStyle(color: Colors.white),
      buttonSingleColor: primaryColor,
    ).show(context);
  }

//Builds const vertical gap widget
  Widget _textFieldVerticalGap() {
    return const SizedBox(
      height: 20,
    );
  }

  //Build delete task icon button
  Widget _buildDeleteTaskButton() {
    //task id is greater than 0, so it's saved in db
    //we can render the delete button
    if (task.id != null) {
      return IconButton(
        onPressed: () {
          final addTaskProvider =
              Provider.of<AddTaskProvider>(context, listen: false);
          //call delete function in provider
          addTaskProvider.deleteTask(context, task);
        },
        icon: Icon(
          Icons.delete,
          color: Colors.red[400],
        ),
      );
    }

    return const Offstage();
  }
}
