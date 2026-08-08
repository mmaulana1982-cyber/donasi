const fs = require('fs');
const parser = require('@babel/parser');

const text = fs.readFileSync('d:/DONASI/index.html', 'utf8');
const start = text.indexOf('<script type="text/babel">');
const end = text.indexOf('</script>', start);
const script = text.slice(start + '<script type="text/babel">'.length, end);

try {
  const ast = parser.parse(script, {
    sourceType: 'module',
    plugins: ['jsx']
  });
  console.log('PARSE_OK');
  console.log('bodyLength=', ast.program.body.length);
} catch (e) {
  console.log('PARSE_ERROR');
  console.log('message=', e.message);
  if (e.loc) {
    console.log('line=', e.loc.line, 'column=', e.loc.column);
  }
  console.log('stack=', e.stack.split('\n').slice(0, 3).join('\n'));
}
