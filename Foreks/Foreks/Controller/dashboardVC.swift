//
//  ViewController.swift
//  Foreks
//
//  Created by Onur Başdaş on 18.01.2022.
//

import UIKit

class dashboardVC: UIViewController {

    @IBOutlet var mainTableView: UITableView!
    
    var mainArray = [MainDefaults]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mainTableView.register(dashboardCell.nib(), forCellReuseIdentifier: dashboardCell.identifier)
        WebService.getPageDefaults { [self] response in
            mainArray.append(contentsOf: response)
            mainTableView.reloadData()
            print(mainArray)
        }
    }
}

extension dashboardVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return mainArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = mainTableView.dequeueReusableCell(withIdentifier: dashboardCell.identifier, for: indexPath) as! dashboardCell
        let mainIndex = mainArray[indexPath.row]
        cell.lblCod.text = mainIndex.cod
        cell.lblGro.text = mainIndex.gro
        cell.lblTke.text = mainIndex.tke
        cell.lblDef.text = mainIndex.def
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 92
    }
    
}


