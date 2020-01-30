require_relative '../../public/models/user'
ENV['RACK_ENV'] = 'test'

User.create(name: 'John Wick', email: 'john@wick.com', password: 'dog', phone: '666')
User.create(name: 'Neo', email: 'neo@one.com', password: 'trinity', phone: '999')

john = User.login('john@wick.com', 'dog')
neo = User.login('neo@one.com', 'trinity')

p john.uid
p neo.uid


john.message(receiver_uid: neo.uid, content: 'You killed my dog')
neo.message(receiver_uid: john.uid, content: 'I believe')

p Conversation.return(u1_id: john.uid, u2_id: neo.uid).cid