import React, { useEffect, useState } from 'react';
import styles from './App.module.css';

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
    <div className={styles.app}>
      <div className={styles.container}>
        <h1 className={styles.header}>Cost Explorer Data</h1>
        
        <div 
          className={`${styles.statusBox} ${
            error ? styles.errorStatus : 
            apiData ? styles.successStatus : 
            styles.loadingStatus
          }`}
        >
          {error ? (
            <div>
              <strong>Error:</strong> {error}
            </div>
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