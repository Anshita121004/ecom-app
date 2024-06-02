import tkinter as tk
from tkinter import messagebox
from tkinter import ttk
import mysql.connector

class SignUpForm:
    def __init__(self, root):
        self.root = root
        self.root.title("Sign Up Form")
        self.root.geometry('400x500')
        self.root.configure(bg='#333333')

        self.canvas = tk.Canvas(root, bg='#333333')
        self.frame = tk.Frame(self.canvas, bg='#333333')
        self.scrollbar = ttk.Scrollbar(root, orient="vertical", command=self.canvas.yview)

        self.canvas.create_window((0, 0), window=self.frame, anchor="nw")
        self.canvas.configure(yscrollcommand=self.scrollbar.set)

        self.signup_label = tk.Label(
            self.frame, text="Sign Up", bg='#333333', fg="#FF3399", font=("Arial", 30))
        self.username_label = tk.Label(
            self.frame, text="Username", bg='#333333', fg="#FFFFFF", font=("Arial", 16))
        self.username_entry = tk.Entry(self.frame, font=("Arial", 16))
        self.password_label = tk.Label(
            self.frame, text="Password", bg='#333333', fg="#FFFFFF", font=("Arial", 16))
        self.password_entry = tk.Entry(self.frame, show="*", font=("Arial", 16))
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
        self.alt_phone_label = tk.Label(
            self.frame, text="Alternative Phone", bg='#333333', fg="#FFFFFF", font=("Arial", 16))
        self.alt_phone_entry = tk.Entry(self.frame, font=("Arial", 16))
        self.dob_label = tk.Label(
            self.frame, text="Date of Birth", bg='#333333', fg="#FFFFFF", font=("Arial", 16))
        self.dob_entry = tk.Entry(self.frame, font=("Arial", 16))
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

        self.signup_button = tk.Button(
            self.frame, text="Sign Up", bg="#FF3399", fg="#FFFFFF", font=("Arial", 16), command=self.signup)

        self.signup_label.grid(row=0, column=0, columnspan=2, sticky="news", pady=20)
        self.username_label.grid(row=1, column=0)
        self.username_entry.grid(row=1, column=1, pady=10)
        self.password_label.grid(row=2, column=0)
        self.password_entry.grid(row=2, column=1, pady=10)
        self.email_label.grid(row=3, column=0)
        self.email_entry.grid(row=3, column=1, pady=10)
        self.first_name_label.grid(row=4, column=0)
        self.first_name_entry.grid(row=4, column=1, pady=10)
        self.last_name_label.grid(row=5, column=0)
        self.last_name_entry.grid(row=5, column=1, pady=10)
        self.phone_label.grid(row=6, column=0)
        self.phone_entry.grid(row=6, column=1, pady=10)
        self.alt_phone_label.grid(row=7, column=0)
        self.alt_phone_entry.grid(row=7, column=1, pady=10)
        self.dob_label.grid(row=8, column=0)
        self.dob_entry.grid(row=8, column=1, pady=10)
        self.house_no_label.grid(row=9, column=0)
        self.house_no_entry.grid(row=9, column=1, pady=10)
        self.street_label.grid(row=10, column=0)
        self.street_entry.grid(row=10, column=1, pady=10)
        self.city_label.grid(row=11, column=0)
        self.city_entry.grid(row=11, column=1, pady=10)
        self.pincode_label.grid(row=12, column=0)
        self.pincode_entry.grid(row=12, column=1, pady=10)
        self.signup_button.grid(row=13, column=0, columnspan=2, pady=20)

        self.scrollbar.pack(side="right", fill="y")
        self.canvas.pack(side="left", fill="both", expand=True)

        self.canvas.create_window((0, 0), window=self.frame, anchor="nw", tags="frame")

        self.frame.bind("<Configure>", self.on_frame_configure)

        # Connect to MySQL database
        self.db_connection = mysql.connector.connect(
            host="localhost",
            user="root",
            password="####",
            database="amazon"
        )
        self.cursor = self.db_connection.cursor()

    def on_frame_configure(self, event):
        self.canvas.configure(scrollregion=self.canvas.bbox("all"))

    def signup(self):
        username = self.username_entry.get()
        password = self.password_entry.get()
        email = self.email_entry.get()
        first_name = self.first_name_entry.get()
        last_name = self.last_name_entry.get()
        phone = self.phone_entry.get()
        alt_phone = self.alt_phone_entry.get()
        dob = self.dob_entry.get()
        house_no = self.house_no_entry.get()
        street = self.street_entry.get()
        city = self.city_entry.get()
        pincode = self.pincode_entry.get()

        query = "INSERT INTO user (Username, Password, Email, FirstName, LastName, PhoneNumber, alternative_phone_number, date_of_birth, houseNo, street, city, pincode) VALUES (%s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s)"
        values = (username, password, email, first_name, last_name, phone, alt_phone, dob, house_no, street, city, pincode)

        self.cursor.execute(query, values)
        self.db_connection.commit()

        messagebox.showinfo(title="Sign Up Success", message="User successfully signed up.")

    def __del__(self):
        # Close database connection when the application exits
        self.db_connection.close()

# Create the Tkinter application window
root = tk.Tk()
app = SignUpForm(root)
root.mainloop()
       
