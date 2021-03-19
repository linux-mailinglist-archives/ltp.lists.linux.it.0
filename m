Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id B345B341D25
	for <lists+linux-ltp@lfdr.de>; Fri, 19 Mar 2021 13:43:39 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 712633C5FB4
	for <lists+linux-ltp@lfdr.de>; Fri, 19 Mar 2021 13:43:39 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 by picard.linux.it (Postfix) with ESMTP id 29B473C2C33
 for <ltp@lists.linux.it>; Fri, 19 Mar 2021 13:43:37 +0100 (CET)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by in-3.smtp.seeweb.it (Postfix) with ESMTP id 781431A0146D
 for <ltp@lists.linux.it>; Fri, 19 Mar 2021 13:43:36 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616157815;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=NxNyQ8i9YCJoVEYkIXCHJdT8d2TBPSzuvhydJy9LzeM=;
 b=E6VB4srHk/QKvPdCvGRa+zYwZRk4n+tmWuLAvjqjhyZUGW859rbT5kyyI6SDFCz5Z1NP4p
 SlxUhXF65lugD3MkAQsEH3g5D5n1IuKL8otckJQjyPgO2DTKhm4PQZC0mamdj7joIUzQzF
 NHDS46mX+OdGCf6OcPEjY6aqzEPkgkU=
