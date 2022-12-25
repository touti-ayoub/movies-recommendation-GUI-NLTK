import tkinter
import tkinter as tk
from tkinter import ttk
import Movie_rec

root = tk.Tk()
root.title("movies recommendations")
root.iconbitmap('icon.ico')
root.option_add("*tearOff", False)  # This is always a good idea
root.geometry("1000x600")
root.columnconfigure(index=0, weight=1)
root.columnconfigure(index=1, weight=1)
root.columnconfigure(index=2, weight=1)
root.rowconfigure(index=0, weight=1)
root.rowconfigure(index=1, weight=1)
root.rowconfigure(index=2, weight=1)
root.resizable(False, False)  # Create a style
style = ttk.Style(root)

# Import the tcl file
root.tk.call("source", "proxttk.tcl")
# Set the theme with the theme_use method
style.theme_use("proxttk")

d = tk.IntVar(value=2)
frame1 = ttk.Frame(root, padding=(40, 0, 0, 10))
frame1.grid(row=0, column=1, padx=0, pady=(50, 10), sticky="nsew", rowspan=3)
frame1.columnconfigure(index=0, weight=1)
# Label
text1 = ttk.Label(frame1, text="Movies Recommendations", font="colortube", justify="center", foreground="black")
text1.grid(row=0, column=0, pady=50, columnspan=2)


def returnEntry(arg=None):
    """Gets the result from Entry and return it to the Label"""
    listbox = tkinter.Listbox(root, width=50, height=10)
    x = Movie_rec.recommend_movies(bpx.get())
    for i in x:
        listbox.insert(0, i)
    listbox.grid(row=2, column=1, padx=300, pady=10, sticky="ew")


# Entry
bpx = ttk.Entry(frame1)
bpx.insert(0, "Enter movie name here...")
bpx.grid(row=2, column=0, padx=200, pady=0, sticky="ew")
Recommend = ttk.Button(frame1, text=" Recommend!", style="AccentButton", command=returnEntry)
Recommend.grid(row=10, column=0, padx=300, pady=10, sticky="nsew")
root.mainloop()
