import { Controller } from "stimulus";
import { fetchWithToken } from "../utils/fetch_with_token";

export default class extends Controller {

  play_music(event) {
    const music = event.target.dataset.music_id
    fetchWithToken(`/musics/${music}/plays`, {
      method: "POST",
      headers: {
        "Accept": "application/json",
        "Content-Type": "application/json"
      },
      body: JSON.stringify({ play: { music_id: music }})
    })
    .then(response => {
      response.json()
    })
    .then((data) => {
      console.log(data)
    });
  }
}
