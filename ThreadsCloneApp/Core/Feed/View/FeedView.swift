//
//  FeedView.swift
//  ThreadsCloneApp
//
//  Created by Alican TARIM on 6.04.2024.
//

import SwiftUI

struct FeedView: View {
    @StateObject var viewModel = FeedViewModel()
    var body: some View {
        NavigationStack {
            ScrollView(showsIndicators: false, content: {
                LazyVStack { // -> Ekranda görünen kısmını oluşturur. Scroll ettikçe diğerlerini yükler.
                    ForEach(viewModel.threads) { thread in
                        ThreadCell(thread: thread)
                    }
                    
                }
            })
            .refreshable {  // Sayfayı aşağı çektiğimizde refresh özelliğini verir. Indicator döner.
                Task { try await viewModel.fetchThreads()}
            }
            .navigationTitle("Threads")
            .navigationBarTitleDisplayMode(.inline)
        }
        .toolbar {
            ToolbarItem(placement: .topBarTrailing) {
                Button(action: {
                    
                }, label: {
                    Image(systemName: "arrow.counterclockwise")
                        .foregroundColor(.black)
                })
            }
        }
    }
}

#Preview {
    NavigationStack {
        FeedView()
    }
}
