import tkinter as tk
import PyPDF2
from PIL import Image, ImageTk
from tkinter.filedialog import askopenfile

root = tk.Tk()

canvas = tk.Canvas(root, width=600, height=300)
canvas.grid(columnspan=3, rowspan=3)

logo= Image.open("logo.png")
logo=ImageTk.PhotoImage(logo)
logo_lable = tk.Label(image=logo)
logo_lable.image =logo
logo_lable.grid(column=1, row=0)

inst = tk.Label(root, text="Vyber PDFko: ")
inst.grid(columnspan=3, column=0, row=1)

def open():
	browt.set("loading...")
	file =askopenfile(parent=root, mode="rb", title="choose a file", filetype =[("Pdf file", "*.pdf")])
	if file:
		read_pdf = PyPDF2.PDFFileReader(file)
		page = read_pdf.getPage(0)
		page_content= page.extractText()
		tbox = tk.Text(root,height=10, width=50, padx= 15, pady =15)
		text_box.insert(1.0, page_content)
		text_box.tag_configure("center", justify ="center")
		text_box.tag_add("center", 1.0, "end")
		text_box.grid(column=1, row=3)
		
		browse_text.set("Browse:")


browt = tk.StringVar()
browbtn = tk.Button(root, textvariable=browt, bg="purple", fg="white", command=lambda:open())
browt.set("Browse")
browbtn.grid(column=1,row=2)

canvas = tk.Canvas(root, width=600, height=300)
canvas.grid(columnspan=3)

root.mainloop()
