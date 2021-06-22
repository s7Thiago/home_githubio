'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';
const RESOURCES = {
  "assets/AssetManifest.json": "162f343a92f10e599c2720cc2e54de02",
"assets/assets/documents/resume.png": "2e3753cb4a5d25c9676cd1b5349ef552",
"assets/assets/documents/resume.svg": "a18f7ae05603e05d04b544c4ba9b036e",
"assets/assets/documents/resume_ai.svg": "db70eb29f39e29593906c17b0be21e37",
"assets/assets/documents/resume_linked/resume.svg": "3c0874c89c42a8ec4b901d417203d9b0",
"assets/assets/images/cursos/ifb.png": "02ada713259d0697fc412410a6f9919b",
"assets/assets/images/cursos/rocketseat.png": "95a902eead062d66f95c0c460ce7cf98",
"assets/assets/images/cursos/udemy.png": "60d799b5c3355ae25a5dce1f9a3f3e7c",
"assets/assets/images/profile-photo-front-art-thiago.png": "531f9412ec2a20e8675b23140cb07253",
"assets/assets/images/qr-code-contact-square.png": "d57047fbdbc134e1eb2d095d1d57a010",
"assets/assets/images/qr-code-contact.png": "6d9a067479723f85214a4080baea743c",
"assets/assets/images/skills/android.png": "0b832fe5beaf2b024915cfed2caf1f75",
"assets/assets/images/skills/aqueduct.png": "3a984f314d4c75ffeab982e3557868fb",
"assets/assets/images/skills/dart.png": "870f2dda793e5deee671e3cca5b8624b",
"assets/assets/images/skills/figma.png": "5db608827fdd08c9792f001088854083",
"assets/assets/images/skills/firebase.png": "d474698ad56d45bcd7421a6d92ef5273",
"assets/assets/images/skills/flutter.png": "9dfa4e8cb56ffe61ca0cbd56f4693ef5",
"assets/assets/images/skills/git.png": "8202102839a0de553f33f535414ef5c1",
"assets/assets/images/skills/illustrator.png": "922796bdd1e38eb0cb3bb3af0be2c585",
"assets/assets/images/skills/java.png": "eacf0510901d6115068738dd9e93fc65",
"assets/assets/images/skills/js.png": "7bd8b2587acdbb0fb93a366727869e9f",
"assets/assets/images/skills/linux.png": "60f9abf82121999fdef885e16d6427f5",
"assets/assets/images/skills/node.png": "cc10b2134da7a1521a8719e87f73927a",
"assets/assets/images/skills/react.png": "f9da231c1eccb05a5eaf397987a07d70",
"assets/assets/images/skills/springboot.png": "228063ef2fe1c0b22137d5a43331f0bc",
"assets/assets/images/skills/sql.png": "7a9f8496687c5745902b0d12058f5a12",
"assets/assets/images/skills/xd.png": "a08bb8f6cd5c5ccdc48c50fbdb627058",
"assets/assets/images/trajetoria/brasa.png": "08352127f720fa8fbc1e8da241d5ff8b",
"assets/assets/images/trajetoria/cassi.png": "fb878f0950778e49f31825d95fb0520c",
"assets/assets/images/trajetoria/gr1d.png": "90409beaf722b2acb2fcda3b6f661bdd",
"assets/assets/images/trajetoria/ieee.png": "ba7fff45f7c658b2cfeb506269421495",
"assets/assets/images/trajetoria/ieee_cs.png": "a187f40db64c309508572d4812d973f6",
"assets/assets/images/trajetoria/ieee_ifb_cs.png": "a06bac3453b318ce60de913a52194031",
"assets/assets/images/trajetoria/Imagem%25206.png": "60d799b5c3355ae25a5dce1f9a3f3e7c",
"assets/assets/images/trajetoria/nt_virtual.png": "78abf0ada1a2a9b66e7a442ebe9cee79",
"assets/assets/images/trajetoria/nubank_old.png": "11ac13b073796168386bb2c925ffc06a",
"assets/assets/images/trajetoria/shawee.png": "c6dafecef377eeeafaf5e80821bc11ea",
"assets/FontManifest.json": "dc3d03800ccca4601324923c0b1d6d57",
"assets/fonts/MaterialIcons-Regular.otf": "4e6447691c9509f7acdbf8a931a85ca1",
"assets/NOTICES": "bead33849d920a976928b47ea1940478",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "6d342eb68f170c97609e9da345464e5e",
"assets/packages/flutter_math_fork/lib/katex_fonts/fonts/KaTeX_AMS-Regular.ttf": "657a5353a553777e270827bd1630e467",
"assets/packages/flutter_math_fork/lib/katex_fonts/fonts/KaTeX_Caligraphic-Bold.ttf": "a9c8e437146ef63fcd6fae7cf65ca859",
"assets/packages/flutter_math_fork/lib/katex_fonts/fonts/KaTeX_Caligraphic-Regular.ttf": "7ec92adfa4fe03eb8e9bfb60813df1fa",
"assets/packages/flutter_math_fork/lib/katex_fonts/fonts/KaTeX_Fraktur-Bold.ttf": "46b41c4de7a936d099575185a94855c4",
"assets/packages/flutter_math_fork/lib/katex_fonts/fonts/KaTeX_Fraktur-Regular.ttf": "dede6f2c7dad4402fa205644391b3a94",
"assets/packages/flutter_math_fork/lib/katex_fonts/fonts/KaTeX_Main-Bold.ttf": "9eef86c1f9efa78ab93d41a0551948f7",
"assets/packages/flutter_math_fork/lib/katex_fonts/fonts/KaTeX_Main-BoldItalic.ttf": "e3c361ea8d1c215805439ce0941a1c8d",
"assets/packages/flutter_math_fork/lib/katex_fonts/fonts/KaTeX_Main-Italic.ttf": "ac3b1882325add4f148f05db8cafd401",
"assets/packages/flutter_math_fork/lib/katex_fonts/fonts/KaTeX_Main-Regular.ttf": "5a5766c715ee765aa1398997643f1589",
"assets/packages/flutter_math_fork/lib/katex_fonts/fonts/KaTeX_Math-BoldItalic.ttf": "946a26954ab7fbd7ea78df07795a6cbc",
"assets/packages/flutter_math_fork/lib/katex_fonts/fonts/KaTeX_Math-Italic.ttf": "a7732ecb5840a15be39e1eda377bc21d",
"assets/packages/flutter_math_fork/lib/katex_fonts/fonts/KaTeX_SansSerif-Bold.ttf": "ad0a28f28f736cf4c121bcb0e719b88a",
"assets/packages/flutter_math_fork/lib/katex_fonts/fonts/KaTeX_SansSerif-Italic.ttf": "d89b80e7bdd57d238eeaa80ed9a1013a",
"assets/packages/flutter_math_fork/lib/katex_fonts/fonts/KaTeX_SansSerif-Regular.ttf": "b5f967ed9e4933f1c3165a12fe3436df",
"assets/packages/flutter_math_fork/lib/katex_fonts/fonts/KaTeX_Script-Regular.ttf": "55d2dcd4778875a53ff09320a85a5296",
"assets/packages/flutter_math_fork/lib/katex_fonts/fonts/KaTeX_Size1-Regular.ttf": "1e6a3368d660edc3a2fbbe72edfeaa85",
"assets/packages/flutter_math_fork/lib/katex_fonts/fonts/KaTeX_Size2-Regular.ttf": "959972785387fe35f7d47dbfb0385bc4",
"assets/packages/flutter_math_fork/lib/katex_fonts/fonts/KaTeX_Size3-Regular.ttf": "e87212c26bb86c21eb028aba2ac53ec3",
"assets/packages/flutter_math_fork/lib/katex_fonts/fonts/KaTeX_Size4-Regular.ttf": "85554307b465da7eb785fd3ce52ad282",
"assets/packages/flutter_math_fork/lib/katex_fonts/fonts/KaTeX_Typewriter-Regular.ttf": "87f56927f1ba726ce0591955c8b3b42d",
"assets/packages/wakelock_web/assets/no_sleep.js": "7748a45cd593f33280669b29c2c8919a",
"favicon.png": "5dcef449791fa27946b3d35ad8803796",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"index.html": "f58a81506b9d9eca72ed4677018f80f7",
"/": "f58a81506b9d9eca72ed4677018f80f7",
"main.dart.js": "f1ce246e1146db643ab3099a7d04c58a",
"manifest.json": "013e5445f31f8a254c28167d067ec6d7",
"version.json": "301c6047184b19715b8d22d9a1aa84d9"
};

