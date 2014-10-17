use 5.014;
use ExtUtils::MakeMaker;

WriteMakefile(
    NAME            => "Lntm",
    ABSTRACT        => 'str2time for one-liners',
    VERSION_FROM    => "lib/Lntm.pm",
    LICENSE         => 'perl',
    PREREQ_PM       => {
        'Date::Parse' => 0,
    },
    META_MERGE => {
        'meta-spec' => { version => 2 },
        resources => {
            repository => {
                type => 'git',
                url  => 'https://github.com/rgs/p5-Lntm.git',
                web  => 'https://github.com/rgs/p5-Lntm',
            },
        },
    },
);
