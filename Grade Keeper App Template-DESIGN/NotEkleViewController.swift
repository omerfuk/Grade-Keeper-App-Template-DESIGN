//
//  NotEkleViewController.swift
//  Grade Keeper App Template-DESIGN
//
//  Created by Ömer Faruk Kılıçaslan on 21.04.2022.
//
import Firebase
import UIKit

class NotEkleViewController: UIViewController {

    
    @IBOutlet weak var textFieldNot2: UITextField!
    @IBOutlet weak var textFieldNot1: UITextField!
    @IBOutlet weak var textFieldDersAdi: UITextField!
    
    var ref:DatabaseReference!
    override func viewDidLoad() {
        super.viewDidLoad()

        ref = Database.database().reference()
    }
    
    @IBAction func notEkle(_ sender: Any) {
        
        if let ad = textFieldDersAdi.text, let not1 = textFieldNot1.text, let not2 = textFieldNot2.text {
            if let n1 = Int(not1), let n2 = Int(not2){
                notEkle(ders_adi: ad, not1: n1, not2: n2)
            }
        }
        
        navigationController?.popToRootViewController(animated: true)
    }
    
    func notEkle(ders_adi:String, not1:Int, not2:Int){
        let dict:[String:Any] = ["ders_adi":ders_adi,"not1":not1,"not2":not2]
        
        let newRef = ref.child("notlar").childByAutoId()
        newRef.setValue(dict)
    }

}