// The application shell files that are downloaded before a service worker can
// start.
const CORE = [
  "/",
"main.dart.js",
"index.html",
"assets/NOTICES",
"assets/AssetManifest.json",
"assets/FontManifest.json"];
// During install, the TEMP cache is populated with the application shell files.
self.addEventListener("install", (event) => {
  self.skipWaiting();
  return event.waitUntil(
    caches.open(TEMP).then((cache) => {
      return cache.addAll(
        CORE.map((value) => new Request(value, {'cache': 'reload'})));
    })
  );
});

// During activate, the cache is populated with the temp files downloaded in
// install. If this service worker is upgrading from one with a saved
// MANIFEST, then use this to retain unchanged resource files.
self.addEventListener("activate", function(event) {
  return event.waitUntil(async function() {
    try {
      var contentCache = await caches.open(CACHE_NAME);
      var tempCache = await caches.open(TEMP);
      var manifestCache = await caches.open(MANIFEST);
      var manifest = await manifestCache.match('manifest');
      // When there is no prior manifest, clear the entire cache.
      if (!manifest) {
        await caches.delete(CACHE_NAME);
        contentCache = await caches.open(CACHE_NAME);
        for (var request of await tempCache.keys()) {
          var response = await tempCache.match(request);
          await contentCache.put(request, response);
        }
        await caches.delete(TEMP);
        // Save the manifest to make future upgrades efficient.
        await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
        return;
      }
      var oldManifest = await manifest.json();
      var origin = self.location.origin;
      for (var request of await contentCache.keys()) {
        var key = request.url.substring(origin.length + 1);
        if (key == "") {
          key = "/";
        }
        // If a resource from the old manifest is not in the new cache, or if
        // the MD5 sum has changed, delete it. Otherwise the resource is left
        // in the cache and can be reused by the new service worker.
        if (!RESOURCES[key] || RESOURCES[key] != oldManifest[key]) {
          await contentCache.delete(request);
        }
      }
      // Populate the cache with the app shell TEMP files, potentially overwriting
      // cache files preserved above.
      for (var request of await tempCache.keys()) {
        var response = await tempCache.match(request);
        await contentCache.put(request, response);
      }
      await caches.delete(TEMP);
      // Save the manifest to make future upgrades efficient.
      await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
      return;
    } catch (err) {
      // On an unhandled exception the state of the cache cannot be guaranteed.
      console.error('Failed to upgrade service worker: ' + err);
      await caches.delete(CACHE_NAME);
      await caches.delete(TEMP);
      await caches.delete(MANIFEST);
    }
  }());
});

