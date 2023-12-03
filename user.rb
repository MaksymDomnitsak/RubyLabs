# frozen_string_literal: true
require 'pony'

class User
  attr_accessor :login, :password

  def initialize(login, password)
    @login = login
    @password = password
  end

  def send_email(subject, body, attachment)
    Pony.mail(
        to: 'o.matviy@chnu.edu.ua',
        subject: subject,
        body: body,
        attachments: { File.basename(attachment) => File.read(attachment) },
        via: :smtp,
        via_options: {
          address: 'smtp.gmail.com',
          port: '587',
          user_name: @login,
          password: @password,
          authentication: :plain,
          enable_starttls_auto: true
        }
      )
  end
end
