# Read about factories at https://github.com/thoughtbot/factory_girl
require "faker"
FactoryGirl.define do
  factory :band do
    name "Opeth"
    image "http://userserve-ak.last.fm/serve/500/58121627/Opeth.png"
  end

  factory :invalid_band, parent: :band do
    name nil
    image "http://userserve-ak.last.fm/serve/500/58121627/Opeth.png"
  end

  factory :random_band, parent: :band do
    name 
    image "http://userserve-ak.last.fm/serve/500/58121627/Opeth.png"
  end
end
