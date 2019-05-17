import Foundation

class TodoListViewModel {

  private(set) var todoList: TodoList

  init(todoList: TodoList) {
    self.todoList = todoList
  }

  func delete(_ index: Int) {
    todoList.remove(index)
  }

}
