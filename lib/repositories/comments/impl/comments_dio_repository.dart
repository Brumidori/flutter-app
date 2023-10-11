import 'package:trilhaapp/model/comment_model.dart';
import 'package:trilhaapp/repositories/comments/comments_repository.dart';
import 'package:trilhaapp/repositories/jsonplacheholder_custom_dio.dart';

class CommentsDioRepsositoy implements CommentsRepository {
  @override
  Future<List<CommentModel>> retornaComentarios(int postId) async {
    var jsonPlaceHolderCustonDio = JsonPlaceHolderCustomDio();
    var response =
        await jsonPlaceHolderCustonDio.dio.get("/posts/$postId/comments");
    return (response.data as List)
        .map((e) => CommentModel.fromJson(e))
        .toList();
  }
}
