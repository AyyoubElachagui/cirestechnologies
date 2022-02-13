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

  Future<Map<String, dynamic>> getNewsScience() async{
    Map<String, dynamic> data =  await apiClient.get(apiPath: 'science');
    return data;
  }

  Future<Map<String, dynamic>> getNewsBusiness() async{
    Map<String, dynamic> data =  await apiClient.get(apiPath: 'business');
    return data;
  }

  Future<Map<String, dynamic>> getNewsSports() async{
    Map<String, dynamic> data =  await apiClient.get(apiPath: 'sports');
    return data;
  }

  Future<Map<String, dynamic>> getNewsTechnology() async{
    Map<String, dynamic> data =  await apiClient.get(apiPath: 'technology');
    return data;
  }

  Future<Map<String, dynamic>> getNewsAutomobile() async{
    Map<String, dynamic> data =  await apiClient.get(apiPath: 'automobile');
    return data;
  }

}

