# ex: syntax=puppet si ts=4 sw=4 et

class bind::defaults (
    $supported              = undef,
    $chroot_supported       = undef,
    $confdir                = undef,
    $namedconf              = undef,
    $cachedir               = undef,
    $logdir                 = undef,
    $random_device          = undef,
    $bind_user              = undef,
    $bind_group             = undef,
    $bind_package           = undef,
    $bind_chroot_package    = undef,
    $bind_service           = undef,
    $bind_chroot_service    = undef,
    $bind_chroot_dir        = undef,
    $nsupdate_package       = undef,
    $managed_keys_directory = undef,
    # NOTE: we need to be able to override this parameter when declaring class,
    # especially when not using hiera (i.e. when using Foreman as ENC):
    $default_zones_include  = undef,
    $default_zones_source   = undef,
    $isc_bind_keys          = undef,
    $chroot_class           = undef,
    $chroot_dir             = undef,
) {
    # If puppet_version is 7 or greater, use ruby 4 api
    if $facts['puppet_version'] =~ '[7-8]\.(0|[1-9]\d*)\.(0|[1-9]\d*)' {
        unless is_bool($supported) {
    } else {
        unless $supported.is_a(Boolean) {
            fail('Please ensure that the dependencies of the bind module are installed and working correctly')
        }
    }
    }
    unless $supported {
        fail('Platform is not supported')
    }
}
