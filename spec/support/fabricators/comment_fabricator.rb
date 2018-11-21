Fabricator(:comment) do
  text { FFaker::BaconIpsum.paragraphs }
  user_id { Fabricate(:user).id }
  # user
  story_id { Fabricate(:story).id }
end
