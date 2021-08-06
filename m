Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F1523E286F
	for <lists+linux-ltp@lfdr.de>; Fri,  6 Aug 2021 12:18:38 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id D25D43C7B0D
	for <lists+linux-ltp@lfdr.de>; Fri,  6 Aug 2021 12:18:37 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 428593C1883
 for <ltp@lists.linux.it>; Fri,  6 Aug 2021 12:18:35 +0200 (CEST)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 494171A01477
 for <ltp@lists.linux.it>; Fri,  6 Aug 2021 12:18:34 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1628245113;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=qMXEEf7OaUDrWvlzEhkdu70eJRlyEaSeq8m80IMZ4+o=;
 b=fVQ8ZlOZ464FAUfh65B7Gn2f+YN3Ra23enFV0x+iJNyIxNVN+1mIlWUsIuIMFwywd+IsgP
 SOTW/cQ+p1CnXaG6JpH2KixcQdpuFB+prDomQl8lpAbWN8eouUj3ugVrQymVWfZq0JQw3u
 jzD1vbgd08GWaSm9NkpAFTCNUJAMucQ=
Received: from mail-yb1-f197.google.com (mail-yb1-f197.google.com
 [209.85.219.197]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-536-vb2x_bf7OxqpdSYhnJiwEg-1; Fri, 06 Aug 2021 06:18:31 -0400
X-MC-Unique: vb2x_bf7OxqpdSYhnJiwEg-1
Received: by mail-yb1-f197.google.com with SMTP id
 i32-20020a25b2200000b02904ed415d9d84so9053482ybj.0
 for <ltp@lists.linux.it>; Fri, 06 Aug 2021 03:18:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=qMXEEf7OaUDrWvlzEhkdu70eJRlyEaSeq8m80IMZ4+o=;
 b=sYBNOgJ0f7inpljpJf2mFn8PsxB57jP5lANfxHIjTIqUIEXDeEkgRKGKnHgkJbY4de
 2w3FVm/ayVLejw0jHJt6DetlNEW/CHn9wLvk8+9llivmw1aBu4bU+e7+ATGYnkdtnI5d
 v58b9dG0p0Afgb39JCEt0D/S1xcyee61Bc99jy69tJc8BYdTX/Ja2LPKtGwea2S614rC
 kbI0ShT0ohkDtdyk7UQ0NHQr06IeHV7Wt2N1nL678Xu+Riete68DBxa4wXFsYwC5ImSi
 TiwfPkC0xT7GMa4oM4UsHwUvQl6ZMBzvPclL1EmwEr0CqCPPJoO53bO91E+wB/1eBe/C
 te1Q==
X-Gm-Message-State: AOAM530CBkLozxHVBFX4uWa20A5hU6eY4sSzcqAvimRmOulvUMVALZJz
 qSTpCSpvvzxCNM6+BpWPUs6EszF6w9PVlYwHXQY5UwSSpQeH9DumNHMsdLa9iNi1TMzTGiemN0D
 rwCEz75nQaBjLw588ytpgKgfkYOI=
X-Received: by 2002:a25:1455:: with SMTP id 82mr11966716ybu.403.1628245110655; 
 Fri, 06 Aug 2021 03:18:30 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwYBJnbKC8W3mJ3USE6v2Z/hxQ/m+5s82brKAHlb6kA5wPP3Wyu7mFsuxgFd12y9FDpLQGNF+N5XBZ9JT2AQVk=
X-Received: by 2002:a25:1455:: with SMTP id 82mr11966701ybu.403.1628245110464; 
 Fri, 06 Aug 2021 03:18:30 -0700 (PDT)
MIME-Version: 1.0
References: <20210806025659.1962902-1-liwang@redhat.com>
 <YQzLUUKbLcoJjRVb@pevik> <YQzOxg35JjpDOj7X@pevik>
 <CAEemH2cNk-L1kRRHy=vvLVjcEm0HPQXaz8fJR00M1TyzoJAynw@mail.gmail.com>
 <YQ0C1givEZ8/H7hN@pevik>
In-Reply-To: <YQ0C1givEZ8/H7hN@pevik>
From: Li Wang <liwang@redhat.com>
Date: Fri, 6 Aug 2021 18:18:18 +0800
Message-ID: <CAEemH2eCbTeTziGetR-mBRP9rB=0S2CvZNuDv-3DehksKUyu8A@mail.gmail.com>
To: Petr Vorel <pvorel@suse.cz>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=liwan@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,HTML_MESSAGE,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [COMMITTED] setsockopt08: includes netinet/in.h
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
Cc: LTP List <ltp@lists.linux.it>, Richard Palethorpe <rpalethorpe@suse.com>
Content-Type: multipart/mixed; boundary="===============1144272429=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============1144272429==
Content-Type: multipart/alternative; boundary="0000000000006abb0805c8e15b22"

--0000000000006abb0805c8e15b22
Content-Type: text/plain; charset="UTF-8"

> > The conflict happened early in tst_test.h and I guess some header files
> > between line#14 to line#44 probably involves <linux/if.h>, but I'm not
> sure
> > which one is the culprit.
> Interesting, really something in in tst_test.h with combination of
> lapi/ip_tables.h. This combination is only in 2 tests, setsockopt0{3,8}.c,
> setsockopt03.c already had <netinet/in.h>.
>

I eventually caught that "tst_capability.h" is the key point.
To includes <netinet/in.h> before that can avoid the conflict.

But still not sure how it made things broken (i.e. where includes
 <linux/if.h>).


> > If we simply put the <netinet/in.h> at the top of tst_test.h, the
> > conflict disappears
> > as well.
> > See experiment commit:
> >
> https://github.com/wangli5665/ltp/commit/0155df479811d9a51f30e09accb330238607f73d
>
> I'd be for adding it there, with comment why it's there. We can prevent
> problems
> with failing another test in the future. (+ remove it from both tests).
>

I'm OK with this fix.

@Cyril, @Richard, what do you think? any other thoughts?

-- 
Regards,
Li Wang

--0000000000006abb0805c8e15b22
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_quote"><div>=C2=A0</div><blockquote cl=
ass=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid=
 rgb(204,204,204);padding-left:1ex">
&gt; The conflict happened early in tst_test.h and I guess some header file=
s<br>
&gt; between line#14 to line#44 probably involves &lt;linux/if.h&gt;, but I=
&#39;m not sure<br>
&gt; which one is the culprit.<br>
Interesting, really something in in tst_test.h with combination of<br>
lapi/ip_tables.h. This combination is only in 2 tests, setsockopt0{3,8}.c,<=
br>
setsockopt03.c already had &lt;netinet/in.h&gt;.<br></blockquote><div><br><=
/div>I eventually <span class=3D"gmail_default" style=3D"font-size:small">c=
aught</span><span class=3D"gmail_default" style=3D"font-size:small"> that</=
span> &quot;tst_capability.h&quot; is the <span class=3D"gmail_default" sty=
le=3D"font-size:small">key point.</span></div><div class=3D"gmail_quote"><s=
pan class=3D"gmail_default">To includes=C2=A0</span>&lt;netinet/in.h&gt;<sp=
an class=3D"gmail_default" style=3D"font-size:small"> before that can avoid=
 the conflict.</span></div><div class=3D"gmail_quote"><span class=3D"gmail_=
default" style=3D"font-size:small"><br></span></div><div class=3D"gmail_quo=
te"><span class=3D"gmail_default">But still not sure how it made things bro=
ken (i.e. where includes=C2=A0</span>=C2=A0&lt;linux/if.h&gt;<span class=3D=
"gmail_default" style=3D"font-size:small">)</span>.</div><div class=3D"gmai=
l_quote"><br></div><div class=3D"gmail_quote"><div class=3D"gmail_default" =
style=3D"font-size:small"></div><blockquote class=3D"gmail_quote" style=3D"=
margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-lef=
t:1ex">
<br>
&gt; If we simply put the &lt;netinet/in.h&gt; at the top of tst_test.h, th=
e<br>
&gt; conflict disappears<br>
&gt; as well.<br>
&gt; See experiment commit:<br>
&gt; <a href=3D"https://github.com/wangli5665/ltp/commit/0155df479811d9a51f=
30e09accb330238607f73d" rel=3D"noreferrer" target=3D"_blank">https://github=
.com/wangli5665/ltp/commit/0155df479811d9a51f30e09accb330238607f73d</a><br>
<br>
I&#39;d be for adding it there, with comment why it&#39;s there. We can pre=
vent problems<br>
with failing another test in the future. (+ remove it from both tests).<br>=
</blockquote><div><br></div><div><div class=3D"gmail_default" style=3D"font=
-size:small">I&#39;m OK with this fix.</div><div class=3D"gmail_default" st=
yle=3D"font-size:small"><br></div><div class=3D"gmail_default" style=3D"fon=
t-size:small">@Cyril, @Richard, what do you think? any other thoughts?</div=
></div></div><div><br></div>-- <br><div dir=3D"ltr"><div dir=3D"ltr"><div>R=
egards,<br></div><div>Li Wang<br></div></div></div></div>

--0000000000006abb0805c8e15b22--


--===============1144272429==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============1144272429==--

