import re
import vim

def _do_ex(command):
    '''Execute Ex command.

    Execute Ex command from args and return results string.
    '''
    vim.command('redir => tmp_do_ex | silent! {0} | redir END'.format(command))
    return vim.eval('tmp_do_ex')

def get_char_code(pl):
    '''Return charcode and char itself on cursol position.

    port from vim-powerline
    '''
    info = _do_ex('ascii')

    if info == '' or info.find('NUL') != -1:
        return 'NUL'

    enc = vim.eval('&encoding')
    fenc = vim.eval('&fileencoding')
    info = info.decode(enc)
    nrformat = u"'{}' " + (u'{:#06x}' if fenc == 'utf-8' else u'{:#04x}')

    # Get the character and the numeric value from the return value of :ascii
    # This matches the two first pieces of the return value, e.g.
    # "<F>  70" => char: 'F', nr: '70'
    m = re.compile(r'<(.+?)>¥s*(¥d+)').search(info)

    if m == None:
        return 'NUL'
    else:
        char, code = m.groups()
        code = int(code)
        return nrformat.format(char, code)
