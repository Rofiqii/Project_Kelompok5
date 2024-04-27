import 'package:flutter_application_1/data/repository/user_repo.dart';
import 'package:flutter_application_1/models/response.model.dart';
import 'package:flutter_application_1/models/user_model.dart';
import 'package:get/get.dart';

class UserController extends GetxController implements GetxService {
  final UserRepo userRepo;

  UserController({required this.userRepo});
  late UserModel _userModel;
  bool _isLoading = false;

  bool get isLoading => _isLoading;
  UserModel get userModel => _userModel;

  Future<ResponseModel> getUserInfo() async {
    
    
    Response response = await userRepo.getUserInfo();
    late ResponseModel responseModel;
    if (response.statusCode == 200) {
      //code 200 means no error
      _userModel = UserModel.fromJson(response.body);
      _isLoading = true;
      responseModel = ResponseModel(true, "successfully");
    } else {
      responseModel = ResponseModel(false, response.statusText!);
      print(response.statusCode);
      print(response.statusText);
      print("authController above");
    }
    _isLoading = false;
    //update for changes on front end
    update();
    return responseModel;
  }
}
