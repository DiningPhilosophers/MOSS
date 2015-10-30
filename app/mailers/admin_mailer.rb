class AdminMailer < ApplicationMailer
  def account_activation(admin)
    @admin = admin
    mail to: admin.user_name, subject: "Account activation"
  end

  def password_reset(admin)
    @admin = admin
    mail to: admin.user_name, subject: "Password reset"
  end
end