//
//  AuthenticationView.swift
//  WatchWhat.iOS
//
//  Created by Drew Miller on 3/19/23.
//

import SwiftUI

struct AuthenticationView: View {
    @EnvironmentObject var viewModel: AuthenticationViewModel

    var body: some View {
        VStack {
            switch viewModel.flow {
            case .login:
                LoginView()
                    .environmentObject(viewModel)
            case .signUp:
                SignupView()
                    .environmentObject(viewModel)
            }
        }
    }
}

struct AuthenticationView_Previews: PreviewProvider {
    static var previews: some View {
        AuthenticationView()
        AuthenticationView()
            .preferredColorScheme(.dark)
    }
}
