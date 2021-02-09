//
//  CommentViewController.swift
//  Swift6FireStore1
//
//  Created by Tatsushi Fukunaga on 2021/02/09.
//

import UIKit
import Firebase
import FirebaseFirestore

class CommentViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var idString = String()
    var kaitouString = String()
    var userName = String()
    let db = Firestore.firestore()
    var dataSets: [CommentModel] = []
    
    @IBOutlet weak var kaitouLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var sendButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if UserDefaults.standard.object(forKey: "userName") != nil {
            userName = UserDefaults.standard.object(forKey: "userName") as! String
        }
        // Do any additional setup after loading the view.
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super .viewWillAppear(animated)
        self.navigationController?.isNavigationBarHidden = false
        loadData()
    }
    
    func loadData() {
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        <#code#>
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSets.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        tableView.estimatedRowHeight = 100
        return UITableView.automaticDimension
    }
    
    @IBAction func sendAction(_ sender: Any) {
        
        db.collection("Answers").document(idString).collection("comment").document().setData(["comment" : userName as Any, "userName" : textField.text as Any, "postData" : Date().timeIntervalSince1970])
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
