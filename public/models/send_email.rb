 
require 'sendgrid-ruby'
include SendGrid
require 'json'

  def send_email
    from = SendGrid::Email.new(email: 'jakep629@gmail.com')
    to = SendGrid::Email.new(email: 'emilyspencer89@hotmail.co.uk')
    subject = 'Sending with SendGrid is Fun'
  
    content = SendGrid::Content.new(type: 'text/plain', value: 'testing' )
    mail = SendGrid::Mail.new(from, subject, to, content)
  
    sg = SendGrid::API.new(api_key: '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')
    response = sg.client.mail._('send').post(request_body: mail.to_json)
    puts response.status_code
    puts response.body
    puts response.headers
  end

  send_email