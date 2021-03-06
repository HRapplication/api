# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password')

Employee.create('name': 'Ashely', 'surname': 'Raymond', 'phone_number': '1-973-201-0080', 'position': 'worker', 'weekly_working_hours': 31, 'supervisor_id': 1)
Employee.create('name': 'Alfonso', 'surname': 'Day', 'phone_number': '1-768-862-8377', 'position': 'worker', 'weekly_working_hours': 15, 'supervisor_id': 1)
Employee.create('name': 'Hasad', 'surname': 'Kirk', 'phone_number': '1-415-563-0395', 'position': 'hr', 'weekly_working_hours': 13, 'supervisor_id': 1)
Employee.create('name': 'Julie', 'surname': 'Reynolds', 'phone_number': '1-398-904-1922', 'position': 'worker', 'weekly_working_hours': 17, 'supervisor_id': 1)
Employee.create('name': 'Desiree', 'surname': 'Hartman', 'phone_number': '1-390-698-9751', 'position': 'hr', 'weekly_working_hours': 14, 'supervisor_id': 1)
Employee.create('name': 'Ishmael', 'surname': 'Miranda', 'phone_number': '1-552-458-9193', 'position': 'worker', 'weekly_working_hours': 21, 'supervisor_id': 1)
Employee.create('name': 'Odette', 'surname': 'Zamora', 'phone_number': '1-150-313-7580', 'position': 'hr', 'weekly_working_hours': 27, 'supervisor_id': 2)
Employee.create('name': 'Dana', 'surname': 'Foreman', 'phone_number': '1-848-897-1090', 'position': 'worker', 'weekly_working_hours': 21, 'supervisor_id': 1)
Employee.create('name': 'Kessie', 'surname': 'Rogers', 'phone_number': '1-420-496-1074', 'position': 'hr', 'weekly_working_hours': 25, 'supervisor_id': 2)
Employee.create('name': 'Molly', 'surname': 'Rosales', 'phone_number': '1-908-872-2733', 'position': 'worker', 'weekly_working_hours': 20, 'supervisor_id': 2)

User.create('email': 'ut@nectellusNunc.edu', 'password': 'SLH81FEX5HD', 'employee_id': '1')
User.create('email': 'nisi.Aenean@feugiat.com', 'password': 'AOR84XJO1TJ', 'employee_id': '2')
User.create('email': 'erat@faucibus.edu', 'password': 'KIT74YFN9NM', 'employee_id': '3')
User.create('email': 'sollicitudin@Namtempor.ca', 'password': 'QFM36KXT6BC', 'employee_id': '4')
User.create('email': 'accumsan.interdum@loremsemper.ca', 'password': 'BXN09MTL5PH', 'employee_id': '5')
User.create('email': 'vel.arcu.eu@Morbi.edu', 'password': 'KTX51OQX7AV', 'employee_id': '6')
User.create('email': 'orci.tincidunt@diameu.ca', 'password': 'AJI74HJF7TG', 'employee_id': '7')
User.create('email': 'ac@dolorelit.ca', 'password': 'ZRX51TAH5WG', 'employee_id': '8')
User.create('email': 'sagittis@ut.ca', 'password': 'IOH13IRB9UH', 'employee_id': '9')
User.create('email': 'pharetra.sed@nonummy.org', 'password': 'WAU96GEE5YK', 'employee_id': '10')

SickLeaveForm.create('start_date': Date.new(2017,04,11), 'end_date': Date.new(2017,05,9), 'care_type': 'self', 'employee_id': 6, 'status': 'waiting')
SickLeaveForm.create('start_date': Date.new(2017,04,28), 'end_date': Date.new(2017,05,12), 'care_type': 'child', 'employee_id': 7, 'status': 'accepted')
SickLeaveForm.create('start_date': Date.new(2017,04,21), 'end_date': Date.new(2017,05,22), 'care_type': 'child', 'employee_id': 4, 'status': 'waiting')
SickLeaveForm.create('start_date': Date.new(2017,04,26), 'end_date': Date.new(2017,05,8), 'care_type': 'child', 'employee_id': 1, 'status': 'waiting')
SickLeaveForm.create('start_date': Date.new(2017,04,22), 'end_date': Date.new(2017,05,13), 'care_type': 'child', 'employee_id': 7, 'status': 'rejected')
SickLeaveForm.create('start_date': Date.new(2017,04,18), 'end_date': Date.new(2017,05,11), 'care_type': 'self', 'employee_id': 8, 'status': 'waiting')
SickLeaveForm.create('start_date': Date.new(2017,04,23), 'end_date': Date.new(2017,05,13), 'care_type': 'child', 'employee_id': 3, 'status': 'waiting')
SickLeaveForm.create('start_date': Date.new(2017,04,13), 'end_date': Date.new(2017,06,4), 'care_type': 'child', 'employee_id': 10, 'status': 'accepted')
SickLeaveForm.create('start_date': Date.new(2017,04,11), 'end_date': Date.new(2017,05,23), 'care_type': 'self', 'employee_id': 9, 'status': 'waiting')
SickLeaveForm.create('start_date': Date.new(2017,04,27), 'end_date': Date.new(2017,05,20), 'care_type': 'child', 'employee_id': 10, 'status': 'rejected')

