//
//  ViewController.swift
//  WPtest
//
//  Created by jorgemr on 04/09/17.
//  Copyright © 2017 InformaticaBiomedica. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON
import SDWebImage

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableview: UITableView!

    var titlePosts : String = ""
    var WPpost : [WPPost] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        Alamofire.request("http://blog.lascomidasdecu.com/wp-json/wp/v2/posts/").responseJSON {
            response in
            /*print("Request: \(String(describing: response.request))")   // original url request
             print("Response: \(String(describing: response.response))") // http url response
             print("Result: \(response.result)")                         // response serialization result
             */
            if let value = response.result.value {
                //Using SwiftyJSON
                let json = JSON(value)
                for (_,post) in json {
                    
                    let newPost = WPPost(title: post["title"]["rendered"].stringValue, contentPost: post["excerpt"]["rendered"].stringValue)
                    self.WPpost.append(newPost)
                    //print("index: \(index)")
                    //print(json[index]["title"]["rendered"].stringValue)
                }
                print("JSON: \(json)") // serialized json response
                
                //print("REAL POST:: \(json["excerpt"]["rendered"])")
                //print("POST WITH IMAGES:: \(json["content"]["rendered"])")
                //print("TITULO:: \(json["title"]["rendered"])")
                //self.titlePosts = json["title"]["rendered"].stringValue
            }
            self.tableview.reloadData()
        }
        // Do any additional setup after loading the view, typically from a nib.
        
    }
   
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func replaceUnicodes(string : String) -> String {
        var newString = string.replacingOccurrences(of: "\\u00f1", with: "ñ")
        newString = newString.replacingOccurrences(of: "\\u00e1", with: "á")
        newString = newString.replacingOccurrences(of: "\\u00e9", with: "é")
        newString = newString.replacingOccurrences(of: "\\u00ed", with: "í")
        newString = newString.replacingOccurrences(of: "\\u00f3", with: "ó")
        newString = newString.replacingOccurrences(of: "\\u00fa", with: "ú")
        newString = newString.replacingOccurrences(of: "\\u00fc", with: "ü")
        newString = newString.replacingOccurrences(of: "\\u00c1", with: "Á")
        newString = newString.replacingOccurrences(of: "\\u00c9", with: "É")
        newString = newString.replacingOccurrences(of: "\\u00cd", with: "Í")
        newString = newString.replacingOccurrences(of: "\\u00d3", with: "Ó")
        newString = newString.replacingOccurrences(of: "\\u00da", with: "Ú")
        newString = newString.replacingOccurrences(of: "\\u00dc", with: "Ü")
        newString = newString.replacingOccurrences(of: "\\u00d1", with: "Ñ")
        newString = newString.replacingOccurrences(of: "\\u00bf", with: "¿")
        newString = newString.replacingOccurrences(of: "\\u00a1", with: "¡")
        newString = newString.replacingOccurrences(of: "\\u00ba", with: "º")
        newString = newString.replacingOccurrences(of: "\\u00aa", with: "ª")
        newString = newString.replacingOccurrences(of: "&#8220;", with: "\"")
        newString = newString.replacingOccurrences(of: "&#8221;", with: "\"")
        
        return newString
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return WPpost.count
    }
    let links = ["http://blog.lascomidasdecu.com/wp-content/uploads/2017/09/OaxAlebrijes.jpg","http://blog.lascomidasdecu.com//wp-content//uploads//2017//09//unam.jpg","http://blog.lascomidasdecu.com/wp-content/uploads/2017/09/musas.jpg","http://blog.lascomidasdecu.com/wp-content/uploads/2017/09/Captura-de-pantalla-2017-09-06-a-las-18.14.23-1024x626.png"]
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "customCell", for: indexPath) as! CustomTableViewCell
        cell.imageTitle.text = WPpost[indexPath.row].titlePost
        
        let imageview = cell.viewWithTag(1) as! UIImageView
        imageview.sd_setImage(with: URL(string: links[indexPath.row]))
        
        //cell.imagePost.image = WPpost[indexPath.row].imagesArray[0]
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //Using AlamoFire
        
    }
    
    
}
