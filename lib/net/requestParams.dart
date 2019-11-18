import 'dart:async';
import 'dart:convert';
import 'dart:core';
import 'dart:io';

import 'package:connectivity/connectivity.dart';
import 'package:device_info/device_info.dart';
import 'package:flutter/material.dart';
import 'package:flutter_aes_ecb_pkcs5/flutter_aes_ecb_pkcs5.dart';
import 'package:package_info/package_info.dart';
import 'package:running_demo/constant/localConstant.dart';

class RequestParams {
  static final String AESTYPE = "AES/ECB/PKCS5Padding";

  static Future<String> getParams(BuildContext buildContext) async {
    Map<String, String> params = Map();
    String is_root = "";
    String imei = "";
    String mac = "";
    String wifi_mac = "";
    String is_emulator = "";
    String channel = "";
    String carrier = "";
    String net = "";
    String android_ver = "";
    String brand = "";
    String version_code = "";
    String version_name = "";
    String package_name = "";
    String os = "";
    String android_id = "";
    String timer = "";
    String tmpsign = "";
    String passport = "";
    String user_id = "";

//    Map<String, String> paramsMap = Map();
    DeviceInfoPlugin deviceInfo = new DeviceInfoPlugin();
    if (Platform.isIOS) {
      var iosInfo = await deviceInfo.iosInfo;
      print(_readIosDeviceInfo(iosInfo).toString());
//      print("name：" + iosInfo.name);
//      print("systemName：" + iosInfo.systemName);
//      print("systemVersion：" + iosInfo.systemVersion);
//      print("model：" + iosInfo.model);
//      print("localizedModel：" + iosInfo.localizedModel);
//      print("identifierForVendor：" + iosInfo.identifierForVendor);
//      print("isPhysicalDevice：" + iosInfo.isPhysicalDevice.toString());
//      print("utsname：" + iosInfo.utsname.toString());
    } else if (Platform.isAndroid) {
      var androidInfo = await deviceInfo.androidInfo;
      //获取包的信息
      PackageInfo packageInfo = await PackageInfo.fromPlatform();
      //判断网络类型
      var connectivityResult = await (Connectivity().checkConnectivity());
      if (connectivityResult == ConnectivityResult.mobile) {
        // 网络类型为移动网络

      } else if (connectivityResult == ConnectivityResult.wifi) {
        // 网络类型为WIFI
        net = "WIFI";
      }
      is_root = "0";
      imei = "";
      mac = "";
      wifi_mac = "18:4b:0d:2a:37:9c";
      is_emulator = "0";
      channel = "qmks_lt_ch1000001";
      carrier = "CUCC";
//      net = "";
      android_ver = androidInfo.version.sdkInt.toString();
      brand = androidInfo.brand;
      version_code = packageInfo.buildNumber;
      version_name = packageInfo.version;
//      package_name = packageInfo.packageName;
      package_name = "com.lt.bc.mb.qmks";
      os = "android";
      android_id = androidInfo.androidId;
      timer = new DateTime.now().millisecondsSinceEpoch.toString();
      passport = "1250685.1573699795.c2f434547204eabc255c89c1dfedebbf";
      user_id = "1250685";
      if (null != imei && null != wifi_mac && null != android_id) {
        tmpsign = "";
      }
//      print(_readAndroidBuildData(androidInfo).toString());

//      print("version：" + androidInfo.version.toString());
//      print("board：" + androidInfo.board);
//      print("bootloader：" + androidInfo.bootloader);
//      print("brand：" + androidInfo.brand);
//      print("device：" + androidInfo.device);
//      print("display：" + androidInfo.display);
//      print("fingerprint：" + androidInfo.fingerprint);
//      print("hardware：" + androidInfo.hardware);
//      print("host：" + androidInfo.host);
//      print("id：" + androidInfo.id);
//      print("manufacturer：" + androidInfo.manufacturer);
//      print("model：" + androidInfo.model);
//      print("product：" + androidInfo.product);
//      print("supported32BitAbis：" + androidInfo.supported32BitAbis.toString());
//      print("supported64BitAbis：" + androidInfo.supported64BitAbis.toString());
//      print("supportedAbis：" + androidInfo.supportedAbis.toString());
//      print("tags：" + androidInfo.tags);
//      print("type：" + androidInfo.type);
//      print("isPhysicalDevice：" + androidInfo.isPhysicalDevice.toString());
//      print("androidId：" + androidInfo.androidId);
    }

    return _getJointParams(
        params,
        is_root,
        imei,
        mac,
        wifi_mac,
        is_emulator,
        channel,
        carrier,
        net,
        android_ver,
        brand,
        version_code,
        version_name,
        package_name,
        os,
        android_id,
        timer,
        tmpsign,
        passport,
        user_id);
  }

  static Map<String, dynamic> _readAndroidBuildData(AndroidDeviceInfo build) {
    return <String, dynamic>{
      'version.securityPatch': build.version.securityPatch,
      'version.sdkInt': build.version.sdkInt,
      'version.release': build.version.release,
      'version.previewSdkInt': build.version.previewSdkInt,
      'version.incremental': build.version.incremental,
      'version.codename': build.version.codename,
      'version.baseOS': build.version.baseOS,
      'board': build.board,
      'bootloader': build.bootloader,
      'brand': build.brand,
      'device': build.device,
      'display': build.display,
      'fingerprint': build.fingerprint,
      'hardware': build.hardware,
      'host': build.host,
      'id': build.id,
      'manufacturer': build.manufacturer,
      'model': build.model,
      'product': build.product,
      'supported32BitAbis': build.supported32BitAbis,
      'supported64BitAbis': build.supported64BitAbis,
      'supportedAbis': build.supportedAbis,
      'tags': build.tags,
      'type': build.type,
      'isPhysicalDevice': build.isPhysicalDevice,
      'androidId': build.androidId
    };
  }

