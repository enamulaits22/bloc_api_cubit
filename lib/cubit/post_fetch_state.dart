part of 'post_fetch_cubit.dart';

class PostFetchState {
  List<PostModel> postModel;
  bool isLoading;

  PostFetchState({
    required this.postModel,
    this.isLoading = true,
  });
}