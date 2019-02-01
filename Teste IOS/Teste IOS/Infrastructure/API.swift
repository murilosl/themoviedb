//
//  API.swift
//  Teste IOS
//
//  Created by Murilo de Souza Lopes on 31/01/2019.
//  Copyright © 2019 Murilo de Souza Lopes. All rights reserved.
//

import Foundation
import Alamofire

class API{
    
    //MARK: - Generic Request
    
    func open(url: String, parameters: Parameters, completion: @escaping APIResultCall){
        
        Alamofire.request(url, parameters: parameters).responseData { (result) in
            if let dataReturn = result.value{
                completion(dataReturn)
            }else{
                completion(nil)
            }
        }
    }
    
    //MARK: - Download Image
    
    func getImageFromUrl(url: String, completion: @escaping APIResultImage) {
        
        Alamofire.request(url).responseData { (result) in
            if let dataReturn = result.value{
                completion(dataReturn)
            }else{
                completion(nil)
            }
        }
    }
}
