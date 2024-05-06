import tkinter as tk
from tkinter import messagebox, Toplevel
import mysql.connector
from PIL import Image, ImageTk
import os

class CartPage:
    def __init__(self, root, user_id):
        self.root = root
        self.root.title("Cart Page")
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

        # Cart Section
        self.cart_frame = tk.Frame(self.root, bg='#f0f0f0')
        self.cart_frame.pack(pady=20, fill=tk.BOTH, expand=True)

        # Create a canvas for the table
        self.canvas = tk.Canvas(self.cart_frame, bg='#f0f0f0')
        self.canvas.pack(side=tk.LEFT, fill=tk.BOTH, expand=True)

        # Add a scrollbar to the canvas
        self.scrollbar = tk.Scrollbar(self.cart_frame, orient=tk.VERTICAL, command=self.canvas.yview)
        self.scrollbar.pack(side=tk.RIGHT, fill=tk.Y)

        self.canvas.configure(yscrollcommand=self.scrollbar.set)

        # Bind the canvas to the scrollbar
        self.canvas.bind('<Configure>', lambda e: self.canvas.configure(scrollregion=self.canvas.bbox("all")))

        # Create a frame inside the canvas to hold the table
        self.table_frame = tk.Frame(self.canvas, bg='#f0f0f0')

        self.canvas.create_window((0, 0), window=self.table_frame, anchor=tk.NW)

        # Connect to MySQL database
        self.db_connection = mysql.connector.connect(
            host="localhost",
            user="root",
            password="****",
            database="amazon"
        )
        self.cursor = self.db_connection.cursor()

        self.user_id = user_id
        self.load_cart()

    def load_cart(self):
        # Fetch cart items from the database
        query = "SELECT p.ProductID, p.Name, p.Price, p.ImageURL FROM product p INNER JOIN cart c ON p.ProductID = c.ProductID WHERE c.UserID = %s"
        self.cursor.execute(query, (self.user_id,))
        cart_items = self.cursor.fetchall()

        if cart_items:
            # Header row
            tk.Label(self.table_frame, text="Image", bg='#f0f0f0').grid(row=0, column=0)
            tk.Label(self.table_frame, text="Product Name", bg='#f0f0f0').grid(row=0, column=1)
            tk.Label(self.table_frame, text="Price", bg='#f0f0f0').grid(row=0, column=2)
            tk.Label(self.table_frame, text="Actions", bg='#f0f0f0').grid(row=0, column=3)  # New column for actions

            total_price = 0

            # Display cart items
            for i, item in enumerate(cart_items, start=1):
                product_id, product_name, product_price, product_image_url = item

                # Load product image
                if product_image_url:
                    image = Image.open(product_image_url)
                    image = image.resize((100, 100), Image.BICUBIC)
                    photo = ImageTk.PhotoImage(image)
                    product_image_label = tk.Label(self.table_frame, image=photo)
                    product_image_label.image = photo
                    product_image_label.grid(row=i, column=0, padx=10, pady=10)

                # Display product name
                tk.Label(self.table_frame, text=product_name, bg='#f0f0f0').grid(row=i, column=1)

                # Display product price
                tk.Label(self.table_frame, text=product_price, bg='#f0f0f0').grid(row=i, column=2)

                # Delete button
                delete_button = tk.Button(self.table_frame, text="Delete", bg="#FF0000", fg="#FFFFFF",
                                          command=lambda idx=i: self.delete_item(product_id))
                delete_button.grid(row=i, column=3)

                total_price += product_price

            # Display total price
            tk.Label(self.cart_frame, text="Total Price: ${:.2f}".format(total_price), bg='#f0f0f0').pack(pady=10)

        else:
            messagebox.showinfo("Empty cart", "Your cart is empty.")

    def delete_item(self, product_id):
        # Function to delete an item from the cart
        query = "DELETE FROM cart WHERE UserID = %s AND ProductID = %s"
        self.cursor.execute(query, (self.user_id, product_id))
        self.db_connection.commit()
        messagebox.showinfo("Item Deleted", "Item successfully deleted from the cart.")
        self.load_cart()

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

    def checkout(self):
        # Function to handle the checkout process
        checkout_window = Toplevel(self.root)
        checkout_window.title("Checkout")
        checkout_window.geometry('400x300')

        # Generate bill
        bill_label = tk.Label(checkout_window, text="Your Bill", font=("Arial", 16))
        bill_label.pack(pady=10)

        # Fetch cart items and calculate total price
        total_price = 0
        bill_details = []
        for item in self.cart_items:
            _, product_name, product_price, _ = item
            bill_details.append((product_name, product_price))
            total_price += product_price

        # Display bill details
        for name, price in bill_details:
            tk.Label(checkout_window, text=f"{name}: ${price}", font=("Arial", 12)).pack()
        tk.Label(checkout_window, text="Total Price: ${:.2f}".format(total_price), font=("Arial", 12)).pack(pady=10)

        # Cash on Delivery option
        cod_label = tk.Label(checkout_window, text="Pay via Cash on Delivery", font=("Arial", 14))
        cod_label.pack(pady=10)

        # Confirm payment button
        confirm_button = tk.Button(checkout_window, text="Confirm Payment", bg="#333333", fg="#FFFFFF", font=("Arial", 12), command=lambda: self.confirm_payment(checkout_window))
        confirm_button.pack(pady=10)

    def confirm_payment(self, checkout_window):
        # Function to confirm COD payment
        messagebox.showinfo("Payment Successful", "Your order has been placed successfully via Cash on Delivery.")
        checkout_window.destroy()

    def __del__(self):
        # Close database connection when the application exits
        self.db_connection.close()

# Create the Tkinter application window
if __name__ == "__main__":
    root = tk.Tk()
    user_id = 1  # Example user ID, replace with your user ID retrieval logic
    app = CartPage(root, user_id)  # Pass the user ID here
    root.mainloop()
