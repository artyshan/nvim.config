local ls = require 'luasnip'
ls.add_snippets('typescript', {
	ls.parser.parse_snippet({ trig = 'function' }, '$1($2): $3 {\n	$0\n}'),
	ls.parser.parse_snippet({ trig = 'private function' }, 'private $1($2): $3 {\n	$0\n}'),
})
