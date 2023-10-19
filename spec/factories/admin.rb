
FactoryBot.define do    
factory :admin, class:User do
    email {"mattia.ponza@hotmail.it"}
    password {"mattia"}
    role {1}
end
end