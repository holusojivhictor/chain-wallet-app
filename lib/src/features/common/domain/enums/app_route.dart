enum AppRoute {
  splash('/splash'),
  onboarding('/onboarding'),
  connect('/connect'),
  import('/import'),
  create('/create'),
  locked('/locked'),
  home('/'),
  send('/send'),
  amount('/send/amount'),
  confirm('/send/amount/confirm'),
  transactions('/transactions'),
  settings('/settings'),
  general('/settings/general'),
  security('/settings/security'),
  contacts('/settings/contacts'),
  networks('/settings/networks'),
  about('/settings/about');

  const AppRoute(this.path);

  final String path;
}
