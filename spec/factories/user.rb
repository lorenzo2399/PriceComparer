FactoryBot.define do    
    factory :user, class: User do    
        email { "the_best_fighter@hotmail.it"}
        password {"antonio"}
        role {0}
    end
end

  