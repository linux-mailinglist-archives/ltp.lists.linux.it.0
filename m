Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 180EE361A21
	for <lists+linux-ltp@lfdr.de>; Fri, 16 Apr 2021 08:57:53 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id D1A633C1B4D
	for <lists+linux-ltp@lfdr.de>; Fri, 16 Apr 2021 08:57:52 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id ACA5C3C1AC4
 for <ltp@lists.linux.it>; Fri, 16 Apr 2021 08:57:50 +0200 (CEST)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id D2294140163E
 for <ltp@lists.linux.it>; Fri, 16 Apr 2021 08:57:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1618556268;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=jI01Uha8rX6n5mz0jYkQByTDHK5tOrF7zCFjaG6k8mA=;
 b=gFHUzZPRrNCBa/24+JwiMr38pqiylvj32w28G1rMPahR13S4z0avdHNn4liXvYcKtVy2zG
 XfmtIWMlGKLfp6yD7U2f4R/EAyDq4CkpNKLWP6RvXQWNQr/ZG1O+w7uiWkke+i7g6sKqn/
 wQsof99jr1segYoHt6pza7MKQuhKDnM=
Received: from mail-yb1-f198.google.com (mail-yb1-f198.google.com
 [209.85.219.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-220-ApQRjkmWPhG8VuQN0stsog-1; Fri, 16 Apr 2021 02:57:45 -0400
X-MC-Unique: ApQRjkmWPhG8VuQN0stsog-1
Received: by mail-yb1-f198.google.com with SMTP id v194so5188084ybv.5
 for <ltp@lists.linux.it>; Thu, 15 Apr 2021 23:57:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=jI01Uha8rX6n5mz0jYkQByTDHK5tOrF7zCFjaG6k8mA=;
 b=BM9f2Uqm3hhaXBMJ9gNDWbJD6/DWS/xuou/5BsiZVhGJGHuzWo3OPZIRG/JJuLS0vR
 WJJGv8m1OK4FUaEs+WJ7OdqShSFn9qwTO6bIeaH1KXuvzvp2Xd4BhvQI4kxZPthtURa/
 R2Jy5UEwaTKoIVSHrM8jgW4H9L7lCHv1zd1WTWKuz7tdc7QKz9E3Rmasme4Ibn+2n9U+
 nOwvo9siFci0FTjjgmmjsrCu0jd+qm9rDMebLrKLS4T9TyDcPj6gSEgKdSLjvn1lg75q
 e/btgNZROzc4QxglVUJ+OuwJrlRZmuWQmsrimQLRE6E3VC7o0DHjDcAxztusyl3iZq2B
 9ADw==
X-Gm-Message-State: AOAM531VkoirIJqHOYohnWxYwyVjWb1xwbJlsc/CzINEUEglWu0z1M5o
 9jl1Jo2BABubxVcWtHB+xTJ0NaVp3eRBBUINyKO6h06GVOT5Q72HxKASCqqWhZvEHnpJIMr0Lco
 iFpLieSzwTBwMRvqWWdT/n/epwM4=
X-Received: by 2002:a05:6902:70e:: with SMTP id
 k14mr10579565ybt.286.1618556265226; 
 Thu, 15 Apr 2021 23:57:45 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxNJjqVai5472Pmgl95SC+RntJb41VMaYU5a6roI4YKpu25xV5Lng9WyQQFth7zgcDdvdBW0wo4rv6doV7oJQg=
X-Received: by 2002:a05:6902:70e:: with SMTP id
 k14mr10579544ybt.286.1618556265020; 
 Thu, 15 Apr 2021 23:57:45 -0700 (PDT)
MIME-Version: 1.0
References: <20210412145506.26894-1-rpalethorpe@suse.com>
 <20210412145506.26894-4-rpalethorpe@suse.com>
In-Reply-To: <20210412145506.26894-4-rpalethorpe@suse.com>
From: Li Wang <liwang@redhat.com>
Date: Fri, 16 Apr 2021 14:57:33 +0800
Message-ID: <CAEemH2fmw0_HuetkiFTnyQGsa0HiD3vsUH-oD9XTTMsynOzn+g@mail.gmail.com>
To: Richard Palethorpe <rpalethorpe@suse.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=liwan@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,HTML_MESSAGE,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v3 3/7] Add new CGroups APIs
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
Content-Type: multipart/mixed; boundary="===============1160865341=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============1160865341==
Content-Type: multipart/alternative; boundary="00000000000039d7a205c0117fc0"

--00000000000039d7a205c0117fc0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

 Hi Richard,

Thanks for your work, the whole design looks good.

Minor suggestions as below:


> +static const char *ltp_cgroup_dir =3D "ltp";
> +static const char *ltp_cgroup_drain_dir =3D "drain";
> +static char test_cgroup_dir[PATH_MAX/4];
> +static const char *ltp_mount_prefix =3D "/tmp/cgroup_";
> +static const char *ltp_v2_mount =3D "unified";
> +
> +#define first_root                             \
> +       (roots[0].ver ? roots : roots + 1)
> +#define for_each_root(r)                       \
> +       for ((r) =3D first_root; (r)->ver; (r)++)
> +#define for_each_v1_root(r)                    \
> +       for ((r) =3D roots + 1; (r)->ver; (r)++)
>

If you go through the whole files you will find, there are some places use
'r' to represent the root but other uses 't', even in functions that
include =E2=80=98t=E2=80=98
to represent a tree.

That probably a minor issue to make people get lost:).

