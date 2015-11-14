# Preview all emails at http://localhost:3000/rails/mailers/admin_mailer
class AdminMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/admin_mailer/account_activation
  def account_activation
    AdminMailer.account_activation
  end

  # Preview this email at http://localhost:3000/rails/mailers/admin_mailer/password_reset
  def password_reset
    AdminMailer.password_reset
  end

end