HomeofficeForm.create('start_date': Date.new(2017,04,15), 'end_date': Date.new(2017,05,29), 'employee_id': 4, 'status': 'waiting')
HomeofficeForm.create('start_date': Date.new(2017,04,17), 'end_date': Date.new(2017,04,19), 'employee_id': 5, 'status': 'waiting')
HomeofficeForm.create('start_date': Date.new(2017,04,20), 'end_date': Date.new(2017,05,10), 'employee_id': 2, 'status': 'accepted')
HomeofficeForm.create('start_date': Date.new(2017,04,25), 'end_date': Date.new(2017,06,01), 'employee_id': 5, 'status': 'waiting')
HomeofficeForm.create('start_date': Date.new(2017,04,10), 'end_date': Date.new(2017,05,25), 'employee_id': 7, 'status': 'rejected')
HomeofficeForm.create('start_date': Date.new(2017,04,13), 'end_date': Date.new(2017,06,10), 'employee_id': 4, 'status': 'waiting')
HomeofficeForm.create('start_date': Date.new(2017,04,17), 'end_date': Date.new(2017,05,16), 'employee_id': 5, 'status': 'waiting')
HomeofficeForm.create('start_date': Date.new(2017,04,19), 'end_date': Date.new(2017,06,02), 'employee_id': 2, 'status': 'accepted')
HomeofficeForm.create('start_date': Date.new(2017,04,23), 'end_date': Date.new(2017,05,07), 'employee_id': 8, 'status': 'waiting')
HomeofficeForm.create('start_date': Date.new(2017,04,13), 'end_date': Date.new(2017,05,04), 'employee_id': 1, 'status': 'waiting')

HolidayForm.create('start_date': Date.new(2017,04,11), 'end_date': Date.new(2017,05,31), 'holiday_type': 'compensation_for_overtime', 'comment': 'vulputate velit eu sem. Pellentesque ut ipsum ac', 'employee_id': 2, 'status': 'waiting')
HolidayForm.create('start_date': Date.new(2017,04,26), 'end_date': Date.new(2017,05,05), 'holiday_type': 'justified_paid_not', 'comment': 'porttitor eros nec tellus. Nunc lectus', 'employee_id': 9, 'status': 'waiting')
HolidayForm.create('start_date': Date.new(2017,04,25), 'end_date': Date.new(2017,05,20), 'holiday_type': 'military', 'comment': 'eu nulla at sem', 'employee_id': 2, 'status': 'rejected')
HolidayForm.create('start_date': Date.new(2017,04,18), 'end_date': Date.new(2017,06,01), 'holiday_type': 'parental', 'comment': 'dictum', 'employee_id': 10, 'status': 'waiting')
HolidayForm.create('start_date': Date.new(2017,04,17), 'end_date': Date.new(2017,05,24), 'holiday_type': 'blood_donation', 'comment': 'libero est, congue a, aliquet vel, vulputate eu, odio.', 'employee_id': 2, 'status': 'waiting')
HolidayForm.create('start_date': Date.new(2017,04,9), 'end_date': Date.new(2017,04,26), 'holiday_type': 'training', 'comment': 'lectus justo eu arcu. Morbi sit amet massa.', 'employee_id': 7, 'status': 'accepted')
HolidayForm.create('start_date': Date.new(2017,04,13), 'end_date': Date.new(2017,04,29), 'holiday_type': 'parental', 'comment': 'tempor erat neque non quam. Pellentesque habitant', 'employee_id': 8, 'status': 'waiting')
HolidayForm.create('start_date': Date.new(2017,04,29), 'end_date': Date.new(2017,06,06), 'holiday_type': 'military', 'comment': 'ac mi eleifend egestas. Sed pharetra, felis eget', 'employee_id': 5, 'status': 'waiting')
HolidayForm.create('start_date': Date.new(2017,04,15), 'end_date': Date.new(2017,06,12), 'holiday_type': 'blood_donation', 'comment': 'quam. Curabitur', 'employee_id': 9, 'status': 'waiting')
HolidayForm.create('start_date': Date.new(2017,04,15), 'end_date': Date.new(2017,06,11), 'holiday_type': 'military', 'comment': 'sit amet luctus vulputate, nisi sem semper erat, in', 'employee_id': 8, 'status': 'waiting')



