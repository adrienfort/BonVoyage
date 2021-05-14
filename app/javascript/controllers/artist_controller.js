import { Controller } from "stimulus";

export default class extends Controller {
  static targets = [
    'dashboard_dashboard',
    'dashboard_works',
    'dashboard_navbar_dashboard',
    'dashboard_navbar_works',
    'artist_show_navbar_musics',
    'artist_show_navbar_albums',
    'artist_show_navbar_album',
    'artist_show_musics',
    'artist_show_albums',
    'artist_show_album'
  ];

  dashboard_change(event) {
    if (event.currentTarget.id === "dashboard-navbar-dashboard") {
      this.dashboard_dashboardTarget.classList.remove("display-none")
      this.dashboard_worksTarget.classList.add("display-none")
      this.dashboard_navbar_dashboardTarget.classList.add("dashboard-navbar-border")
      this.dashboard_navbar_worksTarget.classList.remove("dashboard-navbar-border")
    } else {
      this.dashboard_worksTarget.classList.remove("display-none")
      this.dashboard_dashboardTarget.classList.add("display-none")
      this.dashboard_navbar_dashboardTarget.classList.remove("dashboard-navbar-border")
      this.dashboard_navbar_worksTarget.classList.add("dashboard-navbar-border")
    }
  }

  artist_show_change(event) {
    if (event.currentTarget.id === "artist-show-navbar-musics") {
      this.artist_show_navbar_musicsTarget.classList.add("dashboard-navbar-border")
      this.artist_show_navbar_albumsTarget.classList.remove("dashboard-navbar-border")
      this.artist_show_navbar_albumTarget.classList.remove("dashboard-navbar-border")
      this.artist_show_musicsTarget.classList.remove("display-none")
      this.artist_show_albumsTarget.classList.add("display-none")
      this.artist_show_albumTarget.classList.add("display-none")
    } else if (event.currentTarget.id === "artist-show-navbar-albums") {
      this.artist_show_navbar_musicsTarget.classList.remove("dashboard-navbar-border")
      this.artist_show_navbar_albumsTarget.classList.add("dashboard-navbar-border")
      this.artist_show_navbar_albumTarget.classList.remove("dashboard-navbar-border")
      this.artist_show_musicsTarget.classList.add("display-none")
      this.artist_show_albumsTarget.classList.remove("display-none")
      this.artist_show_albumTarget.classList.add("display-none")
    } else if (event.currentTarget.id === "artist-show-navbar-album") {
      this.artist_show_navbar_musicsTarget.classList.remove("dashboard-navbar-border")
      this.artist_show_navbar_albumsTarget.classList.remove("dashboard-navbar-border")
      this.artist_show_navbar_albumTarget.classList.add("dashboard-navbar-border")
      this.artist_show_musicsTarget.classList.add("display-none")
      this.artist_show_albumsTarget.classList.add("display-none")
      this.artist_show_albumTarget.classList.remove("display-none")
    }
  }
}
