import tkinter as tk
from tkinter import messagebox
import mysql.connector

class ProfilePage:
    def __init__(self, root, user_id):
        self.root = root
        self.user_id = user_id
        self.root.title("Profile Page")
        self.root.geometry('400x500')
        self.root.configure(bg='#333333')

        self.frame = tk.Frame(root, bg='#333333')

        self.profile_label = tk.Label(
            self.frame, text="Profile", bg='#333333', fg="#FF3399", font=("Arial", 30))
        self.username_label = tk.Label(
            self.frame, text="Username", bg='#333333', fg="#FFFFFF", font=("Arial", 16))
        self.username_entry = tk.Entry(self.frame, font=("Arial", 16))
        self.email_label = tk.Label(
            self.frame, text="Email", bg='#333333', fg="#FFFFFF", font=("Arial", 16))
        self.email_entry = tk.Entry(self.frame, font=("Arial", 16))
        self.first_name_label = tk.Label(
            self.frame, text="First Name", bg='#333333', fg="#FFFFFF", font=("Arial", 16))
        self.first_name_entry = tk.Entry(self.frame, font=("Arial", 16))
        self.last_name_label = tk.Label(
            self.frame, text="Last Name", bg='#333333', fg="#FFFFFF", font=("Arial", 16))
        self.last_name_entry = tk.Entry(self.frame, font=("Arial", 16))
        self.phone_label = tk.Label(
            self.frame, text="Phone Number", bg='#333333', fg="#FFFFFF", font=("Arial", 16))
        self.phone_entry = tk.Entry(self.frame, font=("Arial", 16))
        self.house_no_label = tk.Label(
            self.frame, text="House No.", bg='#333333', fg="#FFFFFF", font=("Arial", 16))
        self.house_no_entry = tk.Entry(self.frame, font=("Arial", 16))
        self.street_label = tk.Label(
            self.frame, text="Street", bg='#333333', fg="#FFFFFF", font=("Arial", 16))
        self.street_entry = tk.Entry(self.frame, font=("Arial", 16))
        self.city_label = tk.Label(
            self.frame, text="City", bg='#333333', fg="#FFFFFF", font=("Arial", 16))
        self.city_entry = tk.Entry(self.frame, font=("Arial", 16))
        self.pincode_label = tk.Label(
            self.frame, text="Pincode", bg='#333333', fg="#FFFFFF", font=("Arial", 16))
        self.pincode_entry = tk.Entry(self.frame, font=("Arial", 16))
        self.update_button = tk.Button(
            self.frame, text="Update", bg="#FF3399", fg="#FFFFFF", font=("Arial", 16), command=self.update_profile)

        self.profile_label.grid(row=0, column=0, columnspan=2, sticky="news", pady=20)
        self.username_label.grid(row=1, column=0)
        self.username_entry.grid(row=1, column=1, pady=10)
        self.email_label.grid(row=2, column=0)
        self.email_entry.grid(row=2, column=1, pady=10)
        self.first_name_label.grid(row=3, column=0)
        self.first_name_entry.grid(row=3, column=1, pady=10)
        self.last_name_label.grid(row=4, column=0)
        self.last_name_entry.grid(row=4, column=1, pady=10)
        self.phone_label.grid(row=5, column=0)
        self.phone_entry.grid(row=5, column=1, pady=10)
        self.house_no_label.grid(row=6, column=0)
        self.house_no_entry.grid(row=6, column=1, pady=10)
        self.street_label.grid(row=7, column=0)
        self.street_entry.grid(row=7, column=1, pady=10)
        self.city_label.grid(row=8, column=0)
        self.city_entry.grid(row=8, column=1, pady=10)
        self.pincode_label.grid(row=9, column=0)
        self.pincode_entry.grid(row=9, column=1, pady=10)
        self.update_button.grid(row=10, column=0, columnspan=2, pady=20)

        # Connect to MySQL database
        self.db_connection = mysql.connector.connect(
            host="localhost",
            user="root",
            password="####",
            database="amazon"
        )
        self.cursor = self.db_connection.cursor()

        self.load_user_profile()

        self.frame.pack()

    def load_user_profile(self):
        query = "SELECT Username, Email, FirstName, LastName, PhoneNumber, houseNo, street, city, pincode FROM user WHERE UserID = %s"
        self.cursor.execute(query, (self.user_id,))
        user_data = self.cursor.fetchone()

        if user_data:
            self.username_entry.delete(0, tk.END)
            self.email_entry.delete(0, tk.END)
            self.first_name_entry.delete(0, tk.END)
            self.last_name_entry.delete(0, tk.END)

            self.username_entry.insert(0, user_data[0])
            self.email_entry.insert(0, user_data[1])
            self.first_name_entry.insert(0, user_data[2])
            self.last_name_entry.insert(0, user_data[3])
            self.phone_entry.insert(0, user_data[4])
            self.house_no_entry.insert(0, user_data[5])
            self.street_entry.insert(0, user_data[6])
            self.city_entry.insert(0, user_data[7])
            self.pincode_entry.insert(0, user_data[8])

    def update_profile(self):
        username = self.username_entry.get()
        email = self.email_entry.get()
        first_name = self.first_name_entry.get()
        last_name = self.last_name_entry.get()
        phone = self.phone_entry.get()
        house_no = self.house_no_entry.get()
        street = self.street_entry.get()
        city = self.city_entry.get()
        pincode = self.pincode_entry.get()

        query = "UPDATE user SET Username = %s, Email = %s, FirstName = %s, LastName = %s, PhoneNumber = %s, houseNo = %s, street = %s, city = %s, pincode = %s WHERE UserID = %s"
        values = (username, email, first_name, last_name, phone, house_no, street, city, pincode, self.user_id)

        self.cursor.execute(query, values)
        self.db_connection.commit()

        messagebox.showinfo(title="Profile Updated", message="Profile successfully updated.")

        # Reload user profile after update
        self.load_user_profile()

    def __del__(self):
        # Close database connection when the application exits
        self.db_connection.close()

# Create the Tkinter application window
root = tk.Tk()
with open("user_id.txt", "r") as f:
    user_id = int(f.read())
app = ProfilePage(root, user_id)  # Pass the user ID here
root.mainloop()
