import { Controller } from "stimulus";

export default class extends Controller {
  static targets = [ 'new_musics' ];

  add_music() {
    const nb = this.new_musicsTarget.querySelectorAll(".new-album-music").length;
    const html = `<div class='new-album-music'>\
                    <h5>Music ${nb + 1}</h5>\
                    <div class='form-group string required album_musics_name'>\
                      <label class='string required' for='album_musics_attributes_${nb}_name'>\
                        Name <abbr title='required'>*</abbr>\
                      </label>\
                      <input class='form-control string required' type='text' name='album[musics_attributes][${nb}][name]' id='album_musics_attributes_${nb}_name'>\
                    </div>\
                    <div class='form-group file optional album_musics_audio_file'>\
                      <label class='file optional' for='album_musics_attributes_${nb}_audio_file'>\
                        Audio file\
                      </label>\
                      <input class='form-control-file file optional' type='file' name='album[musics_attributes][${nb}][audio_file]' id='album_musics_attributes_${nb}_audio_file'>\
                    </div>\
                  </div>`;
    this.new_musicsTarget.insertAdjacentHTML("beforeend", html);
  }
}
