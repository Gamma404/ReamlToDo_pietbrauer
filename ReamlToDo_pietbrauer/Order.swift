//
// Created by Apple on 2018/3/21.
// Copyright (c) 2018 Gamma. All rights reserved.
//

import Foundation
import RealmSwift

class Order: Object {

    @objc dynamic var id = UUID().uuidString // key(設置key可以加快查詢的速度)
    @objc dynamic var name = "" // 訂單名稱
    @objc dynamic var amount = 0 // 訂單總金額
    @objc dynamic var createDate = Date() // 訂單產生日期

    override static func primaryKey() -> String? {
        return "id"
    }
}