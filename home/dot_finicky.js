module.exports = {
  defaultBrowser: "Firefox",
  options: {
    // Hide the finicky icon from the top bar
    hideIcon: false
  },
  handlers: [
    {
      // Open Spotify links in Spotify app
      match: finicky.matchDomains("open.spotify.com"),
      browser: "Spotify"
    },
    {
      // Open Zoom links in Zoom app with or without password
      match: /zoom\.us\/join/,
      browser: "us.zoom.xos"
    },
    {
      // Open links in Safari when the option key is pressed
      // Valid keys are: shift, option, command, control, capsLock, and function.
      // Please note that control usually opens a tooltip menu instead of visiting a link
      match: () => finicky.getKeys().option,
      browser: "Safari"
    },
    {
      // Open Apple Music links directly in Music.app
      match: [
        "music.apple.com*",
        "geo.music.apple.com*",
      ],
      url: {
        protocol: "itmss"
      },
      browser: "Music",
    },
    {
      // Open Discord links in Discord app
      match: "https://discord.com/*",
      url: { protocol: "discord" },
      browser: "Discord",
    }
  ],
  rewrite: [{
    // Open Zoom links in Zoom app with or without password
    match: ({
      url
    }) => url.host.includes("zoom.us") && url.pathname.includes("/j/"),
    url({
      url
    }) {
      try {
        var pass = '&pwd=' + url.search.match(/pwd=(\w*)/)[1];
      } catch {
        var pass = ""
      }
      var conf = 'confno=' + url.pathname.match(/\/j\/(\d+)/)[1];
      return {
        search: conf + pass,
        pathname: '/join',
        protocol: "zoommtg"
      }
    }
  }]
};
