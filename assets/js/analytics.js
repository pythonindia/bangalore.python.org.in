// Google Analytics bootstrap, kept out of inline <script> so the
// Content-Security-Policy does not need 'unsafe-inline'.
window.dataLayer = window.dataLayer || [];
function gtag() { window.dataLayer.push(arguments); }
gtag('js', new Date());
gtag('config', document.currentScript.dataset.gaId);
