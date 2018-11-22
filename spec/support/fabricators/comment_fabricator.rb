Fabricator(:comment) do
  text { FFaker::BaconIpsum.paragraphs }
  user_id { Fabricate(:user).id }
  # user
  story_id { Fabricate(:story).id }
  # story

  # # user_id { Fabricate(:user).id }
  # user { Fabricate(:user) }
  # user { Fabricate.create(:user) }
  # # story_id { Fabricate(:story).id }
  # story { Fabricate(:story) }
end
