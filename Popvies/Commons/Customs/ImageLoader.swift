//
//  ImageLoader.swift
//  Popvies
//
//  Created by Dhiya Ulhaq Zulha Alamsyah on 13/03/19.
//  Copyright © 2019 Logivity. All rights reserved.
//

import UIKit

let imageCache = NSCache<NSString, UIImage>()

public class ImageLoader: UIImageView {
    
    var imageUrlString: String?
    
    public func loadImageUsingUrlString(_ urlString: String, completion: @escaping (Bool) -> (), contentMode: ContentMode = .scaleAspectFill) {
        imageUrlString = urlString
        
        let url = URL(string: urlString)
        self.contentMode = contentMode
        if let imageFromCache = imageCache.object(forKey: urlString as NSString) {
            self.image = imageFromCache
            self.contentMode = contentMode
            return
        }
        
        URLSession.shared.dataTask(with: url!, completionHandler: { (data, respones, error) in
            
            if let _ = error {
                return
            }
            
            if urlString.contains("http") {
                DispatchQueue.main.async(execute: {
                    if let data = data, let imageToCache = UIImage(data: data) {
                        
                        if self.imageUrlString == urlString {
                            self.image = imageToCache
                        }
                        
                        self.contentMode = contentMode
                        self.clipsToBounds = true
                        imageCache.setObject(imageToCache, forKey: urlString as NSString)
                        completion(true)
                    }else{
                        completion(false)
                    }
                })
                
            }
        }).resume()
    }
}
