package App::FilenameUtils;

# AUTHORITY
# DATE
# DIST
# VERSION

use strict;
use warnings;

use Perinci::Sub::Util qw(gen_modified_sub);

my %argsopt = (
    quiet => {
        schema => 'bool*',
        cmdline_aliases => {q=>{}},
    },
    detail => {
        schema => 'bool*',
        cmdline_aliases => {l=>{}},
    },
);

sub _gen_wrapper {
    my $what = shift;

    sub {
        my ($orig, %args) = (shift, @_);
        my $detail = delete $args{detail};
        my $quiet  = delete $args{quiet};
        my $res0 = $orig->(@_);
        my $boolres = $res0 ? 1:0;
        my $hashres = $boolres ? $res0 : {};
        [200, "OK", $detail ? $hashres : $boolres, {
            ('cmdline.result' => $quiet ? "" : "Filename '$args{filename}' ".($boolres ? "indicates" : "does NOT indicate")." being $what") x !$detail,
            'cmdline.exit_code' => $boolres ? 0 : 1,
        }];
    };
}

require Filename::Archive;
gen_modified_sub(
    base_name => 'Filename::Archive::check_archive_filename',
    add_args => {
        %argsopt,
    },
    modify_meta => sub {
        $_[0]{result_naked} = 0;
        # XXX we should adjust the examples instead
        delete $_[0]{examples};
    },
    wrap_code => _gen_wrapper('an archive'),
);

require Filename::Audio;
gen_modified_sub(
    base_name => 'Filename::Audio::check_audio_filename',
    add_args => {
        %argsopt,
    },
    modify_meta => sub {
        $_[0]{result_naked} = 0;
        # XXX we should adjust the examples instead
        delete $_[0]{examples};
    },
    wrap_code => _gen_wrapper('an audio file'),
);

require Filename::Backup;
gen_modified_sub(
    base_name => 'Filename::Backup::check_backup_filename',
    add_args => {
        %argsopt,
    },
    modify_meta => sub {
        $_[0]{result_naked} = 0;
        # XXX we should adjust the examples instead
        delete $_[0]{examples};
    },
    wrap_code => _gen_wrapper('a backup file'),
);

require Filename::Compressed;
gen_modified_sub(
    base_name => 'Filename::Compressed::check_compressed_filename',
    add_args => {
        %argsopt,
    },
    modify_meta => sub {
        $_[0]{result_naked} = 0;
        # XXX we should adjust the examples instead
        delete $_[0]{examples};
    },
    wrap_code => _gen_wrapper('a compressed file'),
);

require Filename::Ebook;
gen_modified_sub(
    base_name => 'Filename::Ebook::check_ebook_filename',
    add_args => {
        %argsopt,
    },
    modify_meta => sub {
        $_[0]{result_naked} = 0;
        # XXX we should adjust the examples instead
        delete $_[0]{examples};
    },
    wrap_code => _gen_wrapper('an ebook'),
);

require Filename::Executable;
gen_modified_sub(
    base_name => 'Filename::Executable::check_executable_filename',
    add_args => {
        %argsopt,
    },
    modify_meta => sub {
        $_[0]{result_naked} = 0;
        # XXX we should adjust the examples instead
        delete $_[0]{examples};
    },
    wrap_code => _gen_wrapper('an executable'),
);

require Filename::Image;
gen_modified_sub(
    base_name => 'Filename::Image::check_image_filename',
    add_args => {
        %argsopt,
    },
    modify_meta => sub {
        $_[0]{result_naked} = 0;
        # XXX we should adjust the examples instead
        delete $_[0]{examples};
    },
    wrap_code => _gen_wrapper('an image (picture)'),
);

require Filename::Media;
gen_modified_sub(
    base_name => 'Filename::Media::check_media_filename',
    add_args => {
        %argsopt,
    },
    modify_meta => sub {
        $_[0]{result_naked} = 0;
        # XXX we should adjust the examples instead
        delete $_[0]{examples};
    },
    wrap_code => _gen_wrapper('a media (image/audio/video) file'),
);

require Filename::Video;
gen_modified_sub(
    base_name => 'Filename::Video::check_video_filename',
    add_args => {
        %argsopt,
    },
    modify_meta => sub {
        $_[0]{result_naked} = 0;
        # XXX we should adjust the examples instead
        delete $_[0]{examples};
    },
    wrap_code => _gen_wrapper('a video file'),
);

1;
# ABSTRACT: CLIs for Filename::*

=head1 SYNOPSIS


=head1 DESCRIPTION

This distribution includes several utilities related to Filename::* modules:

#INSERT_EXECS_LIST


=head1 SEE ALSO

L<Filename::Archive>, L<Filename::Audio>, etc.
