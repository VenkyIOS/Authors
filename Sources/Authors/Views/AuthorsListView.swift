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
            ZStack {
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 5) {
                        ForEach(viewModel.authors) { author in
                            AuthorCell(author, maxHeight: geometry.size.height*(0.60))
                                .onTapGesture {
                                    if viewModel.previewAuthor?.id == author.id {
                                        viewModel.previewAuthor = nil
                                        return
                                    }
                                    viewModel.previewAuthor = author
                                }
                                .zIndex(viewModel.previewAuthor?.id == author.id ? 1 : 0)
                                .shadow(color: Color.black.opacity(viewModel.previewAuthor?.id == author.id ? 0.6 : 0.3), radius: viewModel.previewAuthor?.id == author.id ? 10 : 0, x: 0, y: 0)
                                .scaleEffect(viewModel.previewAuthor?.id == author.id ? 1.35 : 1)
                                .animation(.spring(response: 0.4, dampingFraction: 0.6))
                        }
                    }
                    .frame(height: geometry.size.height, alignment: .center)
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
