Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F386211BE3
	for <lists+linux-ltp@lfdr.de>; Thu,  2 Jul 2020 08:16:35 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id D800E3C2A6C
	for <lists+linux-ltp@lfdr.de>; Thu,  2 Jul 2020 08:16:34 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 by picard.linux.it (Postfix) with ESMTP id 8861F3C2A43
 for <ltp@lists.linux.it>; Thu,  2 Jul 2020 08:16:32 +0200 (CEST)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
 by in-3.smtp.seeweb.it (Postfix) with ESMTP id 57EC51A013CA
 for <ltp@lists.linux.it>; Thu,  2 Jul 2020 08:16:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1593670589;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=slZrXiy2K4xJc4jK8yhRADiqnIMMynOTCcXUMEL2NNc=;
 b=ZVy7WEjEuEx8CpkQWL3fi5fu7w+csKsDWIDWMOjHh6/XhqnCc3rotJvxsXB1MWhO0efMXS
 JjAJ0Px/0UZkeKVbq6XIQ+nWS67A/GL0blft5ucJ6PbZiJfzL5SvlZRB+J5P/naY16uYPW
 e5ZxmlvDSTNsEHVP8wzklcDJ2weQLe4=
Received: from mail-lj1-f197.google.com (mail-lj1-f197.google.com
 [209.85.208.197]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-327-5-bfs5npNROjqtKO46HpIw-1; Thu, 02 Jul 2020 02:16:25 -0400
X-MC-Unique: 5-bfs5npNROjqtKO46HpIw-1
Received: by mail-lj1-f197.google.com with SMTP id g24so6592779ljl.19
 for <ltp@lists.linux.it>; Wed, 01 Jul 2020 23:16:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=slZrXiy2K4xJc4jK8yhRADiqnIMMynOTCcXUMEL2NNc=;
 b=W1IAiRRWh/UFxtv15agvPBm08pmj0PqwllEbEN49AluGwjKEN85zo44p7hDbQaJZ2U
 aXeBhtbECCVs6TWxkOcDX4LAZpSfObLGN1ubICY7Gqt1JiaXL/n2eFC3bNXykrnivp/O
 auWQgeHPvdjv6Hdq29kGIGwZRxD3Yvh7/Q4gZsnrlYkMcybeLMZU47LjZ1FahDgHc4q/
 vLNrak7zcF/Da0z9+izIFr/IaZ6/gPJ5q4KLz5q/gq6ZoH+IhiuwiupkXIP+VzHl0la9
 wu/lEg5SCDmx0gIdrfARZF5shg5prJykBPg4/PlabhwNkMyO80cZAsg0GTYyUs0v7ZWQ
 fqlw==
X-Gm-Message-State: AOAM533IzRRl35HTDm6gXKH+AiRg32nSV9jvUgHBCU+5bkyFxUzEqnBi
 l/6SMbPUD1mDCHD+5D6MinyaEHFWC/LTWrBRj6qhHpDcAB5Bi22hKwgTTMqndP3Vy7/pcDr20b6
 VkTZfO1TE2Y40bjahZHX8AtljSiY=
X-Received: by 2002:a2e:a484:: with SMTP id h4mr15663700lji.468.1593670584132; 
 Wed, 01 Jul 2020 23:16:24 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyCW69cNvkUcXtp5Itf1D8+JcRPFSFEp5ScgfscsW/cLfLZLV0W58ZEj01Lfu3NocdcWgsEjYJWbhzhXpQMEsg=
X-Received: by 2002:a2e:a484:: with SMTP id h4mr15663690lji.468.1593670583895; 
 Wed, 01 Jul 2020 23:16:23 -0700 (PDT)
MIME-Version: 1.0
References: <20200701151456.851-1-mdoucha@suse.cz>
In-Reply-To: <20200701151456.851-1-mdoucha@suse.cz>
From: Li Wang <liwang@redhat.com>
Date: Thu, 2 Jul 2020 14:16:11 +0800
Message-ID: <CAEemH2e9Lv3a_SF3Jez6HTdC9=KKrNfoR=U11T2Rhkt4hf2C+w@mail.gmail.com>
To: Martin Doucha <mdoucha@suse.cz>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=liwan@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,HTML_MESSAGE,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2 1/2] Add tst_get_hugepage_size() to LTP library
X-BeenThere: ltp@lists.linux.it
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux Test Project <ltp.lists.linux.it>
List-Unsubscribe: <https://lists.linux.it/options/ltp>,
 <mailto:ltp-request@lists.linux.it?subject=unsubscribe>
List-Archive: <http://lists.linux.it/pipermail/ltp/>
List-Post: <mailto:ltp@lists.linux.it>
List-Help: <mailto:ltp-request@lists.linux.it?subject=help>
List-Subscribe: <https://lists.linux.it/listinfo/ltp>,
 <mailto:ltp-request@lists.linux.it?subject=subscribe>
Cc: LTP List <ltp@lists.linux.it>
Content-Type: multipart/mixed; boundary="===============1380794611=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============1380794611==
Content-Type: multipart/alternative; boundary="0000000000000ae99a05a96f5920"

--0000000000000ae99a05a96f5920
Content-Type: text/plain; charset="UTF-8"

On Wed, Jul 1, 2020 at 11:15 PM Martin Doucha <mdoucha@suse.cz> wrote:

> Signed-off-by: Martin Doucha <mdoucha@suse.cz>
>
Reviewed-by: Li Wang <liwang@redhat.com>


