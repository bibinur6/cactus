fetch('http://localhost:8080/codecraft/api/contest/leader?roomId=727724&&name=Olzhas')
    .then(response => {
        if (!response.ok) {
            throw new Error('Network response was not ok');
        }
        return response.json(); // Parse response as JSON
    })
    .then(data => {
        console.log(data);
    })
    .catch(error => {
        console.error('Error:', error);
        // Handle errors, including JSON parsing errors
    });