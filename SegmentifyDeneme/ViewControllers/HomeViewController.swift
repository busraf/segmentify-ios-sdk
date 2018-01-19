//
//  HomeViewController.swift
//  SegmentifyDeneme
//
//  Created by Ata Anıl Turgay on 19.01.2018.
//  Copyright © 2018 Ata Anıl Turgay. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    @IBAction func customEventButton(_ sender: Any) {
        let viewController = self.storyboard?.instantiateViewController(withIdentifier: "CustomEventViewController") as? CustomEventViewController
        self.navigationController?.pushViewController(viewController!, animated: true)
    }
    @IBAction func notFoundButton(_ sender: Any) {
        let viewController = self.storyboard?.instantiateViewController(withIdentifier: "NotFoundViewController") as? NotFoundViewController
        self.navigationController?.pushViewController(viewController!, animated: true)
    }
    @IBAction func purchaseButton(_ sender: Any) {
        let viewController = self.storyboard?.instantiateViewController(withIdentifier: "PurchaseSuccessViewController") as? PurchaseSuccessViewController
        self.navigationController?.pushViewController(viewController!, animated: true)
    }
    @IBAction func basketButton(_ sender: Any) {
        let viewController = self.storyboard?.instantiateViewController(withIdentifier: "BasketViewController") as? BasketViewController
        self.navigationController?.pushViewController(viewController!, animated: true)
    }
    @IBAction func searchButton(_ sender: Any) {
        let viewController = self.storyboard?.instantiateViewController(withIdentifier: "SearchViewController") as? SearchViewController
        self.navigationController?.pushViewController(viewController!, animated: true)
    }
    @IBAction func CategoryButton(_ sender: Any) {
        let viewController = self.storyboard?.instantiateViewController(withIdentifier: "CategoryViewController") as? CategoryViewController
        self.navigationController?.pushViewController(viewController!, animated: true)
    }
    @IBAction func homeButton(_ sender: Any) {
        let viewController = self.storyboard?.instantiateViewController(withIdentifier: "HomePageViewController") as? HomePageViewController
        self.navigationController?.pushViewController(viewController!, animated: true)
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
