require_relative '../../public/models/user'
ENV['RACK_ENV'] = 'test'

User.create(name: 'John Wick', email: 'john@wick.com', password: 'dog', phone: '666')
User.create(name: 'Neo', email: 'neo@one.com', password: 'trinity', phone: '999')

john = User.login('john@wick.com', 'dog')
neo = User.login('neo@one.com', 'trinity')

p john.uid
p neo.uid

# john.new_listing(address: '10 knightsbridge', post_code: 'SW1X 90', photo: 'imageshack.com/knightsbridge')
# neo.new_listing(address: '10 sloane square', post_code: 'SW1X 55', photo: 'imageshack.com/sloane_square')

# john.message(receiver_uid: neo.uid, content: 'You killed my dog')
# neo.message(receiver_uid: john.uid, content: 'I believe')

# john.new_booking_request(pid: '5973', check_in: '05/16/2020', check_out: '05/26/2020')
# neo.accept_booking_request(bid: 2)
# p Conversation.return(u1_id: john.uid, u2_id: neo.uid).cid