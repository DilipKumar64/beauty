import 'package:beauty/modals/single_service_model.dart';
import 'package:beauty/utils/constants.dart';
import 'package:beauty/utils/custom_exception.dart';

class HomeRepository {
  Future<List<SingleServiceModal>?> fetchServiceDetails() async {
    try {
      List<SingleServiceModal> list = [];
      final data = await firebaseFirestore.collection('services').get();
      for (var a in data.docs) {
        list.add(SingleServiceModal.fromJson(a.data()));
      }
      if (list.isEmpty) {
        return null;
      } else {
        return list;
      }
    } catch (e) {
      throw CustomException(
          message: 'Unable to fetch data from database: ${e.toString()}');
    }
  }
}
