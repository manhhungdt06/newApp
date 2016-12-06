//
//  SettingVC.swift
//  NewEngApp
//
//  Created by admin on 12/1/16.
//  Copyright © 2016 admin. All rights reserved.
//

import UIKit

class SettingVC: BaseViewController {
    
    var setting: SettingParam!
    
    @IBOutlet weak var dayField: UITextField!
    
    @IBOutlet weak var hourField: UITextField!
    
    @IBOutlet weak var minuteField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addSlideMenuButton()
        // Do any additional setup after loading the view.
        
        setting = SettingParam(level: "Easy", language: "English", time: 86400)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func chooseLevel(_ sender: CustomButtonSettings) {
        switch sender.tag {
        case 300:
            setting.level = "Easy"
        case 301:
            setting.level = "Medium"
        case 302:
            setting.level = "Hard"
        default:
            print("none")
        }
    }
    
    @IBAction func chooseLanguage(_ sender: CustomButtonSettings) {
        switch sender.tag {
        case 400:
            setting.language = "English"
        case 401:
            setting.language = "French"
        case 402:
            setting.language = "German"
        case 403:
            setting.language = "Italian"
        case 404:
            setting.language = "Japanese"
        case 405:
            setting.language = "Spanish"
        default:
            print("no language")
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "pushToLearn") {
            
            if dayField.text == "" { dayField.text = "0" }
            if hourField.text == "" { hourField.text = "0" }
            if minuteField.text == "" { minuteField.text = "0" }
            
            setting.time! = Int(dayField.text!)! * 86400 + Int(hourField.text!)! * 3600 + Int(minuteField.text!)! * 60
            
            let dest: LearnVC = segue.destination as! LearnVC
            dest.settingParams = setting
        }
    }
}
