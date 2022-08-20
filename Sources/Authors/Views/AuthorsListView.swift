//
//  AuthorsListView.swift
//  RawEngineeringTest
//
//  Created by Kurapav on 18/08/22.
//

import SwiftUI

struct AuthorsListView: View {
    @ObservedObject var viewModel = AuthorsListViewModel()

    init() {
        viewModel.fetchAuthors()
    }
    var body: some View {
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
