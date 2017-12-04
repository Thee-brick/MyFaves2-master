//
//  MasterViewController.swift
//  MyFaves2
//
//  Created by Charles Konkol on 9/11/17.
//  Copyright © 2017 RockValleyCollege. All rights reserved.
//

import UIKit

class MasterViewController: UITableViewController {

    var detailViewController: DetailViewController? = nil
    // 1) comment out var objects line
    //var objects = [Any]()

     // 2) declare and initialize two arrays
    var ListOfPhotos:[UIImage] = []
    var ListOfFavs:[String]?
    var FavDetails:[String]?

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        // 3) Comment out below lines
//        navigationItem.leftBarButtonItem = editButtonItem
//
//        let addButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(insertNewObject(_:)))
//        navigationItem.rightBarButtonItem = addButton
//        if let split = splitViewController {
//            let controllers = split.viewControllers
//            detailViewController = (controllers[controllers.count-1] as! UINavigationController).topViewController as? DetailViewController
//        }
        
        // 4) Add items to 2 arrays
        //Menus
        ListOfPhotos = [
            UIImage(named: "home.jpg")!,
            UIImage(named: "Blog.jpg")!,
            UIImage(named: "Juice.jpg")!,
            UIImage(named: "Delivery.jpg")!,
            UIImage(named: "About.jpg")!,
            UIImage(named: "Contact.jpg")!,
            UIImage(named: "Info.jpg")!,
            UIImage(named: "Mod.jpg")!,]

        ListOfFavs = ["Home","Blog", "Shop Juice", "Local Delivery Details", "About", "Contact", "The More You Know", "Mod Father: Info and Warranty"]
        FavDetails = ["https://www.marcosvapor.com/#", "https://www.marcosvapor.com/home-marcos-vapor/blog/", "https://www.marcosvapor.com/home-marcos-vapor/shopjuice/", "https://www.marcosvapor.com/local-delivery-custom-clouds-vape-ejuice-eliquid/", "https://www.marcosvapor.com/home-marcos-vapor/about/", "https://www.marcosvapor.com/home-marcos-vapor/contact/", "https://www.marcosvapor.com/home-marcos-vapor/informational-videos/", "https://www.marcosvapor.com/home-marcos-vapor/mod-father-info-warranty-marcos-vapor/"]
        
        if let split = self.splitViewController {
            let controllers = split.viewControllers
            self.detailViewController = (controllers[controllers.count-1] as! UINavigationController).topViewController as? DetailViewController
        }
    }

    override func viewWillAppear(_ animated: Bool) {
        clearsSelectionOnViewWillAppear = splitViewController!.isCollapsed
        super.viewWillAppear(animated)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
 // 5) Comment out func insertNewObject. 
     //Select from line finc InsertNewObject to }
     //and use shortcut command: [Command] [/] to comment all lines

//    func insertNewObject(_ sender: Any) {
//        objects.insert(NSDate(), at: 0)
//        let indexPath = IndexPath(row: 0, section: 0)
//        tableView.insertRows(at: [indexPath], with: .automatic)
//    }

    // MARK: - Segues

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showDetail" {
            if let indexPath = tableView.indexPathForSelectedRow {
                // 6) replace code with below code until line 75
                let object = FavDetails![indexPath.row]
                let controller = (segue.destination as! UINavigationController).topViewController as! DetailViewController
                controller.detailItem = object as AnyObject
                controller.navigationItem.leftBarButtonItem = self.splitViewController?.displayModeButtonItem
                controller.navigationItem.leftItemsSupplementBackButton = true
            }
        }
    }

    // MARK: - Table View

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
         // 7) Replace objects.count with ListOfFavs!.count
        return ListOfFavs!.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
          // 8) Replace code with below code until }
        cell.textLabel!.text = ListOfFavs![indexPath.row]
        let imagename:UIImage = ListOfPhotos[indexPath.row]
        cell.imageView?.image = imagename
        return cell
    }

    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        //9) Make below false
        return true
    }
    
 // 10) Comment out override func tableView(tableView  - shortcut command: [Command] [/]
    
//    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
//        if editingStyle == .delete {
//            objects.remove(at: indexPath.row)
//            tableView.deleteRows(at: [indexPath], with: .fade)
//        } else if editingStyle == .insert {
//            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view.
//        }
//    }


}

