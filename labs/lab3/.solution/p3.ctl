AG(((clientA.state = HAVE_TOKEN) * (reqB = 1)) ->
   AX((clientA.state = HAVE_TOKEN) +
      A((!(clientA.state = HAVE_TOKEN)) U
        (clientB.state = HAVE_TOKEN))));
