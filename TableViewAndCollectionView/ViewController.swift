//
//  ViewController.swift
//  TableViewAndCollectionView
//
//  Created by Macbook on 11/12/20.
//

import UIKit

class ViewController: UIViewController {
    
    //How to create a table view with custom array
    //1.- Add the UITableView from Autolayout
    //2.- Add the datasource delegate to sel and create the extension UITableViewDataSource
    
    @IBOutlet weak var tableView: UITableView!
    private let countryList = ["El Salvador","Argentina","Perú","Francia","Italia","Alemania","Guatemala"]
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
        
        
        
        //Register new Custom cell -- nibName == <Name of the file without .swift> and the forCellReuseIdentifier == <identifier fo the .xib file>
        tableView.register(UINib(nibName: "CustomTableViewCell", bundle: nil), forCellReuseIdentifier: "myCustomCell")
        
        
    }
    
    
}


//Protocol delegate of the datasource
extension ViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 0 {
            return "Primero"
        }
        return "Segundo"
    }
    
    func tableView(_ tableView: UITableView, titleForFooterInSection section: Int) -> String? {
        if section == 0 {
            return "Primero"
        }
        return "Segundo"
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 100
    }
    
    //Returns the count of the table view, through the array size
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return countryList.count
    }
    
    //Returns the cell, dequeueReusableCell is used for reutilice the cell, if cell is null then create a new cell
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.section == 0 {
            var cell = tableView.dequeueReusableCell(withIdentifier: "myCell")
            
            if cell == nil {
                cell = UITableViewCell(style: .default, reuseIdentifier: "myCell")
                cell?.backgroundColor = .gray
                cell?.textLabel?.font = UIFont.systemFont(ofSize: 20)
            }
            
            cell!.textLabel?.text = countryList[indexPath.row]
            return cell!
        }else {
            
            let customCell = tableView.dequeueReusableCell(withIdentifier: "myCustomCell", for: indexPath) as? CustomTableViewCell
            
            customCell?.myFirstLabel.text = String(indexPath.row + 1)
            customCell!.mySecondLabel.text = countryList[indexPath.row]
            
            return customCell!
        }
        
    }
    
    //Returns the number of sections
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    
    //Returns the height of the row. for section 1 return 50 and if other section 150
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0 {
            return 50
        }
        
        return UITableView.automaticDimension
    }
    
}

//Extensions for handler event. For example clicks.
extension ViewController: UITableViewDelegate {
    
    //This function will call when the user click on the cell
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(countryList[indexPath.row])
    }
}

