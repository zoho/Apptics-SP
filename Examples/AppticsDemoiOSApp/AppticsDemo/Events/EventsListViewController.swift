
import UIKit
import AppticsEventTracker
import AppticsScreenTracker

class EventsListViewController: UITableViewController {
}

extension EventsListViewController {
    static let eventsListCellIdentifier = "EventsListCell"
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return EventsTableList.eventData.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: Self.eventsListCellIdentifier, for: indexPath) as? EventsListCell else {
            fatalError("Unable to dequeue ReminderCell")
        }
        let list = EventsTableList.eventData[indexPath.row]
        let event_name = APEvent.event(forType: list.type)
        cell.eventTitle.text = event_name
//        cell.groupTitle.text = eventObject.group
        cell.accessoryType = .disclosureIndicator
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let list = EventsTableList.eventData[indexPath.row]
        APEvent.trackEvent(withType: list.type, andProperties: ["age1":28])
        let event_name = APEvent.event(forType: list.type)
        
        APEvent.trackEvent("testAppStatus", withGroupName: "Applifecycle")
        
        let screentimestamp = APScreentracker.trackViewEnter(withScreenName: "\(event_name!)")
        
        let timestamp = APEvent.startTimedEvent(withEventName: "Test", group: "debugGroup", andProperties: [:])
        
       
        
        
        APEvent.endTimedEvent(withEventName: "Test", group: "debugGroup", andstartTime: timestamp)
        
        APScreentracker.trackViewExit(withTimestamp: screentimestamp)
        
        let crashCases: [[String: Any]] = [
                       ["date": Date()],
                       ["data": "hello".data(using: .utf8)!],
                       ["custom": NSObject()],
                       ["nestedArray": ["a", "b"]],
                       ["nestedDict": ["k": "v"]],
                       ["null": NSNull()]
                   ]

                   for caseProps in crashCases {
                       
                       print("caseProps : \(caseProps)")

                       
                       APEvent.trackEvent("iOS_Login123", andGroupName: "AppLifecycle", withProperties: caseProps)
                   }
        
        
//        Toast.show(message: "Event '\(event_name)' tracked!", controller: self)
    }
}





