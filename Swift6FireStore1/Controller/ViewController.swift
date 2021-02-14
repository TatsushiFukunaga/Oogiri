//
//  ViewController.swift
//  Swift6FireStore1
//
//  Created by Tatsushi Fukunaga on 2021/02/07.
//

import UIKit
import Firebase
import FirebaseAuth
import FirebaseFirestore
import EMAlertController

class ViewController: UIViewController {

    let db1 = Firestore.firestore().collection("Odai").document("RRXHpoUbWCbWKPUFrNLN")
    let db2 = Firestore.firestore()
    
    var userName = String()
    var idString = String()
    
    @IBOutlet weak var odaiLabel: UILabel!
    @IBOutlet weak var textView: UITextView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        if UserDefaults.standard.object(forKey: "userName") != nil {
            userName = UserDefaults.standard.object(forKey: "userName") as! String
        }
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super .viewWillAppear(animated)
        
        if UserDefaults.standard.object(forKey: "documentID") != nil {
            idString = UserDefaults.standard.object(forKey: "documentID") as! String
        } else {
            idString = db2.collection("Answers").document().path
            print(idString)
            idString = String(idString.dropFirst(8))
            UserDefaults.standard.setValue(idString, forKey: "documentID")
        }
        
        self.navigationController?.isNavigationBarHidden = true
        
        // load
        loadQuestionData()
        
    }
    
    func loadQuestionData(){
        db1.getDocument { (snapshot, error) in
            if error != nil {
                return
            }
            
            let data = snapshot?.data()
            self.odaiLabel.text = data!["odaiText"] as! String
        }
    }
    
    
    @IBAction func send(_ sender: Any) {
        db2.collection("Answers").document().setData(["answer": textView.text as Any, "userName": userName as Any, "postDate": Date().timeIntervalSince1970, "like": 0, "likeFlagDic": [idString: false]])
        textView.text = ""
        // alert
        let alert = EMAlertController(icon: UIImage(named: "check"), title: "投稿完了", message: "みんなの回答も見てみよう！")
        let doneAlert = EMAlertAction(title: "OK", style: .normal)
        alert.addAction(doneAlert)
        present(alert, animated: true, completion: nil)
        textView.text = ""
    }
    

    @IBAction func checkAnswer(_ sender: Any) {
        // 画面遷移
        let checkVC = self.storyboard?.instantiateViewController(identifier: "checkVC") as! CheckViewController
        checkVC.odaiString = odaiLabel.text!
        self.navigationController?.pushViewController(checkVC, animated: true)
        
    }
    
    @IBAction func logout(_ sender: Any) {
        
        let firebaseAuth = Auth.auth()
        do {
            try firebaseAuth.signOut()
            UserDefaults.standard.removeObject(forKey: "userName")
            UserDefaults.standard.removeObject(forKey: "documentID")
        } catch let error as NSError {
            print(error)
        }
        self.navigationController?.popViewController(animated: true)
    }
}

