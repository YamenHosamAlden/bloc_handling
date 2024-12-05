import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class TestFormFiald extends StatelessWidget {
  TestFormFiald({super.key});

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
          key: formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CustomForm(
                onChanged: (value) {
                  print("what is the value $value");
                },
                validatorText: (value) {
                  if (value == null) {
                    return "image is required";
                  }
                  return null;
                },
              ),
              ElevatedButton(
                onPressed: () {
                  if (formKey.currentState!.validate()) {}
                },
                child: Text("Click me"),
              )
            ],
          )),
    );
  }
}

class CustomForm extends FormField<File> {
  CustomForm(
      {Key? keyForm,
      String? Function(File?)? validatorText,
      ValueChanged<File?>? onChanged,
      AutovalidateMode? autovalidate,
      File? initialImageValue,
      ImageFormController? imageFormController})
      : super(
            key: keyForm,
            initialValue: initialImageValue,
            builder: (FormFieldState<File> field) {
              void onChangedHandler(File? value) {
                field.didChange(value);
                onChanged?.call(value);
              }

              return Column(
                children: [
                  ImageForm(
                    imageFormController: imageFormController,
                    initialValue: initialImageValue,
                    onChanged: onChangedHandler,
                  ),
                  if (field.hasError)
                    Text(
                      field.errorText ?? "",
                      style: const TextStyle(color: Colors.red),
                    )
                ],
              );
            },
            autovalidateMode: autovalidate,
            validator: validatorText);
}

class ImageForm extends StatefulWidget {
  final ImageFormController? imageFormController;
  final void Function(File?)? onChanged;
  final File? initialValue;

  const ImageForm({
    this.initialValue,
    this.imageFormController,
    this.onChanged,
    super.key,
  });

  @override
  State<ImageForm> createState() => _ImageFormState();
}

class _ImageFormState extends State<ImageForm> {
  late ImageFormController imageFormController;
  late File? initialValue;
  @override
  void initState() {
    initialValue = widget.initialValue;
    imageFormController = widget.imageFormController ??
        ImageFormController(initialFileValue: initialValue);
    super.initState();
  }

  // void _onChange() {
  //   if (widget.onChanged != null) {
  //     widget.onChanged!(imageFormController.value!);
  //   }
  // }

  // @override
  // void didUpdateWidget(covariant ImageForm oldWidget) {
  //   super.didUpdateWidget(oldWidget);
  //   if (oldWidget.imageFormController != imageFormController) {
  //     imageFormController.removeListener(_onChange);
  //     imageFormController = widget.imageFormController ?? ImageFormController();
  //     imageFormController.addListener(_onChange);
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<File?>(
        valueListenable: imageFormController,
        builder: (context, value, child) {
          return Column(
            children: [
              InkWell(
                  onTap: () async {
                    XFile? pickImage = await ImagePicker()
                        .pickImage(source: ImageSource.camera);
                    if (pickImage != null) {
                      imageFormController.pickImage(File(pickImage.path));
                      widget.onChanged!(imageFormController.value!);
                    }
                  },
                  child: CircleAvatar(
                    backgroundImage: imageFormController.value != null
                        ? FileImage(imageFormController.value!)
                        : null,
                  )),
              if (imageFormController.value != null)
                MaterialButton(
                  onPressed: () {
                    imageFormController.removeImage();
                    widget.onChanged!(null);
                  },
                  child: const Text("Remove"),
                ),
            ],
          );
        });
  }
}

class ImageFormController extends ValueNotifier<File?> {
  ImageFormController({File? initialFileValue}) : super(initialFileValue);

  pickImage(newFileImage) {
    value = newFileImage;
    notifyListeners();
  }

  removeImage() {
    value = null;
    notifyListeners();
  }
}
