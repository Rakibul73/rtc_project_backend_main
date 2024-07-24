# test_db.py
import pytest
from unittest.mock import patch, MagicMock
import db

@patch('db.mysql.connector.connect')
def test_get_db(mock_connect):
    # Arrange: Create a mock connection object
    mock_connection = MagicMock()
    mock_connect.return_value = mock_connection

    # Act: Call the function to be tested
    connection = db.get_db()

    # Assert: Check that the connection is returned as expected
    mock_connect.assert_called_once_with(**db.db_config)
    assert connection == mock_connection
