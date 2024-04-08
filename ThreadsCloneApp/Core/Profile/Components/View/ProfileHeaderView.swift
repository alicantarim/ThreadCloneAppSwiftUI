//
//  ProfileHeaderView.swift
//  ThreadsCloneApp
//
//  Created by Alican TARIM on 6.04.2024.
//

import SwiftUI

struct ProfileHeaderView: View {
    
    var user: User?
    
    init(user: User?) {
        self.user = user
    }
    
    var body: some View {
        HStack(alignment: .top) {
            VStack(alignment: .leading, spacing: 12){
                // fullname and username
                VStack(alignment: .leading, spacing: 4) {
                    Text(user?.fullname ?? "")     // Text("Charles Leclerc")
                        .font(.title2)
                        .fontWeight(.semibold)
                    
                    Text(user?.username ?? "")     // Text("charles_leclerc")
                        .font(.subheadline)
                }
                // Text("Formula 1 driver for Scuderia Ferrari")
                if let bio = user?.bio {
                    Text(bio)
                        .font(.footnote)
                }
                
                Text("2 followers")
                    .font(.caption)
                    .foregroundStyle(.gray)
            }
            
            Spacer()
            
            CircularProfileImageView(user: user, size: .medium)
        }
    }
}
/*
#Preview {
    ProfileHeaderView()
}
*/
 
struct ProfileHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileHeaderView(user: dev.user)
    }
}
