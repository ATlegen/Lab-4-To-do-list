//
//  ViewController.swift
//  todolist
//
//  Created by Assemgul on 28.11.2023.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var textfieldname: UITextField!
    
    @IBOutlet weak var textfieldtelephone: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func addtask(_ sender: Any) {
        
        let taskName = textfieldname.text!
        let taskTelephone = textfieldtelephone.text!
        let defaults = UserDefaults.standard
        
        var newTask = TaskItem()
        newTask.name = taskName
        newTask.telephone = taskTelephone
        
        do {
            if let data = defaults.data(forKey: "taskItemArray") {
                var array = try JSONDecoder().decode([TaskItem].self, from: data)
                
                array.append(newTask)
                let encodedata = try JSONEncoder().encode(array)
                defaults.set(encodedata, forKey: "taskItemArray")
                
            }  else {
                
                let encodedata = try JSONEncoder().encode([newTask])
                defaults.set(encodedata, forKey: "taskItemArray")
            }
            
        } catch {
            print("unable to encode \(error)")
        }
        
//        if let array = defaults.array(forKey: "taskItemArray") {
//            taskarray = array as! [TaskItem]
//            
//            taskarray.append(newTask)
//            
//            defaults.set(taskarray, forKey: "taskItemArray")
//            
//        } else {
//            let array = [newTask]
//            
//            defaults.set(taskarray, forKey: "taskItemArray")
//        }
            
        
//        var taskarray:[String] = []
//        
//        if let array = defaults.array(forKey: "taskArray") {
//            taskarray = array as! [String]
//            
//            taskarray.append(taskName)
//            defaults.set(taskarray, forKey: "taskArray")
//        } else {
//            let array = [taskName]
//            defaults.set(array, forKey: "taskArray")
//        }
        textfieldname.text = ""
        textfieldtelephone.text = ""
    }
    
}

