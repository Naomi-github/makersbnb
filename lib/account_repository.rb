require_relative 'account'

class AccountRepository
    #def initialize
        #@email = []
        #users = [] 
    #end
    
    def all
        
            # Send the SQL query and get the result set.
            sql_query = 'SELECT email_address, password FROM accounts;'
            all_users = DatabaseConnection.exec_params(sql_query, [])
            
            users = []
            # The result set is an array of hashes.
            # Loop through it to create a model
            # object for each record hash.
            all_users.each do |eachuser|
        
              # Create a new model object
              # with the record data.
              user = Account.new
              user.email_address = eachuser['email_address']
              user.password = eachuser['password']
        
              users << user
            end
        
            return users
        end
          
    def user_exists?(email)
        # find(email_address)
        # if true
        #     return erb(:existing_user)
        # end
        sql_query = 'SELECT * FROM accounts WHERE email_address = $1;'
        result = DatabaseConnection.exec_params(sql_query, [email])
    
        if result.ntuples > 0 
            return true
        else
            return false
        end
    end

    def create(users)
        sql_query = 'INSERT INTO accounts (id, email_address, password) VALUES ($1, $2, $3);'
        param = [users.id, users.email_address, users.password]
        DatabaseConnection.exec_params(sql_query, param)

        return 'User created'
    end
end