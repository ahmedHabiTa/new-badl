import 'dart:convert';

import 'package:badl/core/constants.dart';
import 'package:badl/core/util/api_base_helper.dart';
import 'package:badl/core/util/shared_pref_helper.dart';
import 'package:badl/features/auth/presentation/pages/register_screen.dart';
import 'package:badl/models/country_model.dart';
import 'package:badl/models/login.dart';
import 'package:badl/models/user.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../../Home/presentation/pages/tabs_screen.dart';

class AuthProvider extends ChangeNotifier {
  FirebaseAuth auth = FirebaseAuth.instance;
  String verificationId = "";
  bool isLoading = false;

  Future<void> getOtpNumber({
    required String phoneNumber,
  }) async {
    isLoading = true;
    await auth.verifyPhoneNumber(
      phoneNumber: phoneNumber,
      verificationCompleted: (PhoneAuthCredential credential) async {
        await auth.signInWithCredential(credential);
      },
      verificationFailed: (FirebaseAuthException exception) {
        if (exception.code == 'invalid-phone-number') {
          print('invalid-phone-number');
        }
      },
      codeSent: (String verificationId, int? resendToken) {
        this.verificationId = verificationId;
      },
      codeAutoRetrievalTimeout: (String verificationId) {},
    );
    isLoading = false;
    notifyListeners();
  }

  Future<void> verify({
    required String smsCode,
    required BuildContext context,
  }) async {
    isLoading = true;
    PhoneAuthCredential phoneAuthCredential = PhoneAuthProvider.credential(
      verificationId: verificationId,
      smsCode: smsCode,
    );
    try {
      await auth.signInWithCredential(phoneAuthCredential);
      //Constants.navigateToRep(routeName: RegisterScreen(), context: context);
    } on FirebaseAuthException catch (error) {
      Constants.showToast(
          message: 'كود خطأ من فضل تحقق مره اخري', color: Colors.red);
    }
    isLoading = false;
    notifyListeners();
  }

  // void signInWithAuthCredential(PhoneAuthCredential phoneAuthCredential) async {
  //   try {
  //     final authCredential =
  //         await auth.signInWithCredential(phoneAuthCredential);
  //     if (authCredential.user != null) {
  //       print('success');
  //     }
  //   } on FirebaseAuthException catch (e) {
  //     print('exception is $e');
  //   }
  // }

  Future<void> login({
    required String mobile,
    required BuildContext context,
  }) async {
    isLoading = true;
    try {
      final body = {
        "mobile": mobile,
        "country_id": '1',
      };
      final response = await ApiBaseHelper.post(
        url: 'api/auth/login',
        body: body,
      );
      
      if (response.statusCode == 201) {
        var data = json.decode(response.body)['user'];
        await SharedPrefsHelper.saveData(key: 'isLogged', value: true);
        await SharedPrefsHelper.saveData(key: 'userID', value: data['id']);
        await SharedPrefsHelper.saveData(key: 'username', value: data['name']);
        await SharedPrefsHelper.saveData(
            key: 'userCountryID', value: data['country_id']);
        await SharedPrefsHelper.saveData(
            key: 'userMobile', value: data['mobile']);
        await SharedPrefsHelper.saveData(key: 'userType', value: data['type']);
        Constants.navigateToRep(
            routeName: const TabsScreen(), context: context);
      } else if (response.statusCode == 200) {
        final res = LoginResponse.fromJson(json.decode(response.body));
        if (res.status == 'notuser') {
          Constants.navigateToRep(
              routeName: RegisterScreen(mobile: mobile), context: context);
        }
      } else {
        Constants.showToast(message: 'خطأ في السيرفر', color: Colors.red);
      }
    } catch (error) {
      print(error.toString());
      throw UnimplementedError();
    }
    isLoading = false;
    notifyListeners();
  }

  Future<void> register({
    required String mobile,
    required String name,
    required BuildContext context,
  }) async {
    isLoading = true;
    try {
      final body = {
        "mobile": mobile,
        "country_id": '1',
        'name': name,
      };
      final response = await ApiBaseHelper.post(
        url: 'api/auth/register',
        body: body,
      );
      if (response.statusCode == 201) {
        final res = UserModel.fromJson(json.decode(response.body));
        print(res.user.toString());
        await SharedPrefsHelper.saveData(key: 'isLogged', value: true);
        await SharedPrefsHelper.saveData(key: 'userID', value: res.user.id);
        await SharedPrefsHelper.saveData(key: 'username', value: res.user.name);
        await SharedPrefsHelper.saveData(
            key: 'userCountryID', value: res.user.countryId);
        await SharedPrefsHelper.saveData(
            key: 'userMobile', value: res.user.mobile);
        await SharedPrefsHelper.saveData(key: 'userType', value: res.user.type);
        Constants.navigateToRep(
            routeName: const TabsScreen(), context: context);
      } else {
        Constants.showToast(message: 'خطأ في السيرفر', color: Colors.red);
      }
    } catch (error) {
      throw UnimplementedError();
    }

    isLoading = false;
    notifyListeners();
  }

  List<CountryDetails>? _countryList;

  List<CountryDetails>? get countryList => _countryList;

  Future<void> getCountry() async {
    try {
      final response = await ApiBaseHelper.get(url: 'api/countries');

      if (response.statusCode == 200) {
        List result = json.decode(response.body)['data'];
        _countryList = result.map((e) => CountryDetails.fromMap(e)).toList();
        print(_countryList?.first.title);
      }
    } catch (error) {
      throw UnimplementedError();
    }
    notifyListeners();
  }
}
