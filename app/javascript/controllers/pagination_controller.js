import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["container"]

  load(event) {
    event.preventDefault()

    fetch(event.currentTarget.href, {
      headers: {
        Accept: "text/vnd.turbo-stream.html"
      }
    })
      .then(response => response.text())
      .then(html => {
        this.containerTarget.innerHTML = html
        window.scrollTo({ top: this.containerTarget.offsetTop, behavior: 'smooth' })
      })
  }
}
