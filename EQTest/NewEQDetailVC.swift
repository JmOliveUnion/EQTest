//
//  NewEQDetailVC.swift
//  EQTest
//
//  Created by 김민종 on 6/28/24.
//

import UIKit
import Combine

class NewEQDetailVC: UIViewController {

    let presetName = ["본인 목소리 울림", "깨끗하지 않은 소리", "소음 속 안 들리는 말소리"]
    let customName = ["My Custom EQ 1", "My Custom EQ 2", "My Custom EQ 13"]

    override func loadView() {
        super.loadView()
        view = NewEQDetailView(frame: view.frame)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        bind()
        setUp()
    }
    
    
    func setUp() {
        guard let mainView = view as? NewEQDetailView else {
            return assertionFailure("MainView is not Exist")
        }
      
        mainView.tableView.register(CustomTableViewCell.self, forCellReuseIdentifier: "CustomTableViewCell")

        mainView.tableView.dataSource = self
        mainView.tableView.delegate = self
    }
    
    func bind() {
        guard let mainView = view as? NewEQDetailView else {
            return assertionFailure("MainView is not Exist")
        }
        
      
        
    }
    

}

extension NewEQDetailVC: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return customName.count + 5
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 62
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "CustomTableViewCell", for: indexPath) as! CustomTableViewCell
        
        switch indexPath.row {
        case 0:
            cell.titleLabel.text = "프리셋"
            cell.titleLabel.font = .boldSystemFont(ofSize: 18)
            cell.xbutton.isHidden = true
        case 4:
            cell.titleLabel.text = "사용자 설정"
            cell.titleLabel.font = .boldSystemFont(ofSize: 18)
            cell.xbutton.isHidden = true

        case 1,2,3:
            cell.titleLabel.text = presetName[indexPath.row - 1]
        default:
            cell.titleLabel.text = customName[indexPath.row - 5]
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        
        if let cell = tableView.cellForRow(at: indexPath) as? CustomTableViewCell {
            
         
            
            // Perform actions based on the row index
            switch indexPath.row {
            case 0, 4:
                print("Wow")
            default:
                for cell in tableView.visibleCells {
                    if let customCell = cell as? CustomTableViewCell {
                        customCell.resetButton()
                    }
                }
                cell.presetButtonPressed(index: indexPath.row)
            }
        } else {
            print("Failed to cast the cell to CustomTableViewCell")
        }
    }
}
