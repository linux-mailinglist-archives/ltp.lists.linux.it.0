Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D9B5D6E66
	for <lists+linux-ltp@lfdr.de>; Tue, 15 Oct 2019 06:55:18 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id E10773C2210
	for <lists+linux-ltp@lfdr.de>; Tue, 15 Oct 2019 06:55:17 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 by picard.linux.it (Postfix) with ESMTP id 6B0DB3C0428
 for <ltp@lists.linux.it>; Tue, 15 Oct 2019 06:55:16 +0200 (CEST)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 by in-7.smtp.seeweb.it (Postfix) with ESMTP id 6499D200961
 for <ltp@lists.linux.it>; Tue, 15 Oct 2019 06:55:14 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1571115313;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=pCQOT5Cg8XaNnOjW4BomL6ngiJyNpYzUM9eNj+LwvUA=;
 b=EftcQtcQ4HO1TiLo2bkxmU1s+Ovl+wd82K+M7ORgW/MvojnpaQQnfcO0yvl7lTFuXCe4bB
 8oAFlXMPrq0yny/38CeqmS7u6Tf967aAgQr/7Z2XEEFioOtjNH5TYj7JmD79x1B2KEsCge
 14RX3yDnCnKCxnY5P1m6e+yS2b++Th0=
Received: from mail-ot1-f72.google.com (mail-ot1-f72.google.com
 [209.85.210.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-173-QHBL1GjhNdmWewQjX_elGA-1; Tue, 15 Oct 2019 00:55:10 -0400
Received: by mail-ot1-f72.google.com with SMTP id h13so8664706otk.20
 for <ltp@lists.linux.it>; Mon, 14 Oct 2019 21:55:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=gRm4lMELu8F1k3Z0Y/1GblGGnCoPTX32SvXrkEOwlvc=;
 b=gDw07bouI29hqXIQoiSm08LFQo1Z2SRD+U3xAIGixF35xXFeYmJHUFnlDeEJWQnX9j
 LHeiC1WokrUVw970NQ985x1ke6aCoA8VZ4nEwI7ARiOl9yocb8ZasHEV5NiCNHbxirxT
 W+m6E9z540TuiAqQZIG7/vWx801sreyOeSjkHtOzok/+VBjPCarUELQ3ldVaS9RSTIuc
 geMZm1EwwOQ+VLpUzGXDpy99Ajo1dN80oELW1w4qA8VO/KIZaP4TEwx8qajyjQYPWgtf
 zuQS8JGMIhxz/oBlnqwDS/mvqOCtvftsEZXENsOnKJsp1tM5pMrSDVTBAhgiOGp4Cnwz
 H5GQ==
X-Gm-Message-State: APjAAAWnqdinEjYGKIY2GlHfBvQkInqCkiYIDXFUfeCrQQlGNrLJQW0i
 MnL1jGCDWSogAHbfkVl3OeIgi4NWiZhTSAXCEEYFE6Ck7e1418pMJVeoBZaL7BagV5NpaavBxG7
 o1q6vO9e1WJADye3Qbl6FBPGe3IQ=
X-Received: by 2002:a9d:61cd:: with SMTP id h13mr17476100otk.264.1571115310059; 
 Mon, 14 Oct 2019 21:55:10 -0700 (PDT)
X-Google-Smtp-Source: APXvYqyc5/8XYFIzOoLwplE8CrTXy3rktFeuy98FR68Vam6Awtsj9AlL9L45pEvb9CLqDFLM1FLpnx2A6b/RCwsc8uU=
X-Received: by 2002:a9d:61cd:: with SMTP id h13mr17476073otk.264.1571115309675; 
 Mon, 14 Oct 2019 21:55:09 -0700 (PDT)
MIME-Version: 1.0
References: <20191014112522.24548-1-chrubis@suse.cz>
 <20191014112522.24548-3-chrubis@suse.cz>
In-Reply-To: <20191014112522.24548-3-chrubis@suse.cz>
From: Li Wang <liwang@redhat.com>
Date: Tue, 15 Oct 2019 12:54:58 +0800
Message-ID: <CAEemH2f0ZXYEwsvcxWhdE33EzLJKr=EeeG91Uq_8rBZOsx57NQ@mail.gmail.com>
To: Cyril Hrubis <chrubis@suse.cz>
X-MC-Unique: QHBL1GjhNdmWewQjX_elGA-1
X-Mimecast-Spam-Score: 0
X-Virus-Scanned: clamav-milter 0.99.2 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,HTML_MESSAGE,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 2/2] testcases/kernel: Add linux git and CVE tags
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
Content-Type: multipart/mixed; boundary="===============0006788705=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============0006788705==
Content-Type: multipart/alternative; boundary="000000000000ef78050594ebc9d8"

--000000000000ef78050594ebc9d8
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Cyril Hrubis <chrubis@suse.cz> wrote:


>
> diff --git a/testcases/cve/cve-2014-0196.c b/testcases/cve/cve-2014-0196.=
c
> index 6997fffe4..012cbb7cd 100644
> --- a/testcases/cve/cve-2014-0196.c
> +++ b/testcases/cve/cve-2014-0196.c
> @@ -141,4 +141,9 @@ static struct tst_test test =3D {
>         .setup =3D setup,
>         .cleanup =3D cleanup,
>         .test_all =3D run,
> +       .tags =3D (const struct tst_tag[]) {
> +               {"linux-git", "4291086b1f08"},
> +               {"CVE", "2014-0196"},
> +               {}
>

Some of the tests use {NULL, NULL} to terminate tag array but some not,
maybe we need to keep consistent in usage.

--=20
Regards,
Li Wang

--000000000000ef78050594ebc9d8
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small">Cyril Hrubis &lt;<a href=3D"mailto:chrubis@suse.cz" target=3D=
"_blank">chrubis@suse.cz</a>&gt; wrote:<br></div></div><div class=3D"gmail_=
quote"><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0=
px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
diff --git a/testcases/cve/cve-2014-0196.c b/testcases/cve/cve-2014-0196.c<=
br>
index 6997fffe4..012cbb7cd 100644<br>
--- a/testcases/cve/cve-2014-0196.c<br>
+++ b/testcases/cve/cve-2014-0196.c<br>
@@ -141,4 +141,9 @@ static struct tst_test test =3D {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 .setup =3D setup,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 .cleanup =3D cleanup,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 .test_all =3D run,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0.tags =3D (const struct tst_tag[]) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0{&quot;linux-git&qu=
ot;, &quot;4291086b1f08&quot;},<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0{&quot;CVE&quot;, &=
quot;2014-0196&quot;},<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0{}<br></blockquote>=
<div><br></div><div><div class=3D"gmail_default" style=3D"">Some of the tes=
ts use {NULL, NULL} to terminate tag array but some not, maybe we need to=
=C2=A0keep consistent in usage.</div></div></div><div><br></div>-- <br><div=
 dir=3D"ltr"><div dir=3D"ltr"><div>Regards,<br></div><div>Li Wang<br></div>=
</div></div></div>

--000000000000ef78050594ebc9d8--


--===============0006788705==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============0006788705==--

