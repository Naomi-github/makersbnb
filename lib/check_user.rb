class CheckUser
    def correctlogin(email_address, password)
        if find(email_address) && find(password)  == true
            return erb(:viewlistings)
        end
    end
end