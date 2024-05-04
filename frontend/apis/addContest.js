const questions = [1,2,3];
const duration = 3;
const toSend = {
    questions: questions,
    duration: duration
}

const fetchSettings = { method: 'POST', body: JSON.stringify(toSend)};

fetch('http://localhost:8080/codecraft/api/contest/open', fetchSettings)
    .then(response => {
        if (!response.ok) {
            throw new Error('Network response was not ok');
        }
        return response.json(); // Parse response as JSON
    })
    .then(data => {
        console.log(data);
        // Do something with the response data
    })
    .catch(error => {
        console.error('Error:', error);
        // Handle errors, including JSON parsing errors
    });