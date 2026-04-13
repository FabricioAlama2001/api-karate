package petstore;

import com.intuit.karate.junit5.Karate;

class PetStoreRunner {

    @Karate.Test
    Karate testAll() {
        return Karate.run("classpath:petstore/petstore.feature");
    }
}