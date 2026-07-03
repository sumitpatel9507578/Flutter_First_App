import 'dart:core';

import 'package:flutter/material.dart';

import 'PostModel.dart';
import 'api_servise.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';

class AddPostScreen extends StatefulWidget {
  const AddPostScreen({super.key});

  @override
  State<AddPostScreen> createState() => _AddPostScreenState();
}


class _AddPostScreenState extends State<AddPostScreen> {
  TextEditingController titleController=TextEditingController();
  TextEditingController bodyController=TextEditingController();
  TextEditingController priceController=TextEditingController();
  TextEditingController descriptionController=TextEditingController();
  TextEditingController categoryController=TextEditingController();
  TextEditingController imageController=TextEditingController();

  File? selectedImage;

  Future<void> pickImage() async {
    final ImagePicker picker = ImagePicker();

    final XFile? image = await picker.pickImage(
      source: ImageSource.gallery,
    );

    if (image != null) {
      setState(() {
        selectedImage = File(image.path);
        imageController.text=image.path;
      });
    }
  }

  ApiService service=ApiService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: Colors.blue,
        centerTitle: true,
        title: Text("Post Screen",style: TextStyle(color: Colors.white,fontWeight: .bold),),
      ),
      drawer: Drawer(),
      body: Center(
        child: ListView(
          children: [
            Column(
              mainAxisAlignment: .center,
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(

                  ),
                  onPressed: pickImage,

                  child: Text("Select Image"),
                ),
                SizedBox(height: 20,),
                selectedImage != null
                    ? Image.file(
                  selectedImage!,
                  height: 100,
                  width: 100,
                  fit: BoxFit.cover,
                )
                    : Text("No Image Selected"),
                SizedBox(height: 10,),
                TextField(
                  controller: imageController,
                  decoration: InputDecoration(
                    labelText: "Image Path",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                SizedBox(height: 30,),
                TextField(
                  controller: titleController,
                  decoration: InputDecoration(
                    labelText: "Title",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),

                SizedBox(height: 10,),
                TextField(
                  controller: priceController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: "Price",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),

                SizedBox(height: 10,),
                TextField(
                  controller: descriptionController,
                  decoration: InputDecoration(
                    labelText: "Description",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),

                SizedBox(height: 10,),
                TextField(
                  controller: categoryController,
                  decoration: InputDecoration(
                   labelText: "Category",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                SizedBox(height: 20,),
                ElevatedButton(onPressed: ()async{
                categoryController.clear();
                titleController.clear();
                imageController.clear();
                priceController.clear();
                descriptionController.clear();
                bodyController.clear();
                  PostModel post=PostModel(title: titleController.text, body: bodyController.text, price: priceController.text, description: descriptionController.text, category: categoryController.text, image: imageController.text);
                  await  service.createPost(post);
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Post Added Successfully")));

                }, child: Text("Add Post"))
              ],
            )
          ],
        ),
      ),
    );
  }
}