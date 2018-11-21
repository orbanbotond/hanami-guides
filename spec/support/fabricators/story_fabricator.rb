Fabricator(:story) do
  text { FFaker::BaconIpsum.paragraphs }
  user_id { Fabricate(:user).id }
end
