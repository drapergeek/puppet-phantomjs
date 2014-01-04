# Public: Set the global default phantomjs version
#
# Usage: phantomjs::global { '1.9.0': }
define phantomjs::global($version = undef, $ensure = present) {
  require phantomjs

  validate_re($ensure, '^(present|absent)$',
    "Phantomjs::Global[${name}] ensure must be present|absent, is ${ensure}")

  if $ensure == present {
    $klass = join(['phantomjs', join(split($version, '[.]'), '_')], '::')
    require $klass
  }

  file { "${phantomjs::phantomenv_root}/version":
    ensure  => $ensure,
    content => "${version}\n",
    replace => true,
  }
}
