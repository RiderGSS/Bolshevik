import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="check"
export default class extends Controller {
    static targets = ["check"];
    greet() {
        console.log("Hello, Stimulus!")}
    toggleCheck() {
        this.checkTarget.classList.toggle("hidden")
        console.log("Hello, Stimulus!", this.element)
    }
}