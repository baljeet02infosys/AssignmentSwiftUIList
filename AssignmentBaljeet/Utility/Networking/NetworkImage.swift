//
//  NetworkImage.swift
//  AssignmentBaljeet
//
//  Created by Baljeet Kaur on 06/04/22.
//

import Foundation
import SwiftUI
import Combine


struct NetworkImage: View {
    @StateObject private var viewModel = ViewModel()

    let url: URL?
    var body: some View {
        Group {
            if let data = viewModel.imageData, let uiImage = UIImage(data: data) {
                Image(uiImage: uiImage)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
            } else if viewModel.isLoading {
                ProgressView()
            } else {
                Image("cheese-toastie-thumb")
                    .frame(width: imageSize, height: imageSize)
                    .clipShape(RoundedRectangle(cornerRadius: imageRadius)).clipShape(Circle())
            }
        }
        .onAppear {
            viewModel.loadImage(from: url)
        }
    }
}

extension NetworkImage {
    class ViewModel: ObservableObject {
        @Published var imageData: Data?
        @Published var isLoading = false
        private static let cache = NSCache<NSURL, NSData>()
        private var cancellables = Set<AnyCancellable>()

        func loadImage(from url: URL?) {
            isLoading = true
            guard let url = url else {
                isLoading = false
                return
            }
            if let data = Self.cache.object(forKey: url as NSURL) {
                imageData = data as Data
                isLoading = false
                return
            }
            URLSession.shared.dataTaskPublisher(for: url)
                .map { $0.data }
                .replaceError(with: nil)
                .receive(on: DispatchQueue.main)
                .sink { [weak self] in
                    if let data = $0 {
                        Self.cache.setObject(data as NSData, forKey: url as NSURL)
                        self?.imageData = data
                    }
                    self?.isLoading = false
                }
                .store(in: &cancellables)
        }
    }
}
