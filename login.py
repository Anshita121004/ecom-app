import tkinter as tk
from tkinter import messagebox
import mysql.connector
import os

class LoginForm:
    def __init__(self, root):
        self.root = root
        self.root.title("Login Form")
        self.root.geometry('340x440')
        self.root.configure(bg='#333333')

        self.frame = tk.Frame(root, bg='#333333')

        self.login_label = tk.Label(
            self.frame, text="Login", bg='#333333', fg="#FF3399", font=("Arial", 30))
        self.username_label = tk.Label(
            self.frame, text="Username", bg='#333333', fg="#FFFFFF", font=("Arial", 16))
        self.username_entry = tk.Entry(self.frame, font=("Arial", 16))
        self.password_entry = tk.Entry(self.frame, show="*", font=("Arial", 16))
        self.password_label = tk.Label(
            self.frame, text="Password", bg='#333333', fg="#FFFFFF", font=("Arial", 16))
        self.login_button = tk.Button(
            self.frame, text="Login", bg="#FF3399", fg="#FFFFFF", font=("Arial", 16), command=self.login)
        self.signup_button = tk.Button(
            self.frame, text="Sign Up", bg="#FF3399", fg="#FFFFFF", font=("Arial", 16), command=self.open_signup_window)

        self.user_type = tk.StringVar()
        self.user_type.set("user")

        self.user_radio = tk.Radiobutton(self.frame, text="User", variable=self.user_type, value="user", bg='#333333', fg="#FFFFFF", font=("Arial", 14))
        self.admin_radio = tk.Radiobutton(self.frame, text="Admin", variable=self.user_type, value="admin", bg='#333333', fg="#FFFFFF", font=("Arial", 14))

        self.login_label.grid(row=0, column=0, columnspan=2, sticky="news", pady=40)
        self.username_label.grid(row=1, column=0)
        self.username_entry.grid(row=1, column=1, pady=20)
        self.password_label.grid(row=2, column=0)
        self.password_entry.grid(row=2, column=1, pady=20)
        self.login_button.grid(row=3, column=0, columnspan=2, pady=10)
        self.signup_button.grid(row=4, column=0, columnspan=2, pady=10)
        self.user_radio.grid(row=5, column=0, pady=10)
        self.admin_radio.grid(row=5, column=1, pady=10)

        # Connect to MySQL database
        self.db_connection = mysql.connector.connect(
            host="localhost",
            user="root",
            password="####",
            database="amazon"
        )
        self.cursor = self.db_connection.cursor()

        self.frame.pack()

    def login(self):
        username = self.username_entry.get()
        password = self.password_entry.get()
        user_type = self.user_type.get()

        if user_type == "user":
            query = "SELECT UserID FROM user WHERE Username = %s AND Password = %s"
        elif user_type == "admin":
            query = "SELECT AdminID FROM admin WHERE Username = %s AND Password = %s"
        else:
            messagebox.showerror(title="Error", message="Please select user or admin.")
            return

        self.cursor.execute(query, (username, password))
        result = self.cursor.fetchone()

        if result:
            # Store user ID in session storage or local storage
            user_id = result[0]
            with open("user_id.txt", "w") as f:
                f.write(str(user_id))
            
            messagebox.showinfo(title="Login Success", message="{} successfully logged in.".format(user_type.capitalize()))

            # Open homepage.py upon successful login
            os.system("python homepage.py")
            self.root.destroy()  # Close the login window
        else:
            messagebox.showerror(title="Error", message="Invalid {} credentials.".format(user_type))

    def open_signup_window(self):
        os.system("python signup.py")

    def __del__(self):
        # Close database connection when the application exits
        self.db_connection.close()

# Create the Tkinter application window
root = tk.Tk()
app = LoginForm(root)
root.mainloop()
