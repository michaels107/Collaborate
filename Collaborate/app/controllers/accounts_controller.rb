# Created 7/26/2020 by Duytan Tran
# Controller for the devise account registration
class AccountsController < ApplicationController
  # Created 7/26/2020 by Duytan Tran
  # Prepares new account page with instance
  def new
    @account = Account.new
  end

  # Created 7/26/2020 by Duytan Tran
  # Updates the accounts and corresponding students/professors table w/ new insert
  def create
    params.permit!
    para = params[:account]
    @account = Account.new(email: para[:email], password: para[:password])
    if @account.save
      associated = if params[:role] == 'student'
                     Student.new(account_id: Account.order('created_at').last.id, f_name: para[:f_name],
                                 l_name: para[:l_name], dot_name: para[:dot_name].downcase, rating: 'A')
                   else
                     Professor.new(account_id: Account.order('created_at').last.id, f_name: para[:f_name],
                                   l_name: para[:l_name])
                   end
      if associated.valid?
        associated.save
        redirect_to :authenticated_root
      else
        @account.delete
      end
    end
  end
end
