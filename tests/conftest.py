"""
Pytest configuration and shared fixtures.
"""

import pytest


@pytest.fixture
def sample_data():
    """Sample data for tests."""
    return {
        "id": 1,
        "name": "Test Item",
        "values": [1, 2, 3],
    }


@pytest.fixture
def temp_file(tmp_path):
    """Create a temporary file for testing."""
    file_path = tmp_path / "test.txt"
    file_path.write_text("test content")
    return file_path


# Add more fixtures as needed

