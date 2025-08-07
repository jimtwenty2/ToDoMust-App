import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:todomust_app/controllers/persistent/global_controller.dart';

class ImagePickerController extends GetxController {
  final globalController = Get.find<GlobalController>();

  // for Profile image
  Future getImage() async {
    globalController.getImage();
  }

  // for Cover image
  Future<void> pickCoverImage() async {
    globalController.pickCoverImage();
  }
}

//
/*
class ImagePickerController extends GetxController {
  // Observable variables
  RxString imagePath = ''.obs;
  RxString coverPath = ''.obs;
  final ImagePicker imagePicker = ImagePicker();

  final _box = GetStorage();

  @override
  void onInit() {
    super.onInit();
    imagePath.value = _box.read('profilePath') ?? '';
    coverPath.value = _box.read('coverPath') ?? '';
  }

  // for Profile image
  Future getImage() async {
    final imagePicked = await imagePicker.pickImage(
      source: ImageSource.gallery,
    );
    if (imagePicked != null) {
      imagePath.value = imagePicked.path.toString();
      _box.write('profilePath', imagePath.value);
    }
  }

  // for Cover image
  Future<void> pickCoverImage() async {
    final pickedFile = await imagePicker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      coverPath.value = pickedFile.path.toString();
      _box.write('coverPath', coverPath.value);
    }
  }
}

 */
