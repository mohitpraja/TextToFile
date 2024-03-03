import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:texttofile/feature/files/controller/files_controller.dart';

class FileView extends GetView<FileController> {
  const FileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          color: Colors.white,
          onPressed: () => Get.back(),
        ),
        titleSpacing: 1,
        backgroundColor: Colors.deepPurple,
        title: const Text(
          "Files",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Container(
        margin: const EdgeInsets.all(15),
        child: Column(
          children: [
            Expanded(
                child: Obx(() => controller.isLoading.value
                    ? const Center(child: CircularProgressIndicator())
                    : controller.allFilePath.isEmpty
                        ? Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Center(
                                child: Icon(
                                  Icons.folder,
                                  size: Get.width * 0.4,
                                  color: Colors.grey,
                                ),
                              ),
                              const Text(
                                "Empty files",
                                style: TextStyle(
                                    color: Colors.black54, fontSize: 18),
                              )
                            ],
                          )
                        : GridView.count(
                            crossAxisCount: 2,
                            childAspectRatio: 16 / 9,
                            mainAxisSpacing: 10.0,
                            crossAxisSpacing: 10.0,
                            children: List.generate(
                                controller.allFilePath.length, (index) {
                              String filePath =
                                  controller.allFilePath[index].path;
                              return GestureDetector(
                                onTap: () {
                                  _bottomSheet(filePath);
                                },
                                child: Container(
                                  padding: const EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                      borderRadius: const BorderRadius.all(
                                          Radius.circular(8)),
                                      color: Colors.grey.withOpacity(0.3)),
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      const SizedBox(),
                                      Icon(
                                        Icons.folder,
                                        size: 45,
                                        color: Colors.amber.shade300,
                                      ),
                                      Text(
                                          "${controller.getFileNameByPath(filePath)}")
                                    ],
                                  ),
                                ),
                              );
                            }),
                          )))
          ],
        ),
      ),
    );
  }

  _bottomSheet(filePath) {
    Get.bottomSheet(Container(
      height: 100,
      width: Get.width,
      decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(8))),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical:20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            GestureDetector(
              onTap: () {
                Get.back();
                controller.openFile(filePath);
              },
              child: const Column(
                children: [
                  Icon(Icons.open_in_new),
                  SizedBox(
                    height: 8,
                  ),
                  Text("Open")
                ],
              ),
            ),
            GestureDetector(
              onTap: () {
                Get.back();
                controller.shareFile(filePath);
              },
              child: const Column(
                children: [
                  Icon(Icons.share),
                  SizedBox(
                    height: 8,
                  ),
                  Text("Share")
                ],
              ),
            )
          ],
        ),
      ),
    ));
  }
}
