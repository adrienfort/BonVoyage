import { Controller } from "stimulus";

export default class extends Controller {
  // static targets = [ 'dashboard_dashboard', 'dashboard_works', 'dashboard_navbar_dashboard', 'dashboard_navbar_works' ];

  connect() {
    console.log("Connected !")
  }

  // dashboard_change(event) {
  //   if (event.currentTarget.id === "dashboard-navbar-dashboard") {
  //     this.dashboard_dashboardTarget.classList.remove("display-none")
  //     this.dashboard_worksTarget.classList.add("display-none")
  //     this.dashboard_navbar_dashboardTarget.classList.add("dashboard-navbar-border")
  //     this.dashboard_navbar_worksTarget.classList.remove("dashboard-navbar-border")
  //   } else {
  //     this.dashboard_worksTarget.classList.remove("display-none")
  //     this.dashboard_dashboardTarget.classList.add("display-none")
  //     this.dashboard_navbar_dashboardTarget.classList.remove("dashboard-navbar-border")
  //     this.dashboard_navbar_worksTarget.classList.add("dashboard-navbar-border")
  //   }
  // }
}
