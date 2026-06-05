self: super: {
  jvm-base = super.buildEnv {
    name = "jvm-base";
    paths = [
      super.jdk21          # Using the version confirmed in your search [cite: 3, 4]
      super.kotlin         # The general purpose language [cite: 25]
      super.gradle_8       # Enterprise-grade build system [cite: 32]
      super.kotlin-language-server
    ];
  };
}