BusinessTripForm.create('start_date': Date.new(2017,04,25), 'end_date': Date.new(2017,9,11), 'company': 'Nam', 'transport': 'pede', 'employee_id': 1, 'status': 'waiting')
BusinessTripForm.create('start_date': Date.new(2017,04,29), 'end_date': Date.new(2017,9,18), 'company': 'magna', 'transport': 'euismod', 'employee_id': 6, 'status': 'waiting')
BusinessTripForm.create('start_date': Date.new(2017,04,29), 'end_date': Date.new(2017,10,11), 'company': 'Duis volutpat', 'transport': 'arcu', 'employee_id': 1, 'status': 'rejected')
BusinessTripForm.create('start_date': Date.new(2017,04,15), 'end_date': Date.new(2017,9,20), 'company': 'adipiscing elit.', 'transport': 'ipsum.', 'employee_id': 2, 'status': 'waiting')
BusinessTripForm.create('start_date': Date.new(2017,04,10), 'end_date': Date.new(2017,8,26), 'company': 'ornare lectus', 'transport': 'aliquam', 'employee_id': 4, 'status': 'waiting')
BusinessTripForm.create('start_date': Date.new(2017,04,29), 'end_date': Date.new(2017,9,28), 'company': 'interdum. Nunc', 'transport': 'posuere', 'employee_id': 4, 'status': 'accepted')
BusinessTripForm.create('start_date': Date.new(2017,04,22), 'end_date': Date.new(2017,10,01), 'company': 'nec metus', 'transport': 'egestas.', 'employee_id': 6, 'status': 'waiting')
BusinessTripForm.create('start_date': Date.new(2017,04,24), 'end_date': Date.new(2017,10,01), 'company': 'amet nulla.', 'transport': 'tincidunt,', 'employee_id': 10, 'status': 'waiting')
BusinessTripForm.create('start_date': Date.new(2017,04,10), 'end_date': Date.new(2017,10,06), 'company': 'Mauris', 'transport': 'tellus', 'employee_id': 5, 'status': 'waiting')
BusinessTripForm.create('start_date': Date.new(2017,04,10), 'end_date': Date.new(2017,9,17), 'company': 'a', 'transport': 'auctor', 'employee_id': 1, 'status': 'waiting')

Address.create('country': 'Germany', 'city': 'Kerkrade', 'address': '3724 Lectus, Road', 'postcode': '22563', 'employee_id': 1)
Address.create('country': 'Costa Rica', 'city': 'Awka', 'address': '5450 Velit St.', 'postcode': '17951', 'employee_id': 2)
Address.create('country': 'Samoa', 'city': 'Sauris', 'address': 'P.O. Box 859, 6460 Sodales Ave', 'postcode': '71119', 'employee_id': 3)
Address.create('country': 'Liberia', 'city': 'Paisley', 'address': '258-9276 Adipiscing. St.', 'postcode': '09708', 'employee_id': 4)
Address.create('country': 'Saint Pierre and Miquelon', 'city': 'Modena', 'address': 'P.O. Box 868, 8143 Laoreet, Ave', 'postcode': '53247', 'employee_id': 5)
Address.create('country': 'Chile', 'city': 'Salles', 'address': 'P.O. Box 628, 800 Ridiculus Avenue', 'postcode': '9829', 'employee_id': 6)
Address.create('country': 'Canada', 'city': 'Beerzel', 'address': 'Ap #887-6729 Nunc Road', 'postcode': '37-549', 'employee_id': 7)
Address.create('country': 'Saudi Arabia', 'city': 'Campbelltown', 'address': 'P.O. Box 959, 8039 Eu Road', 'postcode': '272778', 'employee_id': 8)
Address.create('country': 'Montenegro', 'city': 'Bhilai', 'address': '2404 Eu Road', 'postcode': '06891', 'employee_id': 9)
Address.create('country': 'Mayotte', 'city': 'Stourbridge', 'address': 'P.O. Box 757, 3694 Sociis St.', 'postcode': '9714', 'employee_id': 10)

