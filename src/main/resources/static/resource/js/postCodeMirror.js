/**
 * 
 */

let editor;

const languageMode = {
	java: "text/x-java",
	c: "text/x-csrc",
	cpp: "text/x-c++src",
	python: "text/x-python",
	js: "text/javascript",
	css: "text/css"
}
 
window.onload = () => {
	setEditor();
	console.log(editor);
}

const setEditor = () => {
	const textarea = document.querySelector(".content-textarea");
	editor = CodeMirror.fromTextArea(textarea, {
		lineNumbers: true,
		theme: "ambiance",
		mode: "text/x-java"
	});
}

const changeMode = (e) => {
	const language = document.querySelector(".content-language").value;
	editor.setOption("mode", setMode(language));
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