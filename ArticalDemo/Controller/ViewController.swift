//
//  ViewController.swift
//  ArticalDemo
//
//  Created by User on 24/05/19.
//  Copyright © 2019 User. All rights reserved.
//

import UIKit
import AlamofireImage
class ViewController: UIViewController {

    @IBOutlet weak var articalTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        articalTableView.rowHeight = UITableView.automaticDimension
        articalTableView.estimatedRowHeight = UITableView.automaticDimension
        articalTableView.isHidden = true
        fetachArticalData()
    }

    
    func fetachArticalData()  {
        ArticalService.instance.getArticalData { (sucess) in
            if sucess {
                self.articalTableView.isHidden = false
                self.articalTableView.reloadData()
            }
        }
    }

}
extension ViewController:  UITableViewDelegate , UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ArticalService.instance.articalsArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = articalTableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! ArticalTableViewCell
        let articalData = ArticalService.instance.articalsArray[indexPath.row]
        
        let ulr = URL(string: articalData.img)
        cell.imgView.af_setImage(withURL: ulr!)
        cell.titleLbl.text = articalData.title
        cell.autherLbl.text = articalData.author
        cell.descLbl.text = articalData.description
        cell.url.text = articalData.url
        
        return cell
        
        
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
       
     let url = ArticalService.instance.articalsArray[indexPath.row]
        
        let urlString = URL(string: url.url)
        if #available(iOS 10.0, *) {
            UIApplication.shared.open(urlString!, options: [:], completionHandler: nil)
        } else {
            UIApplication.shared.openURL(urlString!)
        }
        
        
        
        
    }
    
   
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
   
    
}
