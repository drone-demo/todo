part of todo;

class ToDoApp {
  
  InputElement toDoInput;
  UListElement toDoList;
  DivElement toDoErr;
  
  ToDoApp() {
    toDoInput = query('#to-do-input');
    toDoList = query('#to-do-list');
    toDoErr = query('#to-do-err');
    toDoInput.on.change.add(addToDoItem);
  }
  
  void addToDoItem(Event e) {
    var newToDo = new LIElement();
    newToDo.text = toDoInput.value;

    if (isTooLong(toDoInput.value)) {
      showError("Your being too verbose. Please choose a shorter task name.");
      return;
    }

    this.hideError();
    toDoInput.value = '';
    toDoList.children.add(newToDo);
  }

  void showError(String error) {
    toDoErr.text = error;
    toDoErr.classes.remove("hide");
  }
  
  void hideError() => toDoErr.classes.add("hide");
  
  static bool isTooLong(String todo) => todo.length > 50;
}



