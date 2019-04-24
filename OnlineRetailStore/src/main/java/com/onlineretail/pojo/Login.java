package com.onlineretail.pojo;

	import org.springframework.data.annotation.Id;
	import org.springframework.data.mongodb.core.mapping.Document;

	@Document(collection = "login")
	public class Login {

		@Id
		private String id;
		private String name;
		private String email;
		private String password;
		
		
		public Login(){
		}
		
		public Login( String name,String email, String password) {
			super();
			this.name = name;
			this.email = email;
			this.password = password;
		}

		public Login( String email, String password) {
			this.email = email;
			this.password = password;
		}
		
		public String getId() {
			return id;
		}

		public void setId(String id) {
			this.id = id;
		}

		public String getName() {
			return name;
		}

		public void setName(String name) {
			this.name = name;
		}

		public String getEmail() {
			return email;
		}

		public void setEmail(String email) {
			this.email = email;
		}

		public String getPassword() {
			return password;
		}

		public void setPassword(String password) {
			this.password = password;
		}
}