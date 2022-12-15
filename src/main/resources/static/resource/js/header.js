/**
 * 
 */

const headerTemplate = document.createElement("template");
headerTemplate.innerHTML = `
<style>
.header-wrap {
	width: 100%;
	height: 30%;
}

.header-container {
	width: 100%;
	height: 20%;
	background-color: #444444;
}

.header-container div {
	float: left;
}

.logo {
	width: 15%;
	height: 100%;
	display:flex; 
	align-items:center;
	margin-left: 10px;
}

.logo span {
	font-size: 20px;
}

.header-container a {
	text-decoration: none;
	color: white;
	padding: 10px;
}

.menu-container {
	width: 30%;
	height: 100%;
	display: flex;
	align-items: center;
	justify-content: flex-end;
}

.menu {
	width: 100%;
	list-style: none;
	padding-left: 0px;
	color: white;
	margin: 0 auto;
	text-align: center;
}

.menu li {
	display: inline-block;
	margin: 0 auto;
}

.logo-img {
	width: 15%;
}

.login-menu {
	width: 54%;
	height: 100%;
	display: flex;
	align-items: center;
	margin-left: auto;
	justify-content: flex-end;
}

</style>

			<div class="header-container">
				<div class="logo">
					<img class="logo-img" src="/resource/img/logo.png"> <a
						href="/"><span class="logo-text">Code-Tutor </span></a>
				</div>
				<div class="menu-container">
					<ul class="menu">
						<li><a href="/browse">둘러보기</a></li>
						<li><a href="/post">추가하기</a></li>
					</ul>
				</div>
				<div class="login-menu">
					<div class="login-btn" style="">
						<a href="/login"><span>로그인</span></a>
					</div>
				</div>
			</div>
`;

class Header extends HTMLElement {
  constructor() {
    // Always call super first in constructor
    super();
  }
  
  connectedCallback() {
	  	const shadowRoot = this.attachShadow({ mode: 'open' });
	  	shadowRoot.appendChild(headerTemplate.content);
  }
}

customElements.define('header-component', Header);