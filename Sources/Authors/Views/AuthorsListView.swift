//
//  AuthorsListView.swift
//  RawEngineeringTest
//
//  Created by Kurapav on 18/08/22.
//

import SwiftUI

public struct AuthorsListView: View {
    @ObservedObject var viewModel = AuthorsListViewModel()

    public init() {
        viewModel.fetchAuthors()
    }
    public var body: some View {
        GeometryReader { geometry in
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 5) {
                    ForEach(viewModel.authors) { author in
                        AuthorCell(author, maxHeight: geometry.size.height)
                    }
                }
            }
        }

    }
}

struct AuthorsListView_Previews: PreviewProvider {
    static var previews: some View {
        AuthorsListView()
    }
}
