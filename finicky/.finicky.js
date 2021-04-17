module.exports = {
  defaultBrowser: "Firefox",      
  handlers: [
    {
      match: /^https?:\/\/(?:meet|docs)\.google\.com\/.*$/,
      browser: "Google Chrome"
    },
    {
      match: /^https?:\/\/(?:bamboo|jira|git|wiki)\.cision\.com(:[0-9]+)?\/.*$/,
      browser: "Google Chrome"
    },
    {
      match: /^https?:\/\/cision\.okta\.com\/.*$/,
      browser: "Google Chrome"
    },
    {
      match: /^https?:\/\/jenkins\.trendkite\.com\/.*$/,
      browser: "Google Chrome"
    },
    {
      match: /^https?:\/\/postlight\.pingboard\.com\/.*$/,
      browser: "Google Chrome"
    },
    {
    match: /^https?:\/\/postlight\.rewatch\.tv\/.*$/,
    browser: "Google Chrome"
  },
    {
      match: /^https?:\/\/bitbucket\.org\/trendkite\/.*$/,
      browser: "Google Chrome"
    },
    {
      match: /^https?:\/\/production-cision\.instana\.io\/.*$/,
      browser: "Google Chrome"
    },
    {
      match: "open.spotify.com*",
      browser: "Spotify"
    }
  ]
}
