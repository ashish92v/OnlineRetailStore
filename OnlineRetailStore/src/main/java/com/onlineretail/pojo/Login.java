package com.onlineretail.pojo;

	import org.springframework.data.annotation.Id;
	import org.springframework.data.mongodb.core.mapping.Document;

	@Document(collection = "login")
	public class Login {

		@Id
		private String id;
		private String firstname;
		private String lastname;
		private String email;
		private String password;
		private String address1;
		private String address2;
		private String city;
		private String state;
		private String zip;
		private String telephone;
		
		
		public Login(){
		}
		
		public Login( String firstname, String lastname,String email, String password) {
			super();
			this.firstname = firstname;
			this.lastname = lastname;
			this.email = email;
			this.password = password;
		}

		public Login( String firstname, String lastname,String address1, String address2,
				String city, String zip, String state, String telephone) {
			this.firstname = firstname;
			this.lastname = lastname;
			this.address1 = address1;
			this.address2 = address2;
			this.city = city;
			this.zip = zip;
			this.state = state;
			this.telephone = telephone;
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

		public String getFirstname() {
			return firstname;
		}

		public void setFirstname(String firstname) {
			this.firstname = firstname;
		}

		public String getLastname() {
			return lastname;
		}

		public void setLastname(String lastname) {
			this.lastname = lastname;
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

		public String getAddress1() {
			return address1;
		}

		public void setAddress1(String address1) {
			this.address1 = address1;
		}

		public String getAddress2() {
			return address2;
		}

		public void setAddress2(String address2) {
			this.address2 = address2;
		}

		public String getCity() {
			return city;
		}

		public void setCity(String city) {
			this.city = city;
		}

		public String getState() {
			return state;
		}

		public void setState(String state) {
			this.state = state;
		}

		public String getZip() {
			return zip;
		}

		public void setZip(String zip) {
			this.zip = zip;
		}

		public String getTelephone() {
			return telephone;
		}

		public void setTelephone(String telephone) {
			this.telephone = telephone;
		}

		
}