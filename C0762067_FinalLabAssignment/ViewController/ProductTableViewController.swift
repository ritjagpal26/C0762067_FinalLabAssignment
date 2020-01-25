//
//  ProductTableViewController.swift
//  C0762067_FinalLabAssignment
//
//  Created by Mac on 2020-01-24.
//  Copyright © 2020 Mac. All rights reserved.
//

import UIKit
import CoreData
class ProductTableViewController: UITableViewController, UISearchBarDelegate {
    @IBOutlet var productTbale: UITableView!
    var products: [Products]?
    @IBOutlet weak var searchBar: UISearchBar!
    var isSearch = false
    var searchProducts : [Products]?
    override func viewDidLoad() {
        super.viewDidLoad()
        searchBar.delegate = self
        addValue()
            loadCoreData()
        tableView.reloadData()
//        productTbale.reloadData()
//        tableView.reloadData()
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String)
       {
        let filtered = products!.filter { $0.pname.lowercased().contains(searchText.lowercased())}
                   
           if filtered.count>0
           {
            //tasks = []
               searchProducts = filtered;
               isSearch = true;
           }
           else
           {
            searchProducts = self.products
               isSearch = false;
           }
           self.tableView.reloadData();
       }
       
       func searchBarShouldEndEditing(_ searchBar: UISearchBar) -> Bool
       {
           return true;
       }
      
    
    
    

    override func viewWillAppear(_ animated: Bool) {
        loadCoreData()
        productTbale.reloadData()
    }
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        if isSearch
        {
            return searchProducts?.count ?? 0

        }
        else
        {
            return products?.count ?? 0

        }
        
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! productTableViewCell
        if isSearch{
        let product = searchProducts![indexPath.row]

        cell.namelable.text = product.pname
        cell.idlable.text = "\(product.pID)"
        }
        else
        {
            let product = products![indexPath.row]

            cell.namelable.text = product.pname
            cell.idlable.text = "\(product.pID)"

        }
        
//        let product = products![indexPath.row]
//
//        cell.namelable.text = product.pname
//        cell.idlable.text = "\(product.pID)"
        
       
        return cell
        
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
               let vc = storyboard.instantiateViewController(withIdentifier: "viewVc") as! ViewController
        vc.product = products![indexPath.row]
        vc.tpv = self
                  navigationController?.pushViewController(vc,animated: true)
    }
   func loadCoreData() {
          products = [Products]()
          // create an instance of app delegate
          let appDelegate = UIApplication.shared.delegate as! AppDelegate
          // second step is context
          let managedContext = appDelegate.persistentContainer.viewContext
          
          let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "ProductModel")
          
          do {
              let results = try managedContext.fetch(fetchRequest)
           
                  for result in results as! [NSManagedObject] {
                      let descript = result.value(forKey: "pdescription") as! String
                      let name = result.value(forKey: "pname") as! String
                      let price = result.value(forKey: "price") as! Double
                      let id = result.value(forKey: "id") as! Int16
                    let quan = result.value(forKey: "qunatity") as! Int16
                      
                    products?.append(Products(pname: name, pID: id, pDescription: descript, pPrice: price, quna: quan))
                  }
                productTbale.reloadData()
              
          } catch {
              print(error)
          }
          
      }
    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
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
    func addValue(){

        // Do any additional setup after loading the view.
        let appDelegate = UIApplication.shared.delegate as!AppDelegate
               
               // create context
               
               let context = appDelegate.persistentContainer.viewContext
               
               
               // 3rd step - write into context
               let newUser=NSEntityDescription.insertNewObject(forEntityName: "ProductModel", into: context)
        
        // first data
        
               newUser.setValue(1001, forKey: "id")
               newUser.setValue("Mac Book", forKey: "pname")
               newUser.setValue(1000, forKey: "price")
               newUser.setValue(21, forKey: "qunatity")
        newUser.setValue("Apple MAc bOOk", forKey: "pdescription")
        
        // second data
               
               // 4th step - save context
               do{
                   try context.save()
                   print(newUser,"is saved")
               }catch{
                   print(error)
               }
    }

}
