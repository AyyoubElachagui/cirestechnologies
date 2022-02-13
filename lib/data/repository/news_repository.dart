import 'dart:math';

import 'package:cirestechnologies/app/utils/toast_widget.dart';
import 'package:cirestechnologies/data/model/news_model.dart';
import 'package:cirestechnologies/services/api_client.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NewsRepository{
  final apiClient = ApiClient(apiBaseUrl: 'https://inshortsapi.vercel.app/news?category=', dio: Dio());
  final ToastUtils toastUtils = ToastUtils();

  Future<Map<String, dynamic>> getNewsStartUp() async{
    Map<String, dynamic> data =  await apiClient.get(apiPath: 'startup');
    return data;
  }
}

