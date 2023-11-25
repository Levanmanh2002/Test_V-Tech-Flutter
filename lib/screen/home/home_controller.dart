import 'package:get/get.dart';

class HomeController extends GetxController {
  RxList<bool> selectedStates = List.generate(8, (index) => false).obs;

  void toggleSelection(int index) {
    selectedStates[index] = !selectedStates[index];
  }
}
