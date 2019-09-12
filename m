Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BC0EB0BCC
	for <lists+linux-ltp@lfdr.de>; Thu, 12 Sep 2019 11:46:19 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 575713C2082
	for <lists+linux-ltp@lfdr.de>; Thu, 12 Sep 2019 11:46:19 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 by picard.linux.it (Postfix) with ESMTP id 3A1113C0030
 for <ltp@lists.linux.it>; Thu, 12 Sep 2019 11:46:17 +0200 (CEST)
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id B7A6F61053E
 for <ltp@lists.linux.it>; Thu, 12 Sep 2019 11:46:18 +0200 (CEST)
Received: from mail-ot1-f72.google.com (mail-ot1-f72.google.com
 [209.85.210.72])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 4690B3DE31
 for <ltp@lists.linux.it>; Thu, 12 Sep 2019 09:46:14 +0000 (UTC)
Received: by mail-ot1-f72.google.com with SMTP id d20so14403102otp.17
 for <ltp@lists.linux.it>; Thu, 12 Sep 2019 02:46:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=QG5yPvBYQWPDVw9ccetu89E65swRSaBpKK2F1/cI8Gs=;
 b=Kp2ZcLMVBTl/FTp0vWs3IAbYFd4IpuDjv0ATQrOTBM0dRx6G0yiMFacRK9cPtg3BNu
 HyaSODt0Q9o4ALIFZpvvR2pGzwof+TjIhHMEu6B7J0U3VNwVZW60zyCsxs2/DxKYGYVy
 7q7VWj6Xugq3be8MiTFwEBd4OvZ2Lx/wb4DQLYGA9YtAMO+MVkyVpsxbI6PNi825vLEI
 hRQeX/YP2XNTvHAVG4slfdc8pU4MiC7LPWArobLoH3fVZyaKFEKrOAL2XXWDIOmpA2X3
 l9MvG/Ybj39lv/VmiA/LhyYEgVjFS3WJ+bbR46YFoj/VNFxbdy7Y5z1BczpuWjsc8Zum
 +V3g==
X-Gm-Message-State: APjAAAX9dko1iTpgwYzhDHp1/mqut4EPI/RBhfl9tZh+9ZjSCyWvmI7T
 nUIXJFyuVOU9pp0tqKdQoKY6dvSV3naLJ2w3CybPoRuvaB7vNLTpBJGPwBqEpIKIoGpzxzyeVx7
 +Cd5JdSzc/PuW2jh0Y1Fk1ISYLXY=
X-Received: by 2002:aca:ed52:: with SMTP id l79mr7465302oih.47.1568281573796; 
 Thu, 12 Sep 2019 02:46:13 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzwZkva1BYgHZ82pCMnX0yXbY9MOfBgHJb0R3NnjBccs+EavjTa6r8qApkKKl6v2DUuIVckxubH+4NU6xuIurM=
X-Received: by 2002:aca:ed52:: with SMTP id l79mr7465281oih.47.1568281573583; 
 Thu, 12 Sep 2019 02:46:13 -0700 (PDT)
MIME-Version: 1.0
References: <1568266635-17666-1-git-send-email-shuang.qiu@oracle.com>
 <CAEemH2dnWfhmTBHyKPJ9iAgEKPNcCBGwuUJ+zC8+UCFCvX5eSw@mail.gmail.com>
 <20190912094121.GA7714@rei.lan>
In-Reply-To: <20190912094121.GA7714@rei.lan>
From: Li Wang <liwang@redhat.com>
Date: Thu, 12 Sep 2019 17:46:02 +0800
Message-ID: <CAEemH2eydf8umq3NSfQJDcSxKnfLPsV=mzaJ1r5Q9LkcSedmAA@mail.gmail.com>
To: Cyril Hrubis <chrubis@suse.cz>
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-0.0 required=7.0 tests=HTML_MESSAGE,SPF_HELO_PASS,
 SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH V2] madvise09:Update PAGES to a larger value
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
Content-Type: multipart/mixed; boundary="===============1837649799=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============1837649799==
Content-Type: multipart/alternative; boundary="0000000000001a15120592580263"

--0000000000001a15120592580263
Content-Type: text/plain; charset="UTF-8"

On Thu, Sep 12, 2019 at 5:41 PM Cyril Hrubis <chrubis@suse.cz> wrote:

> Hi!
> > Thanks for the quick work on this.
> >
> > There are two problems that you probably ignored.
> >
> > 1. On ppc64 system, the page size is 64KB, and 970 * 64KB is almost 60MB
> > which we do allocate. So we'd better raise
> > the limit_in_bytes/memsw.limit_in_bytes a little in cgroup
> correspondingly.
> >
> > 2. As Cascardo points out, madvise09 gets retries in an infinite loop
> when
> > hitting OOM. That's because, in the run() function, it does not limit the
> > retry times. We need to take care of this as well.
>
> I guess that the debug printing would go out of hand as well, 970
> characters printed into the console is no fun either. The test needs a
> bit more than just bumping the number of pages. However as we are
> getting really close to release I guess that the best course of action
> would be workarounding the issue for now by bumping the number of pages
> to something as 128 pages. Then we can rework the test once LTP has been
> released.
>

OK for me.

-- 
Regards,
Li Wang

--0000000000001a15120592580263
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote"><div dir=3D"lt=
r" class=3D"gmail_attr">On Thu, Sep 12, 2019 at 5:41 PM Cyril Hrubis &lt;<a=
 href=3D"mailto:chrubis@suse.cz">chrubis@suse.cz</a>&gt; wrote:<br></div><b=
lockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-le=
ft:1px solid rgb(204,204,204);padding-left:1ex">Hi!<br>
&gt; Thanks for the quick work on this.<br>
&gt; <br>
&gt; There are two problems that you probably ignored.<br>
&gt; <br>
&gt; 1. On ppc64 system, the page size is 64KB, and 970 * 64KB is almost 60=
MB<br>
&gt; which we do allocate. So we&#39;d better raise<br>
&gt; the limit_in_bytes/memsw.limit_in_bytes a little in cgroup correspondi=
ngly.<br>
&gt; <br>
&gt; 2. As Cascardo points out, madvise09 gets retries in an infinite loop =
when<br>
&gt; hitting OOM. That&#39;s because, in the run() function, it does not li=
mit the<br>
&gt; retry times. We need to take care of this as well.<br>
<br>
I guess that the debug printing would go out of hand as well, 970<br>
characters printed into the console is no fun either. The test needs a<br>
bit more than just bumping the number of pages. However as we are<br>
getting really close to release I guess that the best course of action<br>
would be workarounding the issue for now by bumping the number of pages<br>
to something as 128 pages. Then we can rework the test once LTP has been<br=
>
released.<br></blockquote><div><br></div><div><div class=3D"gmail_default" =
style=3D"font-size:small">OK for me.</div></div><div><br></div></div>-- <br=
><div dir=3D"ltr" class=3D"gmail_signature"><div dir=3D"ltr"><div>Regards,<=
br></div><div>Li Wang<br></div></div></div></div>

--0000000000001a15120592580263--

--===============1837649799==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============1837649799==--
