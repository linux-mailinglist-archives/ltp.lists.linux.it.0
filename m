Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 6979D3C4122
	for <lists+linux-ltp@lfdr.de>; Mon, 12 Jul 2021 04:01:01 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 0183C3C78DE
	for <lists+linux-ltp@lfdr.de>; Mon, 12 Jul 2021 04:01:01 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id C620E3C4E3E
 for <ltp@lists.linux.it>; Mon, 12 Jul 2021 04:00:56 +0200 (CEST)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id D81182009B2
 for <ltp@lists.linux.it>; Mon, 12 Jul 2021 04:00:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626055252;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=MCOmuetVlPdQ+lt2GSCyYRRXoe2jUko0qiAYPrfX9jM=;
 b=QBleAlS/MHGOl2QhE27LgeE9MnAWOCWoMw8B4mZAgzYbUuUcmwyBlnqnJfjafNG25UFwyg
 +2dydmdnSbQZvk+o9mz6J7IMailYAEz1aLQtnrGq1OLcE9hHgnZY8T4vNJu2oh7cBFP8cD
 vJtHxvL+ta53IeFik/awottVoUiGb1I=
Received: from mail-yb1-f200.google.com (mail-yb1-f200.google.com
 [209.85.219.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-257-x1Be8g9YNWSjmox7ybT5Cw-1; Sun, 11 Jul 2021 22:00:48 -0400
X-MC-Unique: x1Be8g9YNWSjmox7ybT5Cw-1
Received: by mail-yb1-f200.google.com with SMTP id
 j186-20020a25d2c30000b029055ed6ffbea6so12942480ybg.14
 for <ltp@lists.linux.it>; Sun, 11 Jul 2021 19:00:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=MCOmuetVlPdQ+lt2GSCyYRRXoe2jUko0qiAYPrfX9jM=;
 b=lnHtQGDvQOYzxkgTfPiWImMfofpY7I6NnXZgN1QWwTJpmQlqUsTHdTeCMJLyROE/BD
 h0rNSzVJrEcKIq3h/cR78xfm6C27BIVLt9HSUWhslb/sSl6qT/kayf1kjh3UiT2l6k1n
 8uq/0UV6bH2RQUE8S1tAFuaUSCBMGPwOWvNd7goNEhpP93umga6cK3WfOAbBZ3YNkVUT
 GHOxVgzkVHvtA/Q7yXWVl2IjTLDfujDsXM0klNcDMejurbcNjsS1rtcp+2J62zgDMFb/
 xhT1NtDb+aB1hcXRhrgcPf19k2O1bKnUisHjsskJf48ErEFtkWIvvhmmZ4TLZ7UMzjs6
 mxTA==
X-Gm-Message-State: AOAM530iZ86nArxHIyD4PsEBLib6GdsYuVUm3rkiDh7v93HqOiPAVErP
 vC0Ahvz2T5TbEOFWTWKoh5Ce/ge2S7gVBw01YYVSo3YM5MtMfFrjZNZGkBP0E7kzSOO7922aJYi
 tIzZJ676Pth4qNt6lNRybgH+0mus=
X-Received: by 2002:a25:38c6:: with SMTP id
 f189mr53544760yba.110.1626055248063; 
 Sun, 11 Jul 2021 19:00:48 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyoxV5bZRE03uNjiKNlq46oRy+lTgIVXRkrHrbc3HXPlp0ysGtpGlhtWPeNaS0dGsrDAkmuEYZTi56604qXDis=
X-Received: by 2002:a25:38c6:: with SMTP id
 f189mr53544726yba.110.1626055247720; 
 Sun, 11 Jul 2021 19:00:47 -0700 (PDT)
MIME-Version: 1.0
References: <20210709140143.9180-1-pvorel@suse.cz>
In-Reply-To: <20210709140143.9180-1-pvorel@suse.cz>
From: Li Wang <liwang@redhat.com>
Date: Mon, 12 Jul 2021 10:00:36 +0800
Message-ID: <CAEemH2fB5VakafKhTgcOsvwK6Q50AJ3WcpRY2fSLfhB86b03Nw@mail.gmail.com>
To: Petr Vorel <pvorel@suse.cz>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=liwan@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,HTML_MESSAGE,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 1/1] tst_net.sh: Declare prefix variable as empty
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
Content-Type: multipart/mixed; boundary="===============1670825744=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============1670825744==
Content-Type: multipart/alternative; boundary="0000000000006d225605c6e37d3f"

--0000000000006d225605c6e37d3f
Content-Type: text/plain; charset="UTF-8"

On Fri, Jul 9, 2021 at 10:01 PM Petr Vorel <pvorel@suse.cz> wrote:

> From: Petr Vorel <petr.vorel@gmail.com>
>
> in tst_ipaddr_un(). This is required to fix problem on dash, which
> (unlike bash and busybox ash implementation) takes value of previously
> defined variable, i.e.  guarding with local does not work:
>
> $ foo=ee; bar() { local foo; echo "foo: '$foo'"; }; bar
> foo: 'ee'
>

I'm thinking maybe we should avoid defining the same name
variables like that. But anyway, your fix should be worked.

Reviewed-by: Li Wang <liwang@redhat.com>



>
> It requires declare it as empty:
> $ foo=ee; bar() { local foo=; echo "foo: '$foo'"; }; bar
> foo: ''
>
> This problem seems to be on various dash versions from 0.5.8 to
> 0.5.11+git20200708+dd9ef66-5 (on Debian oldstable, stable, testing).
> It'd require to set all variables, but now fix just prefix, which is
> used in build.sh and it's quite common name.
>
> Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
> Signed-off-by: Petr Vorel <pvorel@suse.cz>
> ---
>  testcases/lib/tst_net.sh | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/testcases/lib/tst_net.sh b/testcases/lib/tst_net.sh
> index db1db4790..52975f37b 100644
> --- a/testcases/lib/tst_net.sh
> +++ b/testcases/lib/tst_net.sh
> @@ -408,7 +408,7 @@ tst_ipaddr_un()
>         local max_net_id=$default_max
>         local min_net_id=0
>
> -       local counter host_id host_range is_counter max_host_id
> min_host_id net_id prefix tmp type
> +       local counter host_id host_range is_counter max_host_id
> min_host_id net_id prefix= tmp type
>
>         local OPTIND
>         while getopts "c:h:n:p" opt; do
> --
> 2.26.2
>
>

-- 
Regards,
Li Wang

--0000000000006d225605c6e37d3f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote"><div dir=3D"lt=
r" class=3D"gmail_attr">On Fri, Jul 9, 2021 at 10:01 PM Petr Vorel &lt;<a h=
ref=3D"mailto:pvorel@suse.cz">pvorel@suse.cz</a>&gt; wrote:<br></div><block=
quote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1=
px solid rgb(204,204,204);padding-left:1ex">From: Petr Vorel &lt;<a href=3D=
"mailto:petr.vorel@gmail.com" target=3D"_blank">petr.vorel@gmail.com</a>&gt=
;<br>
<br>
in tst_ipaddr_un(). This is required to fix problem on dash, which<br>
(unlike bash and busybox ash implementation) takes value of previously<br>
defined variable, i.e.=C2=A0 guarding with local does not work:<br>
<br>
$ foo=3Dee; bar() { local foo; echo &quot;foo: &#39;$foo&#39;&quot;; }; bar=
<br>
foo: &#39;ee&#39;<br></blockquote><div><br></div><div><div class=3D"gmail_d=
efault" style=3D"font-size:small">I&#39;m thinking maybe we should avoid de=
fining the same name</div><div class=3D"gmail_default" style=3D"font-size:s=
mall">variables like that. But anyway, your fix should be worked.</div><div=
 class=3D"gmail_default" style=3D"font-size:small"><br></div><div class=3D"=
gmail_default" style=3D"font-size:small">Reviewed-by:=C2=A0Li Wang &lt;<a h=
ref=3D"mailto:liwang@redhat.com">liwang@redhat.com</a>&gt;</div><br></div><=
div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0=
px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
It requires declare it as empty:<br>
$ foo=3Dee; bar() { local foo=3D; echo &quot;foo: &#39;$foo&#39;&quot;; }; =
bar<br>
foo: &#39;&#39;<br>
<br>
This problem seems to be on various dash versions from 0.5.8 to<br>
0.5.11+git20200708+dd9ef66-5 (on Debian oldstable, stable, testing).<br>
It&#39;d require to set all variables, but now fix just prefix, which is<br=
>
used in build.sh and it&#39;s quite common name.<br>
<br>
Signed-off-by: Petr Vorel &lt;<a href=3D"mailto:petr.vorel@gmail.com" targe=
t=3D"_blank">petr.vorel@gmail.com</a>&gt;<br>
Signed-off-by: Petr Vorel &lt;<a href=3D"mailto:pvorel@suse.cz" target=3D"_=
blank">pvorel@suse.cz</a>&gt;<br>
---<br>
=C2=A0testcases/lib/tst_net.sh | 2 +-<br>
=C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
<br>
diff --git a/testcases/lib/tst_net.sh b/testcases/lib/tst_net.sh<br>
index db1db4790..52975f37b 100644<br>
--- a/testcases/lib/tst_net.sh<br>
+++ b/testcases/lib/tst_net.sh<br>
@@ -408,7 +408,7 @@ tst_ipaddr_un()<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 local max_net_id=3D$default_max<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 local min_net_id=3D0<br>
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0local counter host_id host_range is_counter max=
_host_id min_host_id net_id prefix tmp type<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0local counter host_id host_range is_counter max=
_host_id min_host_id net_id prefix=3D tmp type<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 local OPTIND<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 while getopts &quot;c:h:n:p&quot; opt; do<br>
-- <br>
2.26.2<br>
<br>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr"=
 class=3D"gmail_signature"><div dir=3D"ltr"><div>Regards,<br></div><div>Li =
Wang<br></div></div></div></div>

--0000000000006d225605c6e37d3f--


--===============1670825744==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============1670825744==--

