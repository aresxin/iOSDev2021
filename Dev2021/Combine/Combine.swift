//
//  Combine.swift
//  Dev2021
//
//  Created by Owen on 2021/4/19.
//

import SwiftUI

struct Combine: View {
    @ObservedObject private var userViewModel = UserViewModel()
    @State var presentAlert = false

    var body: some View {
        Form {
            Section(footer: Text(userViewModel.usernameMessage).foregroundColor(.red)) {
                TextField("Username", text: $userViewModel.username)
                    .autocapitalization(.none)
            }
            Section(footer: Text(userViewModel.passwordMessage).foregroundColor(.red)) {
                SecureField("Password", text: $userViewModel.password).disabled(!self.userViewModel.isPasswordEnable)
               SecureField("Password again", text: $userViewModel.passwordAgain).disabled(!self.userViewModel.isPasswordEnable)
             }
             Section {
               Button(action: { self.signUp() }) {
                 Text("Sign up")
               }.disabled(!self.userViewModel.isValid)
             }
        }
        .sheet(isPresented: $presentAlert) {
            WelcomeView()
        }.navigationTitle(Text("Demo", comment: "Combine"))
    }

    func signUp() {
        self.presentAlert = true
    }
}

struct WelcomeView: View {
  var body: some View {
    Text("Welcome! Great to have you on board!")
  }
}


struct Combine_Previews: PreviewProvider {
    static var previews: some View {
        Combine()
    }
}
