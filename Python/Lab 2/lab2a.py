class MeetingRoom:
    def __init__(self, room_id, capacity, floor_location):
        self.room_id = room_id
        self.capacity = capacity
        self.floor_location = floor_location

class ZoomMeetingRoom(MeetingRoom):
    def __init__(self, room_id, capacity, floor_location, zoom_device_id, zoom_account_id):
        super().__init__(room_id, capacity, floor_location)
        self.zoom_device_id = zoom_device_id
        self.zoom_account_id = zoom_account_id

class Booking:
    def __init__(self, employee_id, room_id, meeting_date, meeting_time, duration):
        self.employee_id = employee_id
        self.room_id = room_id
        self.meeting_date = meeting_date
        self.meeting_time = meeting_time
        self.duration = duration
class BookingManager:
    def __init__(self):
        self.bookings = []

    def add_booking(self, booking):
        self.bookings.append(booking)

    def get_bookings_by_date(self, date):
        return [b for b in self.bookings if b.meeting_date == date]
    
room1 = MeetingRoom("R101", 10, "1st Floor")
room2 = ZoomMeetingRoom("R102", 8, "2nd Floor", "ZD001", "zoom@company.com")

booking1 = Booking("E001", "R101", "2025-10-07", "10:00", 60)
booking2 = Booking("E002", "R102", "2025-10-07", "11:00", 30)

manager = BookingManager()
manager.add_booking(booking1)
manager.add_booking(booking2)

todays_bookings = manager.get_bookings_by_date("2025-10-07")
for b in todays_bookings:
    print(f"Employee {b.employee_id} booked Room {b.room_id} at {b.meeting_time} for {b.duration} mins")
