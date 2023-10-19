FactoryBot.define do
factory :review do   
    user_id {1} 
    title {"Harry Potter and the Philosopher's Stone"}
    rating {4}
    comment {"bello"}
end
factory :reviewa , class: Review do
    user_id {2} 
    title {"Harry Potter and the Philosopher's Stone"}
    rating {4}
    comment {"bello"}
end
end