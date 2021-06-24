Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FF9E3B2A7B
	for <lists+linux-ltp@lfdr.de>; Thu, 24 Jun 2021 10:37:23 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 00FFE3C6F39
	for <lists+linux-ltp@lfdr.de>; Thu, 24 Jun 2021 10:37:23 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 2C8693C2B9A
 for <ltp@lists.linux.it>; Thu, 24 Jun 2021 10:37:20 +0200 (CEST)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id EDE0B1401168
 for <ltp@lists.linux.it>; Thu, 24 Jun 2021 10:37:19 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1624523838;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Zn3s4++v/Q/uwnVi4tV0AiPPNQltyODaW9peM1fyUr4=;
 b=Gjf4OxzADnByNAm5fhggDxSck9d7v6XoG/sBab38vThX8RYvKXw3b1KR3CF3nDfD5qUHQy
 5wG9kIB5frCwucys1ckSzM/MB/uAZ2K1Lml+/Qpzn1xT+/HiGTWeiW3gq1H8274t6uX1C0
 mUURkbM1TX/6sMGdbJNOu+ZwqbK+hFY=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-169-cdCRvI4lObaI11Zo4ojR4Q-1; Thu, 24 Jun 2021 04:37:15 -0400
X-MC-Unique: cdCRvI4lObaI11Zo4ojR4Q-1
Received: by mail-qt1-f198.google.com with SMTP id
 c29-20020ac86e9d0000b0290247b267c8e4so5450509qtv.22
 for <ltp@lists.linux.it>; Thu, 24 Jun 2021 01:37:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Zn3s4++v/Q/uwnVi4tV0AiPPNQltyODaW9peM1fyUr4=;
 b=ebkp74m/sj8C0fPYdvEV9cb17rgJ/jP9yCslMH1ImPwyN48hJQEeSf+A5Sdm6Y/Xrk
 2+k35sOFWu1A8nFZpjGG2asM5/5OG1C7ZhYaIr9GRESsC2PzQipU9pXm6k2Nb+pwhZTo
 jMPC5rdgf4hGjuvzeXieu6l82jJx2coNKNdjzl1hYIy91dqqjzggjTL96flk3XpDAXIP
 ba2peawfJTnY2BV6XspZX5KnzJ24Ku3rJH/AIVF6AbB9TLjxXX/QOwhyUfrJbW3kxpk2
 iy+RHgpSr93kFd4hdRDQxTLsQqS9JzBWtrc9vwARFdWasXbbuu6Ys4ceOS+UJQS1xCPq
 SzAQ==
X-Gm-Message-State: AOAM5317A6DachVm8AlaQZTF+143Zfu+V/MgdFUXGilORm7LsN39xBKd
 Ktw/1N6YHj3j6RQIHSP81psYJUetrdPEd1gQ9ppqcZ5U2994NyVvq+CNMWO/Fpadoq85DODxbXq
 kE+tf8FJ3RBqOKR1ilHtA3kSCJ4o=
X-Received: by 2002:a25:ba87:: with SMTP id s7mr3320411ybg.97.1624523835523;
 Thu, 24 Jun 2021 01:37:15 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwMHP8kqQ/Fkg41AOTgVFRDIYhgJBAlUT4ow+cmZi2kJCRYZ6Dgt8CYypd/1knZQDD9kmj4k1iqMH3LqFYsMV8=
X-Received: by 2002:a25:ba87:: with SMTP id s7mr3320391ybg.97.1624523835200;
 Thu, 24 Jun 2021 01:37:15 -0700 (PDT)
MIME-Version: 1.0
References: <20210624081500.11715-1-aleksei.kodanev@bell-sw.com>
In-Reply-To: <20210624081500.11715-1-aleksei.kodanev@bell-sw.com>
From: Li Wang <liwang@redhat.com>
Date: Thu, 24 Jun 2021 16:37:02 +0800
Message-ID: <CAEemH2ca=ubrdg=EzjgcDBPBp-jVQ1r7dMSc9TH4KCrctSuN2g@mail.gmail.com>
To: Alexey Kodanev <aleksei.kodanev@bell-sw.com>
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
Subject: Re: [LTP] [PATCH 1/2] lib/tst_test: setup TCID earlier in do_setup()
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
Content-Type: multipart/mixed; boundary="===============2076285774=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============2076285774==
Content-Type: multipart/alternative; boundary="00000000000020687605c57eee6a"

--00000000000020687605c57eee6a
Content-Type: text/plain; charset="UTF-8"

Hi Alexey,

Good catch.

On Thu, Jun 24, 2021 at 4:15 PM Alexey Kodanev <aleksei.kodanev@bell-sw.com>
wrote:

> TCID can be NULL in tst_tmpdir() because it is set after do_setup():
>
>     tst_run_tcases()
>         do_setup()
>             ...
>             tid = get_tid();
>             ...
>             tst_tmpdir()  /* using TCID here */
>         TCID = tid;
>
> Signed-off-by: Alexey Kodanev <aleksei.kodanev@bell-sw.com>
>

Reviewed-by: Li Wang <liwang@redhat.com>

-- 
Regards,
Li Wang

--00000000000020687605c57eee6a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small">Hi Alexey,</div><div class=3D"gmail_default" style=3D"font-si=
ze:small"><br></div><div class=3D"gmail_default" style=3D"font-size:small">=
Good catch.</div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" clas=
s=3D"gmail_attr">On Thu, Jun 24, 2021 at 4:15 PM Alexey Kodanev &lt;<a href=
=3D"mailto:aleksei.kodanev@bell-sw.com">aleksei.kodanev@bell-sw.com</a>&gt;=
 wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px =
0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">TCID can=
 be NULL in tst_tmpdir() because it is set after do_setup():<br>
<br>
=C2=A0 =C2=A0 tst_run_tcases()<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 do_setup()<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ...<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 tid =3D get_tid();<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ...<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 tst_tmpdir()=C2=A0 /* using TCID =
here */<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 TCID =3D tid;<br>
<br>
Signed-off-by: Alexey Kodanev &lt;<a href=3D"mailto:aleksei.kodanev@bell-sw=
.com" target=3D"_blank">aleksei.kodanev@bell-sw.com</a>&gt;<br></blockquote=
><div>=C2=A0</div><div><span class=3D"gmail_default" style=3D"font-size:sma=
ll">Reviewed-by: Li Wang &lt;<a href=3D"mailto:liwang@redhat.com">liwang@re=
dhat.com</a>&gt;</span></div></div><div><br></div>-- <br><div dir=3D"ltr" c=
lass=3D"gmail_signature"><div dir=3D"ltr"><div>Regards,<br></div><div>Li Wa=
ng<br></div></div></div></div>

--00000000000020687605c57eee6a--


--===============2076285774==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============2076285774==--

