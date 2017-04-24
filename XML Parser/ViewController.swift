//
//  ViewController.swift
//  XML Parser
//
//  Created by Asif Ikbal on 4/20/17.
//  Copyright © 2017 Asif Ikbal. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {
    
    //MARK: Properties
    
    var foodArray:[Food] = []


    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        

        /// <#Description#>
        let pathToFile = Bundle.main.url(forResource: "simple", withExtension: "xml")
        
        do {
            let parser = try FoodParser(data: Data(contentsOf: pathToFile!))
            foodArray = parser.parseData()
            
            
        } catch  {
            print(error)
        }

        
    }


    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return foodArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
      
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! FoodTableViewCell
        
        let foodObj = foodArray[indexPath.row]
        
        cell.name.text = foodObj.foodName
        cell.price.text = foodObj.foodPrice
        cell.descriptionLabel.text = foodObj.foodDescrition
        cell.caloris.text = String(foodObj.foodCaloris)
        
        return cell
    }            

}

