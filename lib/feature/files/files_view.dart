import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:texttofile/feature/files/controller/files_controller.dart';

class FileView extends GetView<FileController> {
  const FileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(
          Icons.arrow_back,
          color: Colors.white,
        ),
        titleSpacing: 1,
        backgroundColor: Colors.deepPurple,
        title: const Text(
          "Files",
          style: TextStyle(color: Colors.white),
        ),
        actions: [
          IconButton(
              onPressed: () {
                controller.fetchFiles();
              },
              icon: const Icon(
                Icons.sticky_note_2_sharp,
                color: Colors.white,
              ))
        ],
      ),
      body: Container(
        margin: const EdgeInsets.all(15),
        child: Column(
          children: [
            Expanded(
                child: GridView.count(
              crossAxisCount: 2,
              childAspectRatio: 16 / 9,
              mainAxisSpacing: 10.0,
              crossAxisSpacing: 10.0,
              children: List.generate(controller.allFilePath.length, (index) {
                return Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(Radius.circular(8)),
                      color: Colors.grey.withOpacity(0.3)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const SizedBox(),
                      Icon(
                        Icons.folder,
                        size: 45,
                        color: Colors.amber.shade300,
                      ),
                      Text(
                          "${controller.getFileNameByPath(controller.allFilePath[index].path)}")
                    ],
                  ),
                );
              }),
            ))
          ],
        ),
      ),
    );
  }
}
