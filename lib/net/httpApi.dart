import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:running_demo/NetService/BasicNetService.dart';
import 'package:running_demo/NetService/ResultData.dart';
import 'package:running_demo/bean/testBean.dart';
import 'package:running_demo/net/httputils.dart';
import 'package:running_demo/net/netCode.dart';
import 'package:running_demo/net/requestParams.dart';

export 'package:dio/dio.dart';

class HttpApi {
  factory HttpApi() => _getInstance();

  static BuildContext context;

//  static HttpApi get instance => _getInstance();
  static HttpApi instance(BuildContext buildContext) {
    context = buildContext;
    _getInstance();
  }

  static HttpApi _instance;

  static final int SUCCEED = 0;
  static final int FAILED = 1;

  HttpApi._internal() {
    ///初始化
  }

  static HttpApi _getInstance() {
    if (_instance == null) {
      _instance = new HttpApi._internal();
    }
    return _instance;
  }

  ///获取链接
  static Future<ResultData> postBookCity() async {
    print("书城：" + NetCode.URL_BOOK_CHANNEL);
//    print("书城：" +
//        RequestParams.encodeBase64(await FlutterAesEcbPkcs5.encryptString(
//            LocalConstant.shuju, LocalConstant.key)));
//    print("书城：" +
//        await FlutterAesEcbPkcs5.decryptString(
//            LocalConstant.shuju, LocalConstant.key));
//    var text = await RequestParams.getParams(context);
//    print("书城：" + text);
    Map<String, String> params = Map();
    var getParams = await RequestParams.getParams(context);
    params.putIfAbsent("data", () => getParams);
    params.forEach((k, v) {
      print("请求的参数：" + k + "=" + v.toString()); //类型不一样的时候就toString()
    });
//    print("书城：" + RequestParams.getParams(context).toString());
    ResultData resultData = await BasicNetService()
        .post(NetCode.URL_BOOK_CHANNEL, params: {params});
    print("书城：" + resultData.toString());
    return resultData;
  }

  static Future<String> getData() async {
    print("获取数据");
    return await HttpUtils.getInstance()
        .get("https://wanandroid.com/article/listproject/0/json");
  }

  static Future<TestBean> getTest() async {
    print("获取数据");
    var data = await HttpUtils.getInstance()
        .get("https://wanandroid.com/article/listproject/0/json");
    Map map = json.decode(data);
    TestBean testBean = TestBean.fromMap(map);
    return testBean;
  }
}
