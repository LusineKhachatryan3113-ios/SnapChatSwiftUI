//
//  FormViewModel.swift
//  SwiftUISnapChat
//
//  Created by Lusine on 4/21/22.
//

import SwiftUI

import SwiftUI

// Model
enum PasswordStatus1 {
    case empty
    case notStrongEnough
    case valid
}

// ViewModel
import  Combine


class FormViewModel1: ObservableObject {
    @Published var name = ""
    @Published var password = ""
    @Published var inlineErrorForPassword = ""
    @Published var isValid = false
    private var cancellables = Set<AnyCancellable>()
    private var isUserNameValidPublisher: AnyPublisher<Bool, Never>{
       $name
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
    private var isPasswordValidPublisher:AnyPublisher<PasswordStatus1, Never> {
        Publishers.CombineLatest(isPasswordEmptyPublisher,isPasswordStrongPublisher)
            .map {
                if $0 { return PasswordStatus1.empty }
                if !$1 { return PasswordStatus1.notStrongEnough }
                return PasswordStatus1.valid
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
            .map { PasswordStatus1 in
                switch PasswordStatus1 {
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
