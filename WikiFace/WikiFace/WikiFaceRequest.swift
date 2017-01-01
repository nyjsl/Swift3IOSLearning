//
//  WikiFaceRequest.swift
//  WikiFace
//
//  Created by 魏星 on 2017/1/1.
//  Copyright © 2017年 wx. All rights reserved.
//

import Foundation
import UIKit

class WikiFaceRequest{
    
    
    private static var task:URLSessionDataTask?
    
    class func requestPersonFace(person: String,size: CGSize, requestHandler:  @escaping (UIImage?,Bool) -> Void){
        
        let escapedPerson = person.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed)
        let pixels = Int(max(size.width, size.height)) * 2
        let url = URL(string: "https://en.wikipedia.org/w/api.php?action=query&titles=\(escapedPerson!)&prop=pageimages&format=json&pithumbsize=\(pixels)")
        
        let urlRequest = URLRequest(url: url!)
        
        let task = URLSession.shared.dataTask(with: urlRequest, completionHandler: {
            (data,response,error) in
            if error != nil{
                print(error ?? "error")
                requestHandler(nil, false)
                return
            }else{
                guard let _ = data else{
                    print("no data")
                    requestHandler(nil, false)
                    return
                }
                if let resultimg = parseData(data:data!) {
                    requestHandler(resultimg, true)
                }else{
                    requestHandler(nil, true)
                }
            }
           
            
        })
        
        task.resume()
        
       
    }
    
    class func cancelTask(){
        if let task = task {
            task.cancel()
        }
    }
    
    private class func parseData(data:Data) -> UIImage?  {
        do{
            let dictionary = try JSONSerialization.jsonObject(with: data, options: .allowFragments) as! NSDictionary
            if let query = dictionary.object(forKey: "query") as! NSDictionary?{
                if let pages = query.object(forKey: "pages") as! NSDictionary?{
                    if let pageContent = pages.allValues.first as! NSDictionary?{
                        if let thumbNail = pageContent.object(forKey: "thumbnail") as! NSDictionary?{
                            
                            if let source = thumbNail.object(forKey: "source") as! String?{
                                let data = NSData(contentsOf: URL(string: source)!)
                                let faceImage = UIImage(data: data as! Data)
                                return faceImage
                            }
                        }
                    }
                }
            }
 
        }catch{
            print(error)
        }
        return nil
    }
}
