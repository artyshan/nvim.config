local ls = require 'luasnip'
ls.cleanup()
ls.add_snippets('typescript', {
	ls.parser.parse_snippet({ trig = 'function' }, '$1($2): $3 {\n	$0\n}'),
	ls.parser.parse_snippet({ trig = 'private function' }, 'private $1($2): $3 {\n	$0\n}'),
	ls.parser.parse_snippet({ trig = 'foreach' }, 'foreach($1 => {\n\t$0\n});'),
	ls.parser.parse_snippet({ trig = 'map' }, 'map($1 => $0);'),
	ls.parser.parse_snippet({ trig = 'filter' }, 'filter($1 => $0);'),
	ls.parser.parse_snippet({ trig = 'reduce' }, 'reduce(($1) => $0, $2);'),
	ls.parser.parse_snippet({ trig = 'for', name = 'For loop' }, 'for($1) {\n\t$0\n}'),
	ls.parser.parse_snippet({ trig = 'if', name = 'If statement' }, 'if($1) {\n\t$0\n}'),
	ls.parser.parse_snippet({ trig = '{ ', name = 'Inline block' }, '{ $0 }'),
	ls.parser.parse_snippet({ trig = '{', name = 'Block' }, '{\n\t$0\n}'),
	ls.parser.parse_snippet({ trig = 'console', name = 'Console Log' }, 'console.log("$0");'),

	-- angular

	ls.parser.parse_snippet({ trig = 'inpdec', name = 'Input decorator' }, '@Input() ${0:expression}'),
	ls.parser.parse_snippet({ trig = 'input', name = 'Input signal' }, '${1:variable} = input(${0:default});'),
	ls.parser.parse_snippet({ trig = 'output', name = 'Output signal' }, '${1:variable} = output<${0:type}>();'),
})
-- TODO: do not duplicate
ls.add_snippets('javascript', {
	ls.parser.parse_snippet({ trig = 'function' }, '$1($2): $3 {\n	$0\n}'),
	ls.parser.parse_snippet({ trig = 'private function' }, 'private $1($2): $3 {\n	$0\n}'),
	ls.parser.parse_snippet({ trig = 'foreach' }, 'foreach($1 => {\n\t$0\n});'),
	ls.parser.parse_snippet({ trig = 'map' }, '${1:iterable}.map(${2:item} => $0);'),
	ls.parser.parse_snippet({ trig = 'filter' }, 'filter($1 => $0);'),
	ls.parser.parse_snippet({ trig = 'reduce' }, 'reduce(($1) => $0, $2);'),
	ls.parser.parse_snippet({ trig = 'for', name = 'For loop' }, 'for($1) {\n\t$0\n}'),
	ls.parser.parse_snippet({ trig = 'if', name = 'If statement' }, 'if($1) {\n\t$0\n}'),
	ls.parser.parse_snippet({ trig = '{ ', name = 'Inline block' }, '{ $0 }'),
	ls.parser.parse_snippet({ trig = '{', name = 'Block' }, '{\n\t$0\n}'),
	ls.parser.parse_snippet({ trig = 'clog', name = 'Console Log' }, 'console.log($0);'),
})

ls.add_snippets('go', {
	ls.parser.parse_snippet({ trig = 'for', name = 'For loop' }, 'for $1 {\n\t$0\n}'),
})
