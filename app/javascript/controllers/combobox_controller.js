import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="combobox"
export default class extends Controller {
  static targets = ["input", "list", "item"];

  connect() {
    this.listTarget.hidden = true;
    this.inputTarget.addEventListener("input", () => this.filter());
    this.inputTarget.addEventListener("focus", () => this.showAll());
    this.itemTargets.forEach(item => {
      item.addEventListener("click", (event) => this.select(event));
    });
  }

  filter() {
    const query = this.inputTarget.value.toLowerCase();
    this.listTarget.hidden = query === "";

    this.itemTargets.forEach(item => {
      const text = item.textContent.toLowerCase();
      item.hidden = !text.includes(query);
    });
  }

  showAll() {
    this.listTarget.hidden = false;
    this.itemTargets.forEach(item => item.hidden = false);
  }

  select(event) {
    this.inputTarget.value = event.target.textContent;
    this.listTarget.hidden = true;
  }
}
