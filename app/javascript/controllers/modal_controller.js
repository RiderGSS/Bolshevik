
import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
      hideModal(event) {
      this.element.parentElement.removeAttribute("src")
        this.element.remove();
        console.log("Hello!")
    }
    submitEnd(e) {
        console.log("Hello!",e)
        if (e.detail.success) {
            this.hideModal()
        }
    }
}