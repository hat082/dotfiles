function create_latex_document()
	-- Get the path to the template directory
	local template_dir = os.getenv("HOME") .. "/.config/templates"

	-- Function to create a file from the template
	local function create_file_from_template(template_filename, new_filename)
		-- Open the template file for reading
		local file = sys.File("README.TXT"):open() -- opens the File for reading
		print(file:read())
	end

	-- Create the 'preamble.tex' file from the template
	create_file_from_template(template_dir .. "/preamble.tex", "preamble.tex")
	--
	-- -- Create the 'report.tex' file from the template
	-- create_file_from_template(template_dir .. "/report.tex", "report.tex")
	--
	-- -- Create the 'bib.bib' file (empty for this example)
	-- local bib_file = io.open("bib.bib", "w")
	-- if not bib_file then
	-- 	error("Cannot create bib.bib file")
	-- end
	-- bib_file:close()

	-- Create the 'Attachments' directory if it does not exist
	if not os.execute("test -d Attachments || mkdir Attachments") == 0 then
		error("Cannot create Attachments directory")
	end

	-- Create the 'bib.bib' file (empty for this example)
	local todo = io.open("todo.md", "w")
	if not todo then
		error("Cannot create todo.md file")
	end
	todo:close()

	-- Create the 'bib.bib' file (empty for this example)
	local outline = io.open("outline.md", "w")
	if not outline then
		error("Cannot create outline.md file")
	end
	outline:close()

	print("Latex document structure created successfully!")
end

vim.api.nvim_create_user_command("CreateLatexProject", create_latex_document, {})
