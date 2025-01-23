import 'dart:io';
import 'package:path/path.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';
import '../../../../Models/user_login_model.dart';
import '../../../../Models/user_register_model.dart';
import '../../../../core/error/failures.dart';
import 'login_and_register_repo.dart';

class LoginAndRegisterRepoImplement extends LoginAndRegisterRepo {

  FirebaseAuth auth = FirebaseAuth.instance;

  @override
  Future<Either<Failure, UserLoginModel>> fetchUserLoginData(
      UserLoginModel userLoginModel) async {
    try {
      await auth.signInWithEmailAndPassword(
          email: userLoginModel.email,
          password: userLoginModel.password);
      print(userLoginModel);
      return Right(userLoginModel);

    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        return Left(ServerFailure(
            e.toString(), errorMessage: 'The password provided is too weak.'));
      } else if (e.code == 'email-already-in-use') {
        return Left(ServerFailure(e.toString(), errorMessage:
        'The account already exists for that email.',
        ));
      } else {
        return Left(ServerFailure(e.toString(), errorMessage: e.toString()));
      }
    } catch (e) {
      return Left(ServerFailure(e.toString(), errorMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failure, UserRegisterModel>> fetchUserRegisterData(
      UserRegisterModel userRegisterModel) async {
    try {
      await auth.createUserWithEmailAndPassword(
          email: userRegisterModel.email,
          password: userRegisterModel.password);
      saveUserData(
          uId: auth.currentUser!.uid,
          name: userRegisterModel.name,
          email: userRegisterModel.email,
          image: userRegisterModel.image,
          coverImage: userRegisterModel.coverImage

      );
      return Right(userRegisterModel);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        return Left(ServerFailure(
            e.toString(), errorMessage: 'The password provided is too weak.'));
      } else if (e.code == 'email-already-in-use') {
        return Left(ServerFailure(e.toString(), errorMessage:
        'The account already exists for that email.',
        ));
      } else {
        return Left(ServerFailure(e.toString(), errorMessage: e.toString()));
      }
    } catch (e) {
      return Left(ServerFailure(e.toString(), errorMessage: e.toString()));
    }
  }


  @override
  Future<UserRegisterModel> saveUserData({
    required String uId,
    required String name,
    required String image,
    required String email,
    required String coverImage,
  }) async {
    UserRegisterModel userRegisterModel = UserRegisterModel(
        name: name,
        uId: uId,
        image: image,
        email: email,
        coverImage: coverImage
    );
    await FirebaseFirestore.instance.collection('users').
    doc(uId).
    set(userRegisterModel.toMap()).then((value) {
      print(uId);
      // emit(UserCreateSuccessState());
    }).catchError((e) {
      // emit(AppCreateErrorState());
      print(e.toString());
    });
    return userRegisterModel;
  }


  UserRegisterModel userRegisterModel = UserRegisterModel();

  @override
  Future<Either<Failure, UserRegisterModel>> getUserData() async {
    String userId = FirebaseAuth.instance.currentUser!.uid;
    // UserRegisterModel? userRegisterModel;
    await FirebaseFirestore.instance.collection('users').
    doc(userId).
    get().then((value) {
      userRegisterModel = UserRegisterModel.fromJson(value.data()!);
    }).catchError((e) {
      print(e.toString());
    });
    return Right(userRegisterModel);
  }


  File? coverImageOfUser;
  String coverImageUrl = '';

  @override
  Future getCoverImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? imageGalley =
    await picker.pickImage(source: ImageSource.gallery);
    // emit(PickedCoverImageLoadingState());

    if (imageGalley != null) {
      coverImageOfUser = File(imageGalley.path);
      // setState(() {});
      var imageName = basename(imageGalley.path);
      final storageRef = FirebaseStorage.instance.ref(imageName);
      final metadata = SettableMetadata(contentType: 'image/jpeg');
      await storageRef.putFile(coverImageOfUser!, metadata);
      coverImageUrl = await storageRef.getDownloadURL();
      //emit(PickedCoverImageSuccessState());
      await updateUserCoverImage(
          uId: auth.currentUser!.uid,
          name: userRegisterModel.name,
          email: userRegisterModel.email,
          image: userRegisterModel.image,
          coverImage: coverImageUrl
      );

    } else {
    }
  }

  Future<UserRegisterModel> updateUserCoverImage({
    required String uId,
    required String name,
    required String image,
    required String email,
    required String coverImage,
  }) async {
    UserRegisterModel userRegisterModel = UserRegisterModel(
        name: name,
        uId: uId,
        image: image,
        email: email,
        coverImage: coverImageUrl
    );
    await FirebaseFirestore.instance.collection('users').
    doc(auth.currentUser!.uid).
    update(userRegisterModel.toMap()).then((value) {
      getUserData();
// emit(UserCreateSuccessState());
    }).catchError((e) {
//emit(UpdateUserErrorState());
      print(e.toString());
    });

    return userRegisterModel;
  }
}