//
//  SelectDatePeriodView.swift
//  lottery
//
//  Created by your3i on 2022/09/28.
//

import SwiftUI

struct SelectDatePeriodView: View {

    @Binding var fromDate: Date

    @Binding var toDate: Date

    private var fromDateRange: ClosedRange<Date> {
        Date.date(from: "2019/1/1")!...toDate
    }

    private var toDateRange: ClosedRange<Date> {
        fromDate...Date.now
    }
    
    var body: some View {
        HStack {
            DatePicker("", selection: $fromDate, in: fromDateRange, displayedComponents: [.date])
                .datePickerStyle(.compact)
                .labelsHidden()
            Text("-")
            DatePicker("", selection: $toDate, in: toDateRange, displayedComponents: [.date])
                .datePickerStyle(.compact)
                .labelsHidden()
        }
    }
}

struct SelectDatePeriodView_Previews: PreviewProvider {
    static var previews: some View {
        SelectDatePeriodView(fromDate: .constant(.now), toDate: .constant(.now))
    }
}
