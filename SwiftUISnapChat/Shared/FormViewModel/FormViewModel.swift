//
//  FormViewModel.swift
//  SwiftUISnapChat
//
//  Created by Lusine on 4/21/22.
//

import SwiftUI
import  Combine

class FormViewModel: ObservableObject {
    
    @Published var email = ""
    @Published var password = ""
    @Published var inlineErrorForPassword = ""
    @Published var isValid = false
    private var cancellables = Set<AnyCancellable>()
    
    private var isUserNameValidPublisher: AnyPublisher<Bool, Never> {
       $email
        .debounce(for: 0.8, scheduler: RunLoop.main)
        .removeDuplicates()
        .map { $0.count >= 3 }
        .eraseToAnyPublisher()
      }
     private var isPasswordEmptyPublisher: AnyPublisher<Bool, Never> {
       $password
        .debounce(for: 0.8, scheduler: RunLoop.main)
        .removeDuplicates()
        .map { $0.isEmpty }
        .eraseToAnyPublisher()
     }
    private var isPasswordStrongPublisher: AnyPublisher<Bool, Never> {
        $password
        .debounce(for: 0.2, scheduler: RunLoop.main)
            .removeDuplicates()
            .map {
               $0.count >= 3
            }
            .eraseToAnyPublisher()
        }
    private var isPasswordValidPublisher:AnyPublisher<PasswordStatus, Never> {
        Publishers.CombineLatest(isPasswordEmptyPublisher,isPasswordStrongPublisher)
            .map {
                if $0 { return PasswordStatus.empty }
                if !$1 { return PasswordStatus.notStrongEnough }
                return PasswordStatus.valid
            }
            .eraseToAnyPublisher()
        }
    private var isFormValidPublisher: AnyPublisher<Bool, Never> {
        Publishers.CombineLatest(isPasswordValidPublisher,isUserNameValidPublisher)
            .map { $0 == .valid && $1 }
            .eraseToAnyPublisher()
        }
    init() {
        isFormValidPublisher
            .receive(on: RunLoop.main)
            .assign(to: \.isValid , on: self)
            .store(in: &cancellables)

        isPasswordValidPublisher
            .dropFirst()
            .receive(on: RunLoop.main)
            .map { PasswordStatus in
                switch PasswordStatus {
                    case .empty:
                        return "Password cannot be empty!"
                    case .notStrongEnough:
                        return "Password is too weak!"
                    case .valid:
                        return ""
                        }
                }
            .assign(to: \.inlineErrorForPassword, on: self)
            .store(in: &cancellables)
        }
     }
