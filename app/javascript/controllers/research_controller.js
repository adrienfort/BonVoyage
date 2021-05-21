import { Controller } from "stimulus";
const algoliasearch = require('algoliasearch');

export default class extends Controller {
  static targets = [ 'research_params', 'select', 'results' ];

  search(event) {
    const appId = this.research_paramsTarget.dataset.app_id
    const appKey = this.research_paramsTarget.dataset.app_key
    const toFind = this.selectTarget.value
    const explorerId = this.research_paramsTarget.dataset.explorer_id
    const results = this.resultsTarget
    var client = algoliasearch(appId, appKey);
    var index = client.initIndex(toFind);


    index.search(event.target.value, { hitsPerPage: 10, page: 0 })
      .then(function searchDone(content) {
        results.innerHTML = ""
        content.hits.forEach(function displayResults(element) {
          var html = ""

          if (toFind == "Artist") {
            html = `<div class="rect-card-sm">
                      <h6>${element.name}</h6>
                      <a class="rect-card-main-btn" href="/explorers/${explorerId}/artists/${element.objectID}"></a>
                    </div>`
          } else if (toFind == "Album") {
            html = `<div class="rect-card-sm"><h6>${element.name}</h6></div>`
          } else {
            html = `<div class="rect-card-sm"><h6>${element.name}</h6></div>`
          }
          results.insertAdjacentHTML("beforeend", `${html}`)
        })
      })
      .catch(function searchFailure(err) {
        console.error(err);
      });
  }
}
