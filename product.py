import tkinter as tk
from tkinter import messagebox
import mysql.connector
from PIL import Image, ImageTk
import os

class ProductPage:
    def __init__(self, root, product_id, user_id):
        self.root = root
        self.root.title("Product Page")
        self.root.geometry('800x600')
        self.root.configure(bg='#f0f0f0')

        # Ribbon Section
        self.ribbon_frame = tk.Frame(self.root, bg='#333333', height=50)
        self.ribbon_frame.pack(side=tk.TOP, fill=tk.X)

        self.home_button = tk.Button(self.ribbon_frame, text="Home", bg="#333333", fg="#FFFFFF", font=("Arial", 12), command=self.go_to_home)
        self.home_button.pack(side=tk.LEFT, padx=10)

        self.cart_button = tk.Button(self.ribbon_frame, text="Cart", bg="#333333", fg="#FFFFFF", font=("Arial", 12), command=self.go_to_cart)
        self.cart_button.pack(side=tk.RIGHT, padx=10)

        self.wishlist_button = tk.Button(self.ribbon_frame, text="Wishlist", bg="#333333", fg="#FFFFFF", font=("Arial", 12), command=self.go_to_wishlist)
        self.wishlist_button.pack(side=tk.RIGHT, padx=10)

        self.profile_button = tk.Button(self.ribbon_frame, text="Profile", bg="#333333", fg="#FFFFFF", font=("Arial", 12), command=self.go_to_profile)
        self.profile_button.pack(side=tk.RIGHT, padx=10)

        # Product Section
        self.product_frame = tk.Frame(self.root, bg='#f0f0f0')
        self.product_frame.pack(pady=20)

        # Connect to MySQL database
        self.db_connection = mysql.connector.connect(
            host="localhost",
            user="root",
            password="9871618879",
            database="amazon"
        )
        self.cursor = self.db_connection.cursor()

        self.load_product(product_id)
        self.user_id = user_id

    def load_product(self, product_id):
        # Fetch product details from the database based on product_id
        query = "SELECT Name, Description, ImageURL, Price FROM product WHERE ProductID = %s"
        self.cursor.execute(query, (product_id,))
        product_details = self.cursor.fetchone()

        if product_details:
            self.product_id = product_id  # Store product ID for later use
            product_name, product_description, product_image_url, product_price = product_details

            # Display product image
            if product_image_url:
                image = Image.open(product_image_url)
                image = image.resize((300, 300), Image.BICUBIC)                
                photo = ImageTk.PhotoImage(image)
                product_image_label = tk.Label(self.product_frame, image=photo)
                product_image_label.image = photo
                product_image_label.pack(pady=20)

            # Display product name
            product_name_label = tk.Label(self.product_frame, text=product_name, font=("Arial", 20))
            product_name_label.pack()

            # Display product description
            product_description_label = tk.Label(self.product_frame, text=product_description, font=("Arial", 12), wraplength=600)
            product_description_label.pack(pady=20)

            # Display product price
            product_price_label = tk.Label(self.product_frame, text=f"Price: ${product_price}", font=("Arial", 12))
            product_price_label.pack(pady=5)

            # Add to wishlist button
            add_to_wishlist_button = tk.Button(self.product_frame, text="Add to Wishlist", bg="#FF9900", fg="#FFFFFF", font=("Arial", 12), command=self.add_to_wishlist)
            add_to_wishlist_button.pack(side=tk.LEFT, padx=10)

            # Add to cart button
            add_to_cart_button = tk.Button(self.product_frame, text="Add to Cart", bg="#FF9900", fg="#FFFFFF", font=("Arial", 12), command=self.add_to_cart)
            add_to_cart_button.pack(side=tk.LEFT, padx=10)

        else:
            messagebox.showerror("Error", "Product not found in the database.")

    def add_to_wishlist(self):
        # Functionality to add the product to the wishlist table in the database
        try:
            query = "INSERT INTO wishlist (UserID, ProductID) VALUES (%s, %s)"
            self.cursor.execute(query, (self.user_id, self.product_id))
            self.db_connection.commit()
            messagebox.showinfo("Success", "Product added to wishlist.")
        except Exception as e:
            messagebox.showerror("Error", str(e))

    def add_to_cart(self):
        # Functionality to add the product to the cart table in the database
        try:
            query = "INSERT INTO cart (UserID, ProductID) VALUES (%s, %s)"
            self.cursor.execute(query, (self.user_id, self.product_id))
            self.db_connection.commit()
            messagebox.showinfo("Success", "Product added to cart.")
        except Exception as e:
            messagebox.showerror("Error", str(e))

    def go_to_home(self):
        # Functionality to navigate to the homepage
        os.system('python homepage.py')

    def go_to_cart(self):
        # Functionality to navigate to the cart
        os.system('python cart.py')

    def go_to_wishlist(self):
        # Functionality to navigate to the wishlist
        os.system('python wishlist.py')

    def go_to_profile(self):
        # Functionality to navigate to the profile
        os.system('python userprofile.py')

    def __del__(self):
        # Close database connection when the application exits
        self.db_connection.close()

# Create the Tkinter application window
root = tk.Tk()
product_id = 1  # Example product ID
with open("user_id.txt", "r") as f:
    user_id = int(f.read())
app = ProductPage(root, product_id, user_id)
root.mainloop()
