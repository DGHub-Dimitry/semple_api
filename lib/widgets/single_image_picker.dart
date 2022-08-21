import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:semper/widgets/imageview.dart';

import '../../../components/file_helper.dart';

class SingleImagePicker extends StatefulWidget {
  final Function(File) resultPath;
  final String? imageUrl;
  final double imageWidth;
  final double imageHeight;
  const SingleImagePicker({
    this.imageUrl,
    required this.resultPath,
    this.imageWidth = 100,
    this.imageHeight = 130,
    Key? key,
  }) : super(key: key);

  @override
  State<SingleImagePicker> createState() => _SingleImagePickerState();
}

class _SingleImagePickerState extends State<SingleImagePicker> {
  TextEditingController imageTextController = TextEditingController();
  String fileSize = 'N/A';
  String filePath = 'N/A';
  String fileExtension = 'N/A';

  @override
  void initState() {
    if (widget.imageUrl != null) {
      filePath = widget.imageUrl!;
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (filePath == 'N/A')
            InkWell(
              onTap: pick,
              child: Container(
                  color: theme.cardColor,
                  width: widget.imageWidth,
                  height: widget.imageHeight,
                  child: const Icon(Icons.add_photo_alternate_outlined,
                      color: Colors.grey)),
            )
          else if (filePath.contains('http://') ||
              filePath.contains('https://'))
            InkWell(
                onTap: pick,
                child: ImageViewNetwork(
                  url: filePath,
                  width: widget.imageWidth,
                  height: widget.imageHeight,
                ))
          else
            InkWell(
              onTap: pick,
              child: Image.file(
                File(filePath),
                fit: BoxFit.cover,
                width: widget.imageWidth,
                height: widget.imageHeight,
                errorBuilder: (context, path, error) {
                  return Image.asset(
                    'assets/images/image_error_square.png',
                    fit: BoxFit.cover,
                    width: widget.imageWidth,
                    height: widget.imageHeight,
                  );
                },
              ),
            ),
          const SizedBox(
            width: 20,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Path : $filePath',
                  overflow: TextOverflow.fade,
                  maxLines: 1,
                  softWrap: false,
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  'Size : $fileSize',
                  overflow: TextOverflow.fade,
                  maxLines: 1,
                  softWrap: false,
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  'Extension : $fileExtension',
                  overflow: TextOverflow.fade,
                  maxLines: 1,
                  softWrap: false,
                ),
                const SizedBox(
                  height: 10,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  void pick() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowedExtensions: ['png', 'jpg', 'jpeg', 'gif']);

    if (result != null) {
      File file = File(result.files.single.path!);
      setState(() {
        fileExtension = result.files.single.extension!.toString();
        filePath = result.files.single.path!.toString();
        fileSize = getFileSize(result.files.single.size);
        widget.resultPath(file);
      });
    } else {}
  }
}