Received: from mail-yb1-f197.google.com (mail-yb1-f197.google.com
 [209.85.219.197]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-483-9wq6QC-lOrmpBNOvEim_bQ-1; Fri, 19 Mar 2021 08:43:32 -0400
X-MC-Unique: 9wq6QC-lOrmpBNOvEim_bQ-1
Received: by mail-yb1-f197.google.com with SMTP id v124so11667456ybc.15
 for <ltp@lists.linux.it>; Fri, 19 Mar 2021 05:43:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=NxNyQ8i9YCJoVEYkIXCHJdT8d2TBPSzuvhydJy9LzeM=;
 b=OLU1KdZ8wZaQVNZkApn+247HSOk2E1doP5AXos5dH0Zjh185EAfA3shihkmi6lJ7SK
 cAVzXIVjb3iglIe2nkUuf54pa71iZGedw1/1ouiIH0JilG0T/WbBQ5JnFi658B3wWGRM
 l94VPDoc1xBnEBm+JJZCkhnBrp2YK4potjZ7iktDEUSoU5vtNf3qM/YcxtpklF5XIcWh
 GTLYCNi5UOdtnh7JYnC8MkD+k1TC07kIQaWzXxiZ++L+HCRd7fWpZo5nB98kkD2rE+Si
 YZvz2OwgdX0X5dzYDbmUM2vmDj2h8fb3ZEc9hj3/Rt0V76MA/w0YUgV2eEVt9yHBCYfQ
 lPPw==
X-Gm-Message-State: AOAM531OgA5N7OqqID5b/U88chCTqb6xQc/T606RCyajaMt/ZmfaSMgA
 sPA4/vhs7nClAhJqL7v0Qy6FZUHPnTW1jb38HnBnR/OH8av7s66cOo9Ds7d0bKnUlQ6FGTL+Gyq
 dysUR1LNXiNa4F7AIThPPWwO9H2k=
X-Received: by 2002:a25:874c:: with SMTP id e12mr5994578ybn.403.1616157811674; 
 Fri, 19 Mar 2021 05:43:31 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyy4vJjFKsgx3kQ9rr9xH5e7mb3aw44jEJoejNAMmrL3UTITbxXYIPE5LwMAbZlNMuGvBEHC8qrNl8gEyc94+Y=
X-Received: by 2002:a25:874c:: with SMTP id e12mr5994546ybn.403.1616157811423; 
 Fri, 19 Mar 2021 05:43:31 -0700 (PDT)
MIME-Version: 1.0
References: <20210318181641.2062-1-pvorel@suse.cz>
 <20210318181641.2062-3-pvorel@suse.cz>
 <60546E24.9010601@fujitsu.com> <YFRvZ89AykS5ldJj@yuki.lan>
 <YFSGZ9YKo/JUHMtm@pevik> <YFSVbmQ7T0kPnlXs@yuki.lan>
In-Reply-To: <YFSVbmQ7T0kPnlXs@yuki.lan>
From: Li Wang <liwang@redhat.com>
Date: Fri, 19 Mar 2021 20:43:19 +0800
Message-ID: <CAEemH2cz20Xd_c-3WZW2sNY5fXXhXMg8XQjVee=nVUi5-hw4kg@mail.gmail.com>
To: Cyril Hrubis <chrubis@suse.cz>, alice.z.wang@runbox.com
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
Cc: "yangx.jy@fujitsu.com" <yangx.jy@fujitsu.com>,
 "ltp@lists.linux.it" <ltp@lists.linux.it>
Content-Type: multipart/mixed; boundary="===============1884451034=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============1884451034==
Content-Type: multipart/alternative; boundary="0000000000004053ed05bde31062"

--0000000000004053ed05bde31062
Content-Type: text/plain; charset="UTF-8"

+Cc Alice Wang, who is a volunteer of the GNU lawyer team. I met her
several years ago in Beijing, not sure if I remember the email-address
correctly, so I just CC her in case she can read this and maybe help some
side.

Cyril Hrubis <chrubis@suse.cz> wrote:

Hi!
> > Maybe:
> >
> > * license: the default license for new tests is GPL v2 or later, use
> >   GPL-2.0-or-later; the licence for test (e.g. GPL-2.0) should not
> change unless
> >   it's completely rewritten
> > * old copyrights should be kept unless test is completely rewritten
> >
> > BTW this is important, specially for DMCA from Wipro. Cyril, can you
> point some
> > test from Wipro which could be considered as "completely rewritten"?
>
> This is tricky topic and I'm not a lawyer, so I guess that we better
> consult one.
>
> I would expect that if you remove all the previous test code and start
> from a scratch the old copyrights would not apply, but again I'm not
> lawyer and I do not have in depth understanding of the copyright laws
> and treaties.
>
> --
> Cyril Hrubis
> chrubis@suse.cz
>
>

-- 
Regards,
Li Wang

--0000000000004053ed05bde31062
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small">+Cc Alice Wang, who is a volunteer=C2=A0of the GNU lawyer tea=
m. I met her several years ago in Beijing, not sure if I remember the email=
-address correctly, so I just CC her in case she can read this and maybe he=
lp some side.</div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" cl=
ass=3D"gmail_attr">Cyril Hrubis &lt;<a href=3D"mailto:chrubis@suse.cz">chru=
bis@suse.cz</a>&gt; wrote:<br></div><div dir=3D"ltr" class=3D"gmail_attr"><=
br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8e=
x;border-left:1px solid rgb(204,204,204);padding-left:1ex">Hi!<span class=
=3D"gmail_default" style=3D"font-size:small"></span><br>
&gt; Maybe:<br>
&gt; <br>
&gt; * license: the default license for new tests is GPL v2 or later, use<b=
r>
&gt;=C2=A0 =C2=A0GPL-2.0-or-later; the licence for test (e.g. GPL-2.0) shou=
ld not change unless<br>
&gt;=C2=A0 =C2=A0it&#39;s completely rewritten<br>
&gt; * old copyrights should be kept unless test is completely rewritten<br=
>
&gt; <br>
&gt; BTW this is important, specially for DMCA from Wipro. Cyril, can you p=
oint some<br>
&gt; test from Wipro which could be considered as &quot;completely rewritte=
n&quot;?<br>
<br>
This is tricky topic and I&#39;m not a lawyer, so I guess that we better<br=
>
consult one.<br>
<br>
I would expect that if you remove all the previous test code and start<br>
from a scratch the old copyrights would not apply, but again I&#39;m not<br=
>
lawyer and I do not have in depth understanding of the copyright laws<br>
and treaties.<br>
<br>
-- <br>
Cyril Hrubis<br>
<a href=3D"mailto:chrubis@suse.cz" target=3D"_blank">chrubis@suse.cz</a><br=
>
<br>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr"=
 class=3D"gmail_signature"><div dir=3D"ltr"><div>Regards,<br></div><div>Li =
Wang<br></div></div></div></div>

--0000000000004053ed05bde31062--


--===============1884451034==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============1884451034==--

