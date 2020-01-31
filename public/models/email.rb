require 'sendgrid-ruby'
include SendGrid
require 'json'
require_relative 'db_connect'

class Email 

attr_reader :id, :from, :to, :subject, :content, :bid

def initialize(id:, from:, to:, subject:, content:, bid:)
  @id = id,
  @from = from,
  @to = to,
  @subject = subject,
  @content = content,
  @bid = bid
end 

def make_booking
  email_from = SendGrid::Email.new(email: 'emilyspencer89@hotmail.co.uk')
  subject = 'Hello World from the Twilio SendGrid Ruby Library'
  email_to = SendGrid::Email.new(email: 'imraan91@hotmail.co.uk')
  content = SendGrid::Content.new(type: 'text/plain', value: 'Sending test email')
  mail = SendGrid::Mail.new(email_from, subject, email_to, content)
  # puts JSON.pretty_generate(mail.to_json)
  puts mail.to_json

  sg = SendGrid::API.new(api_key: ENV['SENDGRID_API_KEY'], host: 'https://api.sendgrid.com')
  response = sg.client.mail._('send').post(request_body: mail.to_json)
  puts response.status_code
  puts response.body
  puts response.headers
end

def confirm_booking
  email_from = Email.new(email: 'emilyspencer89@hotmail.co.uk')
  subject = 'Booking Confimation Number:'
  email_to = Email.new(email: 'imraan91@hotmail.co.uk')
  content = Content.new(type: 'text/plain', value: 'Congratulations. Your booking has been confirmed')
  mail = SendGrid::Mail.new(email_from, subject, email_to, content)
  # puts JSON.pretty_generate(mail.to_json)
  puts mail.to_json

  sg = SendGrid::API.new(api_key: ENV['SENDGRID_API_KEY'], host: 'https://api.sendgrid.com')
  response = sg.client.mail._('send').post(request_body: mail.to_json)
  puts response.status_code
  puts response.body
  puts response.headers
end

end
