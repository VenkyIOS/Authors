//
//  AuthorCell.swift
//  RawEngineeringTest
//
//  Created by Kurapav on 20/08/22.
//

import Foundation
import SwiftUI
import SDWebImageSwiftUI

struct AuthorCell: View {
    var author: Author
    var cellHeight: CGFloat
    init(_ author: Author, maxHeight: CGFloat = CGFloat(10)) {
        self.author = author
        self.cellHeight = maxHeight
    }
    @State var frame: CGSize = CGSize(width: 1, height: 1)

    var body: some View {
        let size = sizeOfImgForHeight(author, maxHeight: cellHeight)
        return VStack {
            if let url = URL(string: author.download_url ?? "") {
                WebImage(url: url)
                    .resizable()
                    .frame(width: size.width, height: size.height, alignment: .center)
                    .aspectRatio(contentMode: .fit)
                    .cornerRadius(15)
                Text(author.author ?? "").lineLimit(1)
            }
        }
    }

    func sizeOfImgForHeight(_ author: Author, maxHeight: CGFloat) -> CGSize {
        let width: CGFloat = CGFloat(author.width ?? 0)
        let authorHeight: CGFloat = CGFloat(author.height ?? 1)
        let heightValue: CGFloat = authorHeight > 0 ? authorHeight : 1
        print(width, heightValue)
        let size = CGSize(width: maxHeight*CGFloat(width/heightValue), height: maxHeight)
        print(size)
        return size
        
    }
}
