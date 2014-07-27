from django.db import models

from wagtail.wagtailcore.models import Page, Orderable
from wagtail.wagtailcore.fields import RichTextField
from wagtail.wagtailadmin.edit_handlers import FieldPanel, MultiFieldPanel, InlinePanel, PageChooserPanel
from modelcluster.fields import ParentalKey


class BlogPage(Page):
    body = RichTextField()
    intro = RichTextField()
    date = models.DateField("Post date")
    indexed_fields = ('body', )
    search_name = "Blog Page"


BlogPage.content_panels = [
    FieldPanel('title', classname="full title"),
    FieldPanel('date'),
    FieldPanel('intro', classname="full"),
    FieldPanel('body', classname="full"),
]


class LinkFields(models.Model):
    link_page = models.ForeignKey(
        'wagtailcore.Page',
        null=True,
        blank=True,
        related_name='+'
    )

    panels = [
        PageChooserPanel('link_page'),
    ]

    class Meta:
        abstract = True


class RelatedLink(LinkFields):
    title = models.CharField(max_length=255, help_text="Link title")
    panels = [
        FieldPanel('title'),
        MultiFieldPanel(LinkFields.panels, "Link"),
    ]

    class Meta:
        abstract = True


class BlogIndexPageRelatedLink(Orderable, RelatedLink):
    page = ParentalKey('main.BlogIndexPage', related_name='related_links')


class BlogIndexPage(Page):
    intro = models.CharField(max_length=256)
    indexed_fields = ('body', )
    search_name = "Blog Index Page"


BlogIndexPage.content_panels = [
    FieldPanel('title', classname="full title"),
    FieldPanel('intro', classname="full"),
    InlinePanel(BlogIndexPage, 'related_links', label="Related links"),
]    