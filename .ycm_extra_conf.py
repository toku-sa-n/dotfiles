import os
import ycm_core

flags = [
    '-Wall',
]

SOURCE_EXTENTIONS = ['.cpp', '.c', '.cxx', '.cc', ]


def FlagsForFile(filename, **keyword_args):
    return{
        'flags': flags,
        'do_cache': True,
    }