So I'd suggest a unified abbreviation in all:

r  --> root
t  --> tree

if a function has root and tree, plz avoid using abbreviations, just use
itself.



> +#define for_each_css(css)                      \
> +       for ((css) =3D items + 1; (css)->name; (css)++)
> +
> +/* Controller items may only be in a single tree. So when (ss) > 0
> + * we only loop once.
> + */
> +#define for_each_tree(cg, css, t)                                      \
> +       for ((t) =3D (css) ? (cg)->trees_by_css + (css) : (cg)->trees;   =
 \
> +            *(t);                                                      \
> +            (t) =3D (css) ? (cg)->trees + TST_CGROUP_MAX_TREES : (t) + 1=
)
> +
> +static int has_css(uint32_t css_field, enum tst_cgroup_css type)
> +{
> +       return !!(css_field & (1 << type));
>  }
>
>


> +struct tst_cgroup *tst_cgroup_mk(const struct tst_cgroup *parent,
> +                                const char *name)
>  {
>

Since we have already got the parent tst_cgroup, it means we know which
controllers/type has been mounted.

Can we add the required controllers (e.g. "+memory")  to subtree_control
automatically at here, rather than doing it manually before creating
children?
(then we can remove the line#27~30 in tst_cgroup02.c)


--=20
Regards,
Li Wang

--00000000000039d7a205c0117fc0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small">=C2=A0Hi Richard,</div><div class=3D"gmail_default" style=3D"=
font-size:small"><br></div><div class=3D"gmail_default" style=3D"font-size:=
small">Thanks for your work, the whole design looks good.</div><div class=
=3D"gmail_default" style=3D"font-size:small"><br></div><div class=3D"gmail_=
default" style=3D"font-size:small">Minor suggestions as below:</div><div cl=
ass=3D"gmail_default" style=3D"font-size:small">=C2=A0<br></div></div><div =
class=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"margin:0px=
 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
+static const char *ltp_cgroup_dir =3D &quot;ltp&quot;;<br>
+static const char *ltp_cgroup_drain_dir =3D &quot;drain&quot;;<br>
+static char test_cgroup_dir[PATH_MAX/4];<br>
+static const char *ltp_mount_prefix =3D &quot;/tmp/cgroup_&quot;;<br>
+static const char *ltp_v2_mount =3D &quot;unified&quot;;<br>
+<br>
+#define first_root=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0\<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0(roots[0].ver ? roots : roots + 1)<br>
+#define for_each_root(r)=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0\<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0for ((r) =3D first_root; (r)-&gt;ver; (r)++)<br=
>
+#define for_each_v1_root(r)=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0for ((r) =3D roots + 1; (r)-&gt;ver; (r)++)<br>=
</blockquote><div><br></div><div><div class=3D"gmail_default" style=3D"font=
-size:small">If you go through the whole files you will find, there are som=
e places use</div><div class=3D"gmail_default" style=3D"font-size:small">&#=
39;r&#39; to represent the root but other uses &#39;t&#39;, even in functio=
ns that include =E2=80=98t=E2=80=98</div><div class=3D"gmail_default" style=
=3D"font-size:small">to represent a=C2=A0tree.=C2=A0</div><div class=3D"gma=
il_default" style=3D"font-size:small"><br></div><div class=3D"gmail_default=
" style=3D"font-size:small">That probably a minor issue to make people get =
lost:).</div><div class=3D"gmail_default" style=3D"font-size:small"><br></d=
iv><div class=3D"gmail_default" style=3D"font-size:small">So I&#39;d sugges=
t a unified=C2=A0abbreviation in all:</div><div class=3D"gmail_default" sty=
le=3D"font-size:small"><br></div><div class=3D"gmail_default" style=3D"font=
-size:small">r=C2=A0 --&gt; root</div><div class=3D"gmail_default" style=3D=
"font-size:small">t=C2=A0 --&gt; tree</div><div class=3D"gmail_default" sty=
le=3D"font-size:small"><br></div><div class=3D"gmail_default" style=3D"font=
-size:small">if a function has root and tree, plz avoid using abbreviations=
, just use itself.</div><br></div><div>=C2=A0</div><blockquote class=3D"gma=
il_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,2=
04,204);padding-left:1ex">
+#define for_each_css(css)=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0for ((css) =3D items + 1; (css)-&gt;name; (css)=
++)<br>
+<br>
+/* Controller items may only be in a single tree. So when (ss) &gt; 0<br>
+ * we only loop once.<br>
+ */<br>
+#define for_each_tree(cg, css, t)=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0for ((t) =3D (css) ? (cg)-&gt;trees_by_css + (c=
ss) : (cg)-&gt;trees;=C2=A0 =C2=A0 \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 *(t);=C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (t) =3D (css) ? (cg)-&gt;trees +=
 TST_CGROUP_MAX_TREES : (t) + 1)<br>
