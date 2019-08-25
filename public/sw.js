// CODELAB: Update cache names any time any of the cached files change.
var CACHE_NAME = 'my-site-cache-v1';
const FILES_TO_CACHE = [
  '/offline.html',
];

self.addEventListener('install', function(event) {
  // Perform install steps
  event.waitUntil(
    caches.open(CACHE_NAME)
      .then(function(cache) {
        console.log('Opened cache');
        return cache.addAll(FILES_TO_CACHE);
      })
  );
});

self.addEventListener('fetch', function(event) {
  // console.log('done!');
});
