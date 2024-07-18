import Foundation

struct ToDoItem {
    var title: String
    var dueDate: Date?
    var isCompleted: Bool
    var priority: Priority
}

enum Priority: Int, Comparable {
    case low = 0
    case medium = 1
    case high = 2
    
    static func < (lhs: Priority, rhs: Priority) -> Bool {
        return lhs.rawValue < rhs.rawValue
    }
}

var toDoList: [ToDoItem] = []

func addItem(title: String, dueDate: Date?, isCompleted: Bool, prority: Priority) {
    let newItem = ToDoItem(title: title, dueDate: dueDate, isCompleted: isCompleted, priority: prority)
    toDoList.append(newItem)
}

func removeItem(at index: Int) {
    if index < toDoList.count {
        toDoList.remove(at: index)
    }
}

func markItemAsCompleted(at index: Int) {
    if index < toDoList.count {
        toDoList[index].isCompleted = true
    }
}

func listItems() {
    for item in toDoList {
        "\(item.title) - \(item.isCompleted ? "Completed" : "Pending")"
    }
}

func sortItemsByPriority() {
    toDoList.sort { $0.priority.rawValue < $1.priority.rawValue }
}

func filterCompletedItems() -> [ToDoItem] {
    return toDoList.filter({ $0.isCompleted })
}

addItem(title: "Go Coffee Shop", dueDate: Date(), isCompleted: true, prority: .high)
addItem(title: "Write Code", dueDate: Date(), isCompleted: true, prority: .high)
addItem(title: "Eat food", dueDate: Date(), isCompleted: true, prority: .medium)

listItems()
markItemAsCompleted(at: 1)
listItems()

let completedItems = filterCompletedItems()
"Completed items:"
for item in completedItems {
    item.title
}
