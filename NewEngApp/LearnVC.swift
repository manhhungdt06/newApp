//
//  LearnVC.swift
//  NewEngApp
//
//  Created by admin on 12/1/16.
//  Copyright © 2016 admin. All rights reserved.
//

import UIKit

class LearnVC: BaseViewController {
    
    var items: [ItemCollection] = []
    var settingParams: SettingParam!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addSlideMenuButton()
        
        print("settingParams = \(settingParams)")
        var myDict: NSDictionary?
        if let path = Bundle.main.path(forResource: "topic", ofType: "plist") {
            myDict = NSDictionary(contentsOfFile: path)
            for key in (myDict?.allKeys)! {
                if key as? String == settingParams.language! {
                    let dictDetail: NSDictionary = NSDictionary(dictionary: myDict?[key] as! Dictionary)
                    for detail in (dictDetail.allValues as? [[String: Any]])! {
                        self.items.append(ItemCollection(name: detail["name"] as! String, nameImg: detail["image"] as! String, content: detail["content"] as! String))
                    }
                }
            }
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}

extension LearnVC: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return items.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! Cell
        cell.addSubviews()
        cell.imageView.contentMode = .scaleAspectFit
        cell.imageView.image = UIImage(named: items[(indexPath as NSIndexPath).item].img!)
        cell.topicName.text = items[(indexPath as NSIndexPath).item].name
        cell.topicContent.text = items[(indexPath as NSIndexPath).item].content
        return cell
    }
}

extension LearnVC: UICollectionViewDelegate {
    // T O D O
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let studyWordView = self.storyboard?.instantiateViewController(withIdentifier: "Word") as? WordVC
        
        studyWordView?.category = items[(indexPath as NSIndexPath).item].name
        studyWordView?.settings = settingParams
        
        // get name of plist file: TOEIC/ TOEFL/ IELTS ...
        // level, flashcardColor, wordType, ? time restudy
        print("items: \(items[(indexPath as NSIndexPath).item].name)")
        self.navigationController?.pushViewController(studyWordView!, animated: true)
    }
}