> ---
>
> No changes since v1.
>
>  include/tst_hugepage.h | 5 +++++
>  lib/tst_hugepage.c     | 9 +++++++++
>  2 files changed, 14 insertions(+)
>
> diff --git a/include/tst_hugepage.h b/include/tst_hugepage.h
> index 60c03c5c5..e08a2daa2 100644
> --- a/include/tst_hugepage.h
> +++ b/include/tst_hugepage.h
> @@ -12,6 +12,11 @@
>  extern char *nr_opt; /* -s num   Set the number of the been allocated
> hugepages */
>  extern char *Hopt;   /* -H /..   Location of hugetlbfs, i.e.  -H
> /var/hugetlbfs */
>
> +/*
> + * Get the default hugepage size. Returns 0 if hugepages are not
> supported.
> + */
> +size_t tst_get_hugepage_size(void);
> +
>  /*
>   * Try the best to request a specified number of huge pages from system,
>   * it will store the reserved hpage number in tst_hugepages.
> diff --git a/lib/tst_hugepage.c b/lib/tst_hugepage.c
> index f2bf5d20e..3a8dcca90 100644
> --- a/lib/tst_hugepage.c
> +++ b/lib/tst_hugepage.c
> @@ -12,6 +12,15 @@ unsigned long tst_hugepages;
>  char *nr_opt;
>  char *Hopt;
>
> +size_t tst_get_hugepage_size(void)
> +{
> +       if (access(PATH_HUGEPAGES, F_OK)) {
>

The braces here is redundant. Someone who merging the patch can help clean
this.



> +               return 0;
> +       }
> +
> +       return SAFE_READ_MEMINFO("Hugepagesize:") * 1024;
> +}
> +
>  unsigned long tst_request_hugepages(unsigned long hpages)
>  {
>         unsigned long val, max_hpages;
> --
> 2.26.2
>
>
> --
> Mailing list info: https://lists.linux.it/listinfo/ltp
>
>

-- 
Regards,
Li Wang

--0000000000000ae99a05a96f5920
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote"><div dir=3D"lt=
r" class=3D"gmail_attr">On Wed, Jul 1, 2020 at 11:15 PM Martin Doucha &lt;<=
a href=3D"mailto:mdoucha@suse.cz" target=3D"_blank">mdoucha@suse.cz</a>&gt;=
 wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px =
0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Signed-o=
ff-by: Martin Doucha &lt;<a href=3D"mailto:mdoucha@suse.cz" target=3D"_blan=
k">mdoucha@suse.cz</a>&gt;<br></blockquote><div><span class=3D"gmail_defaul=
t" style=3D"font-size:small"></span>Reviewed-by: Li Wang &lt;<a href=3D"mai=
lto:liwang@redhat.com" target=3D"_blank">liwang@redhat.com</a>&gt;</div><di=
v><span class=3D"gmail_default"></span>=C2=A0</div><blockquote class=3D"gma=
il_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,2=
04,204);padding-left:1ex">
---<br>
<br>
No changes since v1.<br>
<br>
=C2=A0include/tst_hugepage.h | 5 +++++<br>
=C2=A0lib/tst_hugepage.c=C2=A0 =C2=A0 =C2=A0| 9 +++++++++<br>
=C2=A02 files changed, 14 insertions(+)<br>
<br>
diff --git a/include/tst_hugepage.h b/include/tst_hugepage.h<br>
index 60c03c5c5..e08a2daa2 100644<br>
--- a/include/tst_hugepage.h<br>
+++ b/include/tst_hugepage.h<br>
@@ -12,6 +12,11 @@<br>
=C2=A0extern char *nr_opt; /* -s num=C2=A0 =C2=A0Set the number of the been=
 allocated hugepages */<br>
=C2=A0extern char *Hopt;=C2=A0 =C2=A0/* -H /..=C2=A0 =C2=A0Location of huge=
tlbfs, i.e.=C2=A0 -H /var/hugetlbfs */<br>
<br>
+/*<br>
+ * Get the default hugepage size. Returns 0 if hugepages are not supported=
.<br>
+ */<br>
+size_t tst_get_hugepage_size(void);<br>
+<br>
=C2=A0/*<br>
=C2=A0 * Try the best to request a specified number of huge pages from syst=
em,<br>
=C2=A0 * it will store the reserved hpage number in tst_hugepages.<br>
diff --git a/lib/tst_hugepage.c b/lib/tst_hugepage.c<br>
index f2bf5d20e..3a8dcca90 100644<br>
--- a/lib/tst_hugepage.c<br>
+++ b/lib/tst_hugepage.c<br>
@@ -12,6 +12,15 @@ unsigned long tst_hugepages;<br>
=C2=A0char *nr_opt;<br>
=C2=A0char *Hopt;<br>
<br>
+size_t tst_get_hugepage_size(void)<br>
+{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (access(PATH_HUGEPAGES, F_OK)) {<br></blockq=
uote><div><br></div><div><div class=3D"gmail_default" style=3D"font-size:sm=
all">The braces here is redundant. Someone who merging the patch can help c=
lean this.</div><br></div><div>=C2=A0</div><blockquote class=3D"gmail_quote=
" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);=
padding-left:1ex">
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return 0;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0return SAFE_READ_MEMINFO(&quot;Hugepagesize:&qu=
ot;) * 1024;<br>
+}<br>
+<br>
=C2=A0unsigned long tst_request_hugepages(unsigned long hpages)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 unsigned long val, max_hpages;<br>
-- <br>
2.26.2<br>
<br>
<br>
-- <br>
Mailing list info: <a href=3D"https://lists.linux.it/listinfo/ltp" rel=3D"n=
oreferrer" target=3D"_blank">https://lists.linux.it/listinfo/ltp</a><br>
<br>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr"=
><div dir=3D"ltr"><div>Regards,<br></div><div>Li Wang<br></div></div></div>=
</div>

--0000000000000ae99a05a96f5920--


--===============1380794611==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============1380794611==--

