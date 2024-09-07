// using get_storage package to interact with a local database 
 import 'dart:async';

import 'package:get_storage/get_storage.dart';

class TLocalStorage{

  late final GetStorage _storage;

  static TLocalStorage? _instance;

  TLocalStorage._internal();

  factory TLocalStorage.instance(){
     _instance ??= TLocalStorage._internal();
     return _instance!;
  }
  Future<void> writeData<T>(String key, T value) async{
    await _storage.write(key, value);
  }

  static Future<void> init(String bucketName)async{
     await GetStorage.init(bucketName);
     _instance = TLocalStorage._internal();
     _instance!._storage = GetStorage(bucketName); 
  }
  Future<void> saveData<T>(String key,T value) async{
    await _storage.write(key, value);
  }

  T? readData<T>(String key){
    return _storage.read<T>(key);
  }

  
  Future<void> removeData<T>(String key) async{
    await _storage.remove(key);
  }

  
  Future<void> clearAll<T>() async{
    await _storage.erase();
  }




}