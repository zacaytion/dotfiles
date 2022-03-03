xlfd_tmpl = u"-%(maker)s-%(family)s-%(weight)s-%(slant)s-%(widthtype)s-%(style)s-%(pixels)s-%(height)s-%(horiz)s-%(vert)s-%(spacing)s-%(width)s-%(registry)s-%(encoding)s"

def make_xlfd(maker="unknown", family=None, weight="normal", slant="r",
              widthtype="normal", style="*", pixels=8, height="*",
              horiz="*", vert="*", spacing="m", width="*", registry="iso8859",
              encoding=1):
    """
    Usage Example::

    tom@desktop ~> python xlfd_maker.py --family "Input Mono" --size 9
    -unknown-Input Mono-normal-r-normal-*-9-*-*-*-m-*-iso10646-1
    """
    font_info = {
        'maker': maker,
        'family': family,
        'weight': weight,
        'slant': slant,
        'widthtype': widthtype,
        'style': style,
        'pixels': pixels,
        'height': height,
        'horiz': horiz,
        'spacing': spacing,
        'vert': vert,
        'width': width,
        'registry': registry,
        'encoding': encoding
    }
    return xlfd_tmpl % font_info


if __name__ == '__main__':
    import argparse
    parser = argparse.ArgumentParser(description="Make font string")
    parser.add_argument('--family', type=str, help="Font Family")
    parser.add_argument('--size', dest='pixels', help="Font Size")
    xlfd_name = make_xlfd(**vars(parser.parse_args()))
    print(xlfd_name)
