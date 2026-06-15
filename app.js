const http = require('http');

const PORT = 3000;

const server = http.createServer((req, res) => {
  res.writeHead(200, { 'Content-Type': 'text/html' });
  res.end('<h1>Hello from my CI/CD Pipeline!</h1><p>Built with Jenkins + Docker</p>');
});

server.listen(PORT, () => {
  console.log(`Server running on port ${PORT}`);
});