//
//  Person.swift
//  Project10
//
//  Created by erika.talberga on 22/02/2024.
//

import UIKit

class Person: NSObject {
//MARK: - Declarations
    var name: String
    var image: String
    
    init(name: String, image: String) {
        self.name = name
        self.image = image
    }
}
