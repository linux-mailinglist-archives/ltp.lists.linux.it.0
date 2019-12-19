Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id DEDBE125D69
	for <lists+linux-ltp@lfdr.de>; Thu, 19 Dec 2019 10:15:23 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id A6E733C2215
	for <lists+linux-ltp@lfdr.de>; Thu, 19 Dec 2019 10:15:23 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 by picard.linux.it (Postfix) with ESMTP id 9D7BF3C149E
 for <ltp@lists.linux.it>; Thu, 19 Dec 2019 10:15:21 +0100 (CET)
Received: from us-smtp-delivery-1.mimecast.com
 (us-smtp-delivery-1.mimecast.com [205.139.110.120])
 by in-5.smtp.seeweb.it (Postfix) with ESMTP id D5BA3605635
 for <ltp@lists.linux.it>; Thu, 19 Dec 2019 10:15:20 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1576746919;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=VPEi1EYghYJ1o7G6wOd22uhVgVxAYgBh2EEOoVzf8bY=;
 b=UVuOKp23MW37Hi6KxtGBpX4Mhsxd41xeFZzd8uftJXq09Q0Z8i7iy8y3hD4TuoqwC5XjNm
 2WvjFZQ1Z2LsQtnwBHRtnRshETSVkn9bfpjWbErFrbDSQ7GnF//iJnap0dRVXsPqbF/ZFB
 5cNYjPlB39RGE8mBKB7uH0R/URcMLOA=
