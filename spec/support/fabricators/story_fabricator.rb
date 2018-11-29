Fabricator(:story) do
  text { FFaker::BaconIpsum.paragraph }
  user_id { Fabricate(:user).id }
end
