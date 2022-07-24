const urls = {
  postlight: [
    "coda.io",
    /(?:meet|docs)\.google\.com/,
    "postlight.pingboard.com",
    "postlight.rewatch.tv",
    "cultureamptraining.com",
    "murmur.cultureamp.com",
    "postlight.rewatch.com",
  ],
  axios: [/github\.com\/axioscode/, /axioscode\.atlassian\.net/, /axios\.twingate\.com/],
};

module.exports = {
  defaultBrowser: "Firefox",
  handlers: [
    {
      match: finicky.matchHostnames(urls.postlight),
      browser: {
        name: "Google Chrome",
        profile: "Default",
      },
    },
    {
      match: /https:\/\/stackoverflow\.com\/c\/postlight/,
      browser: {
        name: "Google Chrome",
        profile: "Default",
      },
    },
    {
      match: finicky.matchHostnames(urls.axios),
      browser: {
        name: "Google Chrome",
        profile: "Axios",
      },
    },
  ],
};
