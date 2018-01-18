//
//  ViewController.swift
//  SegmentifyDeneme
//
//  Created by Ata Anıl Turgay on 7.12.2017.
//  Copyright © 2017 Ata Anıl Turgay. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var images : [String] = []
    var names : [String] = []
    var titles : [String] = []
    var prices : [Int] = []
    var oldPrices : [String] = []
    var productIds : [String] = []
    
    var recommendations : [[[RecommendationModel]]] = []
    
    var appKey = "8157d334-f8c9-4656-a6a4-afc8b1846e4c"
    var subDomain = "segmentify-shop.myshopify.com"
    var dataCenterUrl = "https://dce1.segmentify.com"


    @IBOutlet weak var tableview: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        //SegmentifyAnalyticWrapper.shared.sendPageViewEvent()
        //SegmentifyAnalyticWrapper.shared.sendLoginEvent()
        /*SegmentifyTools.delay(delay: 3) {
            SegmentifyAnalyticWrapper.shared.sendUserChangeEvent()
        }*/
        //SegmentifyAnalyticWrapper.shared.sendUserChangeEvent()
        //SegmentifyAnalyticWrapper.shared.sendLogoutEvent()
        //SegmentifyAnalyticWrapper.shared.sendPaymentSuccessEvent()
        //SegmentifyAnalyticWrapper.shared.sendViewBasketEvent()
        //SegmentifyAnalyticWrapper.shared.sendLoginEvent()
        //SegmentifyAnalyticWrapper.shared.sendPaymentSuccessEvent()
        //SegmentifyAnalyticWrapper.shared.sendPurchaseEvent()
        //SegmentifyAnalyticWrapper.shared.sendRegisterEvent()
        //SegmentifyAnalyticWrapper.shared.sendUserchangeEvent()
        //SegmentifyAnalyticWrapper.shared.sendUserUpdateEvent()
        //SegmentifyAnalyticWrapper.shared.sendCustomevent()
        self.sendPageViewEvent()
    }
    
    func sendPageViewEvent() {

        let obj = SegmentifyObject()
        obj.category = "Search Page"
        //obj.subCategory = "Womenswear"
        SegmentifyManager.sharedManager(appKey: appKey, dataCenterUrl: dataCenterUrl, subDomain: subDomain).setPageViewEvent(segmentifyObject: obj, callback: { (response: [[[RecommendationModel]]]) in
            self.recommendations = response
            self.createProducts(recommendations: self.recommendations)
            //(UIApplication.shared.delegate as! AppDelegate).showAlert(title: "OK", message: "products: \(idArray)", actions: nil)
        })
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func setProductInfos(products : [ProductModel]) {
        for product in products {
            self.productIds.append(product.productId!)
            self.titles.append(product.name!)
            self.images.append("https:" + product.image!)
            self.prices.append(product.price!)
            if(product.oldPriceText != nil){
                self.oldPrices.append(product.oldPriceText!)
            }
            
        }
        self.tableview.reloadData()
    }
    
    
    
    func createProducts(recommendations : [[[RecommendationModel]]]) {
        for recommendation in recommendations {
            for recObjects in recommendation {
                for index in 0...recObjects.count - 1 {
                    if recObjects[index].notificationTitle == "Deneme" {
                        self.setProductInfos(products: recObjects[index].products!)
                    }
                }
            }
        }
    }
    

    

}




extension UIImageView {
    func downloadedFrom(url: URL, contentMode mode: UIViewContentMode = .scaleAspectFit) {
        contentMode = mode
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard
                let httpURLResponse = response as? HTTPURLResponse, httpURLResponse.statusCode == 200,
                let mimeType = response?.mimeType, mimeType.hasPrefix("image"),
                let data = data, error == nil,
                let image = UIImage(data: data)
                else { return }
            DispatchQueue.main.async() {
                self.image = image
            }
            }.resume()
    }
    func downloadedFrom(link: String, contentMode mode: UIViewContentMode = .scaleAspectFit) {
        guard let url = URL(string: link) else { return }
        downloadedFrom(url: url, contentMode: mode)
    }
}






extension ViewController : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.titles.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = tableView.dequeueReusableCell(withIdentifier: "CustomTableViewCell") as! CustomTableViewCell
        cell.nameLabel.text = self.titles[indexPath.row]
        cell.priceLabel.text = String(self.prices[indexPath.row])
        cell.oldPriceLabel.text=String(self.oldPrices[indexPath.row])
        
        cell.onButtonTapped = {
            print(self.productIds[indexPath.row])
    
            SegmentifyManager.sharedManager(appKey: self.appKey, dataCenterUrl: self.dataCenterUrl, subDomain: self.subDomain).setAddOrRemoveBasketStepEvent(basketStep: "add", productID: self.productIds[indexPath.row], price: self.prices[indexPath.row] as NSNumber, quantity:1)
        }

        

        //cell.oldPriceLabel.text = String(self.oldPrices[indexPath.row])
        
        if let imageURL = URL(string:  self.images[indexPath.row]) {
            DispatchQueue.global().async {
                let data = try? Data(contentsOf: imageURL)
                if let data = data {
                    let image = UIImage(data: data)
                    DispatchQueue.main.async {
                        cell.imgDeneme.image = image
                        
                    }
                }
            }
        }
        
//        let url = URL(string:self.images[index])
//            if let data = try? Data(contentsOf: url!)
//            {
//                let image: UIImage = UIImage(data: data)!
//                cell.imgDeneme.image = image
//            }
//
        //cell.imgDeneme.image = self.images[]
        
        return cell
        
    }
}
