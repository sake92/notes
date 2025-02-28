
## General

- use json-enc for hx-vals sending via AJAX
- htmx:afterSettle instead of DOMContentLoaded
- be VERY careful with hx-target, use  hx-disinherit="*" by default, just to be sure
- watch out for inherited attributes, not all of them are inherited, see reference
- scroll bugs https://github.com/bigskysoftware/htmx/issues/407#issuecomment-1562366865


https://simerplaha.github.io/html-to-scala-converter/

## Boooosting

BEST woould be if you have:
- same CSS on all pages
- same JS on all pages
- JS loaded only once, in head, defer, preserved


BECAUSE HTMX dynamically adds CSS/JS, so sometimes you get:
- different ordering of CSS scripts, so overrides dont work anymore
- different ordering of JS scripts, anything might happen
- JS script loads multiple times, you usually are not ready for this

### full-page reload logic

// before
window.addEventListener("DOMContentLoaded", myListener); // initial load

// after
window.addEventListener("DOMContentLoaded", myListener); // initial load
window.addEventListener("htmx:afterSettle", myListener); // plus on htmx boosted responses

function myListener(event) {

	// in case of DOMContentLoaded we don't have to change anything

	// in case of "htmx:afterSettle",
	// we want to only trigger on "full-page reload" (where request was boosted),
	if (event.type === "htmx:afterSettle" && event.detail.requestConfig.boosted !== true) return;
	
	// do stuff
}

## PWA

Service Worker caching on navigation.  
Use "HX-Boosted" header.

const isHtmxNavigate = request.headers.get("HX-Boosted");
    if (request.mode === 'navigate' || isHtmxNavigate) {
	
### Offline / Online / LoggedIn

Wrap menu and trigger its load in parent, to avoid recursion(infinite requests)..

      div(
        hx.get := "/fragments/web-menu",
        hx.trigger := "load",
        hx.target := "#web-menu-container",
        hx.swap := "outerHTML",
        hx.disinherit := "*" // dont swap="outerHTML" etc in links inside..
      )(
        webMenu(firstLoad = true, loggedIn = false)
      ),
      mobileMenu()
    )

  def webMenu(firstLoad: Boolean, loggedIn: Boolean) =
    div(
      id := "web-menu-container",
      cls := "nav__links"
    )(
      a(href := "/scratchpad", cls := "btn")("Code"),
      Option.when(loggedIn)(
        a(href := "/dashboard", cls := "btn")("Dashboard")
      ),
      Option.when(!firstLoad)(
        a(href := "/explore", cls := "btn")("Explore")
      ),
      a(href := "/learn", cls := "btn")("Learn"),
      Option.when(loggedIn)(
        a(href := "/settings", cls := "btn")("Settings")
      ),
      Option.when(!loggedIn)(
        a(href := "/login", cls := "btn")("Log In")
      )
    )	
	