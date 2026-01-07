{ ... }: {
  services.hyprsunset = {
    enable = true;
    settings = {
      max-gamma = 200;
      profile = [
        {
          time = "00:00";
          temperature = "5500";
          gamma = "0.8";
        }
        {
          time = "08:00";
          identity = true;
        }
      ];

    };
  };
}
