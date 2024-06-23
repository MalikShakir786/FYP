class RecentSearches {
  final String status;
  final List<Search>? searches;

  RecentSearches({
    required this.status,
    required this.searches,
  });

  factory RecentSearches.fromJson(Map<String, dynamic> json) {
    return RecentSearches(
      status: json['status'],
      searches: (json['searches'] as List<dynamic>)
          .map((search) => Search.fromJson(search))
          .toList(),
    );
  }
}

class Search {
  final int searchId;
  final String searchQuery;
  final String searchDate;

  Search({
    required this.searchId,
    required this.searchQuery,
    required this.searchDate,
  });

  factory Search.fromJson(Map<String, dynamic> json) {
    return Search(
      searchId: json['search_id'],
      searchQuery: json['search_query'],
      searchDate: json['search_date'],
    );
  }

}
