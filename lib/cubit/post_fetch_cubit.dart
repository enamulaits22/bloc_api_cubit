import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc_concepts/models/post_model.dart';
import 'package:flutter_bloc_concepts/services/post_service.dart';
part 'post_fetch_state.dart';

class PostFetchCubit extends Cubit<PostFetchState> {
  PostFetchCubit() : super(PostFetchState(postModel: []));

  void getData(BuildContext context) async {
    emit(PostFetchState(postModel: [], isLoading: true));
    try {
      final postList = await PostService().fetchData();
      emit(PostFetchState(postModel: postList, isLoading: false));
    } catch (err) {
      emit(PostFetchState(postModel: [], isLoading: false));
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('$err'), backgroundColor: Colors.red,));
      log("Error: $err");
    }
  }
}
