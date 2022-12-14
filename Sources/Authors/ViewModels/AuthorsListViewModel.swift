//
//  AuthorsListViewModel.swift
//  RawEngineeringTest
//
//  Created by Kurapav on 18/08/22.
//

import Foundation
import Combine

public class AuthorsListViewModel: ObservableObject {
    private var getAuthorsSubscriber: AnyCancellable?
    @Published var authors = [Author]()
    @Published var previewAuthor: Author?

    func fetchAuthors() {
        
        var authorsPublisher: AnyPublisher<[Author], Error>?
        authorsPublisher = APIRequestManager.callApi(.getAuthors)
        getAuthorsSubscriber = authorsPublisher?.sink(receiveCompletion: { complition in
            
        }, receiveValue: { authors in
            DispatchQueue.main.async {
                self.authors = authors
            }
        })
    }
}
