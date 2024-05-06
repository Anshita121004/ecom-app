import tkinter as tk
from tkinter import messagebox
import mysql.connector
from PIL import Image, ImageTk
import os

class AdminPage:
    def __init__(self, root):
        self.root = root
        self.root.title("Admin Page")
        self.root.geometry('800x600')
        self.root.configure(bg='#f0f0f0')

        # Ribbon Section
        self.ribbon_frame = tk.Frame(self.root, bg='#333333', height=50)
        self.ribbon_frame.pack(side=tk.TOP, fill=tk.X)

        self.add_product_button = tk.Button(self.ribbon_frame, text="Add Product", bg="#333333", fg="#FFFFFF", font=("Arial", 12), command=self.add_product)
        self.add_product_button.pack(side=tk.LEFT, padx=10)

        # Products Section
        self.products_frame = tk.Frame(self.root, bg='#f0f0f0')
        self.products_frame.pack(fill=tk.BOTH, expand=True)

        # Create a canvas for the table
        self.canvas = tk.Canvas(self.products_frame, bg='#f0f0f0')
        self.canvas.pack(side=tk.LEFT, fill=tk.BOTH, expand=True)

        # Add a scrollbar to the canvas
        self.scrollbar = tk.Scrollbar(self.products_frame, orient=tk.VERTICAL, command=self.canvas.yview)
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
            password="*****",
            database="amazon"
        )
        self.cursor = self.db_connection.cursor()

        self.load_products()

    def load_products(self):
        # Fetch product information from the inventory table
        query = "SELECT p.ProductID, p.Name, p.Description, p.Price, p.ImageURL, i.Quantity AS InventoryQuantity FROM product p JOIN inventory i ON p.ProductID = i.ProductID"
        self.cursor.execute(query)
        products = self.cursor.fetchall()

        # Header row
        tk.Label(self.table_frame, text="Image", bg='#f0f0f0').grid(row=0, column=0)
        tk.Label(self.table_frame, text="Product Name", bg='#f0f0f0').grid(row=0, column=1)
        tk.Label(self.table_frame, text="Quantity", bg='#f0f0f0').grid(row=0, column=2)
        tk.Label(self.table_frame, text="Price", bg='#f0f0f0').grid(row=0, column=3)
        tk.Label(self.table_frame, text="Actions", bg='#f0f0f0').grid(row=0, column=4)  # New column for actions

        # Display products
        for i, product in enumerate(products, start=1):
            product_id, product_name, description, price, image_url, inventory_quantity = product

            # Load product image
            if image_url:
                image = Image.open(image_url)
                image = image.resize((100, 100), Image.BICUBIC)
                photo = ImageTk.PhotoImage(image)
                product_image_label = tk.Label(self.table_frame, image=photo)
                product_image_label.image = photo
                product_image_label.grid(row=i, column=0, padx=10, pady=10)

            # Display product name
            tk.Label(self.table_frame, text=product_name, bg='#f0f0f0').grid(row=i, column=1)

            # Display quantity
            tk.Label(self.table_frame, text=inventory_quantity, bg='#f0f0f0').grid(row=i, column=2)

            # Display price
            tk.Label(self.table_frame, text=price, bg='#f0f0f0').grid(row=i, column=3)

            # Delete button
            delete_button = tk.Button(self.table_frame, text="Delete", bg="#FF0000", fg="#FFFFFF", command=lambda idx=product_id: self.delete_product(idx))
            delete_button.grid(row=i, column=4)

    def add_product(self):
        # Implement functionality to add a new product to the inventory
        pass

    def delete_product(self, product_id):
        # Delete the product from both the inventory and product tables
        try:
            # Delete from inventory table
            delete_inventory_query = "DELETE FROM inventory WHERE ProductID = %s"
            self.cursor.execute(delete_inventory_query, (product_id,))
            
            # Delete from product table
            delete_product_query = "DELETE FROM product WHERE ProductID = %s"
            self.cursor.execute(delete_product_query, (product_id,))
            
            self.db_connection.commit()
            messagebox.showinfo("Success", "Product deleted successfully.")
            # Refresh the admin page
            self.refresh_page()
            
        except mysql.connector.Error as error:
            messagebox.showerror("Error", f"Failed to delete product: {error}")

    def refresh_page(self):
        # Refresh the admin page after adding or deleting a product
        self.table_frame.destroy()  # Destroy the current table frame
        self.table_frame = tk.Frame(self.canvas, bg='#f0f0f0')
        self.canvas.create_window((0, 0), window=self.table_frame, anchor=tk.NW)
        self.load_products()  # Reload the products

    def __del__(self):
        # Close database connection when the application exits
        self.db_connection.close()

# Create the Tkinter application window
root = tk.Tk()
app = AdminPage(root)
root.mainloop()
