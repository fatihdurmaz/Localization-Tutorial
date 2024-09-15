//
//  ContentView.swift
//  Localization Tutorial
//
//  Created by Fatih Durmaz on 15.09.2024.
//

import SwiftUI

struct ContentView: View {
    @State private var firstName = ""
    @State private var lastName = ""
    @State private var email = ""
    @State private var age = 18
    @State private var birthdate = Date()
    @State private var gender = "Male"
    @State private var notificationsEnabled = true
    @State private var preferredLanguage = "English"
    @State private var stepCount = 0
    
    let languages = ["English", "Turkish", "Spanish", "German"]
    
    let genders = ["Male", "Female"]
    
    var body: some View {
        NavigationStack {
            VStack {
                Form {
                    Section(header: Text("Personal Information")) {
                        TextField("First Name", text: $firstName)
                        
                        TextField("Last Name", text: $lastName)
                        
                        TextField("Email", text: $email)
                            .keyboardType(.emailAddress)
                        
                        Stepper(value: $age, in: 1...100) {
                            Text("Age: \(age)")
                        }
                        
                        DatePicker("Birthdate", selection: $birthdate, displayedComponents: .date)
                    }
                    .textCase(.none)
                    
                    Section(header: Text("Preferences")) {
                        Picker("Gender", selection: $gender) {
                            ForEach(genders, id: \.self) {
                                Text(LocalizedStringKey($0))
                            }
                        }
                        .pickerStyle(SegmentedPickerStyle())
                        
                        Picker("Preferred Language", selection: $preferredLanguage) {
                            ForEach(languages, id: \.self) {
                                Text(LocalizedStringKey($0))
                            }
                        }
                        
                        Toggle("Enable Notifications", isOn: $notificationsEnabled)
                        
                        Stepper(value: $stepCount, in: 0...100) {
                            Text("Step Count: \(stepCount)")
                        }
                        
                        Button(action: {
                        }) {
                            Text("Submit")
                                .frame(maxWidth: .infinity)
                                .font(.title2)
                                .padding()
                                .bold()
                                .background(.blue)
                                .foregroundStyle(.white)
                                .clipShape(.rect(cornerRadius: 10))
                        }
                    }
                    .textCase(.none)
                    
                }
            }
            .tint(.blue)
            .navigationTitle("User Form")
            .navigationBarTitleDisplayMode(.inline)
            .toolbarBackground(.white, for: .navigationBar)
            .toolbarBackground(.visible, for: .navigationBar)
            
        }
    }
}

#Preview {
    ContentView()
}
