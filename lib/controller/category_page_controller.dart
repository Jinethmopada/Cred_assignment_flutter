import 'package:get/get.dart';

class CredController extends GetxController{
  final RxBool switchStatus = false.obs;

  void toggleSwitch() {
    switchStatus.value = !switchStatus.value;
  }

  final RxBool isWidgetsVisible = true.obs;

  void toggleWidgetsVisibility() {
    isWidgetsVisible.value = !isWidgetsVisible.value;
  }

  RxString imageValue = ''.obs;
  RxString textValue = ''.obs;
  RxString descriptionValue = ''.obs;

  void onAddImagesAndText(image,text,description){
    imageValue.value = image;
    textValue.value = text;
    descriptionValue.value = description;
  }

}

