require 'test_helper'

class FanMusicTest < ActiveSupport::TestCase

  # ---------------------------------- CREATION ---------------------------------

  test "verify FanMusic creation and validations" do
    fan = FanMusic.new()
    music = musics(:music_1_1_1)
    explorer = explorers(:explorer_1)

    assert_not fan.valid?, "Valid FanMusic without music and explorer"
    fan.music = music
    assert_not fan.valid?, "Valid FanMusic without explorer"
    fan.explorer = explorer
    assert fan.valid?, "Unable to valid FanMusic with right params"
  end

  # ----------------------------------- ACCESS ----------------------------------

  test "verify FanMusic access to explorer and music" do
    fan = fan_musics(:fan_music_1_1_1_1)
    music_name = musics(:music_1_1_1).name
    explorer_nickname = explorers(:explorer_1).nickname

    assert_equal fan.music.name, music_name, "Unable to access FanMusic music"
    assert_equal fan.explorer.nickname, explorer_nickname, "Unable to access FanMusic explorer"
  end

  # --------------------------------- DESTROY ----------------------------------

  test "verify FanMusic doesn't destroy explorer or music when destroy" do
    nb_musics = Music.count
    nb_explorers = Explorer.count
    fan = fan_musics(:fan_music_1_1_1_1)

    fan.destroy
    assert_equal Music.count, nb_musics, "FanMusic destroy music when destroy"
    assert_equal Explorer.count, nb_explorers, "FanMusic destroy explorer when destroy"
  end

end