JobOffer.create('title': 'Administrator systemu linux', 'user_id': 4, 'is_available': 1)
JobOffer.create('title': 'Java developer', 'user_id': 9, 'is_available': 0)
JobOffer.create('title': 'C++ developer', 'user_id': 3, 'is_available': 1)
JobOffer.create('title': 'Administrator sieciowy', 'user_id': 1, 'is_available': 1)
JobOffer.create('title': 'Kierownik działu IT', 'user_id': 8, 'is_available': 1)
JobOffer.create('title': 'Sprzataczka', 'user_id': 6, 'is_available': 0)
JobOffer.create('title': 'Pracownik dzialu HR', 'user_id': 7, 'is_available': 1)
JobOffer.create('title': 'Praktyki', 'user_id': 3, 'is_available': 0)
JobOffer.create('title': 'C# Junior Developer', 'user_id': 5, 'is_available': 1)
JobOffer.create('title': 'Ktokolwiek', 'user_id': 2, 'is_available': 1)

OffersContent.create('content': 'tellus. Phasellus elit pede, malesuada vel, venenatis vel, faucibus id, libero.', 'job_offer_id': 1)
OffersContent.create('content': 'nec enim. Nunc ut erat. Sed nunc est, mollis non, cursus non, egestas a, dui. Cras pellentesque. Sed dictum. Proin', 'job_offer_id': 2)
OffersContent.create('content': 'eu, odio. Phasellus at augue id ante dictum cursus. Nunc mauris elit, dictum eu, eleifend nec, malesuada ut,', 'job_offer_id': 3)
OffersContent.create('content': 'velit egestas lacinia. Sed congue, elit sed consequat auctor, nunc nulla vulputate dui,', 'job_offer_id': 4)
OffersContent.create('content': 'dignissim pharetra. Nam ac nulla. In tincidunt congue turpis. In condimentum. Donec at arcu. Vestibulum', 'job_offer_id': 5)
OffersContent.create('content': 'sem, consequat nec, mollis vitae, posuere at, velit. Cras lorem', 'job_offer_id': 6)
OffersContent.create('content': 'vitae aliquam eros turpis non enim. Mauris quis turpis vitae', 'job_offer_id': 7)
OffersContent.create('content': 'Duis ac arcu. Nunc mauris. Morbi non sapien molestie orci', 'job_offer_id': 8)
OffersContent.create('content': 'sodales at, velit. Pellentesque ultricies dignissim lacus. Aliquam rutrum lorem ac risus. Morbi metus. Vivamus euismod urna. Nullam lobortis quam', 'job_offer_id': 9)
OffersContent.create('content': 'erat. Vivamus nisi. Mauris nulla. Integer urna. Vivamus molestie dapibus ligula. Aliquam erat volutpat.', 'job_offer_id': 10)

Event.create('title': 'Szkolenie pracownicze z zakresu komunikacji w zespole', 'user_id': 1, 'duedate': DateTime.new(2017, 6, 01), 'spots': 10, 'place': 'Glowny budynek firmy')
Event.create('title': 'Szkolenie dla nowych pracownikow', 'user_id': 8, 'duedate': DateTime.new(2017, 6, 14), 'spots': 20, 'place': 'Budynek firmy')
Event.create('title': 'Impreza integracyjna', 'user_id': 7, 'duedate': DateTime.new(2017, 6, 22), 'spots': 10, 'place': 'Kawiarnia')
Event.create('title': 'Konferencja', 'user_id': 9, 'duedate': DateTime.new(2017, 7, 05), 'spots': 10, 'place': 'Sala konferencyjna')
Event.create('title': 'Jubileusz firmy', 'user_id': 10, 'duedate': DateTime.new(2017, 7, 14), 'spots': 10, 'place': 'Gdzies')
Event.create('title': 'Piknik firmowy', 'user_id': 4, 'duedate': DateTime.new(2017, 8, 23), 'spots': 10, 'place': 'Za miastem')
Event.create('title': 'Paintball integracyjny', 'user_id': 8, 'duedate': DateTime.new(2017, 8, 27), 'spots': 10, 'place': 'Pole do paintballa')
Event.create('title': 'Konferencja', 'user_id': 3, 'duedate': DateTime.new(2017, 9, 11), 'spots': 10, 'place': 'Sala konferencyjna')
Event.create('title': 'Cos sie bedzie dzialo', 'user_id': 1, 'duedate': DateTime.new(2017, 10, 20), 'spots': 10, 'place': 'Nie wiem gdzie')
Event.create('title': 'Tutaj tez cos sie bedzie dzialo', 'user_id': 6, 'duedate': DateTime.new(2017, 11, 15), 'spots': 16, 'place': 'Aucune Idee')

