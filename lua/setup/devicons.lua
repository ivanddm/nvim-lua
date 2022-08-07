-- "kyazdani42/nvim-web-devicons"

-- using nonicons instead in Kitty
-- make sure to install the nonicons font from https://github.com/yamatsum/nonicons/tree/master/dist
local icons = {
	["alert"] = "61697",
	["angular"] = "61698",
	["archive"] = "61699",
	["arrow-both"] = "61700",
	["arrow-down"] = "61701",
	["arrow-left"] = "61702",
	["arrow-right"] = "61703",
	["arrow-switch"] = "61704",
	["arrow-up"] = "61705",
	["backbone"] = "61706",
	["beaker"] = "61707",
	["bell"] = "61708",
	["bell-slash"] = "61709",
	["bold"] = "61710",
	["book"] = "61711",
	["bookmark"] = "61712",
	["bookmark-slash"] = "61713",
	["briefcase"] = "61714",
	["broadcast"] = "61715",
	["browser"] = "61716",
	["bug"] = "61717",
	["c"] = "61718",
	["c-plusplus"] = "61719",
	["c-sharp"] = "61720",
	["calendar"] = "61721",
	["check"] = "61722",
	["check-circle"] = "61723",
	["check-circle-fill"] = "61724",
	["checklist"] = "61725",
	["chevron-down"] = "61726",
	["chevron-left"] = "61727",
	["chevron-right"] = "61728",
	["chevron-up"] = "61729",
	["circle"] = "61730",
	["circle-slash"] = "61731",
	["clippy"] = "61732",
	["clock"] = "61733",
	["code"] = "61734",
	["code-review"] = "61735",
	["code-square"] = "61736",
	["comment"] = "61737",
	["comment-discussion"] = "61738",
	["container"] = "61739",
	["cpu"] = "61740",
	["credit-card"] = "61741",
	["cross-reference"] = "61742",
	["css"] = "61743",
	["dart"] = "61744",
	["dash"] = "61745",
	["database"] = "61746",
	["desktop-download"] = "61747",
	["device-camera"] = "61748",
	["device-camera-video"] = "61749",
	["device-desktop"] = "61750",
	["device-mobile"] = "61751",
	["diff"] = "61752",
	["diff-added"] = "61753",
	["diff-ignored"] = "61754",
	["diff-modified"] = "61755",
	["diff-removed"] = "61756",
	["diff-renamed"] = "61757",
	["docker"] = "61758",
	["dot"] = "61759",
	["dot-fill"] = "61760",
	["download"] = "61761",
	["ellipsis"] = "61762",
	["elm"] = "61763",
	["eye"] = "61764",
	["eye-closed"] = "61765",
	["file"] = "61766",
	["file-badge"] = "61767",
	["file-binary"] = "61768",
	["file-code"] = "61769",
	["file-diff"] = "61770",
	["file-directory"] = "61771",
	["file-directory-outline"] = "61772",
	["file-submodule"] = "61773",
	["file-symlink-file"] = "61774",
	["file-zip"] = "61775",
	["filter"] = "61776",
	["flame"] = "61777",
	["fold"] = "61778",
	["fold-down"] = "61779",
	["fold-up"] = "61780",
	["gear"] = "61781",
	["gift"] = "61782",
	["git-branch"] = "61783",
	["git-commit"] = "61784",
	["git-compare"] = "61785",
	["git-merge"] = "61786",
	["git-pull-request"] = "61787",
	["globe"] = "61788",
	["go"] = "61789",
	["grabber"] = "61790",
	["graph"] = "61791",
	["heading"] = "61792",
	["heart"] = "61793",
	["heart-fill"] = "61794",
	["history"] = "61795",
	["home"] = "61796",
	["horizontal-rule"] = "61797",
	["hourglass"] = "61798",
	["html"] = "61799",
	["hubot"] = "61800",
	["image"] = "61801",
	["inbox"] = "61802",
	["infinity"] = "61803",
	["info"] = "61804",
	["issue-closed"] = "61805",
	["issue-opened"] = "61806",
	["issue-reopened"] = "61807",
	["italic"] = "61808",
	["java"] = "61809",
	["javascript"] = "61810",
	["json"] = "61811",
	["kebab-horizontal"] = "61812",
	["key"] = "61813",
	["kotlin"] = "61814",
	["kubernetes"] = "61815",
	["law"] = "61816",
	["light-bulb"] = "61817",
	["link"] = "61818",
	["link-external"] = "61819",
	["list-ordered"] = "61820",
	["list-unordered"] = "61821",
	["location"] = "61822",
	["lock"] = "61823",
	["logo-gist"] = "61824",
	["logo-github"] = "61825",
	["lua"] = "61826",
	["mail"] = "61827",
	["mark-github"] = "61828",
	["markdown"] = "61829",
	["megaphone"] = "61830",
	["mention"] = "61831",
	["meter"] = "61832",
	["milestone"] = "61833",
	["mirror"] = "61834",
	["moon"] = "61835",
	["mortar-board"] = "61836",
	["mute"] = "61837",
	["nginx"] = "61838",
	["no-entry"] = "61839",
	["node"] = "61840",
	["north-star"] = "61841",
	["note"] = "61842",
	["npm"] = "61843",
	["octoface"] = "61844",
	["organization"] = "61845",
	["package"] = "61846",
	["package-dependencies"] = "61847",
	["package-dependents"] = "61848",
	["paintbrush"] = "61849",
	["paper-airplane"] = "61850",
	["pencil"] = "61851",
	["people"] = "61852",
	["perl"] = "61853",
	["person"] = "61854",
	["php"] = "61855",
	["pin"] = "61856",
	["play"] = "61857",
	["plug"] = "61858",
	["plus"] = "61859",
	["plus-circle"] = "61860",
	["project"] = "61861",
	["pulse"] = "61862",
	["python"] = "61863",
	["question"] = "61864",
	["quote"] = "61865",
	["r"] = "61866",
	["react"] = "61867",
	["rectangle"] = "61868",
	["reply"] = "61869",
	["repo"] = "61870",
	["repo-clone"] = "61871",
	["repo-forked"] = "61872",
	["repo-pull"] = "61873",
	["repo-push"] = "61874",
	["repo-template"] = "61875",
	["report"] = "61876",
	["require"] = "61877",
	["rocket"] = "61878",
	["rss"] = "61879",
	["ruby"] = "61880",
	["rust"] = "61881",
	["scala"] = "61882",
	["screen-full"] = "61883",
	["screen-normal"] = "61884",
	["search"] = "61885",
	["server"] = "61886",
	["share"] = "61887",
	["share-android"] = "61888",
	["shield"] = "61889",
	["shield-check"] = "61890",
	["shield-lock"] = "61891",
	["shield-x"] = "61892",
	["sign-in"] = "61893",
	["sign-out"] = "61894",
	["skip"] = "61895",
	["smiley"] = "61896",
	["square"] = "61897",
	["square-fill"] = "61898",
	["squirrel"] = "61899",
	["star"] = "61900",
	["star-fill"] = "61901",
	["stop"] = "61902",
	["stopwatch"] = "61903",
	["strikethrough"] = "61904",
	["sun"] = "61905",
	["swift"] = "61906",
	["sync"] = "61907",
	["tag"] = "61908",
	["tasklist"] = "61909",
	["telescope"] = "61910",
	["terminal"] = "61911",
	["three-bars"] = "61912",
	["thumbsdown"] = "61913",
	["thumbsup"] = "61914",
	["tmux"] = "61915",
	["toml"] = "61916",
	["tools"] = "61917",
	["trashcan"] = "61918",
	["triangle-down"] = "61919",
	["triangle-left"] = "61920",
	["triangle-right"] = "61921",
	["triangle-up"] = "61922",
	["typescript"] = "61923",
	["typography"] = "61924",
	["unfold"] = "61925",
	["unlock"] = "61926",
	["unmute"] = "61927",
	["unverified"] = "61928",
	["upload"] = "61929",
	["verified"] = "61930",
	["versions"] = "61931",
	["vim"] = "61932",
	["vim-command-mode"] = "61933",
	["vim-insert-mode"] = "61934",
	["vim-normal-mode"] = "61935",
	["vim-replace-mode"] = "61936",
	["vim-select-mode"] = "61937",
	["vim-terminal-mode"] = "61938",
	["vim-visual-mode"] = "61939",
	["vue"] = "61940",
	["workflow"] = "61941",
	["x"] = "61942",
	["x-circle"] = "61943",
	["x-circle-fill"] = "61944",
	["yaml"] = "61945",
	["yarn"] = "61946",
	["zap"] = "61947",
	["multi-select"] = "61948",
	["number"] = "61949",
	["trash"] = "61950",
	["video"] = "61951",
	["class"] = "61952",
	["constant"] = "61953",
	["field"] = "61954",
	["interface"] = "61955",
	["keyword"] = "61956",
	["snippet"] = "61957",
	["struct"] = "61958",
	["type"] = "61959",
	["variable"] = "61960",
}

