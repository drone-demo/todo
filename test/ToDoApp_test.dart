library validate_test;
import "package:unittest/unittest.dart";
import "dart:html";
import "../web/todo.dart";

void main() {
  var toDoInput = new InputElement();
  toDoInput.id = "to-do-input";
  var toDoList = new UListElement();
  toDoList.id = "to-do-list";
  var toDoErr = new DivElement();
  toDoErr.id = "to-do-err";

  document.body.nodes.add(toDoInput);
  document.body.nodes.add(toDoList);
  document.body.nodes.add(toDoErr);
  
  // create the new ToDo App
  var app = new ToDoApp();

  test('show error message', (){
    app.showError("test error message");
    expect(toDoErr.text, equals("test error message"));
  });
  
  test('hide error message', (){
    app.hideError();
    expect(toDoErr.classes, contains("hide"));
  });

  num x="test todo text limit";
  test(x, () {
     expect(ToDoApp.isTooLong("go skydiving"), equals(false));
     expect(ToDoApp.isTooLong("this is a really, really, really long task that exceeds 50 characters and should fail this test"), equals(true));
  });
}