+<br>
+static int has_css(uint32_t css_field, enum tst_cgroup_css type)<br>
+{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0return !!(css_field &amp; (1 &lt;&lt; type));<b=
r>
=C2=A0}<br>
<br></blockquote><div>=C2=A0</div><div>=C2=A0</div><blockquote class=3D"gma=
il_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,2=
04,204);padding-left:1ex">
+struct tst_cgroup *tst_cgroup_mk(const struct tst_cgroup *parent,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 const char *name)<br>
=C2=A0{<br></blockquote><div><br></div><div><div class=3D"gmail_default" st=
yle=3D"font-size:small">Since we have already got the parent tst_cgroup, it=
 means we know which</div><div class=3D"gmail_default" style=3D"font-size:s=
mall">controllers/type has been mounted.=C2=A0</div><div class=3D"gmail_def=
ault" style=3D"font-size:small"><br></div><div class=3D"gmail_default" styl=
e=3D"font-size:small">Can we add the required controllers (e.g. &quot;+memo=
ry&quot;)=C2=A0 to subtree_control</div><div class=3D"gmail_default" style=
=3D"font-size:small">automatically at here, rather than doing it manually b=
efore creating children?</div><div class=3D"gmail_default" style=3D"font-si=
ze:small">(then we can remove the line#27~30 in  tst_cgroup02.c)</div></div=
><div><br></div></div><div><br></div>-- <br><div dir=3D"ltr"><div dir=3D"lt=
r"><div>Regards,<br></div><div>Li Wang<br></div></div></div></div>

--00000000000039d7a205c0117fc0--


--===============1160865341==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============1160865341==--

