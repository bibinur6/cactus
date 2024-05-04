fetch('http://localhost:8080/codecraft/api/contest/get?roomId=727724')
    .then(response => {
        if (!response.ok) {
            throw new Error('Network response was not ok');
        }
        return response.json(); // Parse response as JSON
    })
    .then(data => {
        console.log(data);
        console.log(data.contest.leaderBoard);
    })
    .catch(error => {
        console.error('Error:', error);
        // Handle errors, including JSON parsing errors
    });