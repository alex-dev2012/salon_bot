import sqlite3

# id (auto),  

class Database:
    def __init__(self, db_file):
        self.connection = sqlite3.connect(db_file)
        self.isConnect = bool(self.connection)
        self.cursor = self.connection.cursor()
    
    def add_user(self, user_id, user_name, join_time):
        with self.connection:
            query = 'INSERT INTO users (user_id, user_name, join_time) VALUES (?, ?, ?)'
            self.cursor.execute(query, (user_id, user_name, join_time))
