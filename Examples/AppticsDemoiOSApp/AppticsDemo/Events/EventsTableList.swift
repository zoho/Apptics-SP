
import Foundation



struct EventsTableList {
    var type: APEventType
}

extension EventsTableList {
    static var eventData = [
        EventsTableList(type: ._purchase_add_purchase),
        EventsTableList(type: ._bill_country_code),
        EventsTableList(type: ._purchase_update_purchase),
        EventsTableList(type: ._purchase_delete_purchase),
        EventsTableList(type: ._students_studied),
        EventsTableList(type: ._students_logging),
        EventsTableList(type: ._employee_studied),
        EventsTableList(type: ._sell_refund)
    ]
}

