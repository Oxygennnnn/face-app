'''定义了 Django 中 TinyMCE 编辑器的一些配置选项，以便在网页上实现富文本编辑功能。'''

"""Django TinyMCE Settings"""

# TINYMCE_COMPRESSOR = True
TINYMCE_DEFAULT_CONFIG = {
    "language": "zh_CN",
    "theme": "silver",
    "height": 600,
    "plugins": "print preview paste importcss searchreplace "
        "autolink autosave save directionality code visualblocks "
        "visualchars fullscreen image link media template codesample "
        "table charmap hr pagebreak nonbreaking anchor toc insertdatetime "
        "advlist lists wordcount imagetools textpattern noneditable help "
        "charmap quickbars emoticons",
    "toolbar": "undo redo | "
        "bold italic underline strikethrough charmap emoticons | "
        "fontselect fontsizeselect formatselect | "
        "alignleft aligncenter alignright alignjustify | "
        "outdent indent | numlist bullist | "
        "forecolor backcolor removeformat | "
        "pagebreak | "
        "fullscreen  preview save print | ltr rtl | "
        "insertfile image media template link anchor codesample",
    "toolbar_sticky": True,
    "image_caption": True,
}
