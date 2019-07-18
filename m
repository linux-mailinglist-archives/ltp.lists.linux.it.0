Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D79D6C9A5
	for <lists+linux-ltp@lfdr.de>; Thu, 18 Jul 2019 09:01:54 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id B55903C1D2D
	for <lists+linux-ltp@lfdr.de>; Thu, 18 Jul 2019 09:01:53 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 by picard.linux.it (Postfix) with ESMTP id 77E233C0271
 for <ltp@lists.linux.it>; Thu, 18 Jul 2019 09:01:50 +0200 (CEST)
Received: from mail-vk1-f195.google.com (mail-vk1-f195.google.com
 [209.85.221.195])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id E68DA60101E
 for <ltp@lists.linux.it>; Thu, 18 Jul 2019 09:01:50 +0200 (CEST)
Received: by mail-vk1-f195.google.com with SMTP id v68so1844634vkd.1
 for <ltp@lists.linux.it>; Thu, 18 Jul 2019 00:01:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=cpXIOsoXGyd1lolPjSdcLpmMdfGLF9s97x2EKtLLBGg=;
 b=bFV1m8unCb/z1TEbQ0mP9NVw5jRaWomsGLnh9xsUqDKc5h/PHTkaOXUHG5WFVInF9t
 WYmK85MTwnAoVXedcd1nJgOcGdocRVikr4uJ8UVDAZwyxU1RaWtDOFsVGwykw/kL+7O/
 X2YBy6aeQnpQiQM+BWQDWIfR4l5A7j7t4uYVUH0kvo21bB6JD2jNYxRDpPNQMCXTi3tZ
 V6IFo5LWYD9gVpjG8hZV2QB09VRerX6iF+Trv+aYVVgt/4Ov4G/NDYKeaZOilAJlddVb
 9ArQ1oN83ao8vq0RqO7KRbc20+DxgZF8hE6T2FclstrzsXU+L8oL0txt0ak2x3k+Kfrl
 QSzQ==
X-Gm-Message-State: APjAAAWUuD0RPHnRaBnn53aGoOVs/1rOcDAimrt6+l6x3+2LtgZVH8G1
 Ec4HLzDtkzxQL1S9MivxazVdQhLs8gtY0fcyyizXJg==
X-Google-Smtp-Source: APXvYqxBPPTkT+7yfP+N7j/f0abPQKIn72s13SxQRgSp+eoURoe0lCRrYqd26pwLX3eid0YG61XpdDZJmsEwzC9nBjs=
X-Received: by 2002:a1f:3dc1:: with SMTP id k184mr17516897vka.24.1563433307010; 
 Thu, 18 Jul 2019 00:01:47 -0700 (PDT)
MIME-Version: 1.0
References: <20190617213138.15896-1-petr.vorel@gmail.com>
In-Reply-To: <20190617213138.15896-1-petr.vorel@gmail.com>
From: Li Wang <liwang@redhat.com>
Date: Thu, 18 Jul 2019 15:01:35 +0800
Message-ID: <CAEemH2fGBfsxyJTotcvDrGOzFqRs53QmaXygEj8Jz5HgUxr5+A@mail.gmail.com>
To: Petr Vorel <petr.vorel@gmail.com>
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=HTML_MESSAGE,SPF_HELO_NONE,
 SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 1/1] syscalls/ustat: Use __kernel_daddr_t instead
 of daddr_t
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
Content-Type: multipart/mixed; boundary="===============1104998096=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============1104998096==
Content-Type: multipart/alternative; boundary="000000000000e5167b058def2e5b"

--000000000000e5167b058def2e5b
Content-Type: text/plain; charset="UTF-8"

Hi Petr,

On Tue, Jun 18, 2019 at 5:32 AM Petr Vorel <petr.vorel@gmail.com> wrote:

> This fixes build for musl, which does not have <sys/ustat.h> nor
> typedef daddr_t. Musl does not define these as ustat is deprecated
> in favor of statfs() and daddr_t is ancient [1].
>
> Other libc also does not have <sys/ustat.h> (ustat support was removed
> from glibc in 2.28), but they have daddr_t.
>
> This brings <linux/types.h> dependency for ustat testing.
>
> Typedef is needed as sparc and mips have __kernel_daddr_t long,
> otherwise it's int.
>
> [1] https://www.openwall.com/lists/musl/2019/06/10/1
>
> Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
>
Reviewed-by: Li Wang <liwang@redhat.com>

I don't have a try to build this with musl, but from my code review, the
patch makes sense.

-- 
Regards,
Li Wang

--000000000000e5167b058def2e5b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small">Hi Petr,</div></div><br><div class=3D"gmail_quote"><div dir=
=3D"ltr" class=3D"gmail_attr">On Tue, Jun 18, 2019 at 5:32 AM Petr Vorel &l=
t;<a href=3D"mailto:petr.vorel@gmail.com">petr.vorel@gmail.com</a>&gt; wrot=
e:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0=
.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">This fixes bu=
ild for musl, which does not have &lt;sys/ustat.h&gt; nor<br>
typedef daddr_t. Musl does not define these as ustat is deprecated<br>
in favor of statfs() and daddr_t is ancient [1].<br>
<br>
Other libc also does not have &lt;sys/ustat.h&gt; (ustat support was remove=
d<br>
from glibc in 2.28), but they have daddr_t.<br>
<br>
This brings &lt;linux/types.h&gt; dependency for ustat testing.<br>
<br>
Typedef is needed as sparc and mips have __kernel_daddr_t long,<br>
otherwise it&#39;s int.<br>
<br>
[1] <a href=3D"https://www.openwall.com/lists/musl/2019/06/10/1" rel=3D"nor=
eferrer" target=3D"_blank">https://www.openwall.com/lists/musl/2019/06/10/1=
</a><br>
<br>
Signed-off-by: Petr Vorel &lt;<a href=3D"mailto:petr.vorel@gmail.com" targe=
t=3D"_blank">petr.vorel@gmail.com</a>&gt;<br></blockquote><div><span class=
=3D"gmail_default" style=3D"font-size:small"></span>Reviewed-by: Li Wang &l=
t;<a href=3D"mailto:liwang@redhat.com">liwang@redhat.com</a>&gt;<span class=
=3D"gmail_default"></span>=C2=A0</div><div><br></div><div><span class=3D"gm=
ail_default" style=3D"font-size:small">I don&#39;t have a try to build this=
 with musl, but from my code review, the patch makes sense.</span></div></d=
iv><div><br></div>-- <br><div dir=3D"ltr" class=3D"gmail_signature"><div di=
r=3D"ltr"><div>Regards,<br></div><div>Li Wang<br></div></div></div></div>

--000000000000e5167b058def2e5b--

--===============1104998096==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============1104998096==--
