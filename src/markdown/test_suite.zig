
pub const TestCase=struct.{
  start_line:u32,
  end_line:u32,
  example:u32,
  sec:[]const u8,
  html:[]const u8,
  markdown:[]const u8,
};

pub const all_cases=[]TestCase.{
 
TestCase.{
  .start_line=350,.end_line=355,.example=1,.sec="Tabs",
  .html="<pre><code>foo\tbaz\t\tbim\n</code></pre>\n",
  .markdown="\tfoo\tbaz\t\tbim\n",
},
 
TestCase.{
  .start_line=357,.end_line=362,.example=2,.sec="Tabs",
  .html="<pre><code>foo\tbaz\t\tbim\n</code></pre>\n",
  .markdown="  \tfoo\tbaz\t\tbim\n",
},
 
TestCase.{
  .start_line=364,.end_line=371,.example=3,.sec="Tabs",
  .html="<pre><code>a\ta\nὐ\ta\n</code></pre>\n",
  .markdown="    a\ta\n    ὐ\ta\n",
},
 
TestCase.{
  .start_line=377,.end_line=388,.example=4,.sec="Tabs",
  .html="<ul>\n<li>\n<p>foo</p>\n<p>bar</p>\n</li>\n</ul>\n",
  .markdown="  - foo\n\n\tbar\n",
},
 
TestCase.{
  .start_line=390,.end_line=402,.example=5,.sec="Tabs",
  .html="<ul>\n<li>\n<p>foo</p>\n<pre><code>  bar\n</code></pre>\n</li>\n</ul>\n",
  .markdown="- foo\n\n\t\tbar\n",
},
 
TestCase.{
  .start_line=413,.end_line=420,.example=6,.sec="Tabs",
  .html="<blockquote>\n<pre><code>  foo\n</code></pre>\n</blockquote>\n",
  .markdown=">\t\tfoo\n",
},
 
TestCase.{
  .start_line=422,.end_line=431,.example=7,.sec="Tabs",
  .html="<ul>\n<li>\n<pre><code>  foo\n</code></pre>\n</li>\n</ul>\n",
  .markdown="-\t\tfoo\n",
},
 
TestCase.{
  .start_line=434,.end_line=441,.example=8,.sec="Tabs",
  .html="<pre><code>foo\nbar\n</code></pre>\n",
  .markdown="    foo\n\tbar\n",
},
 
TestCase.{
  .start_line=443,.end_line=459,.example=9,.sec="Tabs",
  .html="<ul>\n<li>foo\n<ul>\n<li>bar\n<ul>\n<li>baz</li>\n</ul>\n</li>\n</ul>\n</li>\n</ul>\n",
  .markdown=" - foo\n   - bar\n\t - baz\n",
},
 
TestCase.{
  .start_line=461,.end_line=465,.example=10,.sec="Tabs",
  .html="<h1>Foo</h1>\n",
  .markdown="#\tFoo\n",
},
 
TestCase.{
  .start_line=467,.end_line=471,.example=11,.sec="Tabs",
  .html="<hr />\n",
  .markdown="*\t*\t*\t\n",
},
 
TestCase.{
  .start_line=494,.end_line=502,.example=12,.sec="Precedence",
  .html="<ul>\n<li>`one</li>\n<li>two`</li>\n</ul>\n",
  .markdown="- `one\n- two`\n",
},
 
TestCase.{
  .start_line=533,.end_line=541,.example=13,.sec="Thematic breaks",
  .html="<hr />\n<hr />\n<hr />\n",
  .markdown="***\n---\n___\n",
},
 
TestCase.{
  .start_line=546,.end_line=550,.example=14,.sec="Thematic breaks",
  .html="<p>+++</p>\n",
  .markdown="+++\n",
},
 
TestCase.{
  .start_line=553,.end_line=557,.example=15,.sec="Thematic breaks",
  .html="<p>===</p>\n",
  .markdown="===\n",
},
 
TestCase.{
  .start_line=562,.end_line=570,.example=16,.sec="Thematic breaks",
  .html="<p>--\n**\n__</p>\n",
  .markdown="--\n**\n__\n",
},
 
TestCase.{
  .start_line=575,.end_line=583,.example=17,.sec="Thematic breaks",
  .html="<hr />\n<hr />\n<hr />\n",
  .markdown=" ***\n  ***\n   ***\n",
},
 
TestCase.{
  .start_line=588,.end_line=593,.example=18,.sec="Thematic breaks",
  .html="<pre><code>***\n</code></pre>\n",
  .markdown="    ***\n",
},
 
TestCase.{
  .start_line=596,.end_line=602,.example=19,.sec="Thematic breaks",
  .html="<p>Foo\n***</p>\n",
  .markdown="Foo\n    ***\n",
},
 
TestCase.{
  .start_line=607,.end_line=611,.example=20,.sec="Thematic breaks",
  .html="<hr />\n",
  .markdown="_____________________________________\n",
},
 
TestCase.{
  .start_line=616,.end_line=620,.example=21,.sec="Thematic breaks",
  .html="<hr />\n",
  .markdown=" - - -\n",
},
 
TestCase.{
  .start_line=623,.end_line=627,.example=22,.sec="Thematic breaks",
  .html="<hr />\n",
  .markdown=" **  * ** * ** * **\n",
},
 
TestCase.{
  .start_line=630,.end_line=634,.example=23,.sec="Thematic breaks",
  .html="<hr />\n",
  .markdown="-     -      -      -\n",
},
 
TestCase.{
  .start_line=639,.end_line=643,.example=24,.sec="Thematic breaks",
  .html="<hr />\n",
  .markdown="- - - -    \n",
},
 
TestCase.{
  .start_line=648,.end_line=658,.example=25,.sec="Thematic breaks",
  .html="<p>_ _ _ _ a</p>\n<p>a------</p>\n<p>---a---</p>\n",
  .markdown="_ _ _ _ a\n\na------\n\n---a---\n",
},
 
TestCase.{
  .start_line=664,.end_line=668,.example=26,.sec="Thematic breaks",
  .html="<p><em>-</em></p>\n",
  .markdown=" *-*\n",
},
 
TestCase.{
  .start_line=673,.end_line=685,.example=27,.sec="Thematic breaks",
  .html="<ul>\n<li>foo</li>\n</ul>\n<hr />\n<ul>\n<li>bar</li>\n</ul>\n",
  .markdown="- foo\n***\n- bar\n",
},
 
TestCase.{
  .start_line=690,.end_line=698,.example=28,.sec="Thematic breaks",
  .html="<p>Foo</p>\n<hr />\n<p>bar</p>\n",
  .markdown="Foo\n***\nbar\n",
},
 
TestCase.{
  .start_line=707,.end_line=714,.example=29,.sec="Thematic breaks",
  .html="<h2>Foo</h2>\n<p>bar</p>\n",
  .markdown="Foo\n---\nbar\n",
},
 
TestCase.{
  .start_line=720,.end_line=732,.example=30,.sec="Thematic breaks",
  .html="<ul>\n<li>Foo</li>\n</ul>\n<hr />\n<ul>\n<li>Bar</li>\n</ul>\n",
  .markdown="* Foo\n* * *\n* Bar\n",
},
 
TestCase.{
  .start_line=737,.end_line=747,.example=31,.sec="Thematic breaks",
  .html="<ul>\n<li>Foo</li>\n<li>\n<hr />\n</li>\n</ul>\n",
  .markdown="- Foo\n- * * *\n",
},
 
TestCase.{
  .start_line=766,.end_line=780,.example=32,.sec="ATX headings",
  .html="<h1>foo</h1>\n<h2>foo</h2>\n<h3>foo</h3>\n<h4>foo</h4>\n<h5>foo</h5>\n<h6>foo</h6>\n",
  .markdown="# foo\n## foo\n### foo\n#### foo\n##### foo\n###### foo\n",
},
 
TestCase.{
  .start_line=785,.end_line=789,.example=33,.sec="ATX headings",
  .html="<p>####### foo</p>\n",
  .markdown="####### foo\n",
},
 
TestCase.{
  .start_line=800,.end_line=807,.example=34,.sec="ATX headings",
  .html="<p>#5 bolt</p>\n<p>#hashtag</p>\n",
  .markdown="#5 bolt\n\n#hashtag\n",
},
 
TestCase.{
  .start_line=812,.end_line=816,.example=35,.sec="ATX headings",
  .html="<p>## foo</p>\n",
  .markdown="\\## foo\n",
},
 
TestCase.{
  .start_line=821,.end_line=825,.example=36,.sec="ATX headings",
  .html="<h1>foo <em>bar</em> *baz*</h1>\n",
  .markdown="# foo *bar* \\*baz\\*\n",
},
 
TestCase.{
  .start_line=830,.end_line=834,.example=37,.sec="ATX headings",
  .html="<h1>foo</h1>\n",
  .markdown="#                  foo                     \n",
},
 
TestCase.{
  .start_line=839,.end_line=847,.example=38,.sec="ATX headings",
  .html="<h3>foo</h3>\n<h2>foo</h2>\n<h1>foo</h1>\n",
  .markdown=" ### foo\n  ## foo\n   # foo\n",
},
 
TestCase.{
  .start_line=852,.end_line=857,.example=39,.sec="ATX headings",
  .html="<pre><code># foo\n</code></pre>\n",
  .markdown="    # foo\n",
},
 
TestCase.{
  .start_line=860,.end_line=866,.example=40,.sec="ATX headings",
  .html="<p>foo\n# bar</p>\n",
  .markdown="foo\n    # bar\n",
},
 
TestCase.{
  .start_line=871,.end_line=877,.example=41,.sec="ATX headings",
  .html="<h2>foo</h2>\n<h3>bar</h3>\n",
  .markdown="## foo ##\n  ###   bar    ###\n",
},
 
TestCase.{
  .start_line=882,.end_line=888,.example=42,.sec="ATX headings",
  .html="<h1>foo</h1>\n<h5>foo</h5>\n",
  .markdown="# foo ##################################\n##### foo ##\n",
},
 
TestCase.{
  .start_line=893,.end_line=897,.example=43,.sec="ATX headings",
  .html="<h3>foo</h3>\n",
  .markdown="### foo ###     \n",
},
 
TestCase.{
  .start_line=904,.end_line=908,.example=44,.sec="ATX headings",
  .html="<h3>foo ### b</h3>\n",
  .markdown="### foo ### b\n",
},
 
TestCase.{
  .start_line=913,.end_line=917,.example=45,.sec="ATX headings",
  .html="<h1>foo#</h1>\n",
  .markdown="# foo#\n",
},
 
TestCase.{
  .start_line=923,.end_line=931,.example=46,.sec="ATX headings",
  .html="<h3>foo ###</h3>\n<h2>foo ###</h2>\n<h1>foo #</h1>\n",
  .markdown="### foo \\###\n## foo #\\##\n# foo \\#\n",
},
 
TestCase.{
  .start_line=937,.end_line=945,.example=47,.sec="ATX headings",
  .html="<hr />\n<h2>foo</h2>\n<hr />\n",
  .markdown="****\n## foo\n****\n",
},
 
TestCase.{
  .start_line=948,.end_line=956,.example=48,.sec="ATX headings",
  .html="<p>Foo bar</p>\n<h1>baz</h1>\n<p>Bar foo</p>\n",
  .markdown="Foo bar\n# baz\nBar foo\n",
},
 
TestCase.{
  .start_line=961,.end_line=969,.example=49,.sec="ATX headings",
  .html="<h2></h2>\n<h1></h1>\n<h3></h3>\n",
  .markdown="## \n#\n### ###\n",
},
 
TestCase.{
  .start_line=1004,.end_line=1013,.example=50,.sec="Setext headings",
  .html="<h1>Foo <em>bar</em></h1>\n<h2>Foo <em>bar</em></h2>\n",
  .markdown="Foo *bar*\n=========\n\nFoo *bar*\n---------\n",
},
 
TestCase.{
  .start_line=1018,.end_line=1025,.example=51,.sec="Setext headings",
  .html="<h1>Foo <em>bar\nbaz</em></h1>\n",
  .markdown="Foo *bar\nbaz*\n====\n",
},
 
TestCase.{
  .start_line=1030,.end_line=1039,.example=52,.sec="Setext headings",
  .html="<h2>Foo</h2>\n<h1>Foo</h1>\n",
  .markdown="Foo\n-------------------------\n\nFoo\n=\n",
},
 
TestCase.{
  .start_line=1045,.end_line=1058,.example=53,.sec="Setext headings",
  .html="<h2>Foo</h2>\n<h2>Foo</h2>\n<h1>Foo</h1>\n",
  .markdown="   Foo\n---\n\n  Foo\n-----\n\n  Foo\n  ===\n",
},
 
TestCase.{
  .start_line=1063,.end_line=1076,.example=54,.sec="Setext headings",
  .html="<pre><code>Foo\n---\n\nFoo\n</code></pre>\n<hr />\n",
  .markdown="    Foo\n    ---\n\n    Foo\n---\n",
},
 
TestCase.{
  .start_line=1082,.end_line=1087,.example=55,.sec="Setext headings",
  .html="<h2>Foo</h2>\n",
  .markdown="Foo\n   ----      \n",
},
 
TestCase.{
  .start_line=1092,.end_line=1098,.example=56,.sec="Setext headings",
  .html="<p>Foo\n---</p>\n",
  .markdown="Foo\n    ---\n",
},
 
TestCase.{
  .start_line=1103,.end_line=1114,.example=57,.sec="Setext headings",
  .html="<p>Foo\n= =</p>\n<p>Foo</p>\n<hr />\n",
  .markdown="Foo\n= =\n\nFoo\n--- -\n",
},
 
TestCase.{
  .start_line=1119,.end_line=1124,.example=58,.sec="Setext headings",
  .html="<h2>Foo</h2>\n",
  .markdown="Foo  \n-----\n",
},
 
TestCase.{
  .start_line=1129,.end_line=1134,.example=59,.sec="Setext headings",
  .html="<h2>Foo\\</h2>\n",
  .markdown="Foo\\\n----\n",
},
 
TestCase.{
  .start_line=1140,.end_line=1153,.example=60,.sec="Setext headings",
  .html="<h2>`Foo</h2>\n<p>`</p>\n<h2>&lt;a title=&quot;a lot</h2>\n<p>of dashes&quot;/&gt;</p>\n",
  .markdown="`Foo\n----\n`\n\n<a title=\"a lot\n---\nof dashes\"/>\n",
},
 
TestCase.{
  .start_line=1159,.end_line=1167,.example=61,.sec="Setext headings",
  .html="<blockquote>\n<p>Foo</p>\n</blockquote>\n<hr />\n",
  .markdown="> Foo\n---\n",
},
 
TestCase.{
  .start_line=1170,.end_line=1180,.example=62,.sec="Setext headings",
  .html="<blockquote>\n<p>foo\nbar\n===</p>\n</blockquote>\n",
  .markdown="> foo\nbar\n===\n",
},
 
TestCase.{
  .start_line=1183,.end_line=1191,.example=63,.sec="Setext headings",
  .html="<ul>\n<li>Foo</li>\n</ul>\n<hr />\n",
  .markdown="- Foo\n---\n",
},
 
TestCase.{
  .start_line=1198,.end_line=1205,.example=64,.sec="Setext headings",
  .html="<h2>Foo\nBar</h2>\n",
  .markdown="Foo\nBar\n---\n",
},
 
TestCase.{
  .start_line=1211,.end_line=1223,.example=65,.sec="Setext headings",
  .html="<hr />\n<h2>Foo</h2>\n<h2>Bar</h2>\n<p>Baz</p>\n",
  .markdown="---\nFoo\n---\nBar\n---\nBaz\n",
},
 
TestCase.{
  .start_line=1228,.end_line=1233,.example=66,.sec="Setext headings",
  .html="<p>====</p>\n",
  .markdown="\n====\n",
},
 
TestCase.{
  .start_line=1240,.end_line=1246,.example=67,.sec="Setext headings",
  .html="<hr />\n<hr />\n",
  .markdown="---\n---\n",
},
 
TestCase.{
  .start_line=1249,.end_line=1257,.example=68,.sec="Setext headings",
  .html="<ul>\n<li>foo</li>\n</ul>\n<hr />\n",
  .markdown="- foo\n-----\n",
},
 
TestCase.{
  .start_line=1260,.end_line=1267,.example=69,.sec="Setext headings",
  .html="<pre><code>foo\n</code></pre>\n<hr />\n",
  .markdown="    foo\n---\n",
},
 
TestCase.{
  .start_line=1270,.end_line=1278,.example=70,.sec="Setext headings",
  .html="<blockquote>\n<p>foo</p>\n</blockquote>\n<hr />\n",
  .markdown="> foo\n-----\n",
},
 
TestCase.{
  .start_line=1284,.end_line=1289,.example=71,.sec="Setext headings",
  .html="<h2>&gt; foo</h2>\n",
  .markdown="\\> foo\n------\n",
},
 
TestCase.{
  .start_line=1315,.end_line=1325,.example=72,.sec="Setext headings",
  .html="<p>Foo</p>\n<h2>bar</h2>\n<p>baz</p>\n",
  .markdown="Foo\n\nbar\n---\nbaz\n",
},
 
TestCase.{
  .start_line=1331,.end_line=1343,.example=73,.sec="Setext headings",
  .html="<p>Foo\nbar</p>\n<hr />\n<p>baz</p>\n",
  .markdown="Foo\nbar\n\n---\n\nbaz\n",
},
 
TestCase.{
  .start_line=1349,.end_line=1359,.example=74,.sec="Setext headings",
  .html="<p>Foo\nbar</p>\n<hr />\n<p>baz</p>\n",
  .markdown="Foo\nbar\n* * *\nbaz\n",
},
 
TestCase.{
  .start_line=1364,.end_line=1374,.example=75,.sec="Setext headings",
  .html="<p>Foo\nbar\n---\nbaz</p>\n",
  .markdown="Foo\nbar\n\\---\nbaz\n",
},
 
TestCase.{
  .start_line=1392,.end_line=1399,.example=76,.sec="Indented code blocks",
  .html="<pre><code>a simple\n  indented code block\n</code></pre>\n",
  .markdown="    a simple\n      indented code block\n",
},
 
TestCase.{
  .start_line=1406,.end_line=1417,.example=77,.sec="Indented code blocks",
  .html="<ul>\n<li>\n<p>foo</p>\n<p>bar</p>\n</li>\n</ul>\n",
  .markdown="  - foo\n\n    bar\n",
},
 
TestCase.{
  .start_line=1420,.end_line=1433,.example=78,.sec="Indented code blocks",
  .html="<ol>\n<li>\n<p>foo</p>\n<ul>\n<li>bar</li>\n</ul>\n</li>\n</ol>\n",
  .markdown="1.  foo\n\n    - bar\n",
},
 
TestCase.{
  .start_line=1440,.end_line=1451,.example=79,.sec="Indented code blocks",
  .html="<pre><code>&lt;a/&gt;\n*hi*\n\n- one\n</code></pre>\n",
  .markdown="    <a/>\n    *hi*\n\n    - one\n",
},
 
TestCase.{
  .start_line=1456,.end_line=1473,.example=80,.sec="Indented code blocks",
  .html="<pre><code>chunk1\n\nchunk2\n\n\n\nchunk3\n</code></pre>\n",
  .markdown="    chunk1\n\n    chunk2\n  \n \n \n    chunk3\n",
},
 
TestCase.{
  .start_line=1479,.end_line=1488,.example=81,.sec="Indented code blocks",
  .html="<pre><code>chunk1\n  \n  chunk2\n</code></pre>\n",
  .markdown="    chunk1\n      \n      chunk2\n",
},
 
TestCase.{
  .start_line=1494,.end_line=1501,.example=82,.sec="Indented code blocks",
  .html="<p>Foo\nbar</p>\n",
  .markdown="Foo\n    bar\n\n",
},
 
TestCase.{
  .start_line=1508,.end_line=1515,.example=83,.sec="Indented code blocks",
  .html="<pre><code>foo\n</code></pre>\n<p>bar</p>\n",
  .markdown="    foo\nbar\n",
},
 
TestCase.{
  .start_line=1521,.end_line=1536,.example=84,.sec="Indented code blocks",
  .html="<h1>Heading</h1>\n<pre><code>foo\n</code></pre>\n<h2>Heading</h2>\n<pre><code>foo\n</code></pre>\n<hr />\n",
  .markdown="# Heading\n    foo\nHeading\n------\n    foo\n----\n",
},
 
TestCase.{
  .start_line=1541,.end_line=1548,.example=85,.sec="Indented code blocks",
  .html="<pre><code>    foo\nbar\n</code></pre>\n",
  .markdown="        foo\n    bar\n",
},
 
TestCase.{
  .start_line=1554,.end_line=1563,.example=86,.sec="Indented code blocks",
  .html="<pre><code>foo\n</code></pre>\n",
  .markdown="\n    \n    foo\n    \n\n",
},
 
TestCase.{
  .start_line=1568,.end_line=1573,.example=87,.sec="Indented code blocks",
  .html="<pre><code>foo  \n</code></pre>\n",
  .markdown="    foo  \n",
},
 
TestCase.{
  .start_line=1623,.end_line=1632,.example=88,.sec="Fenced code blocks",
  .html="<pre><code>&lt;\n &gt;\n</code></pre>\n",
  .markdown="```\n<\n >\n```\n",
},
 
TestCase.{
  .start_line=1637,.end_line=1646,.example=89,.sec="Fenced code blocks",
  .html="<pre><code>&lt;\n &gt;\n</code></pre>\n",
  .markdown="~~~\n<\n >\n~~~\n",
},
 
TestCase.{
  .start_line=1650,.end_line=1656,.example=90,.sec="Fenced code blocks",
  .html="<p><code>foo</code></p>\n",
  .markdown="``\nfoo\n``\n",
},
 
TestCase.{
  .start_line=1661,.end_line=1670,.example=91,.sec="Fenced code blocks",
  .html="<pre><code>aaa\n~~~\n</code></pre>\n",
  .markdown="```\naaa\n~~~\n```\n",
},
 
TestCase.{
  .start_line=1673,.end_line=1682,.example=92,.sec="Fenced code blocks",
  .html="<pre><code>aaa\n```\n</code></pre>\n",
  .markdown="~~~\naaa\n```\n~~~\n",
},
 
TestCase.{
  .start_line=1687,.end_line=1696,.example=93,.sec="Fenced code blocks",
  .html="<pre><code>aaa\n```\n</code></pre>\n",
  .markdown="````\naaa\n```\n``````\n",
},
 
TestCase.{
  .start_line=1699,.end_line=1708,.example=94,.sec="Fenced code blocks",
  .html="<pre><code>aaa\n~~~\n</code></pre>\n",
  .markdown="~~~~\naaa\n~~~\n~~~~\n",
},
 
TestCase.{
  .start_line=1714,.end_line=1718,.example=95,.sec="Fenced code blocks",
  .html="<pre><code></code></pre>\n",
  .markdown="```\n",
},
 
TestCase.{
  .start_line=1721,.end_line=1731,.example=96,.sec="Fenced code blocks",
  .html="<pre><code>\n```\naaa\n</code></pre>\n",
  .markdown="`````\n\n```\naaa\n",
},
 
TestCase.{
  .start_line=1734,.end_line=1745,.example=97,.sec="Fenced code blocks",
  .html="<blockquote>\n<pre><code>aaa\n</code></pre>\n</blockquote>\n<p>bbb</p>\n",
  .markdown="> ```\n> aaa\n\nbbb\n",
},
 
TestCase.{
  .start_line=1750,.end_line=1759,.example=98,.sec="Fenced code blocks",
  .html="<pre><code>\n  \n</code></pre>\n",
  .markdown="```\n\n  \n```\n",
},
 
TestCase.{
  .start_line=1764,.end_line=1769,.example=99,.sec="Fenced code blocks",
  .html="<pre><code></code></pre>\n",
  .markdown="```\n```\n",
},
 
TestCase.{
  .start_line=1776,.end_line=1785,.example=100,.sec="Fenced code blocks",
  .html="<pre><code>aaa\naaa\n</code></pre>\n",
  .markdown=" ```\n aaa\naaa\n```\n",
},
 
TestCase.{
  .start_line=1788,.end_line=1799,.example=101,.sec="Fenced code blocks",
  .html="<pre><code>aaa\naaa\naaa\n</code></pre>\n",
  .markdown="  ```\naaa\n  aaa\naaa\n  ```\n",
},
 
TestCase.{
  .start_line=1802,.end_line=1813,.example=102,.sec="Fenced code blocks",
  .html="<pre><code>aaa\n aaa\naaa\n</code></pre>\n",
  .markdown="   ```\n   aaa\n    aaa\n  aaa\n   ```\n",
},
 
TestCase.{
  .start_line=1818,.end_line=1827,.example=103,.sec="Fenced code blocks",
  .html="<pre><code>```\naaa\n```\n</code></pre>\n",
  .markdown="    ```\n    aaa\n    ```\n",
},
 
TestCase.{
  .start_line=1833,.end_line=1840,.example=104,.sec="Fenced code blocks",
  .html="<pre><code>aaa\n</code></pre>\n",
  .markdown="```\naaa\n  ```\n",
},
 
TestCase.{
  .start_line=1843,.end_line=1850,.example=105,.sec="Fenced code blocks",
  .html="<pre><code>aaa\n</code></pre>\n",
  .markdown="   ```\naaa\n  ```\n",
},
 
TestCase.{
  .start_line=1855,.end_line=1863,.example=106,.sec="Fenced code blocks",
  .html="<pre><code>aaa\n    ```\n</code></pre>\n",
  .markdown="```\naaa\n    ```\n",
},
 
TestCase.{
  .start_line=1869,.end_line=1875,.example=107,.sec="Fenced code blocks",
  .html="<p><code></code>\naaa</p>\n",
  .markdown="``` ```\naaa\n",
},
 
TestCase.{
  .start_line=1878,.end_line=1886,.example=108,.sec="Fenced code blocks",
  .html="<pre><code>aaa\n~~~ ~~\n</code></pre>\n",
  .markdown="~~~~~~\naaa\n~~~ ~~\n",
},
 
TestCase.{
  .start_line=1892,.end_line=1903,.example=109,.sec="Fenced code blocks",
  .html="<p>foo</p>\n<pre><code>bar\n</code></pre>\n<p>baz</p>\n",
  .markdown="foo\n```\nbar\n```\nbaz\n",
},
 
TestCase.{
  .start_line=1909,.end_line=1921,.example=110,.sec="Fenced code blocks",
  .html="<h2>foo</h2>\n<pre><code>bar\n</code></pre>\n<h1>baz</h1>\n",
  .markdown="foo\n---\n~~~\nbar\n~~~\n# baz\n",
},
 
TestCase.{
  .start_line=1929,.end_line=1940,.example=111,.sec="Fenced code blocks",
  .html="<pre><code class=\"language-ruby\">def foo(x)\n  return 3\nend\n</code></pre>\n",
  .markdown="```ruby\ndef foo(x)\n  return 3\nend\n```\n",
},
 
TestCase.{
  .start_line=1943,.end_line=1954,.example=112,.sec="Fenced code blocks",
  .html="<pre><code class=\"language-ruby\">def foo(x)\n  return 3\nend\n</code></pre>\n",
  .markdown="~~~~    ruby startline=3 $%@#$\ndef foo(x)\n  return 3\nend\n~~~~~~~\n",
},
 
TestCase.{
  .start_line=1957,.end_line=1962,.example=113,.sec="Fenced code blocks",
  .html="<pre><code class=\"language-;\"></code></pre>\n",
  .markdown="````;\n````\n",
},
 
TestCase.{
  .start_line=1967,.end_line=1973,.example=114,.sec="Fenced code blocks",
  .html="<p><code>aa</code>\nfoo</p>\n",
  .markdown="``` aa ```\nfoo\n",
},
 
TestCase.{
  .start_line=1978,.end_line=1985,.example=115,.sec="Fenced code blocks",
  .html="<pre><code>``` aaa\n</code></pre>\n",
  .markdown="```\n``` aaa\n```\n",
},
 
TestCase.{
  .start_line=2055,.end_line=2070,.example=116,.sec="HTML blocks",
  .html="<table><tr><td>\n<pre>\n**Hello**,\n<p><em>world</em>.\n</pre></p>\n</td></tr></table>\n",
  .markdown="<table><tr><td>\n<pre>\n**Hello**,\n\n_world_.\n</pre>\n</td></tr></table>\n",
},
 
TestCase.{
  .start_line=2084,.end_line=2103,.example=117,.sec="HTML blocks",
  .html="<table>\n  <tr>\n    <td>\n           hi\n    </td>\n  </tr>\n</table>\n<p>okay.</p>\n",
  .markdown="<table>\n  <tr>\n    <td>\n           hi\n    </td>\n  </tr>\n</table>\n\nokay.\n",
},
 
TestCase.{
  .start_line=2106,.end_line=2114,.example=118,.sec="HTML blocks",
  .html=" <div>\n  *hello*\n         <foo><a>\n",
  .markdown=" <div>\n  *hello*\n         <foo><a>\n",
},
 
TestCase.{
  .start_line=2119,.end_line=2125,.example=119,.sec="HTML blocks",
  .html="</div>\n*foo*\n",
  .markdown="</div>\n*foo*\n",
},
 
TestCase.{
  .start_line=2130,.end_line=2140,.example=120,.sec="HTML blocks",
  .html="<DIV CLASS=\"foo\">\n<p><em>Markdown</em></p>\n</DIV>\n",
  .markdown="<DIV CLASS=\"foo\">\n\n*Markdown*\n\n</DIV>\n",
},
 
TestCase.{
  .start_line=2146,.end_line=2154,.example=121,.sec="HTML blocks",
  .html="<div id=\"foo\"\n  class=\"bar\">\n</div>\n",
  .markdown="<div id=\"foo\"\n  class=\"bar\">\n</div>\n",
},
 
TestCase.{
  .start_line=2157,.end_line=2165,.example=122,.sec="HTML blocks",
  .html="<div id=\"foo\" class=\"bar\n  baz\">\n</div>\n",
  .markdown="<div id=\"foo\" class=\"bar\n  baz\">\n</div>\n",
},
 
TestCase.{
  .start_line=2169,.end_line=2178,.example=123,.sec="HTML blocks",
  .html="<div>\n*foo*\n<p><em>bar</em></p>\n",
  .markdown="<div>\n*foo*\n\n*bar*\n",
},
 
TestCase.{
  .start_line=2185,.end_line=2191,.example=124,.sec="HTML blocks",
  .html="<div id=\"foo\"\n*hi*\n",
  .markdown="<div id=\"foo\"\n*hi*\n",
},
 
TestCase.{
  .start_line=2194,.end_line=2200,.example=125,.sec="HTML blocks",
  .html="<div class\nfoo\n",
  .markdown="<div class\nfoo\n",
},
 
TestCase.{
  .start_line=2206,.end_line=2212,.example=126,.sec="HTML blocks",
  .html="<div *???-&&&-<---\n*foo*\n",
  .markdown="<div *???-&&&-<---\n*foo*\n",
},
 
TestCase.{
  .start_line=2218,.end_line=2222,.example=127,.sec="HTML blocks",
  .html="<div><a href=\"bar\">*foo*</a></div>\n",
  .markdown="<div><a href=\"bar\">*foo*</a></div>\n",
},
 
TestCase.{
  .start_line=2225,.end_line=2233,.example=128,.sec="HTML blocks",
  .html="<table><tr><td>\nfoo\n</td></tr></table>\n",
  .markdown="<table><tr><td>\nfoo\n</td></tr></table>\n",
},
 
TestCase.{
  .start_line=2242,.end_line=2252,.example=129,.sec="HTML blocks",
  .html="<div></div>\n``` c\nint x = 33;\n```\n",
  .markdown="<div></div>\n``` c\nint x = 33;\n```\n",
},
 
TestCase.{
  .start_line=2259,.end_line=2267,.example=130,.sec="HTML blocks",
  .html="<a href=\"foo\">\n*bar*\n</a>\n",
  .markdown="<a href=\"foo\">\n*bar*\n</a>\n",
},
 
TestCase.{
  .start_line=2272,.end_line=2280,.example=131,.sec="HTML blocks",
  .html="<Warning>\n*bar*\n</Warning>\n",
  .markdown="<Warning>\n*bar*\n</Warning>\n",
},
 
TestCase.{
  .start_line=2283,.end_line=2291,.example=132,.sec="HTML blocks",
  .html="<i class=\"foo\">\n*bar*\n</i>\n",
  .markdown="<i class=\"foo\">\n*bar*\n</i>\n",
},
 
TestCase.{
  .start_line=2294,.end_line=2300,.example=133,.sec="HTML blocks",
  .html="</ins>\n*bar*\n",
  .markdown="</ins>\n*bar*\n",
},
 
TestCase.{
  .start_line=2309,.end_line=2317,.example=134,.sec="HTML blocks",
  .html="<del>\n*foo*\n</del>\n",
  .markdown="<del>\n*foo*\n</del>\n",
},
 
TestCase.{
  .start_line=2324,.end_line=2334,.example=135,.sec="HTML blocks",
  .html="<del>\n<p><em>foo</em></p>\n</del>\n",
  .markdown="<del>\n\n*foo*\n\n</del>\n",
},
 
TestCase.{
  .start_line=2342,.end_line=2346,.example=136,.sec="HTML blocks",
  .html="<p><del><em>foo</em></del></p>\n",
  .markdown="<del>*foo*</del>\n",
},
 
TestCase.{
  .start_line=2358,.end_line=2374,.example=137,.sec="HTML blocks",
  .html="<pre language=\"haskell\"><code>\nimport Text.HTML.TagSoup\n\nmain :: IO ()\nmain = print $ parseTags tags\n</code></pre>\n<p>okay</p>\n",
  .markdown="<pre language=\"haskell\"><code>\nimport Text.HTML.TagSoup\n\nmain :: IO ()\nmain = print $ parseTags tags\n</code></pre>\nokay\n",
},
 
TestCase.{
  .start_line=2379,.end_line=2393,.example=138,.sec="HTML blocks",
  .html="<script type=\"text/javascript\">\n// JavaScript example\n\ndocument.getElementById(\"demo\").innerHTML = \"Hello JavaScript!\";\n</script>\n<p>okay</p>\n",
  .markdown="<script type=\"text/javascript\">\n// JavaScript example\n\ndocument.getElementById(\"demo\").innerHTML = \"Hello JavaScript!\";\n</script>\nokay\n",
},
 
TestCase.{
  .start_line=2398,.end_line=2414,.example=139,.sec="HTML blocks",
  .html="<style\n  type=\"text/css\">\nh1 {color:red;}\n\np {color:blue;}\n</style>\n<p>okay</p>\n",
  .markdown="<style\n  type=\"text/css\">\nh1 {color:red;}\n\np {color:blue;}\n</style>\nokay\n",
},
 
TestCase.{
  .start_line=2421,.end_line=2431,.example=140,.sec="HTML blocks",
  .html="<style\n  type=\"text/css\">\n\nfoo\n",
  .markdown="<style\n  type=\"text/css\">\n\nfoo\n",
},
 
TestCase.{
  .start_line=2434,.end_line=2445,.example=141,.sec="HTML blocks",
  .html="<blockquote>\n<div>\nfoo\n</blockquote>\n<p>bar</p>\n",
  .markdown="> <div>\n> foo\n\nbar\n",
},
 
TestCase.{
  .start_line=2448,.end_line=2458,.example=142,.sec="HTML blocks",
  .html="<ul>\n<li>\n<div>\n</li>\n<li>foo</li>\n</ul>\n",
  .markdown="- <div>\n- foo\n",
},
 
TestCase.{
  .start_line=2463,.end_line=2469,.example=143,.sec="HTML blocks",
  .html="<style>p{color:red;}</style>\n<p><em>foo</em></p>\n",
  .markdown="<style>p{color:red;}</style>\n*foo*\n",
},
 
TestCase.{
  .start_line=2472,.end_line=2478,.example=144,.sec="HTML blocks",
  .html="<!-- foo -->*bar*\n<p><em>baz</em></p>\n",
  .markdown="<!-- foo -->*bar*\n*baz*\n",
},
 
TestCase.{
  .start_line=2484,.end_line=2492,.example=145,.sec="HTML blocks",
  .html="<script>\nfoo\n</script>1. *bar*\n",
  .markdown="<script>\nfoo\n</script>1. *bar*\n",
},
 
TestCase.{
  .start_line=2497,.end_line=2509,.example=146,.sec="HTML blocks",
  .html="<!-- Foo\n\nbar\n   baz -->\n<p>okay</p>\n",
  .markdown="<!-- Foo\n\nbar\n   baz -->\nokay\n",
},
 
TestCase.{
  .start_line=2515,.end_line=2529,.example=147,.sec="HTML blocks",
  .html="<?php\n\n  echo '>';\n\n?>\n<p>okay</p>\n",
  .markdown="<?php\n\n  echo '>';\n\n?>\nokay\n",
},
 
TestCase.{
  .start_line=2534,.end_line=2538,.example=148,.sec="HTML blocks",
  .html="<!DOCTYPE html>\n",
  .markdown="<!DOCTYPE html>\n",
},
 
TestCase.{
  .start_line=2543,.end_line=2571,.example=149,.sec="HTML blocks",
  .html="<![CDATA[\nfunction matchwo(a,b)\n{\n  if (a < b && a < 0) then {\n    return 1;\n\n  } else {\n\n    return 0;\n  }\n}\n]]>\n<p>okay</p>\n",
  .markdown="<![CDATA[\nfunction matchwo(a,b)\n{\n  if (a < b && a < 0) then {\n    return 1;\n\n  } else {\n\n    return 0;\n  }\n}\n]]>\nokay\n",
},
 
TestCase.{
  .start_line=2576,.end_line=2584,.example=150,.sec="HTML blocks",
  .html="  <!-- foo -->\n<pre><code>&lt;!-- foo --&gt;\n</code></pre>\n",
  .markdown="  <!-- foo -->\n\n    <!-- foo -->\n",
},
 
TestCase.{
  .start_line=2587,.end_line=2595,.example=151,.sec="HTML blocks",
  .html="  <div>\n<pre><code>&lt;div&gt;\n</code></pre>\n",
  .markdown="  <div>\n\n    <div>\n",
},
 
TestCase.{
  .start_line=2601,.end_line=2611,.example=152,.sec="HTML blocks",
  .html="<p>Foo</p>\n<div>\nbar\n</div>\n",
  .markdown="Foo\n<div>\nbar\n</div>\n",
},
 
TestCase.{
  .start_line=2617,.end_line=2627,.example=153,.sec="HTML blocks",
  .html="<div>\nbar\n</div>\n*foo*\n",
  .markdown="<div>\nbar\n</div>\n*foo*\n",
},
 
TestCase.{
  .start_line=2632,.end_line=2640,.example=154,.sec="HTML blocks",
  .html="<p>Foo\n<a href=\"bar\">\nbaz</p>\n",
  .markdown="Foo\n<a href=\"bar\">\nbaz\n",
},
 
TestCase.{
  .start_line=2673,.end_line=2683,.example=155,.sec="HTML blocks",
  .html="<div>\n<p><em>Emphasized</em> text.</p>\n</div>\n",
  .markdown="<div>\n\n*Emphasized* text.\n\n</div>\n",
},
 
TestCase.{
  .start_line=2686,.end_line=2694,.example=156,.sec="HTML blocks",
  .html="<div>\n*Emphasized* text.\n</div>\n",
  .markdown="<div>\n*Emphasized* text.\n</div>\n",
},
 
TestCase.{
  .start_line=2708,.end_line=2728,.example=157,.sec="HTML blocks",
  .html="<table>\n<tr>\n<td>\nHi\n</td>\n</tr>\n</table>\n",
  .markdown="<table>\n\n<tr>\n\n<td>\nHi\n</td>\n\n</tr>\n\n</table>\n",
},
 
TestCase.{
  .start_line=2735,.end_line=2756,.example=158,.sec="HTML blocks",
  .html="<table>\n  <tr>\n<pre><code>&lt;td&gt;\n  Hi\n&lt;/td&gt;\n</code></pre>\n  </tr>\n</table>\n",
  .markdown="<table>\n\n  <tr>\n\n    <td>\n      Hi\n    </td>\n\n  </tr>\n\n</table>\n",
},
 
TestCase.{
  .start_line=2783,.end_line=2789,.example=159,.sec="Link reference definitions",
  .html="<p><a href=\"/url\" title=\"title\">foo</a></p>\n",
  .markdown="[foo]: /url \"title\"\n\n[foo]\n",
},
 
TestCase.{
  .start_line=2792,.end_line=2800,.example=160,.sec="Link reference definitions",
  .html="<p><a href=\"/url\" title=\"the title\">foo</a></p>\n",
  .markdown="   [foo]: \n      /url  \n           'the title'  \n\n[foo]\n",
},
 
TestCase.{
  .start_line=2803,.end_line=2809,.example=161,.sec="Link reference definitions",
  .html="<p><a href=\"my_(url)\" title=\"title (with parens)\">Foo*bar]</a></p>\n",
  .markdown="[Foo*bar\\]]:my_(url) 'title (with parens)'\n\n[Foo*bar\\]]\n",
},
 
TestCase.{
  .start_line=2812,.end_line=2820,.example=162,.sec="Link reference definitions",
  .html="<p><a href=\"my%20url\" title=\"title\">Foo bar</a></p>\n",
  .markdown="[Foo bar]:\n<my%20url>\n'title'\n\n[Foo bar]\n",
},
 
TestCase.{
  .start_line=2825,.end_line=2839,.example=163,.sec="Link reference definitions",
  .html="<p><a href=\"/url\" title=\"\ntitle\nline1\nline2\n\">foo</a></p>\n",
  .markdown="[foo]: /url '\ntitle\nline1\nline2\n'\n\n[foo]\n",
},
 
TestCase.{
  .start_line=2844,.end_line=2854,.example=164,.sec="Link reference definitions",
  .html="<p>[foo]: /url 'title</p>\n<p>with blank line'</p>\n<p>[foo]</p>\n",
  .markdown="[foo]: /url 'title\n\nwith blank line'\n\n[foo]\n",
},
 
TestCase.{
  .start_line=2859,.end_line=2866,.example=165,.sec="Link reference definitions",
  .html="<p><a href=\"/url\">foo</a></p>\n",
  .markdown="[foo]:\n/url\n\n[foo]\n",
},
 
TestCase.{
  .start_line=2871,.end_line=2878,.example=166,.sec="Link reference definitions",
  .html="<p>[foo]:</p>\n<p>[foo]</p>\n",
  .markdown="[foo]:\n\n[foo]\n",
},
 
TestCase.{
  .start_line=2884,.end_line=2890,.example=167,.sec="Link reference definitions",
  .html="<p><a href=\"/url%5Cbar*baz\" title=\"foo&quot;bar\\baz\">foo</a></p>\n",
  .markdown="[foo]: /url\\bar\\*baz \"foo\\\"bar\\baz\"\n\n[foo]\n",
},
 
TestCase.{
  .start_line=2895,.end_line=2901,.example=168,.sec="Link reference definitions",
  .html="<p><a href=\"url\">foo</a></p>\n",
  .markdown="[foo]\n\n[foo]: url\n",
},
 
TestCase.{
  .start_line=2907,.end_line=2914,.example=169,.sec="Link reference definitions",
  .html="<p><a href=\"first\">foo</a></p>\n",
  .markdown="[foo]\n\n[foo]: first\n[foo]: second\n",
},
 
TestCase.{
  .start_line=2920,.end_line=2926,.example=170,.sec="Link reference definitions",
  .html="<p><a href=\"/url\">Foo</a></p>\n",
  .markdown="[FOO]: /url\n\n[Foo]\n",
},
 
TestCase.{
  .start_line=2929,.end_line=2935,.example=171,.sec="Link reference definitions",
  .html="<p><a href=\"/%CF%86%CE%BF%CF%85\">αγω</a></p>\n",
  .markdown="[ΑΓΩ]: /φου\n\n[αγω]\n",
},
 
TestCase.{
  .start_line=2941,.end_line=2944,.example=172,.sec="Link reference definitions",
  .html="",
  .markdown="[foo]: /url\n",
},
 
TestCase.{
  .start_line=2949,.end_line=2956,.example=173,.sec="Link reference definitions",
  .html="<p>bar</p>\n",
  .markdown="[\nfoo\n]: /url\nbar\n",
},
 
TestCase.{
  .start_line=2962,.end_line=2966,.example=174,.sec="Link reference definitions",
  .html="<p>[foo]: /url &quot;title&quot; ok</p>\n",
  .markdown="[foo]: /url \"title\" ok\n",
},
 
TestCase.{
  .start_line=2971,.end_line=2976,.example=175,.sec="Link reference definitions",
  .html="<p>&quot;title&quot; ok</p>\n",
  .markdown="[foo]: /url\n\"title\" ok\n",
},
 
TestCase.{
  .start_line=2982,.end_line=2990,.example=176,.sec="Link reference definitions",
  .html="<pre><code>[foo]: /url &quot;title&quot;\n</code></pre>\n<p>[foo]</p>\n",
  .markdown="    [foo]: /url \"title\"\n\n[foo]\n",
},
 
TestCase.{
  .start_line=2996,.end_line=3006,.example=177,.sec="Link reference definitions",
  .html="<pre><code>[foo]: /url\n</code></pre>\n<p>[foo]</p>\n",
  .markdown="```\n[foo]: /url\n```\n\n[foo]\n",
},
 
TestCase.{
  .start_line=3011,.end_line=3020,.example=178,.sec="Link reference definitions",
  .html="<p>Foo\n[bar]: /baz</p>\n<p>[bar]</p>\n",
  .markdown="Foo\n[bar]: /baz\n\n[bar]\n",
},
 
TestCase.{
  .start_line=3026,.end_line=3035,.example=179,.sec="Link reference definitions",
  .html="<h1><a href=\"/url\">Foo</a></h1>\n<blockquote>\n<p>bar</p>\n</blockquote>\n",
  .markdown="# [Foo]\n[foo]: /url\n> bar\n",
},
 
TestCase.{
  .start_line=3041,.end_line=3054,.example=180,.sec="Link reference definitions",
  .html="<p><a href=\"/foo-url\" title=\"foo\">foo</a>,\n<a href=\"/bar-url\" title=\"bar\">bar</a>,\n<a href=\"/baz-url\">baz</a></p>\n",
  .markdown="[foo]: /foo-url \"foo\"\n[bar]: /bar-url\n  \"bar\"\n[baz]: /baz-url\n\n[foo],\n[bar],\n[baz]\n",
},
 
TestCase.{
  .start_line=3062,.end_line=3070,.example=181,.sec="Link reference definitions",
  .html="<p><a href=\"/url\">foo</a></p>\n<blockquote>\n</blockquote>\n",
  .markdown="[foo]\n\n> [foo]: /url\n",
},
 
TestCase.{
  .start_line=3085,.end_line=3092,.example=182,.sec="Paragraphs",
  .html="<p>aaa</p>\n<p>bbb</p>\n",
  .markdown="aaa\n\nbbb\n",
},
 
TestCase.{
  .start_line=3097,.end_line=3108,.example=183,.sec="Paragraphs",
  .html="<p>aaa\nbbb</p>\n<p>ccc\nddd</p>\n",
  .markdown="aaa\nbbb\n\nccc\nddd\n",
},
 
TestCase.{
  .start_line=3113,.end_line=3121,.example=184,.sec="Paragraphs",
  .html="<p>aaa</p>\n<p>bbb</p>\n",
  .markdown="aaa\n\n\nbbb\n",
},
 
TestCase.{
  .start_line=3126,.end_line=3132,.example=185,.sec="Paragraphs",
  .html="<p>aaa\nbbb</p>\n",
  .markdown="  aaa\n bbb\n",
},
 
TestCase.{
  .start_line=3138,.end_line=3146,.example=186,.sec="Paragraphs",
  .html="<p>aaa\nbbb\nccc</p>\n",
  .markdown="aaa\n             bbb\n                                       ccc\n",
},
 
TestCase.{
  .start_line=3152,.end_line=3158,.example=187,.sec="Paragraphs",
  .html="<p>aaa\nbbb</p>\n",
  .markdown="   aaa\nbbb\n",
},
 
TestCase.{
  .start_line=3161,.end_line=3168,.example=188,.sec="Paragraphs",
  .html="<pre><code>aaa\n</code></pre>\n<p>bbb</p>\n",
  .markdown="    aaa\nbbb\n",
},
 
TestCase.{
  .start_line=3175,.end_line=3181,.example=189,.sec="Paragraphs",
  .html="<p>aaa<br />\nbbb</p>\n",
  .markdown="aaa     \nbbb     \n",
},
 
TestCase.{
  .start_line=3192,.end_line=3204,.example=190,.sec="Blank lines",
  .html="<p>aaa</p>\n<h1>aaa</h1>\n",
  .markdown="  \n\naaa\n  \n\n# aaa\n\n  \n",
},
 
TestCase.{
  .start_line=3258,.end_line=3268,.example=191,.sec="Block quotes",
  .html="<blockquote>\n<h1>Foo</h1>\n<p>bar\nbaz</p>\n</blockquote>\n",
  .markdown="> # Foo\n> bar\n> baz\n",
},
 
TestCase.{
  .start_line=3273,.end_line=3283,.example=192,.sec="Block quotes",
  .html="<blockquote>\n<h1>Foo</h1>\n<p>bar\nbaz</p>\n</blockquote>\n",
  .markdown="># Foo\n>bar\n> baz\n",
},
 
TestCase.{
  .start_line=3288,.end_line=3298,.example=193,.sec="Block quotes",
  .html="<blockquote>\n<h1>Foo</h1>\n<p>bar\nbaz</p>\n</blockquote>\n",
  .markdown="   > # Foo\n   > bar\n > baz\n",
},
 
TestCase.{
  .start_line=3303,.end_line=3312,.example=194,.sec="Block quotes",
  .html="<pre><code>&gt; # Foo\n&gt; bar\n&gt; baz\n</code></pre>\n",
  .markdown="    > # Foo\n    > bar\n    > baz\n",
},
 
TestCase.{
  .start_line=3318,.end_line=3328,.example=195,.sec="Block quotes",
  .html="<blockquote>\n<h1>Foo</h1>\n<p>bar\nbaz</p>\n</blockquote>\n",
  .markdown="> # Foo\n> bar\nbaz\n",
},
 
TestCase.{
  .start_line=3334,.end_line=3344,.example=196,.sec="Block quotes",
  .html="<blockquote>\n<p>bar\nbaz\nfoo</p>\n</blockquote>\n",
  .markdown="> bar\nbaz\n> foo\n",
},
 
TestCase.{
  .start_line=3358,.end_line=3366,.example=197,.sec="Block quotes",
  .html="<blockquote>\n<p>foo</p>\n</blockquote>\n<hr />\n",
  .markdown="> foo\n---\n",
},
 
TestCase.{
  .start_line=3378,.end_line=3390,.example=198,.sec="Block quotes",
  .html="<blockquote>\n<ul>\n<li>foo</li>\n</ul>\n</blockquote>\n<ul>\n<li>bar</li>\n</ul>\n",
  .markdown="> - foo\n- bar\n",
},
 
TestCase.{
  .start_line=3396,.end_line=3406,.example=199,.sec="Block quotes",
  .html="<blockquote>\n<pre><code>foo\n</code></pre>\n</blockquote>\n<pre><code>bar\n</code></pre>\n",
  .markdown=">     foo\n    bar\n",
},
 
TestCase.{
  .start_line=3409,.end_line=3419,.example=200,.sec="Block quotes",
  .html="<blockquote>\n<pre><code></code></pre>\n</blockquote>\n<p>foo</p>\n<pre><code></code></pre>\n",
  .markdown="> ```\nfoo\n```\n",
},
 
TestCase.{
  .start_line=3425,.end_line=3433,.example=201,.sec="Block quotes",
  .html="<blockquote>\n<p>foo\n- bar</p>\n</blockquote>\n",
  .markdown="> foo\n    - bar\n",
},
 
TestCase.{
  .start_line=3449,.end_line=3454,.example=202,.sec="Block quotes",
  .html="<blockquote>\n</blockquote>\n",
  .markdown=">\n",
},
 
TestCase.{
  .start_line=3457,.end_line=3464,.example=203,.sec="Block quotes",
  .html="<blockquote>\n</blockquote>\n",
  .markdown=">\n>  \n> \n",
},
 
TestCase.{
  .start_line=3469,.end_line=3477,.example=204,.sec="Block quotes",
  .html="<blockquote>\n<p>foo</p>\n</blockquote>\n",
  .markdown=">\n> foo\n>  \n",
},
 
TestCase.{
  .start_line=3482,.end_line=3493,.example=205,.sec="Block quotes",
  .html="<blockquote>\n<p>foo</p>\n</blockquote>\n<blockquote>\n<p>bar</p>\n</blockquote>\n",
  .markdown="> foo\n\n> bar\n",
},
 
TestCase.{
  .start_line=3504,.end_line=3512,.example=206,.sec="Block quotes",
  .html="<blockquote>\n<p>foo\nbar</p>\n</blockquote>\n",
  .markdown="> foo\n> bar\n",
},
 
TestCase.{
  .start_line=3517,.end_line=3526,.example=207,.sec="Block quotes",
  .html="<blockquote>\n<p>foo</p>\n<p>bar</p>\n</blockquote>\n",
  .markdown="> foo\n>\n> bar\n",
},
 
TestCase.{
  .start_line=3531,.end_line=3539,.example=208,.sec="Block quotes",
  .html="<p>foo</p>\n<blockquote>\n<p>bar</p>\n</blockquote>\n",
  .markdown="foo\n> bar\n",
},
 
TestCase.{
  .start_line=3545,.end_line=3557,.example=209,.sec="Block quotes",
  .html="<blockquote>\n<p>aaa</p>\n</blockquote>\n<hr />\n<blockquote>\n<p>bbb</p>\n</blockquote>\n",
  .markdown="> aaa\n***\n> bbb\n",
},
 
TestCase.{
  .start_line=3563,.end_line=3571,.example=210,.sec="Block quotes",
  .html="<blockquote>\n<p>bar\nbaz</p>\n</blockquote>\n",
  .markdown="> bar\nbaz\n",
},
 
TestCase.{
  .start_line=3574,.end_line=3583,.example=211,.sec="Block quotes",
  .html="<blockquote>\n<p>bar</p>\n</blockquote>\n<p>baz</p>\n",
  .markdown="> bar\n\nbaz\n",
},
 
TestCase.{
  .start_line=3586,.end_line=3595,.example=212,.sec="Block quotes",
  .html="<blockquote>\n<p>bar</p>\n</blockquote>\n<p>baz</p>\n",
  .markdown="> bar\n>\nbaz\n",
},
 
TestCase.{
  .start_line=3602,.end_line=3614,.example=213,.sec="Block quotes",
  .html="<blockquote>\n<blockquote>\n<blockquote>\n<p>foo\nbar</p>\n</blockquote>\n</blockquote>\n</blockquote>\n",
  .markdown="> > > foo\nbar\n",
},
 
TestCase.{
  .start_line=3617,.end_line=3631,.example=214,.sec="Block quotes",
  .html="<blockquote>\n<blockquote>\n<blockquote>\n<p>foo\nbar\nbaz</p>\n</blockquote>\n</blockquote>\n</blockquote>\n",
  .markdown=">>> foo\n> bar\n>>baz\n",
},
 
TestCase.{
  .start_line=3639,.end_line=3651,.example=215,.sec="Block quotes",
  .html="<blockquote>\n<pre><code>code\n</code></pre>\n</blockquote>\n<blockquote>\n<p>not code</p>\n</blockquote>\n",
  .markdown=">     code\n\n>    not code\n",
},
 
TestCase.{
  .start_line=3694,.end_line=3709,.example=216,.sec="List items",
  .html="<p>A paragraph\nwith two lines.</p>\n<pre><code>indented code\n</code></pre>\n<blockquote>\n<p>A block quote.</p>\n</blockquote>\n",
  .markdown="A paragraph\nwith two lines.\n\n    indented code\n\n> A block quote.\n",
},
 
TestCase.{
  .start_line=3716,.end_line=3735,.example=217,.sec="List items",
  .html="<ol>\n<li>\n<p>A paragraph\nwith two lines.</p>\n<pre><code>indented code\n</code></pre>\n<blockquote>\n<p>A block quote.</p>\n</blockquote>\n</li>\n</ol>\n",
  .markdown="1.  A paragraph\n    with two lines.\n\n        indented code\n\n    > A block quote.\n",
},
 
TestCase.{
  .start_line=3749,.end_line=3758,.example=218,.sec="List items",
  .html="<ul>\n<li>one</li>\n</ul>\n<p>two</p>\n",
  .markdown="- one\n\n two\n",
},
 
TestCase.{
  .start_line=3761,.end_line=3772,.example=219,.sec="List items",
  .html="<ul>\n<li>\n<p>one</p>\n<p>two</p>\n</li>\n</ul>\n",
  .markdown="- one\n\n  two\n",
},
 
TestCase.{
  .start_line=3775,.end_line=3785,.example=220,.sec="List items",
  .html="<ul>\n<li>one</li>\n</ul>\n<pre><code> two\n</code></pre>\n",
  .markdown=" -    one\n\n     two\n",
},
 
TestCase.{
  .start_line=3788,.end_line=3799,.example=221,.sec="List items",
  .html="<ul>\n<li>\n<p>one</p>\n<p>two</p>\n</li>\n</ul>\n",
  .markdown=" -    one\n\n      two\n",
},
 
TestCase.{
  .start_line=3810,.end_line=3825,.example=222,.sec="List items",
  .html="<blockquote>\n<blockquote>\n<ol>\n<li>\n<p>one</p>\n<p>two</p>\n</li>\n</ol>\n</blockquote>\n</blockquote>\n",
  .markdown="   > > 1.  one\n>>\n>>     two\n",
},
 
TestCase.{
  .start_line=3837,.end_line=3850,.example=223,.sec="List items",
  .html="<blockquote>\n<blockquote>\n<ul>\n<li>one</li>\n</ul>\n<p>two</p>\n</blockquote>\n</blockquote>\n",
  .markdown=">>- one\n>>\n  >  > two\n",
},
 
TestCase.{
  .start_line=3856,.end_line=3863,.example=224,.sec="List items",
  .html="<p>-one</p>\n<p>2.two</p>\n",
  .markdown="-one\n\n2.two\n",
},
 
TestCase.{
  .start_line=3869,.end_line=3881,.example=225,.sec="List items",
  .html="<ul>\n<li>\n<p>foo</p>\n<p>bar</p>\n</li>\n</ul>\n",
  .markdown="- foo\n\n\n  bar\n",
},
 
TestCase.{
  .start_line=3886,.end_line=3908,.example=226,.sec="List items",
  .html="<ol>\n<li>\n<p>foo</p>\n<pre><code>bar\n</code></pre>\n<p>baz</p>\n<blockquote>\n<p>bam</p>\n</blockquote>\n</li>\n</ol>\n",
  .markdown="1.  foo\n\n    ```\n    bar\n    ```\n\n    baz\n\n    > bam\n",
},
 
TestCase.{
  .start_line=3914,.end_line=3932,.example=227,.sec="List items",
  .html="<ul>\n<li>\n<p>Foo</p>\n<pre><code>bar\n\n\nbaz\n</code></pre>\n</li>\n</ul>\n",
  .markdown="- Foo\n\n      bar\n\n\n      baz\n",
},
 
TestCase.{
  .start_line=3936,.end_line=3942,.example=228,.sec="List items",
  .html="<ol start=\"123456789\">\n<li>ok</li>\n</ol>\n",
  .markdown="123456789. ok\n",
},
 
TestCase.{
  .start_line=3945,.end_line=3949,.example=229,.sec="List items",
  .html="<p>1234567890. not ok</p>\n",
  .markdown="1234567890. not ok\n",
},
 
TestCase.{
  .start_line=3954,.end_line=3960,.example=230,.sec="List items",
  .html="<ol start=\"0\">\n<li>ok</li>\n</ol>\n",
  .markdown="0. ok\n",
},
 
TestCase.{
  .start_line=3963,.end_line=3969,.example=231,.sec="List items",
  .html="<ol start=\"3\">\n<li>ok</li>\n</ol>\n",
  .markdown="003. ok\n",
},
 
TestCase.{
  .start_line=3974,.end_line=3978,.example=232,.sec="List items",
  .html="<p>-1. not ok</p>\n",
  .markdown="-1. not ok\n",
},
 
TestCase.{
  .start_line=3998,.end_line=4010,.example=233,.sec="List items",
  .html="<ul>\n<li>\n<p>foo</p>\n<pre><code>bar\n</code></pre>\n</li>\n</ul>\n",
  .markdown="- foo\n\n      bar\n",
},
 
TestCase.{
  .start_line=4015,.end_line=4027,.example=234,.sec="List items",
  .html="<ol start=\"10\">\n<li>\n<p>foo</p>\n<pre><code>bar\n</code></pre>\n</li>\n</ol>\n",
  .markdown="  10.  foo\n\n           bar\n",
},
 
TestCase.{
  .start_line=4034,.end_line=4046,.example=235,.sec="List items",
  .html="<pre><code>indented code\n</code></pre>\n<p>paragraph</p>\n<pre><code>more code\n</code></pre>\n",
  .markdown="    indented code\n\nparagraph\n\n    more code\n",
},
 
TestCase.{
  .start_line=4049,.end_line=4065,.example=236,.sec="List items",
  .html="<ol>\n<li>\n<pre><code>indented code\n</code></pre>\n<p>paragraph</p>\n<pre><code>more code\n</code></pre>\n</li>\n</ol>\n",
  .markdown="1.     indented code\n\n   paragraph\n\n       more code\n",
},
 
TestCase.{
  .start_line=4071,.end_line=4087,.example=237,.sec="List items",
  .html="<ol>\n<li>\n<pre><code> indented code\n</code></pre>\n<p>paragraph</p>\n<pre><code>more code\n</code></pre>\n</li>\n</ol>\n",
  .markdown="1.      indented code\n\n   paragraph\n\n       more code\n",
},
 
TestCase.{
  .start_line=4098,.end_line=4105,.example=238,.sec="List items",
  .html="<p>foo</p>\n<p>bar</p>\n",
  .markdown="   foo\n\nbar\n",
},
 
TestCase.{
  .start_line=4108,.end_line=4117,.example=239,.sec="List items",
  .html="<ul>\n<li>foo</li>\n</ul>\n<p>bar</p>\n",
  .markdown="-    foo\n\n  bar\n",
},
 
TestCase.{
  .start_line=4125,.end_line=4136,.example=240,.sec="List items",
  .html="<ul>\n<li>\n<p>foo</p>\n<p>bar</p>\n</li>\n</ul>\n",
  .markdown="-  foo\n\n   bar\n",
},
 
TestCase.{
  .start_line=4153,.end_line=4174,.example=241,.sec="List items",
  .html="<ul>\n<li>foo</li>\n<li>\n<pre><code>bar\n</code></pre>\n</li>\n<li>\n<pre><code>baz\n</code></pre>\n</li>\n</ul>\n",
  .markdown="-\n  foo\n-\n  ```\n  bar\n  ```\n-\n      baz\n",
},
 
TestCase.{
  .start_line=4179,.end_line=4186,.example=242,.sec="List items",
  .html="<ul>\n<li>foo</li>\n</ul>\n",
  .markdown="-   \n  foo\n",
},
 
TestCase.{
  .start_line=4193,.end_line=4202,.example=243,.sec="List items",
  .html="<ul>\n<li></li>\n</ul>\n<p>foo</p>\n",
  .markdown="-\n\n  foo\n",
},
 
TestCase.{
  .start_line=4207,.end_line=4217,.example=244,.sec="List items",
  .html="<ul>\n<li>foo</li>\n<li></li>\n<li>bar</li>\n</ul>\n",
  .markdown="- foo\n-\n- bar\n",
},
 
TestCase.{
  .start_line=4222,.end_line=4232,.example=245,.sec="List items",
  .html="<ul>\n<li>foo</li>\n<li></li>\n<li>bar</li>\n</ul>\n",
  .markdown="- foo\n-   \n- bar\n",
},
 
TestCase.{
  .start_line=4237,.end_line=4247,.example=246,.sec="List items",
  .html="<ol>\n<li>foo</li>\n<li></li>\n<li>bar</li>\n</ol>\n",
  .markdown="1. foo\n2.\n3. bar\n",
},
 
TestCase.{
  .start_line=4252,.end_line=4258,.example=247,.sec="List items",
  .html="<ul>\n<li></li>\n</ul>\n",
  .markdown="*\n",
},
 
TestCase.{
  .start_line=4262,.end_line=4273,.example=248,.sec="List items",
  .html="<p>foo\n*</p>\n<p>foo\n1.</p>\n",
  .markdown="foo\n*\n\nfoo\n1.\n",
},
 
TestCase.{
  .start_line=4284,.end_line=4303,.example=249,.sec="List items",
  .html="<ol>\n<li>\n<p>A paragraph\nwith two lines.</p>\n<pre><code>indented code\n</code></pre>\n<blockquote>\n<p>A block quote.</p>\n</blockquote>\n</li>\n</ol>\n",
  .markdown=" 1.  A paragraph\n     with two lines.\n\n         indented code\n\n     > A block quote.\n",
},
 
TestCase.{
  .start_line=4308,.end_line=4327,.example=250,.sec="List items",
  .html="<ol>\n<li>\n<p>A paragraph\nwith two lines.</p>\n<pre><code>indented code\n</code></pre>\n<blockquote>\n<p>A block quote.</p>\n</blockquote>\n</li>\n</ol>\n",
  .markdown="  1.  A paragraph\n      with two lines.\n\n          indented code\n\n      > A block quote.\n",
},
 
TestCase.{
  .start_line=4332,.end_line=4351,.example=251,.sec="List items",
  .html="<ol>\n<li>\n<p>A paragraph\nwith two lines.</p>\n<pre><code>indented code\n</code></pre>\n<blockquote>\n<p>A block quote.</p>\n</blockquote>\n</li>\n</ol>\n",
  .markdown="   1.  A paragraph\n       with two lines.\n\n           indented code\n\n       > A block quote.\n",
},
 
TestCase.{
  .start_line=4356,.end_line=4371,.example=252,.sec="List items",
  .html="<pre><code>1.  A paragraph\n    with two lines.\n\n        indented code\n\n    &gt; A block quote.\n</code></pre>\n",
  .markdown="    1.  A paragraph\n        with two lines.\n\n            indented code\n\n        > A block quote.\n",
},
 
TestCase.{
  .start_line=4386,.end_line=4405,.example=253,.sec="List items",
  .html="<ol>\n<li>\n<p>A paragraph\nwith two lines.</p>\n<pre><code>indented code\n</code></pre>\n<blockquote>\n<p>A block quote.</p>\n</blockquote>\n</li>\n</ol>\n",
  .markdown="  1.  A paragraph\nwith two lines.\n\n          indented code\n\n      > A block quote.\n",
},
 
TestCase.{
  .start_line=4410,.end_line=4418,.example=254,.sec="List items",
  .html="<ol>\n<li>A paragraph\nwith two lines.</li>\n</ol>\n",
  .markdown="  1.  A paragraph\n    with two lines.\n",
},
 
TestCase.{
  .start_line=4423,.end_line=4437,.example=255,.sec="List items",
  .html="<blockquote>\n<ol>\n<li>\n<blockquote>\n<p>Blockquote\ncontinued here.</p>\n</blockquote>\n</li>\n</ol>\n</blockquote>\n",
  .markdown="> 1. > Blockquote\ncontinued here.\n",
},
 
TestCase.{
  .start_line=4440,.end_line=4454,.example=256,.sec="List items",
  .html="<blockquote>\n<ol>\n<li>\n<blockquote>\n<p>Blockquote\ncontinued here.</p>\n</blockquote>\n</li>\n</ol>\n</blockquote>\n",
  .markdown="> 1. > Blockquote\n> continued here.\n",
},
 
TestCase.{
  .start_line=4467,.end_line=4488,.example=257,.sec="List items",
  .html="<ul>\n<li>foo\n<ul>\n<li>bar\n<ul>\n<li>baz\n<ul>\n<li>boo</li>\n</ul>\n</li>\n</ul>\n</li>\n</ul>\n</li>\n</ul>\n",
  .markdown="- foo\n  - bar\n    - baz\n      - boo\n",
},
 
TestCase.{
  .start_line=4493,.end_line=4505,.example=258,.sec="List items",
  .html="<ul>\n<li>foo</li>\n<li>bar</li>\n<li>baz</li>\n<li>boo</li>\n</ul>\n",
  .markdown="- foo\n - bar\n  - baz\n   - boo\n",
},
 
TestCase.{
  .start_line=4510,.end_line=4521,.example=259,.sec="List items",
  .html="<ol start=\"10\">\n<li>foo\n<ul>\n<li>bar</li>\n</ul>\n</li>\n</ol>\n",
  .markdown="10) foo\n    - bar\n",
},
 
TestCase.{
  .start_line=4526,.end_line=4536,.example=260,.sec="List items",
  .html="<ol start=\"10\">\n<li>foo</li>\n</ol>\n<ul>\n<li>bar</li>\n</ul>\n",
  .markdown="10) foo\n   - bar\n",
},
 
TestCase.{
  .start_line=4541,.end_line=4551,.example=261,.sec="List items",
  .html="<ul>\n<li>\n<ul>\n<li>foo</li>\n</ul>\n</li>\n</ul>\n",
  .markdown="- - foo\n",
},
 
TestCase.{
  .start_line=4554,.end_line=4568,.example=262,.sec="List items",
  .html="<ol>\n<li>\n<ul>\n<li>\n<ol start=\"2\">\n<li>foo</li>\n</ol>\n</li>\n</ul>\n</li>\n</ol>\n",
  .markdown="1. - 2. foo\n",
},
 
TestCase.{
  .start_line=4573,.end_line=4587,.example=263,.sec="List items",
  .html="<ul>\n<li>\n<h1>Foo</h1>\n</li>\n<li>\n<h2>Bar</h2>\nbaz</li>\n</ul>\n",
  .markdown="- # Foo\n- Bar\n  ---\n  baz\n",
},
 
TestCase.{
  .start_line=4809,.end_line=4821,.example=264,.sec="Lists",
  .html="<ul>\n<li>foo</li>\n<li>bar</li>\n</ul>\n<ul>\n<li>baz</li>\n</ul>\n",
  .markdown="- foo\n- bar\n+ baz\n",
},
 
TestCase.{
  .start_line=4824,.end_line=4836,.example=265,.sec="Lists",
  .html="<ol>\n<li>foo</li>\n<li>bar</li>\n</ol>\n<ol start=\"3\">\n<li>baz</li>\n</ol>\n",
  .markdown="1. foo\n2. bar\n3) baz\n",
},
 
TestCase.{
  .start_line=4843,.end_line=4853,.example=266,.sec="Lists",
  .html="<p>Foo</p>\n<ul>\n<li>bar</li>\n<li>baz</li>\n</ul>\n",
  .markdown="Foo\n- bar\n- baz\n",
},
 
TestCase.{
  .start_line=4920,.end_line=4926,.example=267,.sec="Lists",
  .html="<p>The number of windows in my house is\n14.  The number of doors is 6.</p>\n",
  .markdown="The number of windows in my house is\n14.  The number of doors is 6.\n",
},
 
TestCase.{
  .start_line=4930,.end_line=4938,.example=268,.sec="Lists",
  .html="<p>The number of windows in my house is</p>\n<ol>\n<li>The number of doors is 6.</li>\n</ol>\n",
  .markdown="The number of windows in my house is\n1.  The number of doors is 6.\n",
},
 
TestCase.{
  .start_line=4944,.end_line=4963,.example=269,.sec="Lists",
  .html="<ul>\n<li>\n<p>foo</p>\n</li>\n<li>\n<p>bar</p>\n</li>\n<li>\n<p>baz</p>\n</li>\n</ul>\n",
  .markdown="- foo\n\n- bar\n\n\n- baz\n",
},
 
TestCase.{
  .start_line=4965,.end_line=4987,.example=270,.sec="Lists",
  .html="<ul>\n<li>foo\n<ul>\n<li>bar\n<ul>\n<li>\n<p>baz</p>\n<p>bim</p>\n</li>\n</ul>\n</li>\n</ul>\n</li>\n</ul>\n",
  .markdown="- foo\n  - bar\n    - baz\n\n\n      bim\n",
},
 
TestCase.{
  .start_line=4995,.end_line=5013,.example=271,.sec="Lists",
  .html="<ul>\n<li>foo</li>\n<li>bar</li>\n</ul>\n<!-- -->\n<ul>\n<li>baz</li>\n<li>bim</li>\n</ul>\n",
  .markdown="- foo\n- bar\n\n<!-- -->\n\n- baz\n- bim\n",
},
 
TestCase.{
  .start_line=5016,.end_line=5039,.example=272,.sec="Lists",
  .html="<ul>\n<li>\n<p>foo</p>\n<p>notcode</p>\n</li>\n<li>\n<p>foo</p>\n</li>\n</ul>\n<!-- -->\n<pre><code>code\n</code></pre>\n",
  .markdown="-   foo\n\n    notcode\n\n-   foo\n\n<!-- -->\n\n    code\n",
},
 
TestCase.{
  .start_line=5047,.end_line=5069,.example=273,.sec="Lists",
  .html="<ul>\n<li>a</li>\n<li>b</li>\n<li>c</li>\n<li>d</li>\n<li>e</li>\n<li>f</li>\n<li>g</li>\n<li>h</li>\n<li>i</li>\n</ul>\n",
  .markdown="- a\n - b\n  - c\n   - d\n    - e\n   - f\n  - g\n - h\n- i\n",
},
 
TestCase.{
  .start_line=5072,.end_line=5090,.example=274,.sec="Lists",
  .html="<ol>\n<li>\n<p>a</p>\n</li>\n<li>\n<p>b</p>\n</li>\n<li>\n<p>c</p>\n</li>\n</ol>\n",
  .markdown="1. a\n\n  2. b\n\n    3. c\n",
},
 
TestCase.{
  .start_line=5096,.end_line=5113,.example=275,.sec="Lists",
  .html="<ul>\n<li>\n<p>a</p>\n</li>\n<li>\n<p>b</p>\n</li>\n<li>\n<p>c</p>\n</li>\n</ul>\n",
  .markdown="- a\n- b\n\n- c\n",
},
 
TestCase.{
  .start_line=5118,.end_line=5133,.example=276,.sec="Lists",
  .html="<ul>\n<li>\n<p>a</p>\n</li>\n<li></li>\n<li>\n<p>c</p>\n</li>\n</ul>\n",
  .markdown="* a\n*\n\n* c\n",
},
 
TestCase.{
  .start_line=5140,.end_line=5159,.example=277,.sec="Lists",
  .html="<ul>\n<li>\n<p>a</p>\n</li>\n<li>\n<p>b</p>\n<p>c</p>\n</li>\n<li>\n<p>d</p>\n</li>\n</ul>\n",
  .markdown="- a\n- b\n\n  c\n- d\n",
},
 
TestCase.{
  .start_line=5162,.end_line=5180,.example=278,.sec="Lists",
  .html="<ul>\n<li>\n<p>a</p>\n</li>\n<li>\n<p>b</p>\n</li>\n<li>\n<p>d</p>\n</li>\n</ul>\n",
  .markdown="- a\n- b\n\n  [ref]: /url\n- d\n",
},
 
TestCase.{
  .start_line=5185,.end_line=5204,.example=279,.sec="Lists",
  .html="<ul>\n<li>a</li>\n<li>\n<pre><code>b\n\n\n</code></pre>\n</li>\n<li>c</li>\n</ul>\n",
  .markdown="- a\n- ```\n  b\n\n\n  ```\n- c\n",
},
 
TestCase.{
  .start_line=5211,.end_line=5229,.example=280,.sec="Lists",
  .html="<ul>\n<li>a\n<ul>\n<li>\n<p>b</p>\n<p>c</p>\n</li>\n</ul>\n</li>\n<li>d</li>\n</ul>\n",
  .markdown="- a\n  - b\n\n    c\n- d\n",
},
 
TestCase.{
  .start_line=5235,.end_line=5249,.example=281,.sec="Lists",
  .html="<ul>\n<li>a\n<blockquote>\n<p>b</p>\n</blockquote>\n</li>\n<li>c</li>\n</ul>\n",
  .markdown="* a\n  > b\n  >\n* c\n",
},
 
TestCase.{
  .start_line=5255,.end_line=5273,.example=282,.sec="Lists",
  .html="<ul>\n<li>a\n<blockquote>\n<p>b</p>\n</blockquote>\n<pre><code>c\n</code></pre>\n</li>\n<li>d</li>\n</ul>\n",
  .markdown="- a\n  > b\n  ```\n  c\n  ```\n- d\n",
},
 
TestCase.{
  .start_line=5278,.end_line=5284,.example=283,.sec="Lists",
  .html="<ul>\n<li>a</li>\n</ul>\n",
  .markdown="- a\n",
},
 
TestCase.{
  .start_line=5287,.end_line=5298,.example=284,.sec="Lists",
  .html="<ul>\n<li>a\n<ul>\n<li>b</li>\n</ul>\n</li>\n</ul>\n",
  .markdown="- a\n  - b\n",
},
 
TestCase.{
  .start_line=5304,.end_line=5318,.example=285,.sec="Lists",
  .html="<ol>\n<li>\n<pre><code>foo\n</code></pre>\n<p>bar</p>\n</li>\n</ol>\n",
  .markdown="1. ```\n   foo\n   ```\n\n   bar\n",
},
 
TestCase.{
  .start_line=5323,.end_line=5338,.example=286,.sec="Lists",
  .html="<ul>\n<li>\n<p>foo</p>\n<ul>\n<li>bar</li>\n</ul>\n<p>baz</p>\n</li>\n</ul>\n",
  .markdown="* foo\n  * bar\n\n  baz\n",
},
 
TestCase.{
  .start_line=5341,.end_line=5366,.example=287,.sec="Lists",
  .html="<ul>\n<li>\n<p>a</p>\n<ul>\n<li>b</li>\n<li>c</li>\n</ul>\n</li>\n<li>\n<p>d</p>\n<ul>\n<li>e</li>\n<li>f</li>\n</ul>\n</li>\n</ul>\n",
  .markdown="- a\n  - b\n  - c\n\n- d\n  - e\n  - f\n",
},
 
TestCase.{
  .start_line=5375,.end_line=5379,.example=288,.sec="Inlines",
  .html="<p><code>hi</code>lo`</p>\n",
  .markdown="`hi`lo`\n",
},
 
TestCase.{
  .start_line=5389,.end_line=5393,.example=289,.sec="Backslash escapes",
  .html="<p>!&quot;#$%&amp;'()*+,-./:;&lt;=&gt;?@[\\]^_`{|}~</p>\n",
  .markdown="\\!\\\"\\#\\$\\%\\&\\'\\(\\)\\*\\+\\,\\-\\.\\/\\:\\;\\<\\=\\>\\?\\@\\[\\\\\\]\\^\\_\\`\\{\\|\\}\\~\n",
},
 
TestCase.{
  .start_line=5399,.end_line=5403,.example=290,.sec="Backslash escapes",
  .html="<p>\\\t\\A\\a\\ \\3\\φ\\«</p>\n",
  .markdown="\\\t\\A\\a\\ \\3\\φ\\«\n",
},
 
TestCase.{
  .start_line=5409,.end_line=5427,.example=291,.sec="Backslash escapes",
  .html="<p>*not emphasized*\n&lt;br/&gt; not a tag\n[not a link](/foo)\n`not code`\n1. not a list\n* not a list\n# not a heading\n[foo]: /url &quot;not a reference&quot;</p>\n",
  .markdown="\\*not emphasized*\n\\<br/> not a tag\n\\[not a link](/foo)\n\\`not code`\n1\\. not a list\n\\* not a list\n\\# not a heading\n\\[foo]: /url \"not a reference\"\n",
},
 
TestCase.{
  .start_line=5432,.end_line=5436,.example=292,.sec="Backslash escapes",
  .html="<p>\\<em>emphasis</em></p>\n",
  .markdown="\\\\*emphasis*\n",
},
 
TestCase.{
  .start_line=5441,.end_line=5447,.example=293,.sec="Backslash escapes",
  .html="<p>foo<br />\nbar</p>\n",
  .markdown="foo\\\nbar\n",
},
 
TestCase.{
  .start_line=5453,.end_line=5457,.example=294,.sec="Backslash escapes",
  .html="<p><code>\\[\\`</code></p>\n",
  .markdown="`` \\[\\` ``\n",
},
 
TestCase.{
  .start_line=5460,.end_line=5465,.example=295,.sec="Backslash escapes",
  .html="<pre><code>\\[\\]\n</code></pre>\n",
  .markdown="    \\[\\]\n",
},
 
TestCase.{
  .start_line=5468,.end_line=5475,.example=296,.sec="Backslash escapes",
  .html="<pre><code>\\[\\]\n</code></pre>\n",
  .markdown="~~~\n\\[\\]\n~~~\n",
},
 
TestCase.{
  .start_line=5478,.end_line=5482,.example=297,.sec="Backslash escapes",
  .html="<p><a href=\"http://example.com?find=%5C*\">http://example.com?find=\\*</a></p>\n",
  .markdown="<http://example.com?find=\\*>\n",
},
 
TestCase.{
  .start_line=5485,.end_line=5489,.example=298,.sec="Backslash escapes",
  .html="<a href=\"/bar\\/)\">\n",
  .markdown="<a href=\"/bar\\/)\">\n",
},
 
TestCase.{
  .start_line=5495,.end_line=5499,.example=299,.sec="Backslash escapes",
  .html="<p><a href=\"/bar*\" title=\"ti*tle\">foo</a></p>\n",
  .markdown="[foo](/bar\\* \"ti\\*tle\")\n",
},
 
TestCase.{
  .start_line=5502,.end_line=5508,.example=300,.sec="Backslash escapes",
  .html="<p><a href=\"/bar*\" title=\"ti*tle\">foo</a></p>\n",
  .markdown="[foo]\n\n[foo]: /bar\\* \"ti\\*tle\"\n",
},
 
TestCase.{
  .start_line=5511,.end_line=5518,.example=301,.sec="Backslash escapes",
  .html="<pre><code class=\"language-foo+bar\">foo\n</code></pre>\n",
  .markdown="``` foo\\+bar\nfoo\n```\n",
},
 
TestCase.{
  .start_line=5538,.end_line=5546,.example=302,.sec="Entity and numeric character references",
  .html="<p>\u00a0 &amp; © Æ Ď\n¾ ℋ ⅆ\n∲ ≧̸</p>\n",
  .markdown="&nbsp; &amp; &copy; &AElig; &Dcaron;\n&frac34; &HilbertSpace; &DifferentialD;\n&ClockwiseContourIntegral; &ngE;\n",
},
 
TestCase.{
  .start_line=5557,.end_line=5561,.example=303,.sec="Entity and numeric character references",
  .html="<p># Ӓ Ϡ � �</p>\n",
  .markdown="&#35; &#1234; &#992; &#98765432; &#0;\n",
},
 
TestCase.{
  .start_line=5570,.end_line=5574,.example=304,.sec="Entity and numeric character references",
  .html="<p>&quot; ആ ಫ</p>\n",
  .markdown="&#X22; &#XD06; &#xcab;\n",
},
 
TestCase.{
  .start_line=5579,.end_line=5585,.example=305,.sec="Entity and numeric character references",
  .html="<p>&amp;nbsp &amp;x; &amp;#; &amp;#x;\n&amp;ThisIsNotDefined; &amp;hi?;</p>\n",
  .markdown="&nbsp &x; &#; &#x;\n&ThisIsNotDefined; &hi?;\n",
},
 
TestCase.{
  .start_line=5592,.end_line=5596,.example=306,.sec="Entity and numeric character references",
  .html="<p>&amp;copy</p>\n",
  .markdown="&copy\n",
},
 
TestCase.{
  .start_line=5602,.end_line=5606,.example=307,.sec="Entity and numeric character references",
  .html="<p>&amp;MadeUpEntity;</p>\n",
  .markdown="&MadeUpEntity;\n",
},
 
TestCase.{
  .start_line=5613,.end_line=5617,.example=308,.sec="Entity and numeric character references",
  .html="<a href=\"&ouml;&ouml;.html\">\n",
  .markdown="<a href=\"&ouml;&ouml;.html\">\n",
},
 
TestCase.{
  .start_line=5620,.end_line=5624,.example=309,.sec="Entity and numeric character references",
  .html="<p><a href=\"/f%C3%B6%C3%B6\" title=\"föö\">foo</a></p>\n",
  .markdown="[foo](/f&ouml;&ouml; \"f&ouml;&ouml;\")\n",
},
 
TestCase.{
  .start_line=5627,.end_line=5633,.example=310,.sec="Entity and numeric character references",
  .html="<p><a href=\"/f%C3%B6%C3%B6\" title=\"föö\">foo</a></p>\n",
  .markdown="[foo]\n\n[foo]: /f&ouml;&ouml; \"f&ouml;&ouml;\"\n",
},
 
TestCase.{
  .start_line=5636,.end_line=5643,.example=311,.sec="Entity and numeric character references",
  .html="<pre><code class=\"language-föö\">foo\n</code></pre>\n",
  .markdown="``` f&ouml;&ouml;\nfoo\n```\n",
},
 
TestCase.{
  .start_line=5649,.end_line=5653,.example=312,.sec="Entity and numeric character references",
  .html="<p><code>f&amp;ouml;&amp;ouml;</code></p>\n",
  .markdown="`f&ouml;&ouml;`\n",
},
 
TestCase.{
  .start_line=5656,.end_line=5661,.example=313,.sec="Entity and numeric character references",
  .html="<pre><code>f&amp;ouml;f&amp;ouml;\n</code></pre>\n",
  .markdown="    f&ouml;f&ouml;\n",
},
 
TestCase.{
  .start_line=5678,.end_line=5682,.example=314,.sec="Code spans",
  .html="<p><code>foo</code></p>\n",
  .markdown="`foo`\n",
},
 
TestCase.{
  .start_line=5688,.end_line=5692,.example=315,.sec="Code spans",
  .html="<p><code>foo ` bar</code></p>\n",
  .markdown="`` foo ` bar  ``\n",
},
 
TestCase.{
  .start_line=5698,.end_line=5702,.example=316,.sec="Code spans",
  .html="<p><code>``</code></p>\n",
  .markdown="` `` `\n",
},
 
TestCase.{
  .start_line=5707,.end_line=5713,.example=317,.sec="Code spans",
  .html="<p><code>foo</code></p>\n",
  .markdown="``\nfoo\n``\n",
},
 
TestCase.{
  .start_line=5719,.end_line=5724,.example=318,.sec="Code spans",
  .html="<p><code>foo bar baz</code></p>\n",
  .markdown="`foo   bar\n  baz`\n",
},
 
TestCase.{
  .start_line=5730,.end_line=5734,.example=319,.sec="Code spans",
  .html="<p><code>a\u00a0\u00a0b</code></p>\n",
  .markdown="`a\u00a0\u00a0b`\n",
},
 
TestCase.{
  .start_line=5750,.end_line=5754,.example=320,.sec="Code spans",
  .html="<p><code>foo `` bar</code></p>\n",
  .markdown="`foo `` bar`\n",
},
 
TestCase.{
  .start_line=5760,.end_line=5764,.example=321,.sec="Code spans",
  .html="<p><code>foo\\</code>bar`</p>\n",
  .markdown="`foo\\`bar`\n",
},
 
TestCase.{
  .start_line=5776,.end_line=5780,.example=322,.sec="Code spans",
  .html="<p>*foo<code>*</code></p>\n",
  .markdown="*foo`*`\n",
},
 
TestCase.{
  .start_line=5785,.end_line=5789,.example=323,.sec="Code spans",
  .html="<p>[not a <code>link](/foo</code>)</p>\n",
  .markdown="[not a `link](/foo`)\n",
},
 
TestCase.{
  .start_line=5795,.end_line=5799,.example=324,.sec="Code spans",
  .html="<p><code>&lt;a href=&quot;</code>&quot;&gt;`</p>\n",
  .markdown="`<a href=\"`\">`\n",
},
 
TestCase.{
  .start_line=5804,.end_line=5808,.example=325,.sec="Code spans",
  .html="<p><a href=\"`\">`</p>\n",
  .markdown="<a href=\"`\">`\n",
},
 
TestCase.{
  .start_line=5813,.end_line=5817,.example=326,.sec="Code spans",
  .html="<p><code>&lt;http://foo.bar.</code>baz&gt;`</p>\n",
  .markdown="`<http://foo.bar.`baz>`\n",
},
 
TestCase.{
  .start_line=5822,.end_line=5826,.example=327,.sec="Code spans",
  .html="<p><a href=\"http://foo.bar.%60baz\">http://foo.bar.`baz</a>`</p>\n",
  .markdown="<http://foo.bar.`baz>`\n",
},
 
TestCase.{
  .start_line=5832,.end_line=5836,.example=328,.sec="Code spans",
  .html="<p>```foo``</p>\n",
  .markdown="```foo``\n",
},
 
TestCase.{
  .start_line=5839,.end_line=5843,.example=329,.sec="Code spans",
  .html="<p>`foo</p>\n",
  .markdown="`foo\n",
},
 
TestCase.{
  .start_line=5848,.end_line=5852,.example=330,.sec="Code spans",
  .html="<p>`foo<code>bar</code></p>\n",
  .markdown="`foo``bar``\n",
},
 
TestCase.{
  .start_line=6061,.end_line=6065,.example=331,.sec="Emphasis and strong emphasis",
  .html="<p><em>foo bar</em></p>\n",
  .markdown="*foo bar*\n",
},
 
TestCase.{
  .start_line=6071,.end_line=6075,.example=332,.sec="Emphasis and strong emphasis",
  .html="<p>a * foo bar*</p>\n",
  .markdown="a * foo bar*\n",
},
 
TestCase.{
  .start_line=6082,.end_line=6086,.example=333,.sec="Emphasis and strong emphasis",
  .html="<p>a*&quot;foo&quot;*</p>\n",
  .markdown="a*\"foo\"*\n",
},
 
TestCase.{
  .start_line=6091,.end_line=6095,.example=334,.sec="Emphasis and strong emphasis",
  .html="<p>*\u00a0a\u00a0*</p>\n",
  .markdown="*\u00a0a\u00a0*\n",
},
 
TestCase.{
  .start_line=6100,.end_line=6104,.example=335,.sec="Emphasis and strong emphasis",
  .html="<p>foo<em>bar</em></p>\n",
  .markdown="foo*bar*\n",
},
 
TestCase.{
  .start_line=6107,.end_line=6111,.example=336,.sec="Emphasis and strong emphasis",
  .html="<p>5<em>6</em>78</p>\n",
  .markdown="5*6*78\n",
},
 
TestCase.{
  .start_line=6116,.end_line=6120,.example=337,.sec="Emphasis and strong emphasis",
  .html="<p><em>foo bar</em></p>\n",
  .markdown="_foo bar_\n",
},
 
TestCase.{
  .start_line=6126,.end_line=6130,.example=338,.sec="Emphasis and strong emphasis",
  .html="<p>_ foo bar_</p>\n",
  .markdown="_ foo bar_\n",
},
 
TestCase.{
  .start_line=6136,.end_line=6140,.example=339,.sec="Emphasis and strong emphasis",
  .html="<p>a_&quot;foo&quot;_</p>\n",
  .markdown="a_\"foo\"_\n",
},
 
TestCase.{
  .start_line=6145,.end_line=6149,.example=340,.sec="Emphasis and strong emphasis",
  .html="<p>foo_bar_</p>\n",
  .markdown="foo_bar_\n",
},
 
TestCase.{
  .start_line=6152,.end_line=6156,.example=341,.sec="Emphasis and strong emphasis",
  .html="<p>5_6_78</p>\n",
  .markdown="5_6_78\n",
},
 
TestCase.{
  .start_line=6159,.end_line=6163,.example=342,.sec="Emphasis and strong emphasis",
  .html="<p>пристаням_стремятся_</p>\n",
  .markdown="пристаням_стремятся_\n",
},
 
TestCase.{
  .start_line=6169,.end_line=6173,.example=343,.sec="Emphasis and strong emphasis",
  .html="<p>aa_&quot;bb&quot;_cc</p>\n",
  .markdown="aa_\"bb\"_cc\n",
},
 
TestCase.{
  .start_line=6180,.end_line=6184,.example=344,.sec="Emphasis and strong emphasis",
  .html="<p>foo-<em>(bar)</em></p>\n",
  .markdown="foo-_(bar)_\n",
},
 
TestCase.{
  .start_line=6192,.end_line=6196,.example=345,.sec="Emphasis and strong emphasis",
  .html="<p>_foo*</p>\n",
  .markdown="_foo*\n",
},
 
TestCase.{
  .start_line=6202,.end_line=6206,.example=346,.sec="Emphasis and strong emphasis",
  .html="<p>*foo bar *</p>\n",
  .markdown="*foo bar *\n",
},
 
TestCase.{
  .start_line=6211,.end_line=6217,.example=347,.sec="Emphasis and strong emphasis",
  .html="<p>*foo bar\n*</p>\n",
  .markdown="*foo bar\n*\n",
},
 
TestCase.{
  .start_line=6224,.end_line=6228,.example=348,.sec="Emphasis and strong emphasis",
  .html="<p>*(*foo)</p>\n",
  .markdown="*(*foo)\n",
},
 
TestCase.{
  .start_line=6234,.end_line=6238,.example=349,.sec="Emphasis and strong emphasis",
  .html="<p><em>(<em>foo</em>)</em></p>\n",
  .markdown="*(*foo*)*\n",
},
 
TestCase.{
  .start_line=6243,.end_line=6247,.example=350,.sec="Emphasis and strong emphasis",
  .html="<p><em>foo</em>bar</p>\n",
  .markdown="*foo*bar\n",
},
 
TestCase.{
  .start_line=6256,.end_line=6260,.example=351,.sec="Emphasis and strong emphasis",
  .html="<p>_foo bar _</p>\n",
  .markdown="_foo bar _\n",
},
 
TestCase.{
  .start_line=6266,.end_line=6270,.example=352,.sec="Emphasis and strong emphasis",
  .html="<p>_(_foo)</p>\n",
  .markdown="_(_foo)\n",
},
 
TestCase.{
  .start_line=6275,.end_line=6279,.example=353,.sec="Emphasis and strong emphasis",
  .html="<p><em>(<em>foo</em>)</em></p>\n",
  .markdown="_(_foo_)_\n",
},
 
TestCase.{
  .start_line=6284,.end_line=6288,.example=354,.sec="Emphasis and strong emphasis",
  .html="<p>_foo_bar</p>\n",
  .markdown="_foo_bar\n",
},
 
TestCase.{
  .start_line=6291,.end_line=6295,.example=355,.sec="Emphasis and strong emphasis",
  .html="<p>_пристаням_стремятся</p>\n",
  .markdown="_пристаням_стремятся\n",
},
 
TestCase.{
  .start_line=6298,.end_line=6302,.example=356,.sec="Emphasis and strong emphasis",
  .html="<p><em>foo_bar_baz</em></p>\n",
  .markdown="_foo_bar_baz_\n",
},
 
TestCase.{
  .start_line=6309,.end_line=6313,.example=357,.sec="Emphasis and strong emphasis",
  .html="<p><em>(bar)</em>.</p>\n",
  .markdown="_(bar)_.\n",
},
 
TestCase.{
  .start_line=6318,.end_line=6322,.example=358,.sec="Emphasis and strong emphasis",
  .html="<p><strong>foo bar</strong></p>\n",
  .markdown="**foo bar**\n",
},
 
TestCase.{
  .start_line=6328,.end_line=6332,.example=359,.sec="Emphasis and strong emphasis",
  .html="<p>** foo bar**</p>\n",
  .markdown="** foo bar**\n",
},
 
TestCase.{
  .start_line=6339,.end_line=6343,.example=360,.sec="Emphasis and strong emphasis",
  .html="<p>a**&quot;foo&quot;**</p>\n",
  .markdown="a**\"foo\"**\n",
},
 
TestCase.{
  .start_line=6348,.end_line=6352,.example=361,.sec="Emphasis and strong emphasis",
  .html="<p>foo<strong>bar</strong></p>\n",
  .markdown="foo**bar**\n",
},
 
TestCase.{
  .start_line=6357,.end_line=6361,.example=362,.sec="Emphasis and strong emphasis",
  .html="<p><strong>foo bar</strong></p>\n",
  .markdown="__foo bar__\n",
},
 
TestCase.{
  .start_line=6367,.end_line=6371,.example=363,.sec="Emphasis and strong emphasis",
  .html="<p>__ foo bar__</p>\n",
  .markdown="__ foo bar__\n",
},
 
TestCase.{
  .start_line=6375,.end_line=6381,.example=364,.sec="Emphasis and strong emphasis",
  .html="<p>__\nfoo bar__</p>\n",
  .markdown="__\nfoo bar__\n",
},
 
TestCase.{
  .start_line=6387,.end_line=6391,.example=365,.sec="Emphasis and strong emphasis",
  .html="<p>a__&quot;foo&quot;__</p>\n",
  .markdown="a__\"foo\"__\n",
},
 
TestCase.{
  .start_line=6396,.end_line=6400,.example=366,.sec="Emphasis and strong emphasis",
  .html="<p>foo__bar__</p>\n",
  .markdown="foo__bar__\n",
},
 
TestCase.{
  .start_line=6403,.end_line=6407,.example=367,.sec="Emphasis and strong emphasis",
  .html="<p>5__6__78</p>\n",
  .markdown="5__6__78\n",
},
 
TestCase.{
  .start_line=6410,.end_line=6414,.example=368,.sec="Emphasis and strong emphasis",
  .html="<p>пристаням__стремятся__</p>\n",
  .markdown="пристаням__стремятся__\n",
},
 
TestCase.{
  .start_line=6417,.end_line=6421,.example=369,.sec="Emphasis and strong emphasis",
  .html="<p><strong>foo, <strong>bar</strong>, baz</strong></p>\n",
  .markdown="__foo, __bar__, baz__\n",
},
 
TestCase.{
  .start_line=6428,.end_line=6432,.example=370,.sec="Emphasis and strong emphasis",
  .html="<p>foo-<strong>(bar)</strong></p>\n",
  .markdown="foo-__(bar)__\n",
},
 
TestCase.{
  .start_line=6441,.end_line=6445,.example=371,.sec="Emphasis and strong emphasis",
  .html="<p>**foo bar **</p>\n",
  .markdown="**foo bar **\n",
},
 
TestCase.{
  .start_line=6454,.end_line=6458,.example=372,.sec="Emphasis and strong emphasis",
  .html="<p>**(**foo)</p>\n",
  .markdown="**(**foo)\n",
},
 
TestCase.{
  .start_line=6464,.end_line=6468,.example=373,.sec="Emphasis and strong emphasis",
  .html="<p><em>(<strong>foo</strong>)</em></p>\n",
  .markdown="*(**foo**)*\n",
},
 
TestCase.{
  .start_line=6471,.end_line=6477,.example=374,.sec="Emphasis and strong emphasis",
  .html="<p><strong>Gomphocarpus (<em>Gomphocarpus physocarpus</em>, syn.\n<em>Asclepias physocarpa</em>)</strong></p>\n",
  .markdown="**Gomphocarpus (*Gomphocarpus physocarpus*, syn.\n*Asclepias physocarpa*)**\n",
},
 
TestCase.{
  .start_line=6480,.end_line=6484,.example=375,.sec="Emphasis and strong emphasis",
  .html="<p><strong>foo &quot;<em>bar</em>&quot; foo</strong></p>\n",
  .markdown="**foo \"*bar*\" foo**\n",
},
 
TestCase.{
  .start_line=6489,.end_line=6493,.example=376,.sec="Emphasis and strong emphasis",
  .html="<p><strong>foo</strong>bar</p>\n",
  .markdown="**foo**bar\n",
},
 
TestCase.{
  .start_line=6501,.end_line=6505,.example=377,.sec="Emphasis and strong emphasis",
  .html="<p>__foo bar __</p>\n",
  .markdown="__foo bar __\n",
},
 
TestCase.{
  .start_line=6511,.end_line=6515,.example=378,.sec="Emphasis and strong emphasis",
  .html="<p>__(__foo)</p>\n",
  .markdown="__(__foo)\n",
},
 
TestCase.{
  .start_line=6521,.end_line=6525,.example=379,.sec="Emphasis and strong emphasis",
  .html="<p><em>(<strong>foo</strong>)</em></p>\n",
  .markdown="_(__foo__)_\n",
},
 
TestCase.{
  .start_line=6530,.end_line=6534,.example=380,.sec="Emphasis and strong emphasis",
  .html="<p>__foo__bar</p>\n",
  .markdown="__foo__bar\n",
},
 
TestCase.{
  .start_line=6537,.end_line=6541,.example=381,.sec="Emphasis and strong emphasis",
  .html="<p>__пристаням__стремятся</p>\n",
  .markdown="__пристаням__стремятся\n",
},
 
TestCase.{
  .start_line=6544,.end_line=6548,.example=382,.sec="Emphasis and strong emphasis",
  .html="<p><strong>foo__bar__baz</strong></p>\n",
  .markdown="__foo__bar__baz__\n",
},
 
TestCase.{
  .start_line=6555,.end_line=6559,.example=383,.sec="Emphasis and strong emphasis",
  .html="<p><strong>(bar)</strong>.</p>\n",
  .markdown="__(bar)__.\n",
},
 
TestCase.{
  .start_line=6567,.end_line=6571,.example=384,.sec="Emphasis and strong emphasis",
  .html="<p><em>foo <a href=\"/url\">bar</a></em></p>\n",
  .markdown="*foo [bar](/url)*\n",
},
 
TestCase.{
  .start_line=6574,.end_line=6580,.example=385,.sec="Emphasis and strong emphasis",
  .html="<p><em>foo\nbar</em></p>\n",
  .markdown="*foo\nbar*\n",
},
 
TestCase.{
  .start_line=6586,.end_line=6590,.example=386,.sec="Emphasis and strong emphasis",
  .html="<p><em>foo <strong>bar</strong> baz</em></p>\n",
  .markdown="_foo __bar__ baz_\n",
},
 
TestCase.{
  .start_line=6593,.end_line=6597,.example=387,.sec="Emphasis and strong emphasis",
  .html="<p><em>foo <em>bar</em> baz</em></p>\n",
  .markdown="_foo _bar_ baz_\n",
},
 
TestCase.{
  .start_line=6600,.end_line=6604,.example=388,.sec="Emphasis and strong emphasis",
  .html="<p><em><em>foo</em> bar</em></p>\n",
  .markdown="__foo_ bar_\n",
},
 
TestCase.{
  .start_line=6607,.end_line=6611,.example=389,.sec="Emphasis and strong emphasis",
  .html="<p><em>foo <em>bar</em></em></p>\n",
  .markdown="*foo *bar**\n",
},
 
TestCase.{
  .start_line=6614,.end_line=6618,.example=390,.sec="Emphasis and strong emphasis",
  .html="<p><em>foo <strong>bar</strong> baz</em></p>\n",
  .markdown="*foo **bar** baz*\n",
},
 
TestCase.{
  .start_line=6620,.end_line=6624,.example=391,.sec="Emphasis and strong emphasis",
  .html="<p><em>foo<strong>bar</strong>baz</em></p>\n",
  .markdown="*foo**bar**baz*\n",
},
 
TestCase.{
  .start_line=6645,.end_line=6649,.example=392,.sec="Emphasis and strong emphasis",
  .html="<p><em><strong>foo</strong> bar</em></p>\n",
  .markdown="***foo** bar*\n",
},
 
TestCase.{
  .start_line=6652,.end_line=6656,.example=393,.sec="Emphasis and strong emphasis",
  .html="<p><em>foo <strong>bar</strong></em></p>\n",
  .markdown="*foo **bar***\n",
},
 
TestCase.{
  .start_line=6659,.end_line=6663,.example=394,.sec="Emphasis and strong emphasis",
  .html="<p><em>foo<strong>bar</strong></em></p>\n",
  .markdown="*foo**bar***\n",
},
 
TestCase.{
  .start_line=6668,.end_line=6672,.example=395,.sec="Emphasis and strong emphasis",
  .html="<p><em>foo <strong>bar <em>baz</em> bim</strong> bop</em></p>\n",
  .markdown="*foo **bar *baz* bim** bop*\n",
},
 
TestCase.{
  .start_line=6675,.end_line=6679,.example=396,.sec="Emphasis and strong emphasis",
  .html="<p><em>foo <a href=\"/url\"><em>bar</em></a></em></p>\n",
  .markdown="*foo [*bar*](/url)*\n",
},
 
TestCase.{
  .start_line=6684,.end_line=6688,.example=397,.sec="Emphasis and strong emphasis",
  .html="<p>** is not an empty emphasis</p>\n",
  .markdown="** is not an empty emphasis\n",
},
 
TestCase.{
  .start_line=6691,.end_line=6695,.example=398,.sec="Emphasis and strong emphasis",
  .html="<p>**** is not an empty strong emphasis</p>\n",
  .markdown="**** is not an empty strong emphasis\n",
},
 
TestCase.{
  .start_line=6704,.end_line=6708,.example=399,.sec="Emphasis and strong emphasis",
  .html="<p><strong>foo <a href=\"/url\">bar</a></strong></p>\n",
  .markdown="**foo [bar](/url)**\n",
},
 
TestCase.{
  .start_line=6711,.end_line=6717,.example=400,.sec="Emphasis and strong emphasis",
  .html="<p><strong>foo\nbar</strong></p>\n",
  .markdown="**foo\nbar**\n",
},
 
TestCase.{
  .start_line=6723,.end_line=6727,.example=401,.sec="Emphasis and strong emphasis",
  .html="<p><strong>foo <em>bar</em> baz</strong></p>\n",
  .markdown="__foo _bar_ baz__\n",
},
 
TestCase.{
  .start_line=6730,.end_line=6734,.example=402,.sec="Emphasis and strong emphasis",
  .html="<p><strong>foo <strong>bar</strong> baz</strong></p>\n",
  .markdown="__foo __bar__ baz__\n",
},
 
TestCase.{
  .start_line=6737,.end_line=6741,.example=403,.sec="Emphasis and strong emphasis",
  .html="<p><strong><strong>foo</strong> bar</strong></p>\n",
  .markdown="____foo__ bar__\n",
},
 
TestCase.{
  .start_line=6744,.end_line=6748,.example=404,.sec="Emphasis and strong emphasis",
  .html="<p><strong>foo <strong>bar</strong></strong></p>\n",
  .markdown="**foo **bar****\n",
},
 
TestCase.{
  .start_line=6751,.end_line=6755,.example=405,.sec="Emphasis and strong emphasis",
  .html="<p><strong>foo <em>bar</em> baz</strong></p>\n",
  .markdown="**foo *bar* baz**\n",
},
 
TestCase.{
  .start_line=6758,.end_line=6762,.example=406,.sec="Emphasis and strong emphasis",
  .html="<p><strong>foo<em>bar</em>baz</strong></p>\n",
  .markdown="**foo*bar*baz**\n",
},
 
TestCase.{
  .start_line=6765,.end_line=6769,.example=407,.sec="Emphasis and strong emphasis",
  .html="<p><strong><em>foo</em> bar</strong></p>\n",
  .markdown="***foo* bar**\n",
},
 
TestCase.{
  .start_line=6772,.end_line=6776,.example=408,.sec="Emphasis and strong emphasis",
  .html="<p><strong>foo <em>bar</em></strong></p>\n",
  .markdown="**foo *bar***\n",
},
 
TestCase.{
  .start_line=6781,.end_line=6787,.example=409,.sec="Emphasis and strong emphasis",
  .html="<p><strong>foo <em>bar <strong>baz</strong>\nbim</em> bop</strong></p>\n",
  .markdown="**foo *bar **baz**\nbim* bop**\n",
},
 
TestCase.{
  .start_line=6790,.end_line=6794,.example=410,.sec="Emphasis and strong emphasis",
  .html="<p><strong>foo <a href=\"/url\"><em>bar</em></a></strong></p>\n",
  .markdown="**foo [*bar*](/url)**\n",
},
 
TestCase.{
  .start_line=6799,.end_line=6803,.example=411,.sec="Emphasis and strong emphasis",
  .html="<p>__ is not an empty emphasis</p>\n",
  .markdown="__ is not an empty emphasis\n",
},
 
TestCase.{
  .start_line=6806,.end_line=6810,.example=412,.sec="Emphasis and strong emphasis",
  .html="<p>____ is not an empty strong emphasis</p>\n",
  .markdown="____ is not an empty strong emphasis\n",
},
 
TestCase.{
  .start_line=6816,.end_line=6820,.example=413,.sec="Emphasis and strong emphasis",
  .html="<p>foo ***</p>\n",
  .markdown="foo ***\n",
},
 
TestCase.{
  .start_line=6823,.end_line=6827,.example=414,.sec="Emphasis and strong emphasis",
  .html="<p>foo <em>*</em></p>\n",
  .markdown="foo *\\**\n",
},
 
TestCase.{
  .start_line=6830,.end_line=6834,.example=415,.sec="Emphasis and strong emphasis",
  .html="<p>foo <em>_</em></p>\n",
  .markdown="foo *_*\n",
},
 
TestCase.{
  .start_line=6837,.end_line=6841,.example=416,.sec="Emphasis and strong emphasis",
  .html="<p>foo *****</p>\n",
  .markdown="foo *****\n",
},
 
TestCase.{
  .start_line=6844,.end_line=6848,.example=417,.sec="Emphasis and strong emphasis",
  .html="<p>foo <strong>*</strong></p>\n",
  .markdown="foo **\\***\n",
},
 
TestCase.{
  .start_line=6851,.end_line=6855,.example=418,.sec="Emphasis and strong emphasis",
  .html="<p>foo <strong>_</strong></p>\n",
  .markdown="foo **_**\n",
},
 
TestCase.{
  .start_line=6862,.end_line=6866,.example=419,.sec="Emphasis and strong emphasis",
  .html="<p>*<em>foo</em></p>\n",
  .markdown="**foo*\n",
},
 
TestCase.{
  .start_line=6869,.end_line=6873,.example=420,.sec="Emphasis and strong emphasis",
  .html="<p><em>foo</em>*</p>\n",
  .markdown="*foo**\n",
},
 
TestCase.{
  .start_line=6876,.end_line=6880,.example=421,.sec="Emphasis and strong emphasis",
  .html="<p>*<strong>foo</strong></p>\n",
  .markdown="***foo**\n",
},
 
TestCase.{
  .start_line=6883,.end_line=6887,.example=422,.sec="Emphasis and strong emphasis",
  .html="<p>***<em>foo</em></p>\n",
  .markdown="****foo*\n",
},
 
TestCase.{
  .start_line=6890,.end_line=6894,.example=423,.sec="Emphasis and strong emphasis",
  .html="<p><strong>foo</strong>*</p>\n",
  .markdown="**foo***\n",
},
 
TestCase.{
  .start_line=6897,.end_line=6901,.example=424,.sec="Emphasis and strong emphasis",
  .html="<p><em>foo</em>***</p>\n",
  .markdown="*foo****\n",
},
 
TestCase.{
  .start_line=6907,.end_line=6911,.example=425,.sec="Emphasis and strong emphasis",
  .html="<p>foo ___</p>\n",
  .markdown="foo ___\n",
},
 
TestCase.{
  .start_line=6914,.end_line=6918,.example=426,.sec="Emphasis and strong emphasis",
  .html="<p>foo <em>_</em></p>\n",
  .markdown="foo _\\__\n",
},
 
TestCase.{
  .start_line=6921,.end_line=6925,.example=427,.sec="Emphasis and strong emphasis",
  .html="<p>foo <em>*</em></p>\n",
  .markdown="foo _*_\n",
},
 
TestCase.{
  .start_line=6928,.end_line=6932,.example=428,.sec="Emphasis and strong emphasis",
  .html="<p>foo _____</p>\n",
  .markdown="foo _____\n",
},
 
TestCase.{
  .start_line=6935,.end_line=6939,.example=429,.sec="Emphasis and strong emphasis",
  .html="<p>foo <strong>_</strong></p>\n",
  .markdown="foo __\\___\n",
},
 
TestCase.{
  .start_line=6942,.end_line=6946,.example=430,.sec="Emphasis and strong emphasis",
  .html="<p>foo <strong>*</strong></p>\n",
  .markdown="foo __*__\n",
},
 
TestCase.{
  .start_line=6949,.end_line=6953,.example=431,.sec="Emphasis and strong emphasis",
  .html="<p>_<em>foo</em></p>\n",
  .markdown="__foo_\n",
},
 
TestCase.{
  .start_line=6960,.end_line=6964,.example=432,.sec="Emphasis and strong emphasis",
  .html="<p><em>foo</em>_</p>\n",
  .markdown="_foo__\n",
},
 
TestCase.{
  .start_line=6967,.end_line=6971,.example=433,.sec="Emphasis and strong emphasis",
  .html="<p>_<strong>foo</strong></p>\n",
  .markdown="___foo__\n",
},
 
TestCase.{
  .start_line=6974,.end_line=6978,.example=434,.sec="Emphasis and strong emphasis",
  .html="<p>___<em>foo</em></p>\n",
  .markdown="____foo_\n",
},
 
TestCase.{
  .start_line=6981,.end_line=6985,.example=435,.sec="Emphasis and strong emphasis",
  .html="<p><strong>foo</strong>_</p>\n",
  .markdown="__foo___\n",
},
 
TestCase.{
  .start_line=6988,.end_line=6992,.example=436,.sec="Emphasis and strong emphasis",
  .html="<p><em>foo</em>___</p>\n",
  .markdown="_foo____\n",
},
 
TestCase.{
  .start_line=6998,.end_line=7002,.example=437,.sec="Emphasis and strong emphasis",
  .html="<p><strong>foo</strong></p>\n",
  .markdown="**foo**\n",
},
 
TestCase.{
  .start_line=7005,.end_line=7009,.example=438,.sec="Emphasis and strong emphasis",
  .html="<p><em><em>foo</em></em></p>\n",
  .markdown="*_foo_*\n",
},
 
TestCase.{
  .start_line=7012,.end_line=7016,.example=439,.sec="Emphasis and strong emphasis",
  .html="<p><strong>foo</strong></p>\n",
  .markdown="__foo__\n",
},
 
TestCase.{
  .start_line=7019,.end_line=7023,.example=440,.sec="Emphasis and strong emphasis",
  .html="<p><em><em>foo</em></em></p>\n",
  .markdown="_*foo*_\n",
},
 
TestCase.{
  .start_line=7029,.end_line=7033,.example=441,.sec="Emphasis and strong emphasis",
  .html="<p><strong><strong>foo</strong></strong></p>\n",
  .markdown="****foo****\n",
},
 
TestCase.{
  .start_line=7036,.end_line=7040,.example=442,.sec="Emphasis and strong emphasis",
  .html="<p><strong><strong>foo</strong></strong></p>\n",
  .markdown="____foo____\n",
},
 
TestCase.{
  .start_line=7047,.end_line=7051,.example=443,.sec="Emphasis and strong emphasis",
  .html="<p><strong><strong><strong>foo</strong></strong></strong></p>\n",
  .markdown="******foo******\n",
},
 
TestCase.{
  .start_line=7056,.end_line=7060,.example=444,.sec="Emphasis and strong emphasis",
  .html="<p><em><strong>foo</strong></em></p>\n",
  .markdown="***foo***\n",
},
 
TestCase.{
  .start_line=7063,.end_line=7067,.example=445,.sec="Emphasis and strong emphasis",
  .html="<p><em><strong><strong>foo</strong></strong></em></p>\n",
  .markdown="_____foo_____\n",
},
 
TestCase.{
  .start_line=7072,.end_line=7076,.example=446,.sec="Emphasis and strong emphasis",
  .html="<p><em>foo _bar</em> baz_</p>\n",
  .markdown="*foo _bar* baz_\n",
},
 
TestCase.{
  .start_line=7079,.end_line=7083,.example=447,.sec="Emphasis and strong emphasis",
  .html="<p><em>foo <strong>bar *baz bim</strong> bam</em></p>\n",
  .markdown="*foo __bar *baz bim__ bam*\n",
},
 
TestCase.{
  .start_line=7088,.end_line=7092,.example=448,.sec="Emphasis and strong emphasis",
  .html="<p>**foo <strong>bar baz</strong></p>\n",
  .markdown="**foo **bar baz**\n",
},
 
TestCase.{
  .start_line=7095,.end_line=7099,.example=449,.sec="Emphasis and strong emphasis",
  .html="<p>*foo <em>bar baz</em></p>\n",
  .markdown="*foo *bar baz*\n",
},
 
TestCase.{
  .start_line=7104,.end_line=7108,.example=450,.sec="Emphasis and strong emphasis",
  .html="<p>*<a href=\"/url\">bar*</a></p>\n",
  .markdown="*[bar*](/url)\n",
},
 
TestCase.{
  .start_line=7111,.end_line=7115,.example=451,.sec="Emphasis and strong emphasis",
  .html="<p>_foo <a href=\"/url\">bar_</a></p>\n",
  .markdown="_foo [bar_](/url)\n",
},
 
TestCase.{
  .start_line=7118,.end_line=7122,.example=452,.sec="Emphasis and strong emphasis",
  .html="<p>*<img src=\"foo\" title=\"*\"/></p>\n",
  .markdown="*<img src=\"foo\" title=\"*\"/>\n",
},
 
TestCase.{
  .start_line=7125,.end_line=7129,.example=453,.sec="Emphasis and strong emphasis",
  .html="<p>**<a href=\"**\"></p>\n",
  .markdown="**<a href=\"**\">\n",
},
 
TestCase.{
  .start_line=7132,.end_line=7136,.example=454,.sec="Emphasis and strong emphasis",
  .html="<p>__<a href=\"__\"></p>\n",
  .markdown="__<a href=\"__\">\n",
},
 
TestCase.{
  .start_line=7139,.end_line=7143,.example=455,.sec="Emphasis and strong emphasis",
  .html="<p><em>a <code>*</code></em></p>\n",
  .markdown="*a `*`*\n",
},
 
TestCase.{
  .start_line=7146,.end_line=7150,.example=456,.sec="Emphasis and strong emphasis",
  .html="<p><em>a <code>_</code></em></p>\n",
  .markdown="_a `_`_\n",
},
 
TestCase.{
  .start_line=7153,.end_line=7157,.example=457,.sec="Emphasis and strong emphasis",
  .html="<p>**a<a href=\"http://foo.bar/?q=**\">http://foo.bar/?q=**</a></p>\n",
  .markdown="**a<http://foo.bar/?q=**>\n",
},
 
TestCase.{
  .start_line=7160,.end_line=7164,.example=458,.sec="Emphasis and strong emphasis",
  .html="<p>__a<a href=\"http://foo.bar/?q=__\">http://foo.bar/?q=__</a></p>\n",
  .markdown="__a<http://foo.bar/?q=__>\n",
},
 
TestCase.{
  .start_line=7241,.end_line=7245,.example=459,.sec="Links",
  .html="<p><a href=\"/uri\" title=\"title\">link</a></p>\n",
  .markdown="[link](/uri \"title\")\n",
},
 
TestCase.{
  .start_line=7250,.end_line=7254,.example=460,.sec="Links",
  .html="<p><a href=\"/uri\">link</a></p>\n",
  .markdown="[link](/uri)\n",
},
 
TestCase.{
  .start_line=7259,.end_line=7263,.example=461,.sec="Links",
  .html="<p><a href=\"\">link</a></p>\n",
  .markdown="[link]()\n",
},
 
TestCase.{
  .start_line=7266,.end_line=7270,.example=462,.sec="Links",
  .html="<p><a href=\"\">link</a></p>\n",
  .markdown="[link](<>)\n",
},
 
TestCase.{
  .start_line=7276,.end_line=7280,.example=463,.sec="Links",
  .html="<p>[link](/my uri)</p>\n",
  .markdown="[link](/my uri)\n",
},
 
TestCase.{
  .start_line=7283,.end_line=7287,.example=464,.sec="Links",
  .html="<p>[link](&lt;/my uri&gt;)</p>\n",
  .markdown="[link](</my uri>)\n",
},
 
TestCase.{
  .start_line=7290,.end_line=7296,.example=465,.sec="Links",
  .html="<p>[link](foo\nbar)</p>\n",
  .markdown="[link](foo\nbar)\n",
},
 
TestCase.{
  .start_line=7299,.end_line=7305,.example=466,.sec="Links",
  .html="<p>[link](<foo\nbar>)</p>\n",
  .markdown="[link](<foo\nbar>)\n",
},
 
TestCase.{
  .start_line=7309,.end_line=7313,.example=467,.sec="Links",
  .html="<p><a href=\"(foo)\">link</a></p>\n",
  .markdown="[link](\\(foo\\))\n",
},
 
TestCase.{
  .start_line=7318,.end_line=7322,.example=468,.sec="Links",
  .html="<p><a href=\"foo(and(bar))\">link</a></p>\n",
  .markdown="[link](foo(and(bar)))\n",
},
 
TestCase.{
  .start_line=7327,.end_line=7331,.example=469,.sec="Links",
  .html="<p><a href=\"foo(and(bar)\">link</a></p>\n",
  .markdown="[link](foo\\(and\\(bar\\))\n",
},
 
TestCase.{
  .start_line=7334,.end_line=7338,.example=470,.sec="Links",
  .html="<p><a href=\"foo(and(bar)\">link</a></p>\n",
  .markdown="[link](<foo(and(bar)>)\n",
},
 
TestCase.{
  .start_line=7344,.end_line=7348,.example=471,.sec="Links",
  .html="<p><a href=\"foo):\">link</a></p>\n",
  .markdown="[link](foo\\)\\:)\n",
},
 
TestCase.{
  .start_line=7353,.end_line=7363,.example=472,.sec="Links",
  .html="<p><a href=\"#fragment\">link</a></p>\n<p><a href=\"http://example.com#fragment\">link</a></p>\n<p><a href=\"http://example.com?foo=3#frag\">link</a></p>\n",
  .markdown="[link](#fragment)\n\n[link](http://example.com#fragment)\n\n[link](http://example.com?foo=3#frag)\n",
},
 
TestCase.{
  .start_line=7369,.end_line=7373,.example=473,.sec="Links",
  .html="<p><a href=\"foo%5Cbar\">link</a></p>\n",
  .markdown="[link](foo\\bar)\n",
},
 
TestCase.{
  .start_line=7385,.end_line=7389,.example=474,.sec="Links",
  .html="<p><a href=\"foo%20b%C3%A4\">link</a></p>\n",
  .markdown="[link](foo%20b&auml;)\n",
},
 
TestCase.{
  .start_line=7396,.end_line=7400,.example=475,.sec="Links",
  .html="<p><a href=\"%22title%22\">link</a></p>\n",
  .markdown="[link](\"title\")\n",
},
 
TestCase.{
  .start_line=7405,.end_line=7413,.example=476,.sec="Links",
  .html="<p><a href=\"/url\" title=\"title\">link</a>\n<a href=\"/url\" title=\"title\">link</a>\n<a href=\"/url\" title=\"title\">link</a></p>\n",
  .markdown="[link](/url \"title\")\n[link](/url 'title')\n[link](/url (title))\n",
},
 
TestCase.{
  .start_line=7419,.end_line=7423,.example=477,.sec="Links",
  .html="<p><a href=\"/url\" title=\"title &quot;&quot;\">link</a></p>\n",
  .markdown="[link](/url \"title \\\"&quot;\")\n",
},
 
TestCase.{
  .start_line=7429,.end_line=7433,.example=478,.sec="Links",
  .html="<p><a href=\"/url%C2%A0%22title%22\">link</a></p>\n",
  .markdown="[link](/url\u00a0\"title\")\n",
},
 
TestCase.{
  .start_line=7438,.end_line=7442,.example=479,.sec="Links",
  .html="<p>[link](/url &quot;title &quot;and&quot; title&quot;)</p>\n",
  .markdown="[link](/url \"title \"and\" title\")\n",
},
 
TestCase.{
  .start_line=7447,.end_line=7451,.example=480,.sec="Links",
  .html="<p><a href=\"/url\" title=\"title &quot;and&quot; title\">link</a></p>\n",
  .markdown="[link](/url 'title \"and\" title')\n",
},
 
TestCase.{
  .start_line=7471,.end_line=7476,.example=481,.sec="Links",
  .html="<p><a href=\"/uri\" title=\"title\">link</a></p>\n",
  .markdown="[link](   /uri\n  \"title\"  )\n",
},
 
TestCase.{
  .start_line=7482,.end_line=7486,.example=482,.sec="Links",
  .html="<p>[link] (/uri)</p>\n",
  .markdown="[link] (/uri)\n",
},
 
TestCase.{
  .start_line=7492,.end_line=7496,.example=483,.sec="Links",
  .html="<p><a href=\"/uri\">link [foo [bar]]</a></p>\n",
  .markdown="[link [foo [bar]]](/uri)\n",
},
 
TestCase.{
  .start_line=7499,.end_line=7503,.example=484,.sec="Links",
  .html="<p>[link] bar](/uri)</p>\n",
  .markdown="[link] bar](/uri)\n",
},
 
TestCase.{
  .start_line=7506,.end_line=7510,.example=485,.sec="Links",
  .html="<p>[link <a href=\"/uri\">bar</a></p>\n",
  .markdown="[link [bar](/uri)\n",
},
 
TestCase.{
  .start_line=7513,.end_line=7517,.example=486,.sec="Links",
  .html="<p><a href=\"/uri\">link [bar</a></p>\n",
  .markdown="[link \\[bar](/uri)\n",
},
 
TestCase.{
  .start_line=7522,.end_line=7526,.example=487,.sec="Links",
  .html="<p><a href=\"/uri\">link <em>foo <strong>bar</strong> <code>#</code></em></a></p>\n",
  .markdown="[link *foo **bar** `#`*](/uri)\n",
},
 
TestCase.{
  .start_line=7529,.end_line=7533,.example=488,.sec="Links",
  .html="<p><a href=\"/uri\"><img src=\"moon.jpg\" alt=\"moon\" /></a></p>\n",
  .markdown="[![moon](moon.jpg)](/uri)\n",
},
 
TestCase.{
  .start_line=7538,.end_line=7542,.example=489,.sec="Links",
  .html="<p>[foo <a href=\"/uri\">bar</a>](/uri)</p>\n",
  .markdown="[foo [bar](/uri)](/uri)\n",
},
 
TestCase.{
  .start_line=7545,.end_line=7549,.example=490,.sec="Links",
  .html="<p>[foo <em>[bar <a href=\"/uri\">baz</a>](/uri)</em>](/uri)</p>\n",
  .markdown="[foo *[bar [baz](/uri)](/uri)*](/uri)\n",
},
 
TestCase.{
  .start_line=7552,.end_line=7556,.example=491,.sec="Links",
  .html="<p><img src=\"uri3\" alt=\"[foo](uri2)\" /></p>\n",
  .markdown="![[[foo](uri1)](uri2)](uri3)\n",
},
 
TestCase.{
  .start_line=7562,.end_line=7566,.example=492,.sec="Links",
  .html="<p>*<a href=\"/uri\">foo*</a></p>\n",
  .markdown="*[foo*](/uri)\n",
},
 
TestCase.{
  .start_line=7569,.end_line=7573,.example=493,.sec="Links",
  .html="<p><a href=\"baz*\">foo *bar</a></p>\n",
  .markdown="[foo *bar](baz*)\n",
},
 
TestCase.{
  .start_line=7579,.end_line=7583,.example=494,.sec="Links",
  .html="<p><em>foo [bar</em> baz]</p>\n",
  .markdown="*foo [bar* baz]\n",
},
 
TestCase.{
  .start_line=7589,.end_line=7593,.example=495,.sec="Links",
  .html="<p>[foo <bar attr=\"](baz)\"></p>\n",
  .markdown="[foo <bar attr=\"](baz)\">\n",
},
 
TestCase.{
  .start_line=7596,.end_line=7600,.example=496,.sec="Links",
  .html="<p>[foo<code>](/uri)</code></p>\n",
  .markdown="[foo`](/uri)`\n",
},
 
TestCase.{
  .start_line=7603,.end_line=7607,.example=497,.sec="Links",
  .html="<p>[foo<a href=\"http://example.com/?search=%5D(uri)\">http://example.com/?search=](uri)</a></p>\n",
  .markdown="[foo<http://example.com/?search=](uri)>\n",
},
 
TestCase.{
  .start_line=7641,.end_line=7647,.example=498,.sec="Links",
  .html="<p><a href=\"/url\" title=\"title\">foo</a></p>\n",
  .markdown="[foo][bar]\n\n[bar]: /url \"title\"\n",
},
 
TestCase.{
  .start_line=7656,.end_line=7662,.example=499,.sec="Links",
  .html="<p><a href=\"/uri\">link [foo [bar]]</a></p>\n",
  .markdown="[link [foo [bar]]][ref]\n\n[ref]: /uri\n",
},
 
TestCase.{
  .start_line=7665,.end_line=7671,.example=500,.sec="Links",
  .html="<p><a href=\"/uri\">link [bar</a></p>\n",
  .markdown="[link \\[bar][ref]\n\n[ref]: /uri\n",
},
 
TestCase.{
  .start_line=7676,.end_line=7682,.example=501,.sec="Links",
  .html="<p><a href=\"/uri\">link <em>foo <strong>bar</strong> <code>#</code></em></a></p>\n",
  .markdown="[link *foo **bar** `#`*][ref]\n\n[ref]: /uri\n",
},
 
TestCase.{
  .start_line=7685,.end_line=7691,.example=502,.sec="Links",
  .html="<p><a href=\"/uri\"><img src=\"moon.jpg\" alt=\"moon\" /></a></p>\n",
  .markdown="[![moon](moon.jpg)][ref]\n\n[ref]: /uri\n",
},
 
TestCase.{
  .start_line=7696,.end_line=7702,.example=503,.sec="Links",
  .html="<p>[foo <a href=\"/uri\">bar</a>]<a href=\"/uri\">ref</a></p>\n",
  .markdown="[foo [bar](/uri)][ref]\n\n[ref]: /uri\n",
},
 
TestCase.{
  .start_line=7705,.end_line=7711,.example=504,.sec="Links",
  .html="<p>[foo <em>bar <a href=\"/uri\">baz</a></em>]<a href=\"/uri\">ref</a></p>\n",
  .markdown="[foo *bar [baz][ref]*][ref]\n\n[ref]: /uri\n",
},
 
TestCase.{
  .start_line=7720,.end_line=7726,.example=505,.sec="Links",
  .html="<p>*<a href=\"/uri\">foo*</a></p>\n",
  .markdown="*[foo*][ref]\n\n[ref]: /uri\n",
},
 
TestCase.{
  .start_line=7729,.end_line=7735,.example=506,.sec="Links",
  .html="<p><a href=\"/uri\">foo *bar</a></p>\n",
  .markdown="[foo *bar][ref]\n\n[ref]: /uri\n",
},
 
TestCase.{
  .start_line=7741,.end_line=7747,.example=507,.sec="Links",
  .html="<p>[foo <bar attr=\"][ref]\"></p>\n",
  .markdown="[foo <bar attr=\"][ref]\">\n\n[ref]: /uri\n",
},
 
TestCase.{
  .start_line=7750,.end_line=7756,.example=508,.sec="Links",
  .html="<p>[foo<code>][ref]</code></p>\n",
  .markdown="[foo`][ref]`\n\n[ref]: /uri\n",
},
 
TestCase.{
  .start_line=7759,.end_line=7765,.example=509,.sec="Links",
  .html="<p>[foo<a href=\"http://example.com/?search=%5D%5Bref%5D\">http://example.com/?search=][ref]</a></p>\n",
  .markdown="[foo<http://example.com/?search=][ref]>\n\n[ref]: /uri\n",
},
 
TestCase.{
  .start_line=7770,.end_line=7776,.example=510,.sec="Links",
  .html="<p><a href=\"/url\" title=\"title\">foo</a></p>\n",
  .markdown="[foo][BaR]\n\n[bar]: /url \"title\"\n",
},
 
TestCase.{
  .start_line=7781,.end_line=7787,.example=511,.sec="Links",
  .html="<p><a href=\"/url\">Толпой</a> is a Russian word.</p>\n",
  .markdown="[Толпой][Толпой] is a Russian word.\n\n[ТОЛПОЙ]: /url\n",
},
 
TestCase.{
  .start_line=7793,.end_line=7800,.example=512,.sec="Links",
  .html="<p><a href=\"/url\">Baz</a></p>\n",
  .markdown="[Foo\n  bar]: /url\n\n[Baz][Foo bar]\n",
},
 
TestCase.{
  .start_line=7806,.end_line=7812,.example=513,.sec="Links",
  .html="<p>[foo] <a href=\"/url\" title=\"title\">bar</a></p>\n",
  .markdown="[foo] [bar]\n\n[bar]: /url \"title\"\n",
},
 
TestCase.{
  .start_line=7815,.end_line=7823,.example=514,.sec="Links",
  .html="<p>[foo]\n<a href=\"/url\" title=\"title\">bar</a></p>\n",
  .markdown="[foo]\n[bar]\n\n[bar]: /url \"title\"\n",
},
 
TestCase.{
  .start_line=7856,.end_line=7864,.example=515,.sec="Links",
  .html="<p><a href=\"/url1\">bar</a></p>\n",
  .markdown="[foo]: /url1\n\n[foo]: /url2\n\n[bar][foo]\n",
},
 
TestCase.{
  .start_line=7871,.end_line=7877,.example=516,.sec="Links",
  .html="<p>[bar][foo!]</p>\n",
  .markdown="[bar][foo\\!]\n\n[foo!]: /url\n",
},
 
TestCase.{
  .start_line=7883,.end_line=7890,.example=517,.sec="Links",
  .html="<p>[foo][ref[]</p>\n<p>[ref[]: /uri</p>\n",
  .markdown="[foo][ref[]\n\n[ref[]: /uri\n",
},
 
TestCase.{
  .start_line=7893,.end_line=7900,.example=518,.sec="Links",
  .html="<p>[foo][ref[bar]]</p>\n<p>[ref[bar]]: /uri</p>\n",
  .markdown="[foo][ref[bar]]\n\n[ref[bar]]: /uri\n",
},
 
TestCase.{
  .start_line=7903,.end_line=7910,.example=519,.sec="Links",
  .html="<p>[[[foo]]]</p>\n<p>[[[foo]]]: /url</p>\n",
  .markdown="[[[foo]]]\n\n[[[foo]]]: /url\n",
},
 
TestCase.{
  .start_line=7913,.end_line=7919,.example=520,.sec="Links",
  .html="<p><a href=\"/uri\">foo</a></p>\n",
  .markdown="[foo][ref\\[]\n\n[ref\\[]: /uri\n",
},
 
TestCase.{
  .start_line=7924,.end_line=7930,.example=521,.sec="Links",
  .html="<p><a href=\"/uri\">bar\\</a></p>\n",
  .markdown="[bar\\\\]: /uri\n\n[bar\\\\]\n",
},
 
TestCase.{
  .start_line=7935,.end_line=7942,.example=522,.sec="Links",
  .html="<p>[]</p>\n<p>[]: /uri</p>\n",
  .markdown="[]\n\n[]: /uri\n",
},
 
TestCase.{
  .start_line=7945,.end_line=7956,.example=523,.sec="Links",
  .html="<p>[\n]</p>\n<p>[\n]: /uri</p>\n",
  .markdown="[\n ]\n\n[\n ]: /uri\n",
},
 
TestCase.{
  .start_line=7968,.end_line=7974,.example=524,.sec="Links",
  .html="<p><a href=\"/url\" title=\"title\">foo</a></p>\n",
  .markdown="[foo][]\n\n[foo]: /url \"title\"\n",
},
 
TestCase.{
  .start_line=7977,.end_line=7983,.example=525,.sec="Links",
  .html="<p><a href=\"/url\" title=\"title\"><em>foo</em> bar</a></p>\n",
  .markdown="[*foo* bar][]\n\n[*foo* bar]: /url \"title\"\n",
},
 
TestCase.{
  .start_line=7988,.end_line=7994,.example=526,.sec="Links",
  .html="<p><a href=\"/url\" title=\"title\">Foo</a></p>\n",
  .markdown="[Foo][]\n\n[foo]: /url \"title\"\n",
},
 
TestCase.{
  .start_line=8001,.end_line=8009,.example=527,.sec="Links",
  .html="<p><a href=\"/url\" title=\"title\">foo</a>\n[]</p>\n",
  .markdown="[foo] \n[]\n\n[foo]: /url \"title\"\n",
},
 
TestCase.{
  .start_line=8021,.end_line=8027,.example=528,.sec="Links",
  .html="<p><a href=\"/url\" title=\"title\">foo</a></p>\n",
  .markdown="[foo]\n\n[foo]: /url \"title\"\n",
},
 
TestCase.{
  .start_line=8030,.end_line=8036,.example=529,.sec="Links",
  .html="<p><a href=\"/url\" title=\"title\"><em>foo</em> bar</a></p>\n",
  .markdown="[*foo* bar]\n\n[*foo* bar]: /url \"title\"\n",
},
 
TestCase.{
  .start_line=8039,.end_line=8045,.example=530,.sec="Links",
  .html="<p>[<a href=\"/url\" title=\"title\"><em>foo</em> bar</a>]</p>\n",
  .markdown="[[*foo* bar]]\n\n[*foo* bar]: /url \"title\"\n",
},
 
TestCase.{
  .start_line=8048,.end_line=8054,.example=531,.sec="Links",
  .html="<p>[[bar <a href=\"/url\">foo</a></p>\n",
  .markdown="[[bar [foo]\n\n[foo]: /url\n",
},
 
TestCase.{
  .start_line=8059,.end_line=8065,.example=532,.sec="Links",
  .html="<p><a href=\"/url\" title=\"title\">Foo</a></p>\n",
  .markdown="[Foo]\n\n[foo]: /url \"title\"\n",
},
 
TestCase.{
  .start_line=8070,.end_line=8076,.example=533,.sec="Links",
  .html="<p><a href=\"/url\">foo</a> bar</p>\n",
  .markdown="[foo] bar\n\n[foo]: /url\n",
},
 
TestCase.{
  .start_line=8082,.end_line=8088,.example=534,.sec="Links",
  .html="<p>[foo]</p>\n",
  .markdown="\\[foo]\n\n[foo]: /url \"title\"\n",
},
 
TestCase.{
  .start_line=8094,.end_line=8100,.example=535,.sec="Links",
  .html="<p>*<a href=\"/url\">foo*</a></p>\n",
  .markdown="[foo*]: /url\n\n*[foo*]\n",
},
 
TestCase.{
  .start_line=8106,.end_line=8113,.example=536,.sec="Links",
  .html="<p><a href=\"/url2\">foo</a></p>\n",
  .markdown="[foo][bar]\n\n[foo]: /url1\n[bar]: /url2\n",
},
 
TestCase.{
  .start_line=8115,.end_line=8121,.example=537,.sec="Links",
  .html="<p><a href=\"/url1\">foo</a></p>\n",
  .markdown="[foo][]\n\n[foo]: /url1\n",
},
 
TestCase.{
  .start_line=8125,.end_line=8131,.example=538,.sec="Links",
  .html="<p><a href=\"\">foo</a></p>\n",
  .markdown="[foo]()\n\n[foo]: /url1\n",
},
 
TestCase.{
  .start_line=8133,.end_line=8139,.example=539,.sec="Links",
  .html="<p><a href=\"/url1\">foo</a>(not a link)</p>\n",
  .markdown="[foo](not a link)\n\n[foo]: /url1\n",
},
 
TestCase.{
  .start_line=8144,.end_line=8150,.example=540,.sec="Links",
  .html="<p>[foo]<a href=\"/url\">bar</a></p>\n",
  .markdown="[foo][bar][baz]\n\n[baz]: /url\n",
},
 
TestCase.{
  .start_line=8156,.end_line=8163,.example=541,.sec="Links",
  .html="<p><a href=\"/url2\">foo</a><a href=\"/url1\">baz</a></p>\n",
  .markdown="[foo][bar][baz]\n\n[baz]: /url1\n[bar]: /url2\n",
},
 
TestCase.{
  .start_line=8169,.end_line=8176,.example=542,.sec="Links",
  .html="<p>[foo]<a href=\"/url1\">bar</a></p>\n",
  .markdown="[foo][bar][baz]\n\n[baz]: /url1\n[foo]: /url2\n",
},
 
TestCase.{
  .start_line=8192,.end_line=8196,.example=543,.sec="Images",
  .html="<p><img src=\"/url\" alt=\"foo\" title=\"title\" /></p>\n",
  .markdown="![foo](/url \"title\")\n",
},
 
TestCase.{
  .start_line=8199,.end_line=8205,.example=544,.sec="Images",
  .html="<p><img src=\"train.jpg\" alt=\"foo bar\" title=\"train &amp; tracks\" /></p>\n",
  .markdown="![foo *bar*]\n\n[foo *bar*]: train.jpg \"train & tracks\"\n",
},
 
TestCase.{
  .start_line=8208,.end_line=8212,.example=545,.sec="Images",
  .html="<p><img src=\"/url2\" alt=\"foo bar\" /></p>\n",
  .markdown="![foo ![bar](/url)](/url2)\n",
},
 
TestCase.{
  .start_line=8215,.end_line=8219,.example=546,.sec="Images",
  .html="<p><img src=\"/url2\" alt=\"foo bar\" /></p>\n",
  .markdown="![foo [bar](/url)](/url2)\n",
},
 
TestCase.{
  .start_line=8229,.end_line=8235,.example=547,.sec="Images",
  .html="<p><img src=\"train.jpg\" alt=\"foo bar\" title=\"train &amp; tracks\" /></p>\n",
  .markdown="![foo *bar*][]\n\n[foo *bar*]: train.jpg \"train & tracks\"\n",
},
 
TestCase.{
  .start_line=8238,.end_line=8244,.example=548,.sec="Images",
  .html="<p><img src=\"train.jpg\" alt=\"foo bar\" title=\"train &amp; tracks\" /></p>\n",
  .markdown="![foo *bar*][foobar]\n\n[FOOBAR]: train.jpg \"train & tracks\"\n",
},
 
TestCase.{
  .start_line=8247,.end_line=8251,.example=549,.sec="Images",
  .html="<p><img src=\"train.jpg\" alt=\"foo\" /></p>\n",
  .markdown="![foo](train.jpg)\n",
},
 
TestCase.{
  .start_line=8254,.end_line=8258,.example=550,.sec="Images",
  .html="<p>My <img src=\"/path/to/train.jpg\" alt=\"foo bar\" title=\"title\" /></p>\n",
  .markdown="My ![foo bar](/path/to/train.jpg  \"title\"   )\n",
},
 
TestCase.{
  .start_line=8261,.end_line=8265,.example=551,.sec="Images",
  .html="<p><img src=\"url\" alt=\"foo\" /></p>\n",
  .markdown="![foo](<url>)\n",
},
 
TestCase.{
  .start_line=8268,.end_line=8272,.example=552,.sec="Images",
  .html="<p><img src=\"/url\" alt=\"\" /></p>\n",
  .markdown="![](/url)\n",
},
 
TestCase.{
  .start_line=8277,.end_line=8283,.example=553,.sec="Images",
  .html="<p><img src=\"/url\" alt=\"foo\" /></p>\n",
  .markdown="![foo][bar]\n\n[bar]: /url\n",
},
 
TestCase.{
  .start_line=8286,.end_line=8292,.example=554,.sec="Images",
  .html="<p><img src=\"/url\" alt=\"foo\" /></p>\n",
  .markdown="![foo][bar]\n\n[BAR]: /url\n",
},
 
TestCase.{
  .start_line=8297,.end_line=8303,.example=555,.sec="Images",
  .html="<p><img src=\"/url\" alt=\"foo\" title=\"title\" /></p>\n",
  .markdown="![foo][]\n\n[foo]: /url \"title\"\n",
},
 
TestCase.{
  .start_line=8306,.end_line=8312,.example=556,.sec="Images",
  .html="<p><img src=\"/url\" alt=\"foo bar\" title=\"title\" /></p>\n",
  .markdown="![*foo* bar][]\n\n[*foo* bar]: /url \"title\"\n",
},
 
TestCase.{
  .start_line=8317,.end_line=8323,.example=557,.sec="Images",
  .html="<p><img src=\"/url\" alt=\"Foo\" title=\"title\" /></p>\n",
  .markdown="![Foo][]\n\n[foo]: /url \"title\"\n",
},
 
TestCase.{
  .start_line=8329,.end_line=8337,.example=558,.sec="Images",
  .html="<p><img src=\"/url\" alt=\"foo\" title=\"title\" />\n[]</p>\n",
  .markdown="![foo] \n[]\n\n[foo]: /url \"title\"\n",
},
 
TestCase.{
  .start_line=8342,.end_line=8348,.example=559,.sec="Images",
  .html="<p><img src=\"/url\" alt=\"foo\" title=\"title\" /></p>\n",
  .markdown="![foo]\n\n[foo]: /url \"title\"\n",
},
 
TestCase.{
  .start_line=8351,.end_line=8357,.example=560,.sec="Images",
  .html="<p><img src=\"/url\" alt=\"foo bar\" title=\"title\" /></p>\n",
  .markdown="![*foo* bar]\n\n[*foo* bar]: /url \"title\"\n",
},
 
TestCase.{
  .start_line=8362,.end_line=8369,.example=561,.sec="Images",
  .html="<p>![[foo]]</p>\n<p>[[foo]]: /url &quot;title&quot;</p>\n",
  .markdown="![[foo]]\n\n[[foo]]: /url \"title\"\n",
},
 
TestCase.{
  .start_line=8374,.end_line=8380,.example=562,.sec="Images",
  .html="<p><img src=\"/url\" alt=\"Foo\" title=\"title\" /></p>\n",
  .markdown="![Foo]\n\n[foo]: /url \"title\"\n",
},
 
TestCase.{
  .start_line=8386,.end_line=8392,.example=563,.sec="Images",
  .html="<p>![foo]</p>\n",
  .markdown="!\\[foo]\n\n[foo]: /url \"title\"\n",
},
 
TestCase.{
  .start_line=8398,.end_line=8404,.example=564,.sec="Images",
  .html="<p>!<a href=\"/url\" title=\"title\">foo</a></p>\n",
  .markdown="\\![foo]\n\n[foo]: /url \"title\"\n",
},
 
TestCase.{
  .start_line=8431,.end_line=8435,.example=565,.sec="Autolinks",
  .html="<p><a href=\"http://foo.bar.baz\">http://foo.bar.baz</a></p>\n",
  .markdown="<http://foo.bar.baz>\n",
},
 
TestCase.{
  .start_line=8438,.end_line=8442,.example=566,.sec="Autolinks",
  .html="<p><a href=\"http://foo.bar.baz/test?q=hello&amp;id=22&amp;boolean\">http://foo.bar.baz/test?q=hello&amp;id=22&amp;boolean</a></p>\n",
  .markdown="<http://foo.bar.baz/test?q=hello&id=22&boolean>\n",
},
 
TestCase.{
  .start_line=8445,.end_line=8449,.example=567,.sec="Autolinks",
  .html="<p><a href=\"irc://foo.bar:2233/baz\">irc://foo.bar:2233/baz</a></p>\n",
  .markdown="<irc://foo.bar:2233/baz>\n",
},
 
TestCase.{
  .start_line=8454,.end_line=8458,.example=568,.sec="Autolinks",
  .html="<p><a href=\"MAILTO:FOO@BAR.BAZ\">MAILTO:FOO@BAR.BAZ</a></p>\n",
  .markdown="<MAILTO:FOO@BAR.BAZ>\n",
},
 
TestCase.{
  .start_line=8466,.end_line=8470,.example=569,.sec="Autolinks",
  .html="<p><a href=\"a+b+c:d\">a+b+c:d</a></p>\n",
  .markdown="<a+b+c:d>\n",
},
 
TestCase.{
  .start_line=8473,.end_line=8477,.example=570,.sec="Autolinks",
  .html="<p><a href=\"made-up-scheme://foo,bar\">made-up-scheme://foo,bar</a></p>\n",
  .markdown="<made-up-scheme://foo,bar>\n",
},
 
TestCase.{
  .start_line=8480,.end_line=8484,.example=571,.sec="Autolinks",
  .html="<p><a href=\"http://../\">http://../</a></p>\n",
  .markdown="<http://../>\n",
},
 
TestCase.{
  .start_line=8487,.end_line=8491,.example=572,.sec="Autolinks",
  .html="<p><a href=\"localhost:5001/foo\">localhost:5001/foo</a></p>\n",
  .markdown="<localhost:5001/foo>\n",
},
 
TestCase.{
  .start_line=8496,.end_line=8500,.example=573,.sec="Autolinks",
  .html="<p>&lt;http://foo.bar/baz bim&gt;</p>\n",
  .markdown="<http://foo.bar/baz bim>\n",
},
 
TestCase.{
  .start_line=8505,.end_line=8509,.example=574,.sec="Autolinks",
  .html="<p><a href=\"http://example.com/%5C%5B%5C\">http://example.com/\\[\\</a></p>\n",
  .markdown="<http://example.com/\\[\\>\n",
},
 
TestCase.{
  .start_line=8527,.end_line=8531,.example=575,.sec="Autolinks",
  .html="<p><a href=\"mailto:foo@bar.example.com\">foo@bar.example.com</a></p>\n",
  .markdown="<foo@bar.example.com>\n",
},
 
TestCase.{
  .start_line=8534,.end_line=8538,.example=576,.sec="Autolinks",
  .html="<p><a href=\"mailto:foo+special@Bar.baz-bar0.com\">foo+special@Bar.baz-bar0.com</a></p>\n",
  .markdown="<foo+special@Bar.baz-bar0.com>\n",
},
 
TestCase.{
  .start_line=8543,.end_line=8547,.example=577,.sec="Autolinks",
  .html="<p>&lt;foo+@bar.example.com&gt;</p>\n",
  .markdown="<foo\\+@bar.example.com>\n",
},
 
TestCase.{
  .start_line=8552,.end_line=8556,.example=578,.sec="Autolinks",
  .html="<p>&lt;&gt;</p>\n",
  .markdown="<>\n",
},
 
TestCase.{
  .start_line=8559,.end_line=8563,.example=579,.sec="Autolinks",
  .html="<p>&lt; http://foo.bar &gt;</p>\n",
  .markdown="< http://foo.bar >\n",
},
 
TestCase.{
  .start_line=8566,.end_line=8570,.example=580,.sec="Autolinks",
  .html="<p>&lt;m:abc&gt;</p>\n",
  .markdown="<m:abc>\n",
},
 
TestCase.{
  .start_line=8573,.end_line=8577,.example=581,.sec="Autolinks",
  .html="<p>&lt;foo.bar.baz&gt;</p>\n",
  .markdown="<foo.bar.baz>\n",
},
 
TestCase.{
  .start_line=8580,.end_line=8584,.example=582,.sec="Autolinks",
  .html="<p>http://example.com</p>\n",
  .markdown="http://example.com\n",
},
 
TestCase.{
  .start_line=8587,.end_line=8591,.example=583,.sec="Autolinks",
  .html="<p>foo@bar.example.com</p>\n",
  .markdown="foo@bar.example.com\n",
},
 
TestCase.{
  .start_line=8669,.end_line=8673,.example=584,.sec="Raw HTML",
  .html="<p><a><bab><c2c></p>\n",
  .markdown="<a><bab><c2c>\n",
},
 
TestCase.{
  .start_line=8678,.end_line=8682,.example=585,.sec="Raw HTML",
  .html="<p><a/><b2/></p>\n",
  .markdown="<a/><b2/>\n",
},
 
TestCase.{
  .start_line=8687,.end_line=8693,.example=586,.sec="Raw HTML",
  .html="<p><a  /><b2\ndata=\"foo\" ></p>\n",
  .markdown="<a  /><b2\ndata=\"foo\" >\n",
},
 
TestCase.{
  .start_line=8698,.end_line=8704,.example=587,.sec="Raw HTML",
  .html="<p><a foo=\"bar\" bam = 'baz <em>\"</em>'\n_boolean zoop:33=zoop:33 /></p>\n",
  .markdown="<a foo=\"bar\" bam = 'baz <em>\"</em>'\n_boolean zoop:33=zoop:33 />\n",
},
 
TestCase.{
  .start_line=8709,.end_line=8713,.example=588,.sec="Raw HTML",
  .html="<p>Foo <responsive-image src=\"foo.jpg\" /></p>\n",
  .markdown="Foo <responsive-image src=\"foo.jpg\" />\n",
},
 
TestCase.{
  .start_line=8718,.end_line=8722,.example=589,.sec="Raw HTML",
  .html="<p>&lt;33&gt; &lt;__&gt;</p>\n",
  .markdown="<33> <__>\n",
},
 
TestCase.{
  .start_line=8727,.end_line=8731,.example=590,.sec="Raw HTML",
  .html="<p>&lt;a h*#ref=&quot;hi&quot;&gt;</p>\n",
  .markdown="<a h*#ref=\"hi\">\n",
},
 
TestCase.{
  .start_line=8736,.end_line=8740,.example=591,.sec="Raw HTML",
  .html="<p>&lt;a href=&quot;hi'&gt; &lt;a href=hi'&gt;</p>\n",
  .markdown="<a href=\"hi'> <a href=hi'>\n",
},
 
TestCase.{
  .start_line=8745,.end_line=8751,.example=592,.sec="Raw HTML",
  .html="<p>&lt; a&gt;&lt;\nfoo&gt;&lt;bar/ &gt;</p>\n",
  .markdown="< a><\nfoo><bar/ >\n",
},
 
TestCase.{
  .start_line=8756,.end_line=8760,.example=593,.sec="Raw HTML",
  .html="<p>&lt;a href='bar'title=title&gt;</p>\n",
  .markdown="<a href='bar'title=title>\n",
},
 
TestCase.{
  .start_line=8765,.end_line=8769,.example=594,.sec="Raw HTML",
  .html="<p></a></foo ></p>\n",
  .markdown="</a></foo >\n",
},
 
TestCase.{
  .start_line=8774,.end_line=8778,.example=595,.sec="Raw HTML",
  .html="<p>&lt;/a href=&quot;foo&quot;&gt;</p>\n",
  .markdown="</a href=\"foo\">\n",
},
 
TestCase.{
  .start_line=8783,.end_line=8789,.example=596,.sec="Raw HTML",
  .html="<p>foo <!-- this is a\ncomment - with hyphen --></p>\n",
  .markdown="foo <!-- this is a\ncomment - with hyphen -->\n",
},
 
TestCase.{
  .start_line=8792,.end_line=8796,.example=597,.sec="Raw HTML",
  .html="<p>foo &lt;!-- not a comment -- two hyphens --&gt;</p>\n",
  .markdown="foo <!-- not a comment -- two hyphens -->\n",
},
 
TestCase.{
  .start_line=8801,.end_line=8808,.example=598,.sec="Raw HTML",
  .html="<p>foo &lt;!--&gt; foo --&gt;</p>\n<p>foo &lt;!-- foo---&gt;</p>\n",
  .markdown="foo <!--> foo -->\n\nfoo <!-- foo--->\n",
},
 
TestCase.{
  .start_line=8813,.end_line=8817,.example=599,.sec="Raw HTML",
  .html="<p>foo <?php echo $a; ?></p>\n",
  .markdown="foo <?php echo $a; ?>\n",
},
 
TestCase.{
  .start_line=8822,.end_line=8826,.example=600,.sec="Raw HTML",
  .html="<p>foo <!ELEMENT br EMPTY></p>\n",
  .markdown="foo <!ELEMENT br EMPTY>\n",
},
 
TestCase.{
  .start_line=8831,.end_line=8835,.example=601,.sec="Raw HTML",
  .html="<p>foo <![CDATA[>&<]]></p>\n",
  .markdown="foo <![CDATA[>&<]]>\n",
},
 
TestCase.{
  .start_line=8841,.end_line=8845,.example=602,.sec="Raw HTML",
  .html="<p>foo <a href=\"&ouml;\"></p>\n",
  .markdown="foo <a href=\"&ouml;\">\n",
},
 
TestCase.{
  .start_line=8850,.end_line=8854,.example=603,.sec="Raw HTML",
  .html="<p>foo <a href=\"\\*\"></p>\n",
  .markdown="foo <a href=\"\\*\">\n",
},
 
TestCase.{
  .start_line=8857,.end_line=8861,.example=604,.sec="Raw HTML",
  .html="<p>&lt;a href=&quot;&quot;&quot;&gt;</p>\n",
  .markdown="<a href=\"\\\"\">\n",
},
 
TestCase.{
  .start_line=8871,.end_line=8877,.example=605,.sec="Hard line breaks",
  .html="<p>foo<br />\nbaz</p>\n",
  .markdown="foo  \nbaz\n",
},
 
TestCase.{
  .start_line=8883,.end_line=8889,.example=606,.sec="Hard line breaks",
  .html="<p>foo<br />\nbaz</p>\n",
  .markdown="foo\\\nbaz\n",
},
 
TestCase.{
  .start_line=8894,.end_line=8900,.example=607,.sec="Hard line breaks",
  .html="<p>foo<br />\nbaz</p>\n",
  .markdown="foo       \nbaz\n",
},
 
TestCase.{
  .start_line=8905,.end_line=8911,.example=608,.sec="Hard line breaks",
  .html="<p>foo<br />\nbar</p>\n",
  .markdown="foo  \n     bar\n",
},
 
TestCase.{
  .start_line=8914,.end_line=8920,.example=609,.sec="Hard line breaks",
  .html="<p>foo<br />\nbar</p>\n",
  .markdown="foo\\\n     bar\n",
},
 
TestCase.{
  .start_line=8926,.end_line=8932,.example=610,.sec="Hard line breaks",
  .html="<p><em>foo<br />\nbar</em></p>\n",
  .markdown="*foo  \nbar*\n",
},
 
TestCase.{
  .start_line=8935,.end_line=8941,.example=611,.sec="Hard line breaks",
  .html="<p><em>foo<br />\nbar</em></p>\n",
  .markdown="*foo\\\nbar*\n",
},
 
TestCase.{
  .start_line=8946,.end_line=8951,.example=612,.sec="Hard line breaks",
  .html="<p><code>code span</code></p>\n",
  .markdown="`code  \nspan`\n",
},
 
TestCase.{
  .start_line=8954,.end_line=8959,.example=613,.sec="Hard line breaks",
  .html="<p><code>code\\ span</code></p>\n",
  .markdown="`code\\\nspan`\n",
},
 
TestCase.{
  .start_line=8964,.end_line=8970,.example=614,.sec="Hard line breaks",
  .html="<p><a href=\"foo  \nbar\"></p>\n",
  .markdown="<a href=\"foo  \nbar\">\n",
},
 
TestCase.{
  .start_line=8973,.end_line=8979,.example=615,.sec="Hard line breaks",
  .html="<p><a href=\"foo\\\nbar\"></p>\n",
  .markdown="<a href=\"foo\\\nbar\">\n",
},
 
TestCase.{
  .start_line=8986,.end_line=8990,.example=616,.sec="Hard line breaks",
  .html="<p>foo\\</p>\n",
  .markdown="foo\\\n",
},
 
TestCase.{
  .start_line=8993,.end_line=8997,.example=617,.sec="Hard line breaks",
  .html="<p>foo</p>\n",
  .markdown="foo  \n",
},
 
TestCase.{
  .start_line=9000,.end_line=9004,.example=618,.sec="Hard line breaks",
  .html="<h3>foo\\</h3>\n",
  .markdown="### foo\\\n",
},
 
TestCase.{
  .start_line=9007,.end_line=9011,.example=619,.sec="Hard line breaks",
  .html="<h3>foo</h3>\n",
  .markdown="### foo  \n",
},
 
TestCase.{
  .start_line=9022,.end_line=9028,.example=620,.sec="Soft line breaks",
  .html="<p>foo\nbaz</p>\n",
  .markdown="foo\nbaz\n",
},
 
TestCase.{
  .start_line=9034,.end_line=9040,.example=621,.sec="Soft line breaks",
  .html="<p>foo\nbaz</p>\n",
  .markdown="foo \n baz\n",
},
 
TestCase.{
  .start_line=9054,.end_line=9058,.example=622,.sec="Textual content",
  .html="<p>hello $.;'there</p>\n",
  .markdown="hello $.;'there\n",
},
 
TestCase.{
  .start_line=9061,.end_line=9065,.example=623,.sec="Textual content",
  .html="<p>Foo χρῆν</p>\n",
  .markdown="Foo χρῆν\n",
},
 
TestCase.{
  .start_line=9070,.end_line=9074,.example=624,.sec="Textual content",
  .html="<p>Multiple     spaces</p>\n",
  .markdown="Multiple     spaces\n",
},
 
};