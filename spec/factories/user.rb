FactoryBot.define do    
    factory :user, class: User do    
        email { "trjfjfyj@hotmail.it"}
        password {"antonio"}
        role {0}
        full_name {"antonio"}
        favorite_category {"Elettronica"}
    end

    factory :usera, class: User do    
        email { "propro@hotmail.it"}
        password {"antonio"}
        role {0}
        full_name {"antonio"}
        favorite_category {"Elettronica"}
    end


    factory :userb, class: User do    
        email { "blabla@hotmail.it"}
        password {"antonio"}
        role {0}
        full_name {"antonio"}
        favorite_category {"Elettronica"}
    end

    factory :userc, class: User do    
        email { "blabla@hotmail.it"}
        password {"antonio"}
        role {0}
        full_name {"antonio"}
        favorite_category {""}
    end
end

  