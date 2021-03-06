import Foundation

class Task2 {

  var title: String
  var description: String
  var priority: Int
  var isCompleted: Bool

  init(title: String, description: String = "", priority: Int = 100, isCompleted: Bool = false) {
    self.title = title
    self.description = description
    self.priority = priority
    self.isCompleted = isCompleted
  }

  func complete() {
    isCompleted = true
  }

}
