import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:foody_app/main.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class CustomDottedBorder extends StatelessWidget {
  final Function(File?) onImagePicked;
  final File? image;

  const CustomDottedBorder({
    super.key,
    required this.onImagePicked,
    this.image,
  });

  Future<void> _pickImage() async {
    final ImagePicker picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      onImagePicked(File(pickedFile.path));
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _pickImage,
      child: Center(
        child: DottedBorder(
          borderType: BorderType.Circle,
          dashPattern: const [8, 4],
          color: const Color(0XFF8D92A3),
          strokeWidth: 2,
          child: Container(
            width: 120,
            height: 120,
            decoration: const BoxDecoration(
              color: Color(0XFFF0F0F0),
              shape: BoxShape.circle,
            ),
            child: Padding(
              padding: const EdgeInsets.all(5),
              child: Center(
                child: image != null
                    ? ClipOval(
                        child: Image.file(
                          image!,
                          width: 120,
                          height: 120,
                          fit: BoxFit.cover,
                        ),
                      )
                    : Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Text(
                          'Add Photo',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: getResoponsiveFontSize(
                              context,
                              fontSize: 18,
                            ),
                          ),
                        ),
                      ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
