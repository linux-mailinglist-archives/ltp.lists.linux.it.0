Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id EC87A34143E
	for <lists+linux-ltp@lfdr.de>; Fri, 19 Mar 2021 05:34:29 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 047E53C90B4
	for <lists+linux-ltp@lfdr.de>; Fri, 19 Mar 2021 05:34:29 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 by picard.linux.it (Postfix) with ESMTP id F21D93C608D
 for <ltp@lists.linux.it>; Fri, 19 Mar 2021 05:34:24 +0100 (CET)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by in-6.smtp.seeweb.it (Postfix) with ESMTP id A0CA614011BB
 for <ltp@lists.linux.it>; Fri, 19 Mar 2021 05:34:23 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616128462;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=g50Sdz110GCknHaSrWuEO1bzT/JTB/KAD6qkMoKwQ/k=;
 b=Fr/PE18rIfvT3qQgApxpmEJSlyjXmlDX+/bfw36F3RYYa9OvXwJ2wd8Qlf9SxiB8Kq2uYy
 cDgPCigtYL8KVn0iJzMt+ZmuEhz6cghmVy4dS5pvj9jTfexXj6qe8sF1g9D9OC35oSSIh/
 qr5GlqNusbeUjWuO4PWgLmOoBJP+Rj0=
Received: from mail-yb1-f198.google.com (mail-yb1-f198.google.com
 [209.85.219.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-218-clQgFngmN_qgiFvJuNlRaw-1; Fri, 19 Mar 2021 00:34:18 -0400
X-MC-Unique: clQgFngmN_qgiFvJuNlRaw-1
Received: by mail-yb1-f198.google.com with SMTP id 6so51219030ybq.7
 for <ltp@lists.linux.it>; Thu, 18 Mar 2021 21:34:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=g50Sdz110GCknHaSrWuEO1bzT/JTB/KAD6qkMoKwQ/k=;
 b=GAl6s6EEmvMXFn1r9DRP7hPzkCM1jh6VGvkz5pcNQvUnhtN1KiNoezYT8MDAqryJ08
 ICtesLEbQudEFtiReAOiDCNHzH7TsuNt9R1TpXemI9eJyEswLptta1xxYY1lYOZpop8P
 Dda6PP0NoVVECmFcCsE4qVnYRjkizHXfjC3pRJs+KJ5PXlZpklXXz+bFjglYYXzFrpuB
 X5/pMU/Q/949nu1hZYIXHQJt+bctCsVru4UIbcngRyn8qFq8dl/G/iWK1hSFMA4jNX1u
 a3UqsgmpnMjA4n0fUewhe+9tSJBPzxwTwCIz5IFAN1KNQTnAJXR8FHGos4NFm+5I5n2Q
 BJKQ==
X-Gm-Message-State: AOAM5338w/gHw9hzWP2JM4ND7Tp3bi+TJH2uFOuLQrIoeDm4PWItelg2
 DqrJdw4OeLZMVVJG3qzZo5DhGZ7q2VEAoSJ8f03VUblSDGTH7gk+rrAAuUtskz3INEKndJ+VcuJ
 20UnKfnJZ1n6/H+IRh6c1GaLSRu8=
X-Received: by 2002:a25:e7d7:: with SMTP id e206mr3915696ybh.110.1616128457947; 
 Thu, 18 Mar 2021 21:34:17 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwUVKZwT0xt8GdlYHhbIV5ns6bC1kcPizwglr2CROjooog6gtuQkqlgLABRa9ni8ck3NKSFzZ9t/viEdNUpap8=
X-Received: by 2002:a25:e7d7:: with SMTP id e206mr3915688ybh.110.1616128457781; 
 Thu, 18 Mar 2021 21:34:17 -0700 (PDT)
MIME-Version: 1.0
References: <20210318181641.2062-1-pvorel@suse.cz>
 <20210318181641.2062-3-pvorel@suse.cz>
In-Reply-To: <20210318181641.2062-3-pvorel@suse.cz>
From: Li Wang <liwang@redhat.com>
Date: Fri, 19 Mar 2021 12:34:06 +0800
Message-ID: <CAEemH2fUGFY6YH=m4SfGpJ_nbYWJmUK1_-mLK8n74zM_WNFLng@mail.gmail.com>
To: Petr Vorel <pvorel@suse.cz>
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
Subject: Re: [LTP] [PATCH v2 2/2] doc: Add Maintainer Patch Review Checklist
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
Cc: Yang Xu <xuyang2018.jy@cn.fujitsu.com>, LTP List <ltp@lists.linux.it>
Content-Type: multipart/mixed; boundary="===============0629661589=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============0629661589==
Content-Type: multipart/alternative; boundary="000000000000a34f7e05bddc3a97"

--000000000000a34f7e05bddc3a97
Content-Type: text/plain; charset="UTF-8"

On Fri, Mar 19, 2021 at 2:17 AM Petr Vorel <pvorel@suse.cz> wrote:

> Signed-off-by: Petr Vorel <pvorel@suse.cz>
> ---
>  doc/maintainer-patch-review-checklist.txt | 53 +++++++++++++++++++++++
>  1 file changed, 53 insertions(+)
>  create mode 100644 doc/maintainer-patch-review-checklist.txt
>
> diff --git a/doc/maintainer-patch-review-checklist.txt
> b/doc/maintainer-patch-review-checklist.txt
> new file mode 100644
> index 000000000..2587287aa
> --- /dev/null
> +++ b/doc/maintainer-patch-review-checklist.txt
> @@ -0,0 +1,53 @@
> +# Maintainer Patch Review Checklist
> +
> +Patchset should be tested locally and ideally also in maintainer's fork in
> +https://travis-ci.org/[Travis CI].
> +
> +NOTE: Travis does only build testing, passing the CI means only that the
> +      test compiles fine on variety of different distributions and
> +      releases.
> +
> +The test should be executed at least once locally and should PASS as well.
> +
> +Commit messages should have
> +
> +* Author's `Signed-off-by` tag
> +* Committer's `Reviewed-by` or `Signed-off-by` tag
>

Or adding `Acked-by:` also acceptable?

I'm not sure what's the difference between Acked-by and Reviewed-by,
but personally feel the Acked-by has more confidence in the reviewing.

In my mind,

`Acked-by` means:
code review OK, compiled OK, executed OK, has confidence it OK for all
arches

`Reviewed-by` means:
code review OK, compiled and executed OK just locally or optional, still room
for improvement/discussion

-- 
Regards,
Li Wang

--000000000000a34f7e05bddc3a97
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote"><div dir=3D"lt=
r" class=3D"gmail_attr">On Fri, Mar 19, 2021 at 2:17 AM Petr Vorel &lt;<a h=
ref=3D"mailto:pvorel@suse.cz" target=3D"_blank">pvorel@suse.cz</a>&gt; wrot=
e:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0=
.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Signed-off-by=
: Petr Vorel &lt;<a href=3D"mailto:pvorel@suse.cz" target=3D"_blank">pvorel=
@suse.cz</a>&gt;<br>
---<br>
=C2=A0doc/maintainer-patch-review-checklist.txt | 53 ++++++++++++++++++++++=
+<br>
=C2=A01 file changed, 53 insertions(+)<br>
=C2=A0create mode 100644 doc/maintainer-patch-review-checklist.txt<br>
<br>
diff --git a/doc/maintainer-patch-review-checklist.txt b/doc/maintainer-pat=
ch-review-checklist.txt<br>
new file mode 100644<br>
index 000000000..2587287aa<br>
--- /dev/null<br>
+++ b/doc/maintainer-patch-review-checklist.txt<br>
@@ -0,0 +1,53 @@<br>
+# Maintainer Patch Review Checklist<br>
+<br>
+Patchset should be tested locally and ideally also in maintainer&#39;s for=
k in<br>
+<a href=3D"https://travis-ci.org/%5BTravis" rel=3D"noreferrer" target=3D"_=
blank">https://travis-ci.org/[Travis</a> CI].<br>
+<br>
+NOTE: Travis does only build testing, passing the CI means only that the<b=
r>
+=C2=A0 =C2=A0 =C2=A0 test compiles fine on variety of different distributi=
ons and<br>
+=C2=A0 =C2=A0 =C2=A0 releases.<br>
+<br>
+The test should be executed at least once locally and should PASS as well.=
<br>
+<br>
+Commit messages should have<br>
+<br>
+* Author&#39;s `Signed-off-by` tag<br>
+* Committer&#39;s `Reviewed-by` or `Signed-off-by` tag<br></blockquote><di=
v><br></div><div><div class=3D"gmail_default" style=3D"font-size:small">Or =
adding `Acked-by:` also acceptable?</div><div class=3D"gmail_default" style=
=3D"font-size:small"><br></div><div class=3D"gmail_default" style=3D"font-s=
ize:small">I&#39;m not sure what&#39;s the difference between Acked-by and =
Reviewed-by,</div><div class=3D"gmail_default" style=3D"font-size:small">bu=
t personally feel the Acked-by has more confidence in the reviewing.</div><=
div class=3D"gmail_default" style=3D"font-size:small"><br></div><div class=
=3D"gmail_default" style=3D"font-size:small">In my mind,</div><div class=3D=
"gmail_default" style=3D"font-size:small"><br></div><div class=3D"gmail_def=
ault" style=3D"font-size:small">`Acked-by` means:</div><div class=3D"gmail_=
default" style=3D"font-size:small">code review OK, compiled OK, executed=C2=
=A0OK, has confidence it OK for all arches</div><div class=3D"gmail_default=
" style=3D"font-size:small"><br></div><div class=3D"gmail_default" style=3D=
"font-size:small">`Reviewed-by` means:</div><div class=3D"gmail_default" st=
yle=3D"font-size:small">code review OK, compiled and executed OK just local=
ly or optional, still<span style=3D"color:rgb(51,51,51);font-size:14px">=C2=
=A0room for improvement/discussion</span></div></div></div><div><br></div>-=
- <br><div dir=3D"ltr"><div dir=3D"ltr"><div>Regards,<br></div><div>Li Wang=
<br></div></div></div></div>

--000000000000a34f7e05bddc3a97--


--===============0629661589==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============0629661589==--

