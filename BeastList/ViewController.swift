//
//  ViewController.swift
//  Segues
//
//  Created by admin on 08/12/2021.
//

import UIKit

class ViewController: UIViewController {
    
    
    var tasks = [String]()

    @IBOutlet weak var textFieldTask: UITextField!

    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var myBeastButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        makeItRounded()
        tableView.dataSource = self
        tableView.delegate = self
        
        // Do any additional setup after loading the view.
    }

    @IBAction func myBeastButton(_ sender: UIButton) {
        
        let newTasks = textFieldTask.text
        while(!(newTasks!.isEmpty)){
        if let newTasks = newTasks {
            tasks.insert(newTasks, at: 0)
        }
        textFieldTask.text = ""
        tableView.reloadData()
        print(tasks)
        break
        
        }}
    func makeItRounded(){
        textFieldTask.layer.cornerRadius = 8
        myBeastButton.layer.cornerRadius = 10
        textFieldTask.layer.borderColor = UIColor.blue.cgColor
}

    }
    
extension ViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tasks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            
        let cell = tableView.dequeueReusableCell(withIdentifier: "MyCell", for: indexPath) //as! MyBeastTableViewCell
            cell.textLabel?.text = tasks[indexPath.row]
            //cell.delegate = self
            
            return cell
        }


    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("Section: \(indexPath.section) and Row: \(indexPath.row)")
        tasks.remove(at: indexPath.row)
        tableView.reloadData()
    }


    

      
  }
