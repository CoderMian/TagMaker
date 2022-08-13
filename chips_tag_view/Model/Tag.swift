//
//  Tag.swift
//  chips_tag_view
//
//  Created by devsaar on 28/06/2022.
//

import SwiftUI
//tag Model...
struct Tag: Identifiable,Hashable
{
    var id = UUID().uuidString
    var text:String
    var size:CGFloat = 0

}


