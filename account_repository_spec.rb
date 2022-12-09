require 'account'
require 'account_repository'

def reset_accounts_table
    seed_sql = File.read('spec/accounts_seeds.sql')
    connection = PG.connect({ host: '127.0.0.1', dbname: 'makersbnb_test' })
    connection.exec(seed_sql)
  end

describe AccountRepository do
  before(:each) do 
    reset_accounts_table
  end

  context 'testing all method' do
    it 'returns all users' do
      user = AccountRepository.new
      repo = user.all
      expect(repo[0].email_address).to eq 'user1@email.com'
      expect(repo[1].email_address).to eq 'user2@email.com'
    end

    it 'creates a new user' do
      user = Account.new
      user.id = 3
      user.email_address = 'email@email.com'
      user.password = 'password'

      accounts = AccountRepository.new
      expect(accounts.create(user)).to eq 'User created'
      expect(accounts.all[2].email_address).to include 'email@email.com'
      expect(accounts.all[2].password).to include 'password'

      reset_accounts_table
    end
  end

  context 'checking if user exists' do
    it 'checks if email address is already used' do
      repo = AccountRepository.new
      
      users = repo.user_exists?('user1@email.com')

      expect(users).to eq true
    end
  end
end