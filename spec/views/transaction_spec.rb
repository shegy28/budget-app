require 'rails_helper'

RSpec.describe 'Transactions page', type: :feature do
  before :each do
    @user = User.create(
      id: 1,
      name: 'John',
      email: 'john@example.com',
      password: 'password'
    )

    visit new_user_session_path

    fill_in 'Email', with: @user.email
    fill_in 'Password', with: @user.password
    click_button 'Log in'

    @category = Group.new(name: 'Food', icon: 'nil', author: @user)
    @category.save

    @groceries = Group.create(name: 'Groceries',
                              icon: 'https://www.pngmart.com/files/11/Shopping-Bag-PNG-Free-Download.png', author: @user)

    @transaction = Expense.new(name: 'Food', amount: 100, author_id: @user.id)
    @transaction.groups << @groceries
    @transaction.save


    visit new_user_expense_path(@category.author)
  end

  it 'should display the transactions page' do
    expect(page).to have_selector('div', text: 'NEW TRANSACTION')
  end

  it 'should display add new transaction button' do
    expect(page).to have_link('Back')
  end

  it 'should save the transaction' do
    fill_in 'Name', with: 'Food'
    fill_in 'Amount', with: 100
    select 'Groceries', from: 'expense_group_ids'
    click_button 'Save'
    expect(page).to have_selector('p', text: 'Most recent')
  end
end
