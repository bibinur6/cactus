fetch('http://localhost:8080/codecraft/api/contest/addPoint?roomId=727724&&name=Ualikhan')
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
