AG(!(((clientA.state = HAVE_TOKEN) * (clientB.state = HAVE_TOKEN)) +
     ((clientA.state = HAVE_TOKEN) * (clientC.state = HAVE_TOKEN)) +
     ((clientB.state = HAVE_TOKEN) * (clientC.state = HAVE_TOKEN))));
