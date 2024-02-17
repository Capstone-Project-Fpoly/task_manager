import 'package:task_manager/feature/drag_and_drop/drag_and_drop_bloc.dart';
import 'package:task_manager/graphql/Fragment/card_fragment.graphql.dart';
import 'package:task_manager/graphql/Mutations/card/create_card.graphql.dart';
import 'package:task_manager/graphql/Mutations/card/move_card.graphql.dart';
import 'package:task_manager/schema.graphql.dart';

extension DragAndDropCardExtention on DragAndDropBloc {
  Future<Fragment$CardFragment?> fetchCreateCard({
    required String idList,
    required String title,
  }) async {
    isLoadingAddSubject.value = true;
    final result = await graphqlService.client.mutate$CreateCard(
      Options$Mutation$CreateCard(
        variables: Variables$Mutation$CreateCard(
          idList: idList,
          title: title,
        ),
      ),
    );
    isLoadingAddSubject.value = false;
    if (result.hasException) {
      return null;
    }
    return result.parsedData?.createCard;
  }

  Future<void> fetchMoveCard({
    required int oldItemIndex,
    required int oldListIndex,
    required int newItemIndex,
    required int newListIndex,
  }) async {
    final input = Input$InputMoveCard(
      newItemIndex: newItemIndex,
      newListIndex: newListIndex,
      oldItemIndex: oldItemIndex,
      oldListIndex: oldListIndex,
    );
    final result = await graphqlService.client.mutate$MoveCard(
      Options$Mutation$MoveCard(
        variables: Variables$Mutation$MoveCard(
          idBoard: idBoard,
          input: input,
        ),
      ),
    );
    if (result.hasException || result.parsedData == null) {
      toastService.showText(
        message: 'Di chuyển thẻ thất bại. Hãy thử lại',
      );
      fetchListFragmentByIdBoard();
      return;
    }
  }
}
