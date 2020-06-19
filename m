Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 800742003FB
	for <lists+linux-ltp@lfdr.de>; Fri, 19 Jun 2020 10:33:52 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 0BE833C2C56
	for <lists+linux-ltp@lfdr.de>; Fri, 19 Jun 2020 10:33:52 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 by picard.linux.it (Postfix) with ESMTP id DB5FB3C2AB3
 for <ltp@lists.linux.it>; Fri, 19 Jun 2020 10:33:47 +0200 (CEST)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
 by in-3.smtp.seeweb.it (Postfix) with ESMTP id 4F2F21A009A1
 for <ltp@lists.linux.it>; Fri, 19 Jun 2020 10:33:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1592555624;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=prDARn8AtPMTrrkFiNbq015EyhdfQp7ugACRD8qaEkE=;
 b=fszd+k/lkfZ3Vr5VS0O2YHRPJe1Il1MCbO/mj1BCWTMBkQGqgyBzEYiI2kzfHuu9fh3x0S
 x/pQlBAZvzboM/7BJNFw+FXcSIk5vCk5/oDz/8o4r3UHsVgIc2AGZ6u7kOcUmcNbG3PUTx
 2PiHsrbHXEvfNMYLywzpMeGzpBEO7zA=
Received: from mail-lf1-f72.google.com (mail-lf1-f72.google.com
 [209.85.167.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-331-hwmVODInONaf6HbZPMLrvw-1; Fri, 19 Jun 2020 04:33:42 -0400
X-MC-Unique: hwmVODInONaf6HbZPMLrvw-1
Received: by mail-lf1-f72.google.com with SMTP id j21so3056970lfg.18
 for <ltp@lists.linux.it>; Fri, 19 Jun 2020 01:33:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=prDARn8AtPMTrrkFiNbq015EyhdfQp7ugACRD8qaEkE=;
 b=qP9Z6MdyhrlheWpiMlr8H0Ugem0/cy/3BylMtE3uC0GXKTpD1mpsTkZOuEqVV0DrbA
 S6ekMpIAW9SKN9b1v71nNTfM6lTo1Bhiiq1WGFYVFEEyUOt7YwFI+UHNWhg+84XFuM+i
 UBIKKgNTZPv9nsaGNJF3hvv4rx07IG8zYw1SpBwLNbrBTdb4wyxs1aTkXxHYVphIOtA/
 +vj0qci2oQA3EmeuyIW0dMm3DOcFapkI8qzxut5aP02jew8yygTDLUylFYSBkf7CGJl1
 UPLioBmAPZRcYvXqL28hturngmvNdmuaP5f20WlTuj9GDVoK87wW5vl9toSqPNnS9DOl
 mg2Q==
X-Gm-Message-State: AOAM531RGMnOu9QA4ZGW67Ls8CafIqmv1uYNZizAaa8CBDnTGndEGURW
 l6OwxLtuHyyeyLlimMrJaq77kkrDP8351VkfiMNSuWMzwXMnO9TnP/6UTTWGsI1TTLPiTadYTLx
 rGUI/juAuBTC1XMd4qG1HyB2eJ+g=
X-Received: by 2002:a05:651c:149:: with SMTP id
 c9mr1283772ljd.441.1592555621094; 
 Fri, 19 Jun 2020 01:33:41 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyRulpN2DGDQwe6EPQobe1+LLZUlJdGqjIcOdN9+MAZiORbLcCxHQQxu/azUOf8pqfiFroeIeGS5nWxZvfS7K8=
X-Received: by 2002:a05:651c:149:: with SMTP id
 c9mr1283761ljd.441.1592555620881; 
 Fri, 19 Jun 2020 01:33:40 -0700 (PDT)
MIME-Version: 1.0
References: <20200618091827.4143850-1-zhe.he@windriver.com>
In-Reply-To: <20200618091827.4143850-1-zhe.he@windriver.com>
From: Li Wang <liwang@redhat.com>
Date: Fri, 19 Jun 2020 16:33:28 +0800
Message-ID: <CAEemH2eCv=rSvbM=G2dr2OxW0CodbXJmasmVUVTCKCofEAOVJQ@mail.gmail.com>
To: zhe.he@windriver.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,HTML_MESSAGE,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] syscalls/copy_file_range02: Expect EFBIG in
 subcase max length on 32-bit architectures
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
Content-Type: multipart/mixed; boundary="===============0014448352=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============0014448352==
Content-Type: multipart/alternative; boundary="0000000000001172fc05a86bc012"

--0000000000001172fc05a86bc012
Content-Type: text/plain; charset="UTF-8"

On Thu, Jun 18, 2020 at 5:21 PM <zhe.he@windriver.com> wrote:

> From: He Zhe <zhe.he@windriver.com>
>
> For syscall
> ssize_t copy_file_range(int fd_in, loff_t *off_in,
>                                int fd_out, loff_t *off_out,
>                                size_t len, unsigned int flags);
> off_out is loff_t* that is long long, 64 bits on 32-bit architectures,
> while len is size_t that unsigned int, 32 bits on 32-bit architectures.
>
> In subcase "max length", simplified as below,
>
> dst = tst_max_lfs_filesize();
> TEST(sys_copy_file_range(fd_src, 0, *tc->copy_to_fd, &dst, tc->len,
> tc->flags));
>
> where dst is 4K*4G and len is 4G, so (4K+1)*4G is always smaller than
> 4G*4G,
> it can never match the following kernel condition on 32-bit architectures.
>

Thanks for fixing this, pushed.

-- 
Regards,
Li Wang

--0000000000001172fc05a86bc012
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote"><div dir=3D"lt=
r" class=3D"gmail_attr">On Thu, Jun 18, 2020 at 5:21 PM &lt;<a href=3D"mail=
to:zhe.he@windriver.com">zhe.he@windriver.com</a>&gt; wrote:<br></div><bloc=
kquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:=
1px solid rgb(204,204,204);padding-left:1ex">From: He Zhe &lt;<a href=3D"ma=
ilto:zhe.he@windriver.com" target=3D"_blank">zhe.he@windriver.com</a>&gt;<b=
r>
<br>
For syscall<br>
ssize_t copy_file_range(int fd_in, loff_t *off_in,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0int fd_out, loff_t *off_out,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0size_t len, unsigned int flags);<br>
off_out is loff_t* that is long long, 64 bits on 32-bit architectures,<br>
while len is size_t that unsigned int, 32 bits on 32-bit architectures.<br>
<br>
In subcase &quot;max length&quot;, simplified as below,<br>
<br>
dst =3D tst_max_lfs_filesize();<br>
TEST(sys_copy_file_range(fd_src, 0, *tc-&gt;copy_to_fd, &amp;dst, tc-&gt;le=
n, tc-&gt;flags));<br>
<br>
where dst is 4K*4G and len is 4G, so (4K+1)*4G is always smaller than 4G*4G=
,<br>
it can never match the following kernel condition on 32-bit architectures.<=
br></blockquote><div><br></div><div><div class=3D"gmail_default" style=3D"f=
ont-size:small">Thanks for fixing this, pushed.</div></div><div><br></div><=
/div>-- <br><div dir=3D"ltr" class=3D"gmail_signature"><div dir=3D"ltr"><di=
v>Regards,<br></div><div>Li Wang<br></div></div></div></div>

--0000000000001172fc05a86bc012--


--===============0014448352==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============0014448352==--

