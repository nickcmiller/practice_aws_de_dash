import React, { useEffect, useState } from 'react';

function App() {
  const [apiData, setApiData] = useState(null);
  const [error, setError] = useState(null);
  const baseApiUrl = process.env.REACT_APP_API_GATEWAY_URL;

  useEffect(() => {
    const fetchData = async () => {
      if (!baseApiUrl) {
        setError('API URL is not defined');
        return;
      }

      // Construct the URL properly with /cost endpoint
      const apiUrl = `${baseApiUrl}/cost`;
      
      console.log('Fetching from URL:', apiUrl);

      try {
        const response = await fetch(apiUrl, {
          method: 'GET',
          headers: {
            'Accept': 'application/json',
            'Content-Type': 'application/json',
          },
          mode: 'cors' // Explicitly set CORS mode
        });
        
        // Debug logs
        console.log('Response status:', response.status);
        console.log('Response headers:', Object.fromEntries(response.headers));
        
        if (!response.ok) {
          throw new Error(`HTTP error! status: ${response.status}`);
        }
        
        const data = await response.json();
        console.log('Received data:', data); // Debug log
        setApiData(data);
        setError(null);
      } catch (error) {
        console.error('Detailed error:', error);
        setError(`${error.message} - API URL: ${apiUrl}`);
        setApiData(null);
      }
    };

    fetchData();
  }, [baseApiUrl]);

  return (
    <div className="App">
      <h1>Welcome to the React Static Website</h1>
      <p>This website is hosted on S3 using Terraform. I'm not a cat.</p>
      <div>
        <h2>Cost Explorer Data</h2>
        <div style={{backgroundColor: '#f5f5f5', padding: '10px', borderRadius: '5px'}}>
          <p><strong>Debug Info:</strong></p>
          <p>API URL: {baseApiUrl || 'Not set'}</p>
          {error ? (
            <div style={{ color: 'red' }}>Error: {error}</div>
          ) : apiData ? (
            <div>{apiData.message}</div>
          ) : (
            <div>Loading...</div>
          )}
        </div>
      </div>
    </div>
  );
}

export default App;