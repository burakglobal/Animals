//
//  InterfaceController.swift
//  AnimalsWatch Extension
//
//  Created by Djuro Alfirevic on 11/22/17.
//  Copyright © 2017 Djuro Alfirevic. All rights reserved.
//

import WatchKit
import Foundation

class InterfaceController: WKInterfaceController {
    
    // MARK: - Properties
    @IBOutlet weak var animalInterfaceImage: WKInterfaceImage!
    
    // MARK: - Private API
    fileprivate func grabImage() {
        let url = "http://images.all-free-download.com/images/graphiclarge/tiger_avatar_04_hd_pictures_169016.jpg"
        animalInterfaceImage.setImage(from: url)
    }
    
    // MARK: - Actions
    @IBAction func animalButtonTapped() {
        grabImage()
    }
    
}

extension WKInterfaceImage {
    
    func setImage(from urlString: String) {
        if let url = URL(string: urlString) {
            DispatchQueue.global(qos: .userInitiated).async {
                let data = try? Data(contentsOf: url)
                
                if let data = data {
                    DispatchQueue.main.async {
                        self.setImage(UIImage(data: data))
                    }
                }
            }
        }
    }
    
}
