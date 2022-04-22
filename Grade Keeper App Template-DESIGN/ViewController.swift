//
//  ViewController.swift
//  Grade Keeper App Template-DESIGN
//
//  Created by Ömer Faruk Kılıçaslan on 21.04.2022.
//

import UIKit

class ViewController: UIViewController {

    var notlarListe = [Notlar]()
    
    @IBOutlet weak var notTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()

        let n1 = Notlar(not_id: 1, ders_adi: "Tarih", not1: 30, not2: 50)
        let n2 = Notlar(not_id: 2, ders_adi: "Fizik", not1: 50, not2: 20)
        
        notlarListe.append(n1)
        notlarListe.append(n2)
        
        notTableView.delegate = self
        notTableView.dataSource = self

    }


}

extension ViewController:UITableViewDelegate,UITableViewDataSource{
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return notlarListe.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let not = notlarListe[indexPath.row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "notHucre",for: indexPath) as! NotHucreTableViewCell
        
        cell.labelDersAdi.text = not.ders_adi
        cell.labelNot1.text = String(not.not1!)
        cell.labelNot2.text = String(not.not2!)
        
        return cell
        }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.performSegue(withIdentifier: "toNotDetay", sender: indexPath.row)
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        let deleteAction = UIContextualAction(style: .destructive, title: "Sil", handler: { (contextualAction,view,boolValue) in
            
            let alertController = UIAlertController(title: "UYARI", message: "Silmek İstediğinize Emin Misiniz", preferredStyle: .alert)
            
            let iptalAction = UIAlertAction(title: "İptal", style: .destructive)
            
            let tamamAction = UIAlertAction(title: "Tamam", style: .default, handler: nil)
            
            alertController.addAction(iptalAction)
            alertController.addAction(tamamAction)
            
        
            
            self.present(alertController, animated: true, completion: nil)
        
        })
        
        let guncelleAction = UIContextualAction(style: .normal, title: "Guncelle", handler: {(contextualAction,view,boolValue) in
            
            
        })
        return UISwipeActionsConfiguration(actions: [deleteAction,guncelleAction])
    }
}
