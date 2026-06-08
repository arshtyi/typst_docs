#let _yaml-encode = yaml.encode

#let _plain(value) = {
    let t = type(value)
    if value == none or t in (bool, int, float, str) {
        value
    } else if t == content {
        let out = (func: repr(value.func()))
        for (key, child) in value.fields().pairs() {
            out.insert(key, _plain(child))
        }
        out
    } else if t == array {
        value.map(_plain)
    } else if t == dictionary {
        let out = (:)
        for (key, child) in value.pairs() {
            out.insert(key, _plain(child))
        }
        out
    } else {
        repr(value)
    }
}

#let tree(value) = _plain(value)

#let yaml(value) = _yaml-encode(tree(value))

#let dump(value, lang: "yaml") = raw(yaml(value), lang: lang)

#let panic-dump(value) = panic(yaml(value))