  static Map<String, dynamic> _readIosDeviceInfo(IosDeviceInfo data) {
    return <String, dynamic>{
      'name': data.name,
      'systemName': data.systemName,
      'systemVersion': data.systemVersion,
      'model': data.model,
      'localizedModel': data.localizedModel,
      'identifierForVendor': data.identifierForVendor,
      'isPhysicalDevice': data.isPhysicalDevice,
      'utsname.sysname:': data.utsname.sysname,
      'utsname.nodename:': data.utsname.nodename,
      'utsname.release:': data.utsname.release,
      'utsname.version:': data.utsname.version,
      'utsname.machine:': data.utsname.machine,
    };
  }

  static Future<String> _getJointParams(
      Map<String, String> params,
      String is_root,
      String imei,
      String mac,
      String wifi_mac,
      String is_emulator,
      String channel,
      String carrier,
      String net,
      String android_ver,
      String brand,
      String version_code,
      String version_name,
      String package_name,
      String os,
      String android_id,
      String timer,
      String tmpsign,
      String passport,
      String user_id) async {
    params.putIfAbsent("is_root", () => is_root);
    params.putIfAbsent("imei", () => imei);
    params.putIfAbsent("mac", () => mac);
    params.putIfAbsent("wifi_mac", () => wifi_mac);
    params.putIfAbsent("is_emulator", () => is_emulator);
    params.putIfAbsent("channel", () => channel);
    params.putIfAbsent("carrier", () => carrier);
    params.putIfAbsent("net", () => net);
    params.putIfAbsent("android_ver", () => android_ver);
    params.putIfAbsent("brand", () => brand);
    params.putIfAbsent("version_code", () => version_code);
    params.putIfAbsent("version_name", () => version_name);
    params.putIfAbsent("package_name", () => package_name);
    params.putIfAbsent("os", () => os);
    params.putIfAbsent("android_id", () => android_id);
    params.putIfAbsent("timer", () => timer);
    params.putIfAbsent("tmpsign", () => tmpsign);
    params.putIfAbsent("passport", () => passport);
    params.putIfAbsent("user_id", () => user_id);

//    encryptParams(params);
    print(params.toString());
    StringBuffer sb = new StringBuffer();

    params.forEach((k, v) {
//      print(k + "=" + v.toString()); //类型不一样的时候就toString()
      sb.write(k);
      sb.write("=");
      sb.write(v);
      sb.write("&");
    });

    String string = sb.toString();
//    print(string);
    string = string.substring(0, string.length - 1);
    print("加密前: " + string);
//    var key = await FlutterAesEcbPkcs5.generateDesKey(128);
//
//    print(key);
    var text =
        await FlutterAesEcbPkcs5.encryptString(string, LocalConstant.kay);
    print("加密后：" + '${text}');
    text = encodeBase64(text);
//
    print("base64后：" + '${text}');
//    FlutterAesEcbPkcs5.encryptString(string, LocalConstant.key);
//        .then(Future<String>);
//    print("222" + text);
//    await aesTest();
//    string = await FlutterAesEcbPkcs5.decryptString(
//        LocalConstant.lll, LocalConstant.kay);
//    print("222: " + string);
    return text;
  }

  /*
  * Base64加密
  */
  static String encodeBase64(String data) {
    var content = utf8.encode(data);
    var digest = base64Encode(content);
    return digest;
  }

  /*
  * Base64解密
  */
  static String decodeBase64(String data) {
    return String.fromCharCodes(base64Decode(data));
  }

  static Future debase64() async {
    var debase64 = decodeBase64(LocalConstant.shuju3);
    print("base64解密数据：" + debase64);
    var aes =
        await FlutterAesEcbPkcs5.decryptString(debase64, LocalConstant.kay);
    print("aes解密数据：" + aes);
  }

  static Future aesTest() async {
//    var data = "{\"username\":\"helloword\"}";

    //生成16字节的随机密钥
//    var key = await FlutterAesEcbPkcs5.generateDesKey(128);

    var data = LocalConstant.shuju;

    var key = LocalConstant.kay;

    print("key: " + key);
    //加密
    var encryptText = await FlutterAesEcbPkcs5.encryptString(data, key);

    print("encryptText: " + encryptText);

    //加密
    encryptText = encodeBase64(encryptText);

    print("encodeBase64: " + encryptText);

    encryptText = decodeBase64(encryptText);
    print("decodeBase64: " + encryptText);
    //解密
    var decryptText = await FlutterAesEcbPkcs5.decryptString(encryptText, key);

    print("decryptText: " + decryptText);
  }

  static String encryptParams(Map<String, String> sourceParams) {
    if (!sourceParams.containsKey("appKey")) {
//      sourceParams.putIfAbsent("appKey", LocalConstant.APP_KEY);
      sourceParams.putIfAbsent("appKey", () => "gosing_papa_book");
    }
    StringBuffer sb = new StringBuffer();

    sourceParams.forEach((k, v) {
      print(k + "==" + v.toString()); //类型不一样的时候就toString()
      sb.write(k);
      sb.write("=");
      sb.write(v);
      sb.write("&");
    });

    String string = sb.toString();
    print(string);
    string = string.substring(0, string.length - 1);
    print(string);
//    String encryptString =
//        FlutterAesEcbPkcs5.encryptString(string, LocalConstant.key).toString();
//    print(FlutterAesEcbPkcs5.encryptString(string, LocalConstant.key));
//    String encryptParams = aesEncrypt(LocalConstant.a, stringParams); //AES加密
    return string;
  }
}
