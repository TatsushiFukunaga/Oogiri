//
//  CheckViewController.swift
//  Swift6FireStore1
//
//  Created by Tatsushi Fukunaga on 2021/02/08.
//

import UIKit
import Firebase
import FirebaseFirestore

class CheckViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var odaiString = String()
    
    @IBOutlet weak var odaiLabel: UILabel!
    
    @IBOutlet weak var tableView: UITableView!
    
    let db = Firestore.firestore()
    var dataSets : [AnswersModel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        odaiLabel.text = odaiString
        
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super .viewWillAppear(animated)
        loadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        <#code#>
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        <#code#>
    }
    
    func loadData() {
        // get documents of Answers
        
        
        // into DataSets as AnswersModel
    }
    


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
