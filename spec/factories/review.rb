FactoryBot.define do
factory :review, class: Review do   
    negozio {"ebay"}
    item_id {556}
    title {"Harry Potter and the Philosopher's Stone"}
    rating {4}
    comment {"bello"}
    user_id {1}
end


factory :reviewa , class: Review do
    negozio {"DUmmy"}
    title {"Harry Potter and the Philosopher's Stone"}
    rating {4}
    item_id {558}
    comment {"bello"}
    user
end

factory :rew, class: Review do
    title {'Sample Review Title'}
    rating {5}
    comment {"This is a sample review comment"}
    item_id {12345}
    negozio {"Example Store"}
    user_id {6}
end
end