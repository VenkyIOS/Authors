//
//  Author.swift
//  RawEngineeringTest
//
//  Created by Kurapav on 18/08/22.
//

import Foundation

struct Author: Decodable, Identifiable {
     var id: String?
     var author: String?
     var width: Int?
     var height: Int?
     var url: String?
     var download_url: String?
}
