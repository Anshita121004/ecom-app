import tkinter as tk
from tkinter import messagebox, Canvas
import mysql.connector
import subprocess
from PIL import Image, ImageTk
from category import CategoriesPage  # Import the CategoriesPage class from category.py

class HomePage:
    def __init__(self, root):
        self.root = root
        self.root.title("E-commerce Homepage")
        self.root.geometry('800x600')
        self.root.configure(bg='#f0f0f0')

        # Ribbon Section
        self.ribbon_frame = tk.Frame(self.root, bg='#333333', height=50)
        self.ribbon_frame.pack(side=tk.TOP, fill=tk.X)

        self.profile_button = tk.Button(self.ribbon_frame, text="Profile", bg="#333333", fg="#FFFFFF", font=("Arial", 12), command=self.open_user_profile)
        self.profile_button.pack(side=tk.LEFT, padx=10)

        self.search_entry = tk.Entry(self.ribbon_frame, font=("Arial", 12), width=110)
        self.search_entry.pack(side=tk.LEFT, padx=10)
        self.search_entry.bind('<Return>', self.search_products)  # Bind the Return key to trigger search

        self.wishlist_button = tk.Button(self.ribbon_frame, text="Wishlist", bg="#333333", fg="#FFFFFF", font=("Arial", 12), command=self.open_wishlist)
        self.wishlist_button.pack(side=tk.RIGHT, padx=10)

        self.cart_button = tk.Button(self.ribbon_frame, text="Cart", bg="#333333", fg="#FFFFFF", font=("Arial", 12), command=self.open_cart)
        self.cart_button.pack(side=tk.RIGHT, padx=10)

        # Carousel Slider
        self.carousel_frame = tk.Frame(self.root, bg='#f0f0f0')
        self.carousel_frame.pack(pady=20)

        self.images = ['image1.png', 'image2.jpg', 'image3.jpeg']
        self.current_image_index = 0
        self.carousel_label = tk.Label(self.carousel_frame)
        self.carousel_label.pack()
        self.show_image()

        # Categories Section
        self.categories_canvas = Canvas(self.root, bg='#f0f0f0', highlightthickness=0)
        self.categories_frame = tk.Frame(self.categories_canvas, bg='#f0f0f0')
        self.categories_scrollbar = tk.Scrollbar(self.root, orient="vertical", command=self.categories_canvas.yview)
        self.categories_canvas.configure(yscrollcommand=self.categories_scrollbar.set)

        self.categories_scrollbar.pack(side="right", fill="y")
        self.categories_canvas.pack(side="left", fill="both", expand=True)
        self.categories_canvas.create_window((0,0), window=self.categories_frame, anchor="nw")
        self.categories_frame.bind("<Configure>", self.on_frame_configure)

        # Connect to MySQL database
        self.db_connection = mysql.connector.connect(
            host="localhost",
            user="root",
            password="9871618879",
            database="amazon"
        )
        self.cursor = self.db_connection.cursor()

        self.populate_categories()

        with open("user_id.txt", "r") as f:
            user_id = int(f.read())

    def show_image(self):
        image_path = self.images[self.current_image_index]
        self.current_image_index = (self.current_image_index + 1) % len(self.images)
        image = Image.open(image_path)
        image = image.resize((1200, 425), Image.BICUBIC)
        photo = ImageTk.PhotoImage(image)
        self.carousel_label.config(image=photo)
        self.carousel_label.image = photo
        self.root.after(2000, self.show_image)  # Display each image for 2 seconds

    def populate_categories(self, search_query=None):
        if search_query:
            query = "SELECT Name FROM product WHERE Name LIKE %s"
            params = ('%' + search_query + '%',)
        else:
            query = "SELECT Name FROM category"
            params = None

        self.cursor.execute(query, params)
        categories = self.cursor.fetchall()

        row_index = 0
        col_index = 0
        max_cols = 5  # Maximum number of columns
        if not categories and search_query:
            messagebox.showinfo("Info", "No such product found")
        for category in categories:
            category_name = category[0]
            category_button = tk.Button(self.categories_frame, text=category_name, bg="#FFFFFF", fg="#333333", font=("Arial", 14), width=20, height=2)
            category_button.grid(row=row_index, column=col_index, padx=10, pady=10)
            category_button.config(command=lambda cat=category_name: self.open_category_page(cat))

            col_index += 1
            if col_index >= max_cols:
                col_index = 0
                row_index += 1

    def on_frame_configure(self, event):
        self.categories_canvas.configure(scrollregion=self.categories_canvas.bbox("all"))

    def search_products(self, event):
        search_query = self.search_entry.get()
        self.clear_categories()
        self.populate_categories(search_query)

    def clear_categories(self):
        for widget in self.categories_frame.winfo_children():
            widget.destroy()

    def open_category_page(self, category):
        def open_category_window():
            # Import CategoriesPage dynamically
            from category import CategoriesPage
            
            # Get the category ID from the database
            query = "SELECT CategoryID FROM category WHERE Name = %s"
            self.cursor.execute(query, (category,))
            category_id = self.cursor.fetchone()[0]

            # Open the category page
            category_window = tk.Toplevel(self.root)  # Create a new window
            CategoriesPage(category_window, category_id)
        
        # Execute open_category_window when the category button is clicked
        open_category_window()

    def open_user_profile(self):
        subprocess.Popen(["python", "userprofile.py"])

    def open_cart(self):
        subprocess.Popen(["python", "cart.py"])

    def open_wishlist(self):
        subprocess.Popen(["python", "wishlist.py"])

    def __del__(self):
        # Close database connection when the application exits
        self.db_connection.close()

# Create the Tkinter application window
root = tk.Tk()
app = HomePage(root)
root.mainloop()
