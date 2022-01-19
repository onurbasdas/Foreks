//
//  ViewController.swift
//  Foreks
//
//  Created by Onur Başdaş on 18.01.2022.
//

import UIKit
import DropDown

class DashboardVC: UIViewController {
    
    @IBOutlet var mainTableView: UITableView!
    @IBOutlet var firstBtn: UIButton!
    @IBOutlet var secondBtn: UIButton!
    
    var mainArray = [MainDefaults]()
    var detailArray = [L]()
    var selectedArray = [Mypage]()
    var menuArray = [String]()
    var myTimer = Timer()
    let menu  = DropDown()
    let secondMenu = DropDown()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getData()
        getSelectedData()
        conf()
        menuConf()
    }
    
    func conf() {
        mainTableView.register(DashboardCell.nib(), forCellReuseIdentifier: DashboardCell.identifier)
        myTimer = Timer.scheduledTimer(timeInterval: 5.0, target: self, selector: #selector(dataUpdate), userInfo: nil, repeats: true)
    }
    
    @objc func dataUpdate() {
        detailArray.removeAll()
        getDetailData(tke: mainArray)
    }
    
    func getDetailData(tke: [MainDefaults]) {
        DispatchQueue.main.async { [self] in
            tke.forEach { x in
                WebService.getPageDetail(firstItem: "las", secondItem: "pdd", tke: x.tke) { [self] result in
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
    
    func getSelectedData() {
        DispatchQueue.main.async {
            WebService.getMainName { [self] resName in
                selectedArray.append(contentsOf: resName)
                selectedArray.forEach { y in
                    menuArray.append(y.name)
                    menu.dataSource = menuArray
                    secondMenu.dataSource = menuArray
                }
            }
        }
    }
    
    func menuConf() {
        menu.anchorView = firstBtn
        secondMenu.anchorView = secondBtn
        menu.selectionAction = { [self] (index: Int, item: String) in
            firstBtn.setTitle(item, for: .normal)
        }
        secondMenu.selectionAction = { [self] (index: Int, item: String) in
            secondBtn.setTitle(item, for: .normal)
        }
    }
    
    @IBAction func firstBtnClicked(_ sender: Any) {
        menu.show()
    }
    @IBAction func secondBtnClicked(_ sender: Any) {
        secondMenu.show()
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
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


