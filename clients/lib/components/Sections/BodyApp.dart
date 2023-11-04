import 'package:clients/controller/CrudOpeartion.dart';
import 'package:clients/view/updateTask.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';

class DefaultPage extends StatefulWidget {
  DefaultPage({super.key});

  @override
  State<DefaultPage> createState() => _DefaultPageState();
}

class _DefaultPageState extends State<DefaultPage> {
  late Future<dynamic> futureData;
  @override
  void initState() {
    futureData = GetRequest().getTask('/task', context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: futureData,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }
        if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        }
        if (snapshot.hasData && snapshot.data.length != 0) {
          return ListView.builder(
            physics: const BouncingScrollPhysics(),
            itemCount: snapshot.data.length,
            itemBuilder: (context, index) => Center(
              child: Slidable(
                startActionPane:
                    ActionPane(motion: const StretchMotion(), children: [
                  SlidableAction(
                    onPressed: (context) {
                      Get.to(() => MyUpdatePage(
                            prevTitle: snapshot.data[index]['title'],
                            prevDescription: snapshot.data[index]['description'],
                            id: snapshot.data[index]['id'],
                          ));
                    },
                    label: "Upadte",
                  ),
                ]),
                endActionPane:
                    ActionPane(motion: const StretchMotion(), children: [
                  SlidableAction(
                      backgroundColor: Colors.red,
                      icon: Icons.delete,
                      onPressed: (context) {
                        DeleteRequest().deleteTask(
                            '/delete/task/' +
                                snapshot.data[index]['id'].toString(),
                            context);
                        setState(() {
                          futureData = GetRequest().getTask("/task", context);
                        });
                      })
                ]),
                child: Card(
                  color: const Color(0xff3a3b3b),
                  elevation: 0,
                  child: ListTile(
                    title: Text(
                      snapshot.data[index]['title'],
                      style: const TextStyle(
                        color: Colors.white54,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    subtitle: Text(
                      snapshot.data[index]['description'],
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          );
        } else {
          return const Center(
              child: Text(
            "No Tasks Yet ",
            style: TextStyle(
              color: Colors.white60,
              fontSize: 40,
            ),
          ));
        }
      },
    );
  }
}
