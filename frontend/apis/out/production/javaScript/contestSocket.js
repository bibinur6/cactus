const WebSocket = require('ws');
const socket = new WebSocket('ws://localhost:8080/codecraft/api/contest');

socket.onopen = function(event) {
    console.log('Connected to socket server');
};

socket.onmessage = function(event) {
    const message = event.data;
    console.log('Received message:', message);
};

socket.onerror = function(error) {
    console.error('Socket encountered error:', error.body);
};

socket.onclose = function(event) {
    console.log('Socket connection closed:', event);
};