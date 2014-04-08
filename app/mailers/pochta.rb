class Pochta < ActionMailer::Base
  default from: "from@example.com"


  def volunteer(m)
    @mail = m
    @url  = 'ura'
    mail(to: Gsetting.contact_emails.split(/\s+/), subject: 'volunteer')
  end

  def callback(m)
    @mail = m
    @url  = 'ura'
    mail(to: Gsetting.contact_emails.split(/\s+/), subject: 'callback')
  end

end