EventsContent.create('content': 'eu sem. Pellentesque ut ipsum ac mi eleifend egestas. Sed pharetra, felis eget varius ultrices,', 'event_id': 1)
EventsContent.create('content': 'torquent per conubia nostra, per inceptos hymenaeos. Mauris ut quam vel sapien imperdiet ornare. In faucibus. Morbi vehicula. Pellentesque', 'event_id': 2)
EventsContent.create('content': 'Aliquam auctor, velit eget laoreet posuere, enim nisl elementum purus, accumsan interdum libero dui nec', 'event_id': 3)
EventsContent.create('content': 'In condimentum. Donec at arcu. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Donec', 'event_id': 4)
EventsContent.create('content': 'adipiscing. Mauris molestie pharetra nibh. Aliquam ornare, libero at auctor ullamcorper, nisl arcu', 'event_id': 5)
EventsContent.create('content': 'a, aliquet vel, vulputate eu, odio. Phasellus at augue id ante dictum cursus. Nunc', 'event_id': 6)
EventsContent.create('content': 'vel, mauris. Integer sem elit, pharetra ut, pharetra sed, hendrerit a, arcu. Sed et libero.', 'event_id': 7)
EventsContent.create('content': 'varius ultrices, mauris ipsum porta elit, a feugiat tellus lorem eu metus. In lorem.', 'event_id': 8)
EventsContent.create('content': 'quis massa. Mauris vestibulum, neque sed dictum eleifend, nunc risus varius orci,', 'event_id': 9)
EventsContent.create('content': 'Quisque purus sapien, gravida non, sollicitudin a, malesuada id, erat. Etiam vestibulum', 'event_id': 10)

EnlistedForEvent.create('event_id': 8, 'employee_id': 7)
EnlistedForEvent.create('event_id': 8, 'employee_id': 4)
EnlistedForEvent.create('event_id': 7, 'employee_id': 6)
EnlistedForEvent.create('event_id': 7, 'employee_id': 1)
EnlistedForEvent.create('event_id': 5, 'employee_id': 4)
EnlistedForEvent.create('event_id': 10, 'employee_id': 3)
EnlistedForEvent.create('event_id': 6, 'employee_id': 4)
EnlistedForEvent.create('event_id': 2, 'employee_id': 4)
EnlistedForEvent.create('event_id': 6, 'employee_id': 5)
EnlistedForEvent.create('event_id': 7, 'employee_id': 7)

Schedule.create('work_date': Date.new(2017,06,01), 'start_hour': '22:03:28', 'end_hour': '04:55:14', 'is_weekend': 1, 'user_id': 4)
Schedule.create('work_date': Date.new(2017,05,28), 'start_hour': '10:10:26', 'end_hour': '17:52:19', 'is_weekend': 0, 'user_id': 4)
Schedule.create('work_date': Date.new(2017,06,21), 'start_hour': '07:16:39', 'end_hour': '05:26:14', 'is_weekend': 0, 'user_id': 3)
Schedule.create('work_date': Date.new(2017,04,12), 'start_hour': '06:25:29', 'end_hour': '11:40:13', 'is_weekend': 1, 'user_id': 5)
Schedule.create('work_date': Date.new(2017,04,24), 'start_hour': '12:59:49', 'end_hour': '15:40:59', 'is_weekend': 1, 'user_id': 5)
Schedule.create('work_date': Date.new(2017,06,23), 'start_hour': '04:42:18', 'end_hour': '21:15:00', 'is_weekend': 0, 'user_id': 4)
Schedule.create('work_date': Date.new(2017,06,20), 'start_hour': '02:09:41', 'end_hour': '20:44:55', 'is_weekend': 0, 'user_id': 1)
Schedule.create('work_date': Date.new(2017,06,18), 'start_hour': '22:39:04', 'end_hour': '00:46:15', 'is_weekend': 0, 'user_id': 10)
Schedule.create('work_date': Date.new(2017,06,04), 'start_hour': '15:41:21', 'end_hour': '10:40:20', 'is_weekend': 1, 'user_id': 2)
Schedule.create('work_date': Date.new(2017,04,12), 'start_hour': '16:28:51', 'end_hour': '08:59:27', 'is_weekend': 1, 'user_id': 6)
