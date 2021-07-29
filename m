Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id D02443D9F3C
	for <lists+linux-ltp@lfdr.de>; Thu, 29 Jul 2021 10:12:55 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 2683F3C8F6E
	for <lists+linux-ltp@lfdr.de>; Thu, 29 Jul 2021 10:12:55 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 5AF873C5AAD
 for <ltp@lists.linux.it>; Thu, 29 Jul 2021 10:12:50 +0200 (CEST)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 5E740600858
 for <ltp@lists.linux.it>; Thu, 29 Jul 2021 10:12:50 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1627546369;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=N2V1J6wjRAWVZ5u4y19OmvFqag1S/aQDA5rzH8onaz4=;
 b=bAAXDwEdcC3CVm4LGu47Zkb4bVUn3jK//21XFPB9sA+emhX2k2dx5aRK5ONf8ZNhQmAv4t
 IB8cyZlt7BHXLMdN5/E414a/nX5uLP3cBc+7z1ZyMyfL74Oudur64E4RS34SbTwkKdcGFl
 7/4NUVFPP0JIWXoplehHCQSyJZO6nGQ=
Received: from mail-yb1-f198.google.com (mail-yb1-f198.google.com
 [209.85.219.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-52--SO9UItZPT2hKD4bOMMW1g-1; Thu, 29 Jul 2021 04:12:47 -0400
X-MC-Unique: -SO9UItZPT2hKD4bOMMW1g-1
Received: by mail-yb1-f198.google.com with SMTP id
 b9-20020a5b07890000b0290558245b7eabso6021066ybq.10
 for <ltp@lists.linux.it>; Thu, 29 Jul 2021 01:12:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=N2V1J6wjRAWVZ5u4y19OmvFqag1S/aQDA5rzH8onaz4=;
 b=aO5L5OvRxpJ8OzyZLzfIbEW9QFgynDN3qlKb5T/HkCRt3oKnjoSa2vutUbs4qPRd4J
 Br1Let0jA2Q2m2C21fDEgpV+cd+YIha+x6u5xAWnHNZ8DGtu9gMLWFtlbnPoHsocigM5
 M9XPDaVnkE/kynAFGt5GPE7UMSP1+LT5Fwbk3Q8xR8qA8/zKAxdyzD6OVqlHu4i7ex3l
 zGICh5ZLJtt9Fh+my5irrAZ17C//eXcBy7hM9G721GumVKjfgB8lWy4X2QG2/iQjwMaw
 BurKZTtN2KeRFUa10M+/yGDgCM2MVZe5svbxtI8AtqhxVrS80LUsgsIh3YgGfYJTSISl
 ioCw==
X-Gm-Message-State: AOAM533jA0J5FNZhOXBvweCb+/NlTb0Ko0yiS92tf7itlCwwURDGQJSo
 42jIdebqBJWr/6rSmqcTlozT+MQqI9eYX3ffYaY+sG/3vrWVA3+hR6VS82YgMKKX06XoXyURwCc
 EYadHex2797A5/daW4+Btrix2RJE=
X-Received: by 2002:a25:9243:: with SMTP id e3mr4784088ybo.97.1627546366496;
 Thu, 29 Jul 2021 01:12:46 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJystNg1mlGOrIJRgPzLTWzLSRtyuarqPRbNdDgmm2630aBS0VJKMETLWZr/0D2fwRfk1cxO2b8T/Ks9800qZFg=
X-Received: by 2002:a25:9243:: with SMTP id e3mr4784071ybo.97.1627546366293;
 Thu, 29 Jul 2021 01:12:46 -0700 (PDT)
MIME-Version: 1.0
References: <3d693985aafc13fba1cd7c4fa807bbbddd015c7b.1627303875.git.jstancek@redhat.com>
In-Reply-To: <3d693985aafc13fba1cd7c4fa807bbbddd015c7b.1627303875.git.jstancek@redhat.com>
From: Li Wang <liwang@redhat.com>
Date: Thu, 29 Jul 2021 16:12:34 +0800
Message-ID: <CAEemH2eFpEzzPAW3CLN=68sxzKzjVZrhuExTBUdHUeKFhnfPiA@mail.gmail.com>
To: Jan Stancek <jstancek@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=liwan@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,HTML_MESSAGE,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] mbind01: accept MPOL_LOCAL when passing empty set
 for MPOL_PREFERRED
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
Content-Type: multipart/mixed; boundary="===============1820465306=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============1820465306==
Content-Type: multipart/alternative; boundary="00000000000004cc5405c83eab3c"

--00000000000004cc5405c83eab3c
Content-Type: text/plain; charset="UTF-8"

>  static void test_default(unsigned int i, char *p)
>  {
>         struct test_case *tc = &tcase[i];
> @@ -183,7 +196,10 @@ static void do_test(unsigned int i)
>                         tst_res(TFAIL | TTERRNO, "get_mempolicy failed");
>                         return;
>                 }
> -               if (tc->policy != policy) {
> +
> +               if (tc->check_policy)
> +                       tc->check_policy(policy);
> +               else if (tc->policy != policy) {
>                         tst_res(TFAIL, "Wrong policy: %d, expected: %d",
>                                 tc->policy, policy);
>

Seems the error print is reverse, which should be corrected as:

                        tst_res(TFAIL, "Wrong policy: %d, expected: %d",
-                               tc->policy, policy);
+                               policy, tc->policy);



-- 
Regards,
Li Wang

--00000000000004cc5405c83eab3c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_quote"><div>=C2=A0</div><blockquote cl=
ass=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid=
 rgb(204,204,204);padding-left:1ex">
=C2=A0static void test_default(unsigned int i, char *p)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 struct test_case *tc =3D &amp;tcase[i];<br>
@@ -183,7 +196,10 @@ static void do_test(unsigned int i)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 tst_res(TFAIL | TTERRNO, &quot;get_mempolicy failed&quot;);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 return;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (tc-&gt;policy !=
=3D policy) {<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (tc-&gt;check_po=
licy)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0tc-&gt;check_policy(policy);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0else if (tc-&gt;pol=
icy !=3D policy) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 tst_res(TFAIL, &quot;Wrong policy: %d, expected: %d&quot;,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 tc-&gt;policy, policy);<br></blockqu=
ote><div><br></div><div class=3D"gmail_default" style=3D"font-size:small">S=
eems the error print is reverse, which should be corrected as:</div><div cl=
ass=3D"gmail_default" style=3D"font-size:small"><br></div><div class=3D"gma=
il_default" style=3D"font-size:small">=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 tst_res(TFAIL, &quot;Wrong=
 policy: %d, expected: %d&quot;,<br>- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 tc-&g=
t;policy, policy);<br>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 policy, tc-&gt;poli=
cy);<br></div><div class=3D"gmail_default" style=3D"font-size:small"><br></=
div></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr" class=3D=
"gmail_signature"><div dir=3D"ltr"><div>Regards,<br></div><div>Li Wang<br><=
/div></div></div></div>

--00000000000004cc5405c83eab3c--


--===============1820465306==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============1820465306==--

