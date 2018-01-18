 //
//  RecommendationModel.swift
//  SegmentifyDeneme
//
//  Created by Ata Anıl Turgay on 8.01.2018.
//  Copyright © 2018 Ata Anıl Turgay. All rights reserved.
//

import Foundation

class RecommendationModel : NSCopying {
    var notificationTitle:String?
    var products:[ProductModel]?
    var errorString:String?
    var instanceId:String?
    var interactionId:String?
    
    init() {
        
    }
    
    init(notificationTitle: String, products: [ProductModel], errorString: String?, instanceId: String?, interactionId: String?) {
        self.notificationTitle = notificationTitle
        self.products = products
        self.errorString = errorString
        self.instanceId = instanceId
        self.interactionId = interactionId
    }
    
    func copy(with zone: NSZone? = nil) -> Any {
        var mProducts = [ProductModel]()
        for p in products! {
            mProducts.append(p.copy() as! ProductModel)
        }
        let copy = RecommendationModel(notificationTitle: notificationTitle!, products: mProducts, errorString: errorString, instanceId: instanceId, interactionId: interactionId)
        return copy
    }
    
    
}
