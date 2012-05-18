#/bin/sh

# Generate a new project scaffold

# Usage:
# ./newproject.sh projectname
# Will attempt to create several directories in your Projects folder at
# $HOME/$yourprojectfolder/

# =CUSTOMIZE THESE VARS= #
my_projects="Projects"
asset_dir="assets"
image_dir="images"
css_dir="css"
js_dir="js"
jquery_url="http://code.jquery.com/"
jquery_file="jquery-1.7.2.min.js"
# ==========END========= #

if [ "$1" != "" ] ; then 
  
  project_name="$1"

  cd "$HOME/$my_projects"

  mkdir -p "$project_name" || exit 1
  mkdir -p "$project_name/$asset_dir"
  mkdir -p "$project_name/$asset_dir/$image_dir"
  mkdir -p "$project_name/$asset_dir/$css_dir"
  mkdir -p "$project_name/$asset_dir/$css_dir/vendor"
  mkdir -p "$project_name/$asset_dir/$js_dir"
  mkdir -p "$project_name/$asset_dir/$js_dir/vendor"

  cd "$HOME/$my_projects/$project_name" && touch index.html
  cd "$HOME/$my_projects/$project_name/$asset_dir/$css_dir" && touch app.css && touch reset.css
  cd "$HOME/$my_projects/$project_name/$asset_dir/$js_dir/vendor" && touch "$jquery_file"
  curl "$jquery_url/$jquery_file"  > "$jquery_file"


  reset="html, body, div, span, applet, object, iframe,
h1, h2, h3, h4, h5, h6, p, blockquote, pre,
a, abbr, acronym, address, big, cite, code,
del, dfn, em, img, ins, kbd, q, s, samp,
small, strike, strong, sub, sup, tt, var,
b, u, i, center,
dl, dt, dd, ol, ul, li,
fieldset, form, label, legend,
table, caption, tbody, tfoot, thead, tr, th, td,
article, aside, canvas, details, embed, 
figure, figcaption, footer, header, hgroup, 
menu, nav, output, ruby, section, summary,
time, mark, audio, video {
	margin: 0;
	padding: 0;
	border: 0;
	font-size: 100%;
	font: inherit;
	vertical-align: baseline;
}
/* HTML5 display-role reset for older browsers */
article, aside, details, figcaption, figure, 
footer, header, hgroup, menu, nav, section {
	display: block;
}
body {
	line-height: 1;
}
ol, ul {
	list-style: none;
}
blockquote, q {
	quotes: none;
}
blockquote:before, blockquote:after,
q:before, q:after {
	content: '';
	content: none;
}
table {
	border-collapse: collapse;
	border-spacing: 0;
}"

  echo "$reset" > "$HOME/$my_projects/$project_name/$asset_dir/$css_dir/reset.css"

  html="<!DOCTYPE html>

<html xmlns=\"http://www.w3.org/1999/xhtml\" xml:lang=\"en\" lang=\"en\">
<head>
	<meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\"/>
	<title>REPLACEME</title>
	<script/type=\"text/javascript\" src=\"/$asset_dir/$js_dir/vendor/$jquery_file\"></script>
	<link rel=\"stylesheet\" href=\"/$asset_dir/$css_dir/reset.css\" type=\"text/css\" media=\"screen\" />
	<link rel=\"stylesheet\" href=\"/$asset_dir/$css_dir/app.css\" type=\"text/css\" media=\"screen\" />
</head>
<body>
Hello world!
</body>
</html>
"

  echo "$html" > "$HOME/$my_projects/$project_name/index.html"
   

  echo "Created project $project_name"

elif [ "$1" == "" ] ; then
  echo "Usage: ./newproject.sh projectname"
fi
