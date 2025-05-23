local ls = require 'luasnip'
ls.cleanup()
ls.add_snippets('typescript', {
	ls.parser.parse_snippet({ trig = 'function' }, '$1($2): $3 {\n	$0\n}'),
	ls.parser.parse_snippet({ trig = 'private function' }, 'private $1($2): $3 {\n	$0\n}'),
	ls.parser.parse_snippet({ trig = 'foreach' }, '${1:iterable}.forEach(${2:arg} => {\n\t$0\n});'),
	ls.parser.parse_snippet({ trig = 'map' }, '${1:iterable}.map(${2:arg} => ${0:output});'),
	ls.parser.parse_snippet({ trig = 'filter' }, '${1:iterable}.filter(${2:arg} => ${0:condition});'),
	ls.parser.parse_snippet({ trig = 'find' }, '${1:iterable}.find(${2:arg} => ${0:condition});'),
	ls.parser.parse_snippet({ trig = 'reduce' }, '${1:iterable}.reduce(${2:args} => $0, ${3:initial});'),
	ls.parser.parse_snippet({ trig = 'forloop', name = 'For loop' }, 'for($1) {\n\t$0\n}'),
	ls.parser.parse_snippet({ trig = 'if', name = 'If statement' }, 'if($1) {\n\t$0\n}'),
	ls.parser.parse_snippet({ trig = '{ ', name = 'Inline block' }, '{ $0 }'),
	ls.parser.parse_snippet({ trig = '{', name = 'Block' }, '{\n\t$0\n}'),
	ls.parser.parse_snippet({ trig = 'clog', name = 'Console Log' }, 'console.log("$0");'),

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

ls.add_snippets('html', {
	ls.parser.parse_snippet({ trig = 'div', name = 'div' }, '<div>$0</div>'),
	ls.parser.parse_snippet({ trig = 'span', name = 'span' }, '<span>$0</span>'),
	ls.parser.parse_snippet({ trig = 'class', name = 'class' }, 'class="$0"'),

	-- Angular
	-- TODO: load only in angular projects
	ls.parser.parse_snippet({ trig = 'if', name = 'If' }, '@if (${1:condition}) {\n\t$0\n}'),
	ls.parser.parse_snippet({ trig = 'ngcont', name = 'Ng-container' }, '<ng-container>$0</ng-container>'),
	ls.parser.parse_snippet({ trig = 'ngtemp', name = 'Ng-template' }, '<ng-template>$0</ng-template>'),
	ls.parser.parse_snippet({ trig = 'input', name = 'Input' }, '[${1:name}]="${0:value}"'),
	ls.parser.parse_snippet({ trig = 'output', name = 'Output' }, '(${1:name})="${0:value}"'),
	ls.parser.parse_snippet({ trig = 'doublebind', name = 'Double binding' }, '[(${1:name})]="${0:value}"'),
	ls.parser.parse_snippet({ trig = 'databind', name = 'Data binding' }, '{{ $0 }}'),
})

ls.add_snippets('go', {
	ls.parser.parse_snippet({ trig = 'for', name = 'For loop' }, 'for $1 {\n\t$0\n}'),
})
