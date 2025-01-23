import 'package:path/path.dart';
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:softwie/Modules/Register/manager/register_states.dart';
import 'dart:async';
import '../../../Models/user_register_model.dart';
import '../../login/data/repos/login_and_register_repo.dart';


class UserRegisterCubit extends Cubit<UserRegisterStates> {

  UserRegisterCubit(this.loginAndRegisterRepo)
      :super(UserRegisterInitialState());

  // UserRegisterModel? registeredUser;
  static UserRegisterCubit get(context) => BlocProvider.of(context);

  final LoginAndRegisterRepo loginAndRegisterRepo;

  Future<void> getUserData(UserRegisterModel userRegisterModel) async {
    emit(UserRegisterLoadingState());
    var result =
    await loginAndRegisterRepo.fetchUserRegisterData(userRegisterModel);
    result.fold((serverFailure) =>
        emit(UserRegisterErrorState(serverFailure.errMessage)),
            (userRegisterModel) =>
            emit(PickedProfileImageSuccessState()));
  }


  Future<void> getUserRegisterData() async {
    emit(GetUserRegisterDataLoadingState());
    var result =
    await loginAndRegisterRepo.getUserData();
    result.fold((serverFailure) =>
        emit(GetUserRegisterDataErrorState(serverFailure.errMessage)),
            (userRegisterModel) =>
            emit(GetUserRegisterDataSuccessState(userRegisterModel)));
  }


  FirebaseAuth auth = FirebaseAuth.instance;

  File? file;
  String profileImageUrl = '';
  Future getImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);
    try{

      if (image != null) {
        file = File(image.path);
        var imageProfileName = basename(image.path);
        print(imageProfileName);
        final storageRef = FirebaseStorage.instance.ref(imageProfileName);
        final metadataProfile = SettableMetadata(contentType: 'image/jpeg');
        await storageRef.putFile(file!,metadataProfile);
        profileImageUrl= await storageRef.getDownloadURL();
        emit(PickedProfileImageSuccessState());
        await updateUserProfileImage(
            image: profileImageUrl
        );
        print(file!.path);
      } else {

        emit(PickedProfileImageErrorState());
      }
    }catch(error){
      print(error.toString());
    }
  }

  File? coverImageOfUser;
  String coverImageUrl = '';


  UserRegisterModel userRegisterModel = UserRegisterModel();



  Future getCoverImage() async {

    final ImagePicker picker = ImagePicker();
    final XFile? imageGalley =
    await picker.pickImage(source: ImageSource.gallery);
    emit(PickedCoverImageLoadingState());

    if (imageGalley != null) {
      coverImageOfUser = File(imageGalley.path);
      var imageName = basename(imageGalley.path);
      print(imageName);
      final storageRef = FirebaseStorage.instance.ref(imageName);
      final metadata = SettableMetadata(contentType: 'image/jpeg');
      await storageRef.putFile(coverImageOfUser!, metadata);
      coverImageUrl = await storageRef.getDownloadURL();
      emit(PickedCoverImageSuccessState());
      await updateUserCoverImage(
          coverImage: coverImageUrl
      );
      print(coverImageUrl);
    } else {
    }
  }
  User? user = FirebaseAuth.instance.currentUser;
  Future<UserRegisterModel> updateUserProfileImage({
    required String image,
  }) async {
    getUserRegisterData();
    String userId =FirebaseAuth.instance.currentUser!.uid;
    await FirebaseFirestore.instance.collection('users').
    doc(userId).
    update({
      'image': profileImageUrl,
    }).then((value) {
      getUserRegisterData();
    }).catchError((e) {
      emit(UpdateUserErrorState());
      print(e.toString());
    });

    return userRegisterModel;
  }


  Future<UserRegisterModel> updateUserCoverImage({
    required String coverImage,
  }) async {
    getUserRegisterData();
    String userId =FirebaseAuth.instance.currentUser!.uid;
    await FirebaseFirestore.instance.collection('users').
    doc(userId).
    update({
      'coverImage': coverImageUrl,
    }).then((value) {
      getUserRegisterData();
    }).catchError((e) {
      emit(UpdateUserErrorState());
      print(e.toString());
    });

    return userRegisterModel;
  }
}
