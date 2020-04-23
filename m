Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id AD6F51B58C4
	for <lists+linux-ltp@lfdr.de>; Thu, 23 Apr 2020 12:05:18 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 760383C2949
	for <lists+linux-ltp@lfdr.de>; Thu, 23 Apr 2020 12:05:18 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 by picard.linux.it (Postfix) with ESMTP id D1F0B3C2933
 for <ltp@lists.linux.it>; Thu, 23 Apr 2020 12:05:16 +0200 (CEST)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
 by in-2.smtp.seeweb.it (Postfix) with ESMTP id AB04460151A
 for <ltp@lists.linux.it>; Thu, 23 Apr 2020 12:05:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1587636314;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=fkgE4GU0IDdkw7Fhvy9Ku8qNjjIyPY4Kau7cxQzJtvc=;
 b=CJBu7AhVBNB6fgofTWh7TaFXmO2UEulXYWERALuYY1OWb/X+gnmvRpxqqcDC1s5aG7H0Ir
 joNq1uJ8Kfs2IgmhsFbo5wNg5ah52Ylfgj6aYhksW5OBAwprUeA438paxHmwySS5BXXKGx
 s3ILmPKooabEb4IVhFYdVgnzkD33paI=
Received: from mail-lf1-f69.google.com (mail-lf1-f69.google.com
 [209.85.167.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-497--BTSV3I9MZiER2OfMU6Jcg-1; Thu, 23 Apr 2020 06:05:11 -0400
X-MC-Unique: -BTSV3I9MZiER2OfMU6Jcg-1
Received: by mail-lf1-f69.google.com with SMTP id v6so2143802lfi.6
 for <ltp@lists.linux.it>; Thu, 23 Apr 2020 03:05:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=6ERGMKlocS/+tRy4Y8/m5TZ+nKhJ6OpRnyWMzpf+Iqw=;
 b=nSMKXSwyLcBuK2GTxqrPVuaSRsZ5ZE35b3yMF95qh0NykN0etub9JqQA5qhVqHJitB
 Ia3C2737iZc5Res402oPB2vMp7Y01XDG33DGg2ap7p30NwQaCAIyXd+NTyc70dKTDzvp
 3TCVOWq0VQtOenJQiyMua1Ogup79P9zE63rrsj3/amp4RGva2pq0FrlUg74f2OFovF6g
 zrvrIBWieZGvGKaPBhW8LXrD9QQEZ9OOT5uBagy4Nloj9TNgkDliCLtlMmhVyb85WrFe
 9/b+ICWWkNJAvosP0s4JNLyyS2fCBN+HkIZsSX8pSdLzPISKIL/ZQS3rR3TiuDoGtoPb
 YB7w==
X-Gm-Message-State: AGi0PuaTy8M3y4ZBJYnU4ZvgxmxqKwP7gFiDMs1LeiLFwe3r4MXIlD+F
 7B3fMSzLJ/bSGSXEzovXSrg9sS7bsxht/7Z0QN1lvQhW7fQc99oP/LswqY1JagnSlfgM0L9MvGE
 IPfQfSRTFCUTYtSKfhjZBVflpqd4=
X-Received: by 2002:a2e:9dcd:: with SMTP id x13mr1802834ljj.120.1587636309501; 
 Thu, 23 Apr 2020 03:05:09 -0700 (PDT)
X-Google-Smtp-Source: APiQypKYtR9/wiH1FI6l/8zB3zJ5xL8Wq3eMjSM1lgSxDMx6/u5ZZTqh+nqVaeOL/snkp8WlgXpchvRjGjS+Nc5qucg=
X-Received: by 2002:a2e:9dcd:: with SMTP id x13mr1802822ljj.120.1587636309262; 
 Thu, 23 Apr 2020 03:05:09 -0700 (PDT)
MIME-Version: 1.0
References: <1587552329-21738-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
 <1587552329-21738-3-git-send-email-xuyang2018.jy@cn.fujitsu.com>
 <CAEemH2ea_CtRyP9KtpJDjpEzobRyhrodiycDCAxhLbCjuOwhCQ@mail.gmail.com>
 <662aa817-04ff-e924-6880-7c23fa1cfe31@cn.fujitsu.com>
In-Reply-To: <662aa817-04ff-e924-6880-7c23fa1cfe31@cn.fujitsu.com>
From: Li Wang <liwang@redhat.com>
Date: Thu, 23 Apr 2020 18:04:57 +0800
Message-ID: <CAEemH2cF-kziNEHuN1GayTtzwdxFFzsu0wRGB85yJ=LaKS-XBw@mail.gmail.com>
To: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.99.2 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=1.2 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,HTML_IMAGE_ONLY_16,HTML_MESSAGE,SPF_HELO_NONE,SPF_PASS,
 T_REMOTE_IMAGE autolearn=disabled version=3.4.0
X-Spam-Level: *
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v4 3/3] syscalls/pipe2_03: Add new test for pipe2
 O_DIRECT flag
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
Content-Type: multipart/mixed; boundary="===============0888664791=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============0888664791==
Content-Type: multipart/alternative; boundary="0000000000003f1a8c05a3f262ba"

--0000000000003f1a8c05a3f262ba
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 23, 2020 at 4:45 PM Yang Xu <xuyang2018.jy@cn.fujitsu.com>
wrote:

> ...
> > I got a failure on the ppc64le platform(page size: 65536kB).
> >
> > # ./pipe2_03
> > tst_test.c:1246: INFO: Timeout per run is 0h 05m 00s
> > pipe_size =3D 1048576
> > PIPE_BUF =3D 4096
> > packet_num =3D 256
> > safe_macros.c:457: BROK: pipe2_03.c:58:
> > write(4,0x1001d2b8,18446744073709551615) failed: EAGAIN/EWOULDBLOCK (11=
)
> I think we should remove PIPE_BUF and use page_size  because we use a
> page to store data not a fixed size buffer in kernel. as below(also,
> man-pages[1] is need to update):
>

Emm, If PIPE_BUF doesn't work correctly, shouldn't this a kernel pipe bug?
I think we need to take a close look at what happened there but not to
replace by using page_size directly.

--=20
Regards,
Li Wang

--0000000000003f1a8c05a3f262ba
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><img class=3D"gmail-ajT" src=3D"https://ssl.gstatic.com/ui/v1=
/icons/mail/images/cleardot.gif"><br></div></div><br><div class=3D"gmail_qu=
ote"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, Apr 23, 2020 at 4:45 PM =
Yang Xu &lt;<a href=3D"mailto:xuyang2018.jy@cn.fujitsu.com">xuyang2018.jy@c=
n.fujitsu.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" sty=
le=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddi=
ng-left:1ex"><span class=3D"gmail_default" style=3D"font-size:small">...</s=
pan><br>
&gt; I got a failure on the ppc64le platform(page size: 65536kB).<br>
&gt; <br>
&gt; # ./pipe2_03<br>
&gt; tst_test.c:1246: INFO: Timeout per run is 0h 05m 00s<br>
&gt; pipe_size =3D 1048576<br>
&gt; PIPE_BUF =3D 4096<br>
&gt; packet_num =3D 256<br>
&gt; safe_macros.c:457: BROK: pipe2_03.c:58: <br>
&gt; write(4,0x1001d2b8,18446744073709551615) failed: EAGAIN/EWOULDBLOCK (1=
1)<br>
I think we should remove PIPE_BUF and use page_size=C2=A0 because we use a =
<br>
page to store data not a fixed size buffer in kernel. as below(also, <br>
man-pages[1] is need to update):<br></blockquote><div><br></div><div><div c=
lass=3D"gmail_default" style=3D"font-size:small">Emm, If PIPE_BUF doesn&#39=
;t work correctly, shouldn&#39;t this a kernel pipe bug? I think we need to=
 take a close look at what happened there but not to replace by=C2=A0using =
page_size directly.</div></div><div>=C2=A0</div></div>-- <br><div dir=3D"lt=
r" class=3D"gmail_signature"><div dir=3D"ltr"><div>Regards,<br></div><div>L=
i Wang<br></div></div></div></div>

--0000000000003f1a8c05a3f262ba--


--===============0888664791==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============0888664791==--

