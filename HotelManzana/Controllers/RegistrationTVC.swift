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
    
    @IBOutlet weak var numberOfAdults: UILabel!
    @IBOutlet weak var numberOfAdultStepper: UIStepper!
    @IBOutlet weak var numberOfChildren: UILabel!
    
    @IBOutlet weak var numberOfChildrenStepper: UIStepper!
    
    
    
    @IBOutlet weak var wifiSwitch: UISwitch!
    
    @IBOutlet weak var roomTypeLabel: UILabel!
    
    
    let checkInDatePickerCellIndexPath = IndexPath(row: 1, section:1)
    let checkOutDatePickerCellIndexPath = IndexPath(row: 3, section:1)
    
    var isCheckInDatePickerShown: Bool = false {
        didSet {
            checkinDatePicker.isHidden = !isCheckInDatePickerShown
        }
    }
    var isCheckOutDatePickerShown: Bool = false {
        didSet {
            checkoutDatePicker.isHidden = !isCheckOutDatePickerShown
        }
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat
    {
        switch (indexPath.section, indexPath.row)
        {
        case (checkInDatePickerCellIndexPath.section, checkInDatePickerCellIndexPath.row):
            
            if isCheckInDatePickerShown
            {
                return 216.0
            } else
            {
                return 0.0
            }
        case (checkOutDatePickerCellIndexPath.section, checkOutDatePickerCellIndexPath.row):
            if isCheckOutDatePickerShown
            {
                return 216.0
            } else
            {
                return 0.0
            }
        default:
            return 44.0
        }
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        switch (indexPath.section,indexPath.row) {
        case (checkInDatePickerCellIndexPath.section,checkInDatePickerCellIndexPath.row - 1):

            if isCheckInDatePickerShown
            {
                isCheckInDatePickerShown = false
            }
            else if isCheckOutDatePickerShown
            {
                isCheckOutDatePickerShown = false
                isCheckInDatePickerShown = true
            }
            else
            {
                isCheckInDatePickerShown = true
            }
            
            tableView.beginUpdates()
            tableView.endUpdates()
            
        case (checkOutDatePickerCellIndexPath.section, checkOutDatePickerCellIndexPath.row - 1):
            if isCheckOutDatePickerShown
            {
                isCheckOutDatePickerShown = false
            }
            else if isCheckInDatePickerShown
            {
                isCheckInDatePickerShown = false
                isCheckOutDatePickerShown = true
            } else
            {
                isCheckOutDatePickerShown = true
            }
            tableView.beginUpdates()
            tableView.endUpdates()
            
        default:
            break
        }

       
    }
    
    @IBAction func doneBarButton(_ sender: UIBarButtonItem)
    {
        let firstName = firstNameTextField.text ?? ""
        let lastName = self.lastName.text ?? ""
        let email = mailTextField.text ?? ""
        let checkInDate = checkinDatePicker.date
        let checkOutDate = checkoutDatePicker.date
        
        let numberOfAdults = self.numberOfAdults.text
        let numberOfChildren = self.numberOfChildren.text
        let hasWifi = wifiSwitch.isOn
        
        
        
        
        print("First Name: \(firstName)")
        print("Last Name: \(lastName)")
        print("Email: \(email)")
        
        print("check in date: \(checkInDate)")
        print("check out date: \(checkOutDate)")
        
        print("numberOfAdults: \(numberOfAdults)")
        print("numberOfChildren: \(numberOfChildren)")
        
        print("Wifi: \(hasWifi)")
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

    
    func updateNumberOfGuests() {
        
        numberOfAdults.text = "\(Int(numberOfAdultStepper.value))"
        numberOfChildren.text = "\(Int(numberOfChildrenStepper.value))"
    }
    
    
    @IBAction func stepperValueChanged(_ sender: Any) {
        
        updateNumberOfGuests()
        
        
    }
    
    @IBAction func wifiSwitchChanged(_ sender: Any) {
    }
    
    
    
    
}
