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
        VStack {
            TextField("名前を入力してください", text: $name)
                .padding(10)

            
            TextField("血液型を入力してください", text: $bloodType)
                .padding(10)
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
