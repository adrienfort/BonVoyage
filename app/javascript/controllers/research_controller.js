import { Controller } from "stimulus";
const algoliasearch = require('algoliasearch');

export default class extends Controller {
  static targets = [ 'research_params', 'select', 'results' ];

  search(event) {
    const appId = this.research_paramsTarget.dataset.app_id
    const appKey = this.research_paramsTarget.dataset.app_key
    const toFind = this.selectTarget.value
    const explorerId = this.research_paramsTarget.explorer_id
    const results = this.resultsTarget
    var client = algoliasearch(appId, appKey);
    var index = client.initIndex(toFind);

    index.search(event.target.value, { hitsPerPage: 10, page: 0 })
      .then(function searchDone(content) {
        results.innerHTML = ""
        content.hits.forEach(function displayResults(element) {
          var html = ""

          if (toFind == "Artist") {
            html = `<a href="/explorers/${explorerId}/artists/${element.objectID}">${element.name}</a>`
          } else if (toFind == "Album") {
            html = `album -> ${element.name}`
            // html = `<a href="/explorers/${explorerId}/artists/${??}/albums/${element.objectID}">${element.name}</a>`
          } else {
            html = `music -> ${element.name}`
          }
          results.insertAdjacentHTML("beforeend", `<div class="m-1">${html}</div>`)
        })
      })
      .catch(function searchFailure(err) {
        console.error(err);
      });
  }
}
