//
//  ViewController.swift
//  PreFetchLoading
//
//  Created by MACBOOK on 06/07/20.
//  Copyright © 2020 SukhmaniKaur. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var resultArray: [Result] = [Result]()

    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        configUI()
    }

    //MARK: - configUI
    private func configUI() {
        tableView.register(UINib(nibName: "CustomCell", bundle: nil), forCellReuseIdentifier: "CustomCell")
        customAPI()
    }

}

//MARK: - TableView DataSource and Delegate Methods
extension ViewController: UITableViewDataSource, UITableViewDelegate {
    // numberOfRowsInSection
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        10
    }
    
    // heightForRowAt
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    // cellForRowAt
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "CustomCell", for: indexPath) as? CustomCell else {
            return UITableViewCell()
        }
        return cell
    }
}

extension ViewController {
    func customAPI() {
        let params: [String: Any] = [String: Any]()
        APIManager.sharedInstance.I_AM_COOL(params: params, api: API.link, Loader: true, isMultipart: false) { (response) in
            if response != nil{                             //if response is not empty
                do {
                    let success = try JSONDecoder().decode(ResultModel.self, from: response!) // decode the response into success model
                    self.resultArray = success.results
                    DispatchQueue.main.async {
                        self.tableView.reloadData()
                    }
                }
                catch let err {
                    log.error("ERROR OCCURED WHILE DECODING: \(Log.stats()) \(err)")/
                }
            }
        }
    }
}