-- if vim.env.TERM == "xterm-kitty" or vim.env.TERM == "wezterm" then
if vim.env.TERM == "xterm-kitty" then
	local devicons = require("nvim-web-devicons")

	local function get(name)
		return vim.fn.nr2char(icons[name])
	end

	devicons.set_icon({
		["svg"] = {
			icon = get("image"),
			color = "#FFB13B",
			name = "Svg",
		},
		["git"] = {
			icon = get("git-commit"),
			color = "#F14C28",
			name = "GitLogo",
		},
		[".gitattributes"] = {
			icon = get("git-commit"),
			color = "#41535b",
			name = "GitAttributes",
		},
		[".gitconfig"] = {
			icon = get("git-commit"),
			color = "#41535b",
			name = "GitConfig",
		},
		[".gitignore"] = {
			icon = get("git-commit"),
			color = "#41535b",
			name = "GitIgnore",
		},
		[".gvimrc"] = {
			icon = get("vim"),
			color = "#019833",
			name = "Gvimrc",
		},
		[".npmignore"] = {
			icon = get("npm"),
			color = "#E8274B",
			name = "NPMIgnore",
		},
		[".vimrc"] = {
			icon = get("vim"),
			color = "#019833",
			name = "Vimrc",
		},
		[".zshrc"] = {
			icon = get("terminal"),
			color = "#89e051",
			name = "Zshrc",
		},
		["Dockerfile"] = {
			icon = get("docker"),
			color = "#384d54",
			name = "Dockerfile",
		},
		["Gemfile$"] = {
			icon = get("ruby"),
			color = "#701516",
			name = "Gemfile",
		},
		["LICENSE"] = {
			icon = get("file-badge"),
			color = "#d0bf41",
			name = "License",
		},
		["bash"] = {
			icon = get("terminal"),
			color = "#89e051",
			name = "Bash",
		},
		["c"] = {
			icon = get("c"),
			color = "#599eff",
			name = "C",
		},
		["c++"] = {
			icon = get("c-plusplus"),
			color = "#f34b7d",
			name = "CPlusPlus",
		},
		["cc"] = {
			icon = get("c-plusplus"),
			color = "#f34b7d",
			name = "CPlusPlus",
		},
		["conf"] = {
			icon = get("gear"),
			color = "#6d8086",
			name = "Conf",
		},
		["cp"] = {
			icon = get("c-plusplus"),
			color = "#519aba",
			name = "Cp",
		},
		["cpp"] = {
			icon = get("c-plusplus"),
			color = "#519aba",
			name = "Cpp",
		},
		["css"] = {
			icon = get("css"),
			color = "#563d7c",
			name = "Css",
		},
		["dart"] = {
			icon = get("dart"),
			color = "#03589C",
			name = "Dart",
		},
		["db"] = {
			icon = get("database"),
			color = "#dad8d8",
			name = "Db",
		},
		["dockerfile"] = {
			icon = get("docker"),
			color = "#384d54",
			name = "Dockerfile",
		},
		["fish"] = {
			icon = get("terminal"),
			color = "#4d5a5e",
			name = "Fish",
		},
		["go"] = {
			icon = get("go"),
			color = "#519aba",
			name = "Go",
		},
		["htm"] = {
			icon = get("html"),
			color = "#e34c26",
			name = "Htm",
		},
		["html"] = {
			icon = get("html"),
			color = "#e34c26",
			name = "Html",
		},
		["ico"] = {
			icon = get("image"),
			color = "#cbcb41",
			name = "Ico",
		},
		["java"] = {
			icon = get("java"),
			color = "#cc3e44",
			name = "Java",
		},
		["jpeg"] = {
			icon = get("image"),
			color = "#a074c4",
			name = "Jpeg",
		},
		["jpg"] = {
			icon = get("image"),
			color = "#a074c4",
			name = "Jpg",
		},
		["js"] = {
			icon = get("javascript"),
			color = "#cbcb41",
			name = "Js",
		},
		["json"] = {
			icon = get("json"),
			color = "#cbcb41",
			name = "Json",
		},
		["jsx"] = {
			icon = get("react"),
			color = "#519aba",
			name = "Jsx",
		},
		["license"] = {
			icon = get("file-badge"),
			color = "#cbcb41",
			name = "License",
		},
		["lua"] = {
			icon = get("lua"),
			color = "#51a0cf",
			name = "Lua",
		},
		["makefile"] = {
			icon = get("terminal"),
			color = "#6d8086",
			name = "Makefile",
		},
		["markdown"] = {
			icon = get("markdown"),
			color = "#519aba",
			name = "Markdown",
		},
		["md"] = {
			icon = get("markdown"),
			color = "#519aba",
			name = "Md",
		},
		["mdx"] = {
			icon = get("markdown"),
			color = "#519aba",
			name = "Mdx",
		},
		["node_modules"] = {
			icon = get("npm"),
			color = "#E8274B",
			name = "NodeModules",
		},
		["php"] = {
			icon = get("php"),
			color = "#a074c4",
			name = "Php",
		},
		["pl"] = {
			icon = get("perl"),
			color = "#519aba",
			name = "Pl",
		},
		["png"] = {
			icon = get("image"),
			color = "#a074c4",
			name = "Png",
		},
		["py"] = {
			icon = get("python"),
			color = "#3572A5",
			name = "Py",
		},
		["pyc"] = {
			icon = get("python"),
			color = "#519aba",
			name = "Pyc",
		},
		["pyd"] = {
			icon = get("python"),
			color = "#519aba",
			name = "Pyd",
		},
		["pyo"] = {
			icon = get("python"),
			color = "#519aba",
			name = "Pyo",
		},
		["r"] = {
			icon = get("r"),
			color = "#358a5b",
			name = "R",
		},
		["rake"] = {
			icon = get("ruby"),
			color = "#701516",
			name = "Rake",
		},
		["rakefile"] = {
			icon = get("ruby"),
			color = "#701516",
			name = "Rakefile",
		},
		["rb"] = {
			icon = get("ruby"),
			color = "#701516",
			name = "Rb",
		},
		["rs"] = {
			icon = get("rust"),
			color = "#dea584",
			name = "Rs",
		},
		["rss"] = {
			icon = get("rss"),
			color = "#FB9D3B",
			name = "Rss",
		},
		["scala"] = {
			icon = get("scala"),
			color = "#cc3e44",
			name = "Scala",
		},
		["sh"] = {
			icon = get("terminal"),
			color = "#4d5a5e",
			name = "Sh",
		},
		["sql"] = {
			icon = get("database"),
			color = "#dad8d8",
			name = "Sql",
		},
		["swift"] = {
			icon = get("swift"),
			color = "#e37933",
			name = "Swift",
		},
		["toml"] = {
			icon = get("toml"),
			color = "#6d8086",
			name = "Toml",
		},
		["ts"] = {
			icon = get("typescript"),
			color = "#519aba",
			name = "Ts",
		},
		["tsx"] = {
			icon = get("react"),
			color = "#519aba",
			name = "Tsx",
		},
		["vim"] = {
			icon = get("vim"),
			color = "#019833",
			name = "Vim",
		},
		["vue"] = {
			icon = get("vue"),
			color = "#8dc149",
			name = "Vue",
		},
		["webp"] = {
			icon = get("image"),
			color = "#a074c4",
			name = "Webp",
		},
		["yaml"] = {
			icon = get("yaml"),
			color = "#6d8086",
			name = "Yaml",
		},
		["yml"] = {
			icon = get("yaml"),
			color = "#6d8086",
			name = "Yml",
		},
		["zsh"] = {
			icon = get("terminal"),
			color = "#89e051",
			name = "Zsh",
		},
		["terminal"] = {
			icon = get("terminal"),
			color = "#31B53E",
			name = "Terminal",
		},
	})

	devicons.set_default_icon(get("file"), "#6d8086")
end