package br.com.fiap.bookish_octo_guacamole.service;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertNotNull;

import br.com.fiap.bookish_octo_guacamole.model.Recipe;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.mockito.InjectMocks;
import org.mockito.MockitoAnnotations;

import java.util.List;

public class RecipeServiceTest {
  @InjectMocks
  RecipeService service;

  @BeforeEach
  void setup() {
    MockitoAnnotations.openMocks(this);
  }

  @Test
  void listRecipeTest() {
    List<Recipe> allRecipes = service.getAllRecipes();

    assertEquals(2, allRecipes.size());
  }
}
