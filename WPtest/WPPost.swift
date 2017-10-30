//
//  WPPost.swift
//  WPtest
//
//  Created by Jorge MR on 13/09/17.
//  Copyright © 2017 InformaticaBiomedica. All rights reserved.
//

import UIKit

class WPPost {
    var titlePost : String
    var imagesArray : [UIImage]
    var contentPost : String
    
    init(title: String = "", contentPost : String = "", imagesArray: [UIImage] = [#imageLiteral(resourceName: "RaM")]) {
        self.titlePost = title
        self.contentPost = contentPost
        self.imagesArray = imagesArray
    }
}
