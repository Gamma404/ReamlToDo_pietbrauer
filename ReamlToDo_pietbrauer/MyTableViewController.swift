//
//  MyTableViewController.swift
//  ReamlToDo_pietbrauer
//
//  Created by Apple on 2018/3/20.
//  Copyright © 2018年 Gamma. All rights reserved.
//

import UIKit
import RealmSwift

class MyTableViewController: UITableViewController {


    override func viewDidLoad() {
        super.viewDidLoad()
//        do {
//            try AddOrder()
//        } catch {
//        }

//        do {
//            try ModifyOrder()
//        } catch {
//        }
// 查詢資料
        queryOrder()
    }

    private func queryOrder() {
        let realm = try! Realm()

        let orders = realm.objects(Order.self).filter("name = '鞋子700雙'")

        for result in orders {
            print("id: \(result.id)")
            print("name: \(result.name)")
            print("amount: \(result.amount)")
        }
    }

    private func ModifyOrder() throws { // 修改資料
        let realm = try! Realm()

        let order: Order = Order()
        order.id = "E3C5344A-5930-404B-8B79-3BC82981AC5E"
        order.name = "鞋子700雙"
        order.amount = 40000

        try! realm.write {
            // 必須有定義key值才能傳入true
            realm.add(order, update: true)
        }
    }

    private func AddOrder() throws { // 生成訂單
        let realm = try! Realm()

//放在這只會有一筆資料
//        let order: Order = Order()
//        order.name = "鞋子1000雙" // 訂單名稱
//        order.amount = 60000 // 訂單金額

        // 交易開始
        realm.beginWrite()

        for _ in 1...100{
//放裡面就會有100筆
            let order: Order = Order()
            order.name = "鞋子1000雙" // 訂單名稱
            order.amount = 60000 // 訂單金額
            
            realm.add(order)
        }

        // 交易結束，並提交數據
        try! realm.commitWrite()

        // 印出資料庫的位址
        print("fileURL: \(realm.configuration.fileURL!)")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 0
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 0
    }

    /*
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

        return cell
    }
    */

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
