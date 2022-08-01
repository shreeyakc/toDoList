//
//  tableTableViewController.swift
//  toDoList
//
//  Created by Scholar on 7/29/22.
//

import UIKit

class ToDoTableViewController: UITableViewController {

    var toDos : [ToDo] = []
  
    override func viewDidLoad() {
      
        super.viewDidLoad()

        toDos = createToDos()
        
    }

    func createToDos() -> [ToDo] {

      let swift = ToDo()
      swift.name = "Learn Swift"
      swift.important = true

      let dog = ToDo()
      dog.name = "Walk the Dog"
      // important is set to false by default

      return [swift, dog]
    }

//    override func numberOfSections(in tableView: UITableView) -> Int {
//        return 1
//    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return toDos.count
    }

    //hello
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...
        
        let toDo = toDos[indexPath.row]
        
        if toDo.important {
            cell.textLabel?.text = "❗️" + toDo.name
          } else {
            cell.textLabel?.text = toDo.name
          }
     
        return cell
    }

    override func prepare(for segue : UIStoryboardSegue, sender : Any?){
        if let addVC = segue.destination as? AddToDoViewController {
            addVC.previousVC = self
        }
    }

}
