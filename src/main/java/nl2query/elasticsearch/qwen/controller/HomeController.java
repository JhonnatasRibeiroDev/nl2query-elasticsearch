package nl2query.elasticsearch.qwen.controller;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.Map;

@RestController
public class HomeController {

	@GetMapping("/")
	public ResponseEntity<Map<String, Object>> home() {
		return ResponseEntity.ok(Map.of(
				"application", "qwen",
				"status", "UP",
				"message", "NL2Query Elasticsearch - convert natural language to Elasticsearch queries"
		));
	}

	@GetMapping("/health")
	public ResponseEntity<Map<String, String>> health() {
		return ResponseEntity.ok(Map.of("status", "UP"));
	}
}
