//
//  ProfileView.swift
//  ThreadsCloneApp
//
//  Created by Alican TARIM on 6.04.2024.
//

import SwiftUI

struct ProfileView: View {
    let user: User
    
    
    
    
    
    var body: some View {
        ScrollView(showsIndicators: false) {
            // bio and stats
            VStack(spacing: 20) {
                ProfileHeaderView(user: user)
                
                Button {
                    
                } label: {
                    Text("Follow")
                        .font(.subheadline)
                        .fontWeight(.semibold)
                        .foregroundStyle(.white)
                        .frame(width: 352, height: 32)
                        .background(.black)
                        .cornerRadius(8)
                }
                
                // user content list view
                UserContentListView(user: user)
            
            }
        }
        .navigationBarTitleDisplayMode(.inline)
        .padding(.horizontal)
    }
}
/*
 #Preview {
 ProfileView(user: dev.user)
 }
 */
struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView(user: dev.user)
    }
}
