import tkinter as tk
from tkinter import messagebox
import mysql.connector
from PIL import Image, ImageTk
import os

class CategoriesPage:
    def __init__(self, root, category_id):
        self.root = root
        self.root.title("Categories Page")
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

        # Products Section
        self.products_frame = tk.Frame(self.root, bg='#f0f0f0')
        self.products_frame.pack(pady=20)

        # Connect to MySQL database
        self.db_connection = mysql.connector.connect(
            host="localhost",
            user="root",
            password="9871618879",
            database="amazon"
        )
        self.cursor = self.db_connection.cursor()

        self.load_products(category_id)

    def load_products(self, category_id):
        # Fetch products of the specified category from the database
        query = "SELECT ProductID, Name, Description, ImageURL FROM product WHERE CategoryID = %s"
        self.cursor.execute(query, (category_id,))
        products = self.cursor.fetchall()

        row_index = 0
        col_index = 0
        max_cols = 4  # Maximum number of columns
        for product in products:
            product_id, product_name, product_description, product_image_url = product

            # Load product image
            if product_image_url:
                image = Image.open(product_image_url)
                image = image.resize((200, 200), Image.BICUBIC)                
                photo = ImageTk.PhotoImage(image)
                product_image_label = tk.Label(self.products_frame, image=photo)
                product_image_label.image = photo
                product_image_label.grid(row=row_index, column=col_index, padx=20, pady=10)
                product_image_label.bind("<Button-1>", lambda event, prod_id=product_id: self.go_to_product(prod_id))  # Bind click event

            # Display product name
            product_name_label = tk.Label(self.products_frame, text=product_name, font=("Arial", 12))
            product_name_label.grid(row=row_index + 1, column=col_index, pady=5)

            # Add to cart button
            add_to_cart_button = tk.Button(self.products_frame, text="Add to Cart", bg="#333333", fg="#FFFFFF", font=("Arial", 12),
                                           command=lambda prod_id=product_id: self.add_to_cart(prod_id))  # Bind add to cart action
            add_to_cart_button.grid(row=row_index + 2, column=col_index, pady=5)
            
            col_index += 1
            if col_index >= max_cols:
                col_index = 0
                row_index += 3  # Increment row index for the next row of products

    def add_to_cart(self, product_id):
        # Functionality to add the product to the cart table in the database
        try:
            query = "INSERT INTO cart (UserID, ProductID) VALUES (%s, %s)"
            user_id = 1  # Assuming user ID is 1 for demonstration purposes
            self.cursor.execute(query, (user_id, product_id))
            self.db_connection.commit()
            messagebox.showinfo("Success", "Product added to cart.")
        except Exception as e:
            messagebox.showerror("Error", str(e))

    def go_to_product(self, product_id):
        # Functionality to navigate to the product page of the selected product
        os.system('python product.py {}'.format(product_id))

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
category_id = 1  # Example category ID
app = CategoriesPage(root, category_id)
root.mainloop()
