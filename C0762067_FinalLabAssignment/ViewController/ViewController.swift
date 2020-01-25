//
//  ViewController.swift
//  C0762067_FinalLabAssignment
//
//  Created by Mac on 2020-01-24.
//  Copyright © 2020 Mac. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var product  : Products!
    var tpv : ProductTableViewController?
    
    @IBOutlet weak var quantitylbl: UILabel!
    @IBOutlet weak var pricelable: UILabel!
    @IBOutlet weak var namelable: UILabel!
    @IBOutlet weak var descriptionlable: UILabel!
    @IBOutlet weak var idlable: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        namelable.text = product.pname
        idlable.text = "\(product.pID)"
        descriptionlable.text = product.pDescription
        pricelable.text = "\(product.pPrice)"
        quantitylbl.text = "\(product.quantity)"
        
        
    }
    
    
    


}

