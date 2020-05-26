Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id E92191E18B3
	for <lists+linux-ltp@lfdr.de>; Tue, 26 May 2020 03:13:25 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id B0BA53C3336
	for <lists+linux-ltp@lfdr.de>; Tue, 26 May 2020 03:13:24 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 by picard.linux.it (Postfix) with ESMTP id 72B003C1482
 for <ltp@lists.linux.it>; Tue, 26 May 2020 03:13:20 +0200 (CEST)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 by in-5.smtp.seeweb.it (Postfix) with ESMTP id 3B6C960076F
 for <ltp@lists.linux.it>; Tue, 26 May 2020 03:12:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1590455597;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=CL7h6Vor2u/YU1v7brIy7rWmmlJwyRVclCBKlULnyQY=;
 b=OIksjH4esTAhuMAihkAZQ0n1mOhX4/b7NuoXN8zUue6pGAv4CdjMtzQ3/Fi/+BWDrVAEvH
 zG97yqhbj7C/8s98sG85M7jf5svaH7rY404GN/vOIsU/IV/q7SDP/K7NKXGsjFw6uzgPvM
 7GehiOFwOvThmvPVUh1kAKhVUhvnXvo=
Received: from mail-lf1-f71.google.com (mail-lf1-f71.google.com
 [209.85.167.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-376-DDYvtjdtPWeAW2JQpJBp2g-1; Mon, 25 May 2020 21:13:15 -0400
X-MC-Unique: DDYvtjdtPWeAW2JQpJBp2g-1
Received: by mail-lf1-f71.google.com with SMTP id x27so3791431lfq.14
 for <ltp@lists.linux.it>; Mon, 25 May 2020 18:13:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=CL7h6Vor2u/YU1v7brIy7rWmmlJwyRVclCBKlULnyQY=;
 b=s8rhNvtRfBmcLofJMC8FpKVp0kwHuWgAJVugMuUA5cS2lzvDGuMguh5fix0RSmcgPG
 tx9oiRSx17mfIlQnyLeBKRdJdx2vcsq7NIK0KCnVkAQ7wQ+mxQDbVf9duycPrjAjPLFk
 wu+BM2WkPP2cQvhaD68tV5DwQwOB/soF87co0n8daPoavmGZyZKaaH+6BSJ3fg9exvmQ
 JpfYgddypbPJ05hm2Ld/qCNytWwkqZaF5pV6ygfQUc93q2rtwF+V3dyXcpB2ppIoC4Dg
 jlgFy3U1qs/jGKqMhvPujtXT88Q7mq/G0oTzXaj2mshiSxlBYQwKhaJWC/HAPaMuRvKZ
 MiGg==
X-Gm-Message-State: AOAM533JuY84+KL318/VUqLKat6OOdPb1t3rSMUZ08FWOkQobKLdTm/o
 NYPhLiRYJ4cVxzmLuybGsu5tYAAgCeqlRzHYfteh/LOobpBuTh6ahE90MHpntJVIV9WcHqcPqW8
 mWfJUAdI6tSuyBD1KJaOAq0FAlPE=
X-Received: by 2002:a19:23d2:: with SMTP id j201mr15692675lfj.83.1590455593586; 
 Mon, 25 May 2020 18:13:13 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz6wlogbh77RDPnxvItttmBGyu8II+58tYB6h0TECc9zDbukhhK+ECGGSKCL1E9eqvzxq0GXZ/jxnuQKfkBT0c=
X-Received: by 2002:a19:23d2:: with SMTP id j201mr15692669lfj.83.1590455593392; 
 Mon, 25 May 2020 18:13:13 -0700 (PDT)
MIME-Version: 1.0
References: <20200525105410.4328-1-liwang@redhat.com>
 <20200525190233.GA21052@dell5510>
In-Reply-To: <20200525190233.GA21052@dell5510>
From: Li Wang <liwang@redhat.com>
Date: Tue, 26 May 2020 09:13:01 +0800
Message-ID: <CAEemH2dx1FecjOvVKdewTd0PBjCsin=6RuG5esCP-0+Zp_ichw@mail.gmail.com>
To: Petr Vorel <pvorel@suse.cz>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,HTML_MESSAGE,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] hugemmap05: check if the reserving hpages as
 expected
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
Content-Type: multipart/mixed; boundary="===============2118454916=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============2118454916==
Content-Type: multipart/alternative; boundary="000000000000acf41405a682ccef"

--000000000000acf41405a682ccef
Content-Type: text/plain; charset="UTF-8"

On Tue, May 26, 2020 at 3:02 AM Petr Vorel <pvorel@suse.cz> wrote:

> Hi Li,
>
> > To get rid of TBROK on small box:
> >   hugemmap05.c:88: BROK: mmap((nil),201326592,3,1,6,0) failed: ENOMEM
> (12)
>
> > And, reduce the reserved testing huge pages to 2, it also works well.
>
> Reviewed-by: Petr Vorel <pvorel@suse.cz>
>

Thanks for your review.

>
> Nice speedup :)
> Maybe add some constant for size (2), as it's used on 3 places?
>

Good suggestion, I added a 'NR_HPAGES' definition and pushed.

-- 
Regards,
Li Wang

--000000000000acf41405a682ccef
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote"><div dir=3D"lt=
r" class=3D"gmail_attr">On Tue, May 26, 2020 at 3:02 AM Petr Vorel &lt;<a h=
ref=3D"mailto:pvorel@suse.cz">pvorel@suse.cz</a>&gt; wrote:<br></div><block=
quote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1=
px solid rgb(204,204,204);padding-left:1ex">Hi Li,<br>
<br>
&gt; To get rid of TBROK on small box:<br>
&gt;=C2=A0 =C2=A0hugemmap05.c:88: BROK: mmap((nil),201326592,3,1,6,0) faile=
d: ENOMEM (12)<br>
<br>
&gt; And, reduce the reserved testing huge pages to 2, it also works well.<=
br>
<br>
Reviewed-by: Petr Vorel &lt;<a href=3D"mailto:pvorel@suse.cz" target=3D"_bl=
ank">pvorel@suse.cz</a>&gt;<br></blockquote><div><br></div><div class=3D"gm=
ail_default" style=3D"font-size:small">Thanks for your review.</div><div cl=
ass=3D"gmail_default" style=3D"font-size:small"></div><blockquote class=3D"=
gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(20=
4,204,204);padding-left:1ex">
<br>
Nice speedup :)<br>
Maybe add some constant for size (2), as it&#39;s used on 3 places?<br></bl=
ockquote><div><br></div><div class=3D"gmail_default" style=3D"font-size:sma=
ll">Good suggestion, I added a &#39;NR_HPAGES&#39; definition and pushed.</=
div></div><div><br></div>-- <br><div dir=3D"ltr" class=3D"gmail_signature">=
<div dir=3D"ltr"><div>Regards,<br></div><div>Li Wang<br></div></div></div><=
/div>

--000000000000acf41405a682ccef--


--===============2118454916==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============2118454916==--

