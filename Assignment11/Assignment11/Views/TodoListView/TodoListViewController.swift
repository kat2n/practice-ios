import UIKit

class TodoListViewController: UITableViewController {

  let cellId = "todo-list-cell"

  var model: TodoListViewModel!

  init(todoList: TodoList) {
    self.model = TodoListViewModel(todoList: todoList)
    super.init(nibName: nil, bundle: nil)
  }

  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
  }

  override func viewDidLoad() {
    super.viewDidLoad()

    tableView.register(TodoListCell.self, forCellReuseIdentifier: cellId)

    navigationItem.title = "Todo List"
    navigationItem.leftBarButtonItem = editButtonItem
    navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(handleAddButton))

    tableView.allowsMultipleSelectionDuringEditing = true
  }

  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)

    tableView.reloadData()
  }

  override func numberOfSections(in tableView: UITableView) -> Int {
    return 1
  }

  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return model.todoList.data.count
  }

  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! TodoListCell
    cell.render(model.todoList.get(indexPath.row))
    return cell
  }

  override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    navigationController?.pushViewController(TodoDetailsViewController(task: model.todoList.get(indexPath.row)), animated: true)
  }

  override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
    return true
  }

  override func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {

    let delete = UITableViewRowAction(style: .normal, title: "Delete") { action, indexPath in
      self.model.delete(indexPath.row)
      tableView.deleteRows(at: [indexPath], with: .fade)
    }
    delete.backgroundColor = .red

    return [delete]
  }

  override func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {

  }

  override func setEditing(_ editing: Bool, animated: Bool) {
    super.setEditing(editing, animated: animated)
    tableView.isEditing = editing
  }

  @objc func handleAddButton() {
    present(AddTodoViewController(todoList: model.todoList), animated: true)
  }

}

