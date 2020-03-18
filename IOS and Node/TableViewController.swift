//
//  TableViewController.swift
//  IOS and Node
//
//  Created by Kilz on 17/03/2020.
//  Copyright © 2020 Kilz. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {
    
   
    var posts = [Post]()

    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.rightBarButtonItem = .init(title: "Add Item", style: .plain, target: self, action: #selector(addingItem))
        
        Title()
        fetchPosts()
        
    }
    
    
    //MARK: FUNCTIONS
    
    
    //Navigation Button
    @objc func addingItem() {
        print("Adding item")
        
        
        Service.shared.addItem(itemName: "Gear", itemDescription: "good", itemPrice: "799") { (err) in
            if let err = err {
                            print("Failed to create item", err)
                            return
                        }
                        print("Item Added")
            self.fetchPosts()
                    }
        
    }
    
    //Adding Title
    
    private func Title(){
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.title = "Items"
    }
    
    //fetchPosts
    
    fileprivate func fetchPosts() {
        Service.shared.fetchPosts { (res) in
            switch res {
            case.failure(let err):
                print("Failed to fetch Posts", err)

            case .success(let posts):
               // print(posts)
                
                self.posts = posts
                self.tableView.reloadData()

            }
        }
    }
    
    

    

    // MARK: - Table view data source


    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
      
        return posts.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "tableCell", for: indexPath) as! TableViewCell
        
        cell.generateCell(posts[indexPath.row])
    
        // Configure the cell...

        return cell
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    
    // Override to support editing the table view.
    /*override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            print("post deleteled")
            
            let post = self.posts[indexPath.row]
           // Service.shared.deleteItem()
            
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    
*/
    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
