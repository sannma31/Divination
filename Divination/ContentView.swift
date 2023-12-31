//
//  ContentView.swift
//  Divination
//
//  Created by 笠井翔雲 on 2023/12/04.
//
import SwiftUI

struct YearMonthDay: Hashable {
    var year: Int
    var month: Int
    var day: Int
}

struct ContentView: View {
    @State private var name: String = "ゆめみん"
    @State private var birthday: YearMonthDay = YearMonthDay(year: 2000, month: 1, day: 27)
    @State private var bloodType: String = "ab"
    @State private var today: YearMonthDay = YearMonthDay(year: 2000, month: 1, day: 27)
    
    var body: some View {
        VStack(spacing: 20) {
            Text("名前を入力してね")
                .font(.headline)
            
            TextField("名前を入力してください", text: $name)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding(10)
                .foregroundColor(.gray)
            
            Text("誕生日を入力してください")
                .font(.headline)
            
            DatePicker("", selection: $birthday.date, displayedComponents: .date)
                .datePickerStyle(DefaultDatePickerStyle())
                .labelsHidden()
                .padding(10)
            
            Text("血液型を入力してください")
                .font(.headline)
            
            TextField("血液型を入力してください", text: $bloodType)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding(10)
            Text("今日の日付: \(today.year)/\(today.month)/\(today.day)")
        }
        .padding()
        .onAppear {
            // 今日の日付を取得して設定
            let todayDate = Date()
            let calendar = Calendar.current
            let components = calendar.dateComponents([.year, .month, .day], from: todayDate)
            today.year = components.year ?? 0
            today.month = components.month ?? 0
            today.day = components.day ?? 0
            
        }
        .padding()
    }
}

extension YearMonthDay {
    var date: Date {
        get {
            return Calendar.current.date(from: DateComponents(year: year, month: month, day: day)) ?? Date()
        }
        set {
            let components = Calendar.current.dateComponents([.year, .month, .day], from: newValue)
            year = components.year ?? 0
            month = components.month ?? 0
            day = components.day ?? 0
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