// The fetch handler redirects requests for RESOURCE files to the service
// worker cache.
self.addEventListener("fetch", (event) => {
  if (event.request.method !== 'GET') {
    return;
  }
  var origin = self.location.origin;
  var key = event.request.url.substring(origin.length + 1);
  // Redirect URLs to the index.html
  if (key.indexOf('?v=') != -1) {
    key = key.split('?v=')[0];
  }
  if (event.request.url == origin || event.request.url.startsWith(origin + '/#') || key == '') {
    key = '/';
  }
  // If the URL is not the RESOURCE list then return to signal that the
  // browser should take over.
  if (!RESOURCES[key]) {
    return;
  }
  // If the URL is the index.html, perform an online-first request.
  if (key == '/') {
    return onlineFirst(event);
  }
  event.respondWith(caches.open(CACHE_NAME)
    .then((cache) =>  {
      return cache.match(event.request).then((response) => {
        // Either respond with the cached resource, or perform a fetch and
        // lazily populate the cache.
        return response || fetch(event.request).then((response) => {
          cache.put(event.request, response.clone());
          return response;
        });
      })
    })
  );
});

self.addEventListener('message', (event) => {
  // SkipWaiting can be used to immediately activate a waiting service worker.
  // This will also require a page refresh triggered by the main worker.
  if (event.data === 'skipWaiting') {
    self.skipWaiting();
    return;
  }
  if (event.data === 'downloadOffline') {
    downloadOffline();
    return;
  }
});

// Download offline will check the RESOURCES for all files not in the cache
// and populate them.
async function downloadOffline() {
  var resources = [];
  var contentCache = await caches.open(CACHE_NAME);
  var currentContent = {};
  for (var request of await contentCache.keys()) {
    var key = request.url.substring(origin.length + 1);
    if (key == "") {
      key = "/";
    }
    currentContent[key] = true;
  }
  for (var resourceKey of Object.keys(RESOURCES)) {
    if (!currentContent[resourceKey]) {
      resources.push(resourceKey);
    }
  }
  return contentCache.addAll(resources);
}

// Attempt to download the resource online before falling back to
// the offline cache.
function onlineFirst(event) {
  return event.respondWith(
    fetch(event.request).then((response) => {
      return caches.open(CACHE_NAME).then((cache) => {
        cache.put(event.request, response.clone());
        return response;
      });
    }).catch((error) => {
      return caches.open(CACHE_NAME).then((cache) => {
        return cache.match(event.request).then((response) => {
          if (response != null) {
            return response;
          }
          throw error;
        });
      });
    })
  );
}
