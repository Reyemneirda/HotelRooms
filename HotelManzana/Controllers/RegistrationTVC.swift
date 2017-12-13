//
//  RegistrationTVC.swift
//  HotelManzana
//
//  Created by Adrien Meyer on 13/12/2017.
//  Copyright © 2017 ronny abraham. All rights reserved.
//

import UIKit

class RegistrationTVC: UITableViewController {

    @IBOutlet weak var firstNameTextField: UITextField!
    
    @IBOutlet weak var lastName: UITextField!
    
    @IBOutlet weak var mailTextField: UITextField!
    
    @IBAction func doneBarButton(_ sender: UIBarButtonItem)
    {
        let firstName = firstNameTextField.text ?? ""
        let lastName = self.lastName.text ?? ""
        let email = mailTextField.text ?? ""
        
        print(firstName)
        print(lastName)
        print(email)
    }
    
    func updateDateView () {
        
    let dateFormatter = DateFormatter()
        
        dateFormatter.dateStyle = .medium
        
        checkinDate.text = dateFormatter.string(from: checkinDatePicker.date)
        checkOutDate.text = dateFormatter.string(from: checkoutDatePicker.date)
    }
    
    @IBOutlet weak var checkinDate: UILabel!
    @IBOutlet weak var checkinDatePicker: UIDatePicker!
    @IBOutlet weak var checkOutDate: UILabel!

    @IBOutlet weak var checkoutDatePicker: UIDatePicker!
    
    @IBAction func datePickerChanged(_ sender: UIDatePicker){
        updateDateView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.updateDateView()
        let midnightToday = Calendar.current.startOfDay(for: Date())
        
        checkinDatePicker.minimumDate = midnightToday
        checkoutDatePicker.date = midnightToday

        //at start of update date views
        checkoutDatePicker.minimumDate = checkinDatePicker.date.addingTimeInterval(86400)
        

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

}