Received: from mail-ot1-f71.google.com (mail-ot1-f71.google.com
 [209.85.210.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-250-rM8w9Ds1MUGJtZl1i9i3zw-1; Thu, 19 Dec 2019 04:15:15 -0500
Received: by mail-ot1-f71.google.com with SMTP id 73so2605079otj.10
 for <ltp@lists.linux.it>; Thu, 19 Dec 2019 01:15:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=lOnX7AgKjxV0h/9jKKWtWJI5NFOblVOuumXEZiTiMF8=;
 b=LK5ib/NBamu5lhiFrQCUyofm3QlC+yjeRzSiF3t0VS0Tn7vjyPs+mkzS56VGngcvch
 p2lttPybAPGGXlBWUeSkyGMy1p5EiQ6PYayXZ0q2o4fu9C3EsYpPscvTVx4A01IYatwU
 79fr9a1e/BHZh7xk4v2L4AgBA72/Tc1a0ZTkIILauRTCPoMhAok4WbDqfH83Pm5H2mB5
 wtDC7SA5YPgLbmu2HPbNIUqHDZiYZd0aISaR/E1OYRI0bYMmwVlQ/ky2TJohBgjhlnfO
 Pu6VHIw+IY9TP9UwDuzPODdxRej4Nc565oUKvf6AV4Putx+B0lunkxH01gmkp/ai28Qv
 HgVw==
X-Gm-Message-State: APjAAAUf6MwPFMOIw1PgZtYJARPUToK94u4TxaJLG5tZrH7wqkywATtH
 wFoqgSvqYreDq6XlVzzGouBxSN3nAc06IFMZQc+EoFPWIEVopbM+3dtDUQxw3S7qyI3E4fd/T6M
 m3hJ5k0Dq85+EwqFqe/2foeI2Kqk=
X-Received: by 2002:a9d:3a49:: with SMTP id j67mr7819689otc.264.1576746912137; 
 Thu, 19 Dec 2019 01:15:12 -0800 (PST)
X-Google-Smtp-Source: APXvYqzQOdC9TTVWuVVnAnVlc3y153CNbe58xyzEB5YjP6dNLgn3TErtO9yZVhRTODR64kvY5J4RG92yodauRr4XsHU=
X-Received: by 2002:a9d:3a49:: with SMTP id j67mr7819667otc.264.1576746911899; 
 Thu, 19 Dec 2019 01:15:11 -0800 (PST)
MIME-Version: 1.0
References: <20191218082826.25083-1-liwang@redhat.com>
 <2104821569.17247635.1576661091375.JavaMail.zimbra@redhat.com>
 <CAFA6WYN1ssqCzCqvT=9=DLjZdQz8OnH7+YBi8VGo7XLRdNLyvg@mail.gmail.com>
 <CAEemH2eRhmozt5OiT6z-YBjJUBNaGZgQVQRh40hNpKcq2d4-aw@mail.gmail.com>
 <CAFA6WYOBbH8UbwrK1f3ZQjGuqHJqGZxhQ-N0w1mpBHz0bnPG1w@mail.gmail.com>
In-Reply-To: <CAFA6WYOBbH8UbwrK1f3ZQjGuqHJqGZxhQ-N0w1mpBHz0bnPG1w@mail.gmail.com>
From: Li Wang <liwang@redhat.com>
Date: Thu, 19 Dec 2019 17:15:00 +0800
Message-ID: <CAEemH2eXvZB9uCuZFsc2uMAt5k2F_gfgXCqch58juMsJn4Gr4w@mail.gmail.com>
To: Sumit Garg <sumit.garg@linaro.org>
X-MC-Unique: rM8w9Ds1MUGJtZl1i9i3zw-1
X-Mimecast-Spam-Score: 0
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,HTML_MESSAGE,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH RFC] sync_file_range02: remove the toplimit of
 write back
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
Cc: LTP List <ltp@lists.linux.it>, Caspar Zhang <caspar@linux.alibaba.com>
Content-Type: multipart/mixed; boundary="===============0074572344=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============0074572344==
Content-Type: multipart/alternative; boundary="00000000000095bd98059a0aff84"

--00000000000095bd98059a0aff84
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 19, 2019 at 4:52 PM Sumit Garg <sumit.garg@linaro.org> wrote:

> ...
> >> To avoid similar scenarios, I suggested to add a "sync()" call just
> >> prior to test here [1]. And I couldn't reproduce the failure in
> >> 1000-times run with 4.19 kernel.
> >
> >
> > Yes, that makes sense to me.
> >
>
> Would you mind to give it a try and check if you could reproduce the
> failure?
>

Actually, I haven't had one time to reproduce it. This failure was reported
by CI jobs and very low frequency occurred. The fix is based on a
discussion with FS developer analysis.

But I would have a try with this patch(+ sync()).

--=20
Regards,
Li Wang

--00000000000095bd98059a0aff84
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote"><div dir=3D"lt=
r" class=3D"gmail_attr">On Thu, Dec 19, 2019 at 4:52 PM Sumit Garg &lt;<a h=
ref=3D"mailto:sumit.garg@linaro.org">sumit.garg@linaro.org</a>&gt; wrote:<s=
pan class=3D"gmail_default" style=3D"font-size:small"></span></div><blockqu=
ote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px=
 solid rgb(204,204,204);padding-left:1ex"><span class=3D"gmail_default" sty=
le=3D"font-size:small">...</span><br>
&gt;&gt; To avoid similar scenarios, I suggested to add a &quot;sync()&quot=
; call just<br>
&gt;&gt; prior to test here [1]. And I couldn&#39;t reproduce the failure i=
n<br>
&gt;&gt; 1000-times run with 4.19 kernel.<br>
&gt;<br>
&gt;<br>
&gt; Yes, that makes sense to me.<br>
&gt;<br>
<br>
Would you mind to give it a try and check if you could reproduce the failur=
e?<br></blockquote><div><br></div><div><div class=3D"gmail_default" style=
=3D"font-size:small">Actually, I haven&#39;t had one time to reproduce it. =
This failure was reported by CI jobs and very low frequency occurred. The f=
ix is based on a discussion=C2=A0with FS developer analysis.</div><div clas=
s=3D"gmail_default" style=3D"font-size:small"><br></div><div class=3D"gmail=
_default" style=3D"font-size:small">But I would have a try with this patch(=
+ sync()).</div></div></div><div><br></div>-- <br><div dir=3D"ltr" class=3D=
"gmail_signature"><div dir=3D"ltr"><div>Regards,<br></div><div>Li Wang<br><=
/div></div></div></div>

--00000000000095bd98059a0aff84--


--===============0074572344==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============0074572344==--

