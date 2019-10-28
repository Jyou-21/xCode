//
//  ViewController.swift
//  dayPicker
//
//  Created by Jack Younger on 10/23/19.
//  Copyright © 2019 Jack Younger. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 3
    }
    
    @IBOutlet weak var dayPicker: UIPickerView!
    @IBOutlet weak var finalView: UILabel!
    
    let day = ["Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday", "Sunday"]
    let block = ["A", "B", "C"]
    let schedType = ["Regular", "Double Block", "Assembly"]
    let mySchedule: [String:String] = ["A":"Free Period",
                                       "B":"Computer Science",
                                       "C":"Trig/Pre-Calc",
                                       "D":"Spanish 3",
                                       "E":"English 3",
                                       "F":"History",
                                       "M/W 5/6":"Graphic Design",
                                       "R 6":"Life Skills",
    ]
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if component == 0{
            return block.count
        }else if component == 1 {
            return day.count
        }else {
            return schedType.count
        }
    }
        
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if component == 0{
            return block[row]
            
        }else if component == 1 {
            return day[row]
        }else {
            return schedType[row]
        }
    }
    
    @IBAction func getSchedule(_ sender: Any) {
        let blockTypeRow = dayPicker.selectedRow(inComponent: 0)
        let ACBDay = block[blockTypeRow]
     
        let weekDayRow = dayPicker.selectedRow(inComponent: 1)
        let weekDay = day[weekDayRow]
        
        let periodRotation:[String:[String]] = [
            "A":["A","B","Snack","D","E","Lunch"],
            "C":["C","A","Snack","F","D","Lunch"],
            "B":["B","C","Snack","E","F","Lunch"]]
        let mySched = getScheduleForDay(periods: periodRotation[ACBDay]!, mySchedule:mySchedule, weekDay: weekDay)
        finalView.text = mySched
    }
    
    func getScheduleForDay(periods:[String], mySchedule:[String:String],weekDay:String) -> String{
        var output = ""
        for period in periods{
            output += "\(period) - "
            output += mySchedule[period] ?? "free period"
            output += "\n"
        }
        if weekDay == "Monday" || weekDay == "Wednesday"{
            output.append("DB - Graphic Design")
        }else if weekDay == "Friday"{
            output.append("DB - Life Skills")
        }
        return output
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

