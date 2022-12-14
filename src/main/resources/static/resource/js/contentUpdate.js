/**
 * 
 */
 
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
};

const languageOption = {
	java: ".java-option",
	c: ".c-option",
	cpp: ".cpp-option",
	python: ".python-option",
	js: ".js-option",
	css: ".css-option"
};
 
window.onload = () => {
	setEditor();
	setOption();
}

const changeMode = (e) => {
	const language = document.querySelector(".language-container .content-language");
	console.log(language);
	editor.setOption("mode", setMode(language));
	console.log(editor);
}

const setOption = () => {
	const language = document.querySelector(".content-language").innerText;
	let option;
	
	switch(language) {
		case "Java":
			option = languageOption.java;
			break;
		case "C":
			option = languageOption.c;
			break;
		case "C++":
			option = languageOption.cpp;
			break;
		case "Python":
			option = languageOption.python;
			break;
		case "JavaScript":
			option = languageOption.js;
			break;
		case "CSS":
			option = languageOption.css;
			break;
	}
	
	const select = document.querySelector(option);
	select.selected = true;
}

const setEditor = () => {
	const textarea = document.querySelector(".content-textarea");
	const language = document.querySelector(".content-language").innerText;
	const mode = setMode(language);

	editor = CodeMirror.fromTextArea(textarea, {
		lineNumbers: true,
		theme: "ambiance",
		mode: mode,
		viewportMargin: Infinity,
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