export function removeFlash() {
  document.onload = setTimeout(() => document.querySelector('.alert').remove(), 5000);
}