Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 1574A4A6A64
	for <lists+linux-ltp@lfdr.de>; Wed,  2 Feb 2022 03:59:50 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 80C353C98A8
	for <lists+linux-ltp@lfdr.de>; Wed,  2 Feb 2022 03:59:48 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id EEDBA3C9871
 for <ltp@lists.linux.it>; Wed,  2 Feb 2022 03:59:41 +0100 (CET)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id E14FE10005AF
 for <ltp@lists.linux.it>; Wed,  2 Feb 2022 03:59:40 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643770779;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=x5HTf9cjqGzVG57l23cnhjysti0KJ1GoXsI50cGDEL4=;
 b=ePVSvpbR7g6lswNXhiPK1cM7QtRcPq997qlkv0ExBaCw73nA7CBY8+l1Ca18b4cKkUZjV0
 VD/RfKnT5EbhhoRydb59Xj6Kore5pn3ZOcH0Y5zFeaiXfU7v9WN6kfFWuz310vITYttRzo
 z3PFyoGTptchCJuCaMJuqPNxlXTvvz0=
Received: from mail-yb1-f198.google.com (mail-yb1-f198.google.com
 [209.85.219.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-43-p0LoKdWrOo-k2c_oThrjiQ-1; Tue, 01 Feb 2022 21:59:36 -0500
X-MC-Unique: p0LoKdWrOo-k2c_oThrjiQ-1
Received: by mail-yb1-f198.google.com with SMTP id
 t8-20020a259ac8000000b00619a3b5977fso19377506ybo.5
 for <ltp@lists.linux.it>; Tue, 01 Feb 2022 18:59:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=x5HTf9cjqGzVG57l23cnhjysti0KJ1GoXsI50cGDEL4=;
 b=j31b8p/gYiU7aXeKqdrCGKv//RndqAJO7hVqq/9BW1BaIF+5+F1oc1RXnPgoT//pF8
 6AOcOtbdS/cEZBL1sLhi5Vl9vdcUDSmKVk5392HsOjGjefzgNpQHFcGvvpWu3naigXzw
 qJzQEeR9lRQ/LJ7LuYDYuufo+ali/zE+8cqFl/WSmJdNYO4qhK3lWJ5Cc0oyFsIkeA1L
 SMm50OLOQeI/MTqh15kvynEe0ag9lNbibqbPyCtPnqY3HZhuwO3TWp9oCyOHZiJ48f83
 WtroFGEgmQkhykgjgZALHA96yYRfCWy9kv9kKjLpz6BLaIYlpHWUQYMmKdPJHrS6hOkW
 nRIw==
X-Gm-Message-State: AOAM5320CHRkNvS6NXmDO5RwJIkx6qGCOk4MbNQNQ3YrbIh//ja4Vhc3
 THp9uahIFLGlvvKgooLcfGem+JLxs8hUw+lQFxEaEzSHsBi33h7ujUaxc+79jbH4TMqzgqQQ4fy
 f5iZfyqkmBAH7CHBUrBv/x7+miM0=
X-Received: by 2002:a25:3409:: with SMTP id b9mr40550274yba.102.1643770775355; 
 Tue, 01 Feb 2022 18:59:35 -0800 (PST)
X-Google-Smtp-Source: ABdhPJy6kNqE6fAv/HhQxmFVFeylvwlhHkBFkwrOw5UX79h7uf+hbbwWq8C2qM4H9GLbzk/LyBLd6f7wbEoiqV52ri4=
X-Received: by 2002:a25:3409:: with SMTP id b9mr40550268yba.102.1643770775147; 
 Tue, 01 Feb 2022 18:59:35 -0800 (PST)
MIME-Version: 1.0
References: <20220127171455.9809-1-pvorel@suse.cz>
 <61F609C7.1080803@fujitsu.com>
 <CAEemH2df5D=MV-bCP5d39F-CxTngHB-OUGxZBfDx+pj5uRTyjw@mail.gmail.com>
 <5e625be6.59ff.17ea9aba81e.Coremail.xuyang_jy_0410@163.com>
In-Reply-To: <5e625be6.59ff.17ea9aba81e.Coremail.xuyang_jy_0410@163.com>
From: Li Wang <liwang@redhat.com>
Date: Wed, 2 Feb 2022 10:59:20 +0800
Message-ID: <CAEemH2erJ_Gb0hMQ5Z=OTkH_bP1wGcJ1_+oQsWR6tLhWUVPQeQ@mail.gmail.com>
To: xuyang <xuyang_jy_0410@163.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=liwan@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,HTML_MESSAGE,SPF_HELO_NONE,SPF_PASS,
 T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [RFC PATCH 1/1] lib: Print in summary also tests not run
 at all
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
Cc: "ltp@lists.linux.it" <ltp@lists.linux.it>
Content-Type: multipart/mixed; boundary="===============1876976794=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============1876976794==
Content-Type: multipart/alternative; boundary="000000000000252dc805d7003575"

--000000000000252dc805d7003575
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Jan 30, 2022 at 2:43 PM xuyang <xuyang_jy_0410@163.com> wrote:

> Yes=EF=BC=8Cbut it still be wrong if we use serval TPASS in sub test case=
.
>

We can simply avoid that by skipping tst_test->forks_child. But in this cas=
e
limited the scope of the "not-run" uses. TBH, I haven't come up with a
perfect
idea to satisfy all situations.

+               if (tst_test->tcnt && !tst_test->forks_child) {
+                       fprintf(stderr, "not-run  %d\n",  (tst_test->tcnt *
test_variants) -
+                                       results->passed - results->failed -
results->broken -
+                                       results->skipped -
results->warnings);
+               }

--=20
Regards,
Li Wang

--000000000000252dc805d7003575
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote"><div dir=3D"lt=
r" class=3D"gmail_attr">On Sun, Jan 30, 2022 at 2:43 PM xuyang &lt;<a href=
=3D"mailto:xuyang_jy_0410@163.com">xuyang_jy_0410@163.com</a>&gt; wrote:<br=
></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;=
border-left:1px solid rgb(204,204,204);padding-left:1ex">

   =20

<div>
<div style=3D"line-height:1.6;font-family:=E8=8B=B9=E6=96=B9,=E5=BE=AE=E8=
=BD=AF=E9=9B=85=E9=BB=91,&quot;sans-serif&quot;">Yes=EF=BC=8Cbut it still b=
e wrong if we use serval TPASS in sub test case.<br></div></div></blockquot=
e><div><br></div><div class=3D"gmail_default" style=3D"font-size:small">We =
can simply avoid that by skipping tst_test-&gt;forks_child. But in this cas=
e</div><div class=3D"gmail_default" style=3D"font-size:small">limited the s=
cope of the &quot;not-run&quot; uses. TBH, I haven&#39;t come up with a per=
fect</div><div class=3D"gmail_default" style=3D"font-size:small">idea to sa=
tisfy all situations.</div><div class=3D"gmail_default" style=3D"font-size:=
small"><br></div><div class=3D"gmail_default" style=3D"font-size:small">+ =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (tst_test-&gt;tcnt &amp=
;&amp; !tst_test-&gt;forks_child) {<br>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fprintf(stderr, &quot;not-run =
=C2=A0%d\n&quot;, =C2=A0(tst_test-&gt;tcnt * test_variants) -<br>+ =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 results-&gt;passed - r=
esults-&gt;failed - results-&gt;broken -<br>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 results-&gt;skipped - results-&gt;warnings)=
;<br>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }</div></div><div><=
br></div>-- <br><div dir=3D"ltr" class=3D"gmail_signature"><div dir=3D"ltr"=
><div>Regards,<br></div><div>Li Wang<br></div></div></div></div>

--000000000000252dc805d7003575--


--===============1876976794==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============1876976794==--

