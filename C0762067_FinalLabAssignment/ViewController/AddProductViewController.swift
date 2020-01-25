//
//  AddProductViewController.swift
//  C0762067_FinalLabAssignment
//
//  Created by Mac on 2020-01-24.
//  Copyright © 2020 Mac. All rights reserved.
//

import UIKit
import CoreData
class AddProductViewController: UIViewController {
    var products : [Products]?
    
    @IBOutlet weak var id: UITextField!
    
    @IBOutlet weak var quantitytext: UITextField!
    @IBOutlet weak var descriptiontext: UITextField!
    @IBOutlet weak var price: UITextField!
    @IBOutlet weak var name: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        loadCoreData()

        // Do any additional setup after loading the view.
    }
    @objc func saveCoreData() {
          
           // create an instance of app delegate
           let appDelegate = UIApplication.shared.delegate as! AppDelegate
           // second step is context
           let managedContext = appDelegate.persistentContainer.viewContext
           
           for product in products! {
               let productEntity = NSEntityDescription.insertNewObject(forEntityName: "ProductModel", into: managedContext)
               productEntity.setValue(product.pID, forKey: "id")
               productEntity.setValue(product.pname, forKey: "pname")
               productEntity.setValue(product.pDescription, forKey: "pdescription")
               productEntity.setValue(product.pPrice, forKey: "price")
            productEntity.setValue(product.quantity, forKey: "qunatity")
               
               // save context
               do {
                   try managedContext.save()
                
               } catch {
                   print(error)
               }
           }
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
                 if results is [NSManagedObject] {
                     for result in results as! [NSManagedObject] {
                         let descript = result.value(forKey: "pdescription") as! String
                         let name = result.value(forKey: "pname") as! String
                         let price = result.value(forKey: "price") as! Double
                         let id = result.value(forKey: "id") as! Int16
                          let quan = result.value(forKey: "qunatity") as! Int16
                         
                        products?.append(Products(pname: name, pID: id, pDescription: descript, pPrice: price, quna: quan))
                     }
             
                 }
             } catch {
                 print(error)
             }
             
         }

    @IBAction func AddProductButton(_ sender: Any) {
        let pid =  Int16(id.text ?? "0") ?? 0
        let names = name.text ?? ""
        let prices = Double(price.text ?? "0.0") ?? 0.0
        let description = descriptiontext.text ?? ""
        //let quantity = Int(addProduct[3].text ?? "2020") ?? 2020
      
                  let appDelegate = UIApplication.shared.delegate as! AppDelegate
                  // second step is context
                  let managedContext = appDelegate.persistentContainer.viewContext
                  
                 
                      let productEntity = NSEntityDescription.insertNewObject(forEntityName: "ProductModel", into: managedContext)
                      productEntity.setValue(pid ,forKey: "id")
                      productEntity.setValue(names, forKey: "pname")
                      productEntity.setValue(description, forKey: "pdescription")
                      productEntity.setValue(prices, forKey: "price")
        productEntity.setValue(prices, forKey: "qunatity")

                      
                      // save context
                      do {
                          try managedContext.save()
                       
                      } catch {
                          print(error)
                      }
            
        
        
        
        navigationController?.popViewController(animated: true)
        
        }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    if let producttabel = segue.destination as? ProductTableViewController {
        producttabel.products = self.products
        }
    }
    }

    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */


