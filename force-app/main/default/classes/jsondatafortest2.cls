public class jsondatafortest2 {

	

	public class Information {
		public String id;
		public String title;
		public String url;
	}

		public String author;
		public List<Information> Information;
	
	public static Jsondatafortest2 parse(String json) {
		return (Jsondatafortest2) System.JSON.deserialize(json, Jsondatafortest2.class);
	}
}