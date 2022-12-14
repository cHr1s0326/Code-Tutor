/**
 * 
 */
const languageMode = {
	java: "text/x-java",
	c: "text/x-csrc",
	cpp: "text/x-c++src",
	python: "text/x-python",
	js: "text/javascript",
	css: "text/css"
}
 
window.onload = () => {
	const textarea = document.querySelector(".content-textarea");
	const language = document.querySelector(".content-language").innerText;
	const mode = setMode(language);

	const editor = CodeMirror.fromTextArea(textarea, {
		lineNumbers: true,
		theme: "ambiance",
		mode: mode,
		viewportMargin: Infinity,
		readOnly: true
	});
	editor.setSize("100%", "100%");
}

const setMode = (language) => {
	let mode;
	switch(language) {
		case "Java":
			mode = languageMode.java;
			break;
		case "C":
			mode = languageMode.c;
			break;
		case "C++":
			mode = languageMode.cpp;
			break;
		case "Python":
			mode = languageMode.python;
			break;
		case "JavaScript":
			mode = languageMode.js;
			break;
		case "CSS":
			mode = languageMode.css;
			break;
	}
	
	return mode;
}