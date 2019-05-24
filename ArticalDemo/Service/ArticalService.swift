//
//  ArticalService.swift
//  ArticalDemo
//
//  Created by User on 24/05/19.
//  Copyright © 2019 User. All rights reserved.
//

import Foundation
import SwiftyJSON
import Alamofire
import SVProgressHUD
class ArticalService {
    static var instance = ArticalService()
   
    private var sessionManager = Alamofire.SessionManager()
    
    var articalsArray : [ArticalModel] = []
    
    
    
    func getArticalData( completion: @escaping CompletionHandler){
        
        let headers: HTTPHeaders = [
            "Content-Type": "application/json"
        ]
       
        let configuration = URLSessionConfiguration.default
        configuration.timeoutIntervalForRequest = 100
        self.sessionManager = Alamofire.SessionManager(configuration: configuration)
     
        
        SVProgressHUD.show()
        self.sessionManager.request(artical_Url, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: headers)
        
            .responseJSON { response in
                SVProgressHUD.dismiss()
                switch response.result{
                    
                case .success(let value):
                    let json = JSON(value)
                    json["articles"].array?.forEach({ (artical) in
                        let artiacaldata = ArticalModel(author: artical["author"].stringValue, title: artical["title"].stringValue, description: artical["description"].stringValue, url: artical["url"].stringValue, img: artical["urlToImage"].stringValue, content: artical["content"].stringValue)
                       
                        self.articalsArray.append(artiacaldata)
                        completion(true)
                    })
                case .failure(let error):
                    print(error.localizedDescription)
                }
        }
    }
    
    
    
}
