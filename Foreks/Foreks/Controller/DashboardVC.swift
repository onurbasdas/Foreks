//
//  ViewController.swift
//  Foreks
//
//  Created by Onur Başdaş on 18.01.2022.
//

import UIKit

class DashboardVC: UIViewController {

    @IBOutlet var mainTableView: UITableView!
    
    var mainArray = [MainDefaults]()
    var detailArray = [L]()
    var myTimer = Timer()
    
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mainTableView.register(DashboardCell.nib(), forCellReuseIdentifier: DashboardCell.identifier)
        getData()
        myTimer = Timer.scheduledTimer(timeInterval: 2.0, target: self, selector: #selector(dataUpdate), userInfo: nil, repeats: true)
    }
    
    @objc func dataUpdate() {
        detailArray.removeAll()
        getDetailData(tke: mainArray)
    }
    
    func getDetailData(tke: [MainDefaults]) {
        DispatchQueue.main.async {
            tke.forEach { x in
                WebService.getPageDetail(tke: x.tke) { [self] result in
                    detailArray.append(contentsOf: result)
                    mainTableView.reloadData()
                }
            }
        }
    }
    
    func getData() {
        DispatchQueue.main.async {
            WebService.getPageDefaults { [self] res in
                mainArray.append(contentsOf: res)
                mainTableView.reloadData()
                getDetailData(tke: res)
            }
        }
    }
}

extension DashboardVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return detailArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = mainTableView.dequeueReusableCell(withIdentifier: DashboardCell.identifier, for: indexPath) as! DashboardCell
        let mainIndex = mainArray[indexPath.row]
        let detailIndex = detailArray[indexPath.row]
        cell.loadData(code: mainIndex, data: detailIndex)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 75
    }
    
}


