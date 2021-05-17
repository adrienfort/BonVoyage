import { Controller } from "stimulus";

export default class extends Controller {
  static targets = [
    'dashboard_navbar_explore',
    'dashboard_navbar_artists',
    'dashboard_navbar_albums',
    'dashboard_navbar_playlists',
    'dashboard_explore',
    'dashboard_artists',
    'dashboard_albums',
    'dashboard_playlists',
    'rakings_navbar_artists',
    'rakings_navbar_albums',
    'rakings_navbar_musics',
    'rakings_artists',
    'rakings_albums',
    'rakings_musics'
  ];

  dashboard_change(event) {
    if (event.currentTarget.id === "dashboard-navbar-explore") {
      this.dashboard_artistsTarget.classList.add("display-none")
      this.dashboard_albumsTarget.classList.add("display-none")
      this.dashboard_playlistsTarget.classList.add("display-none")
      this.dashboard_exploreTarget.classList.remove("display-none")
      document.querySelector(".dashboard-navbar-border").classList.remove("dashboard-navbar-border")
      this.dashboard_navbar_exploreTarget.classList.add("dashboard-navbar-border")
    } else if (event.currentTarget.id === "dashboard-navbar-artists") {
      this.dashboard_exploreTarget.classList.add("display-none")
      this.dashboard_albumsTarget.classList.add("display-none")
      this.dashboard_playlistsTarget.classList.add("display-none")
      this.dashboard_artistsTarget.classList.remove("display-none")
      document.querySelector(".dashboard-navbar-border").classList.remove("dashboard-navbar-border")
      this.dashboard_navbar_artistsTarget.classList.add("dashboard-navbar-border")
    } else if (event.currentTarget.id === "dashboard-navbar-albums") {
      this.dashboard_exploreTarget.classList.add("display-none")
      this.dashboard_artistsTarget.classList.add("display-none")
      this.dashboard_playlistsTarget.classList.add("display-none")
      this.dashboard_albumsTarget.classList.remove("display-none")
      document.querySelector(".dashboard-navbar-border").classList.remove("dashboard-navbar-border")
      this.dashboard_navbar_albumsTarget.classList.add("dashboard-navbar-border")
    } else if (event.currentTarget.id === "dashboard-navbar-playlists") {
      this.dashboard_exploreTarget.classList.add("display-none")
      this.dashboard_artistsTarget.classList.add("display-none")
      this.dashboard_albumsTarget.classList.add("display-none")
      this.dashboard_playlistsTarget.classList.remove("display-none")
      document.querySelector(".dashboard-navbar-border").classList.remove("dashboard-navbar-border")
      this.dashboard_navbar_playlistsTarget.classList.add("dashboard-navbar-border")
    }
  }

  rakings_change(event) {
    if (event.currentTarget.id === "rakings-navbar-artists") {
      document.querySelector(".dashboard-navbar-border").classList.remove("dashboard-navbar-border")
      this.rakings_navbar_artistsTarget.classList.add("dashboard-navbar-border")
      this.rakings_artistsTarget.classList.remove("display-none")
      this.rakings_albumsTarget.classList.add("display-none")
      this.rakings_musicsTarget.classList.add("display-none")
    } else if (event.currentTarget.id === "rakings-navbar-albums") {
      document.querySelector(".dashboard-navbar-border").classList.remove("dashboard-navbar-border")
      this.rakings_navbar_albumsTarget.classList.add("dashboard-navbar-border")
      this.rakings_artistsTarget.classList.add("display-none")
      this.rakings_albumsTarget.classList.remove("display-none")
      this.rakings_musicsTarget.classList.add("display-none")
    } else if (event.currentTarget.id === "rakings-navbar-musics") {
      document.querySelector(".dashboard-navbar-border").classList.remove("dashboard-navbar-border")
      this.rakings_navbar_musicsTarget.classList.add("dashboard-navbar-border")
      this.rakings_artistsTarget.classList.add("display-none")
      this.rakings_albumsTarget.classList.add("display-none")
      this.rakings_musicsTarget.classList.remove("display-none")
    }
  }
}
