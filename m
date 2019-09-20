Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 68C59B899B
	for <lists+linux-ltp@lfdr.de>; Fri, 20 Sep 2019 05:00:31 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 2B5123C2169
	for <lists+linux-ltp@lfdr.de>; Fri, 20 Sep 2019 05:00:31 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 by picard.linux.it (Postfix) with ESMTP id F10813C210B
 for <ltp@lists.linux.it>; Fri, 20 Sep 2019 05:00:29 +0200 (CEST)
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id BA0B4140148E
 for <ltp@lists.linux.it>; Fri, 20 Sep 2019 05:00:28 +0200 (CEST)
Received: from mail-oi1-f197.google.com (mail-oi1-f197.google.com
 [209.85.167.197])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id ABADB37E80
 for <ltp@lists.linux.it>; Fri, 20 Sep 2019 03:00:26 +0000 (UTC)
Received: by mail-oi1-f197.google.com with SMTP id u64so362543oie.20
 for <ltp@lists.linux.it>; Thu, 19 Sep 2019 20:00:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=X7t50rF63bFX20F2hz8sgAzj1QVk1n2io87J3OnYe3k=;
 b=MExrcQqzsu9qZR8vXYNOtkbm5cJxhZQg5A7+ljFWp1L2e05tNdMoAq5y1nUrTQzCi0
 ph+VPh4vIusOluPN+VAAI4VvZxP+ayfZ2Nb8kA8Z7hXiU9yTlS1HI4qGkj7bXOJZkDQQ
 mWFBh59f9ud+IA5FK2+EPfHlzkG4KS7vvFpQzHEMnp4u8mddxh9HHjbTxj8CVlUeFmkh
 Tby6A5++Vy+j9zJVjrmTc4K3cQmjCzaytd7mcI+vDfAYyyLEkNOQH6bgSsUdug3gI/e+
 ukW6O5PoK5rpbIuFVPKjcGlmBaDppAfu5UXu3rFBlxVCqFOF1gw89u0ZJSJN/JzyycVW
 2imQ==
X-Gm-Message-State: APjAAAXSplmQ7JTZOhCHuTq7hXlBl94dqc3jlDghwym3ONAqx9vjByHl
 P2XXl4blG4CNyNJpJ4lMo0oiYTVWgrsR0F5AkN3iSnXJwReVn2nyEcyHCOWEcypHJX+W1aiHhXf
 r6alxgx/9g8bEi+cToZddPbrpbAU=
X-Received: by 2002:a54:480d:: with SMTP id j13mr1056268oij.96.1568948426190; 
 Thu, 19 Sep 2019 20:00:26 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwLbaFbJOEo9d0NoEhE8IOjHyXzrVP7emxbFql4/YKpRR+u5fBXK5ku/U/ZNAuDSE0DhcQgRx8KDN4QBth5SJo=
X-Received: by 2002:a54:480d:: with SMTP id j13mr1056231oij.96.1568948425818; 
 Thu, 19 Sep 2019 20:00:25 -0700 (PDT)
MIME-Version: 1.0
References: <20190918053519.26244-1-liwang@redhat.com>
 <20190919100205.GA26642@rei>
In-Reply-To: <20190919100205.GA26642@rei>
From: Li Wang <liwang@redhat.com>
Date: Fri, 20 Sep 2019 11:00:14 +0800
Message-ID: <CAEemH2eD5fcYYcK06Jyp-bxOwO-tzk1zdLyruu5U-VfyouTXaA@mail.gmail.com>
To: Cyril Hrubis <chrubis@suse.cz>
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-0.0 required=7.0 tests=HTML_MESSAGE,SPF_HELO_PASS,
 SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [RFC PATCH] tst_taint: TCONF when kernel is alreay tainted
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
Cc: Chang Yin <cyin@redhat.com>, LTP List <ltp@lists.linux.it>
Content-Type: multipart/mixed; boundary="===============1712224988=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============1712224988==
Content-Type: multipart/alternative; boundary="00000000000097b3110592f3451a"

--00000000000097b3110592f3451a
Content-Type: text/plain; charset="UTF-8"

On Thu, Sep 19, 2019 at 6:02 PM Cyril Hrubis <chrubis@suse.cz> wrote:

> Hi!
> > As the tst_taint_init comments described, If the tainted-flags are
> already set
> > by the kernel, there is no reason to continue and TCONF is generated.
> But in
> > the function achieve, it uses TBROK.
> >
> >   cmdline="cve-2017-17053"
> >   tst_test.c:1096: INFO: Timeout per run is 0h 10m 00s
> >   tst_taint.c:88: BROK: Kernel is already tainted: 536871424
>
> There is a reason for generating TBROK, we do not want the test to be
> skipped silently in this case. If kernel is tainted something went wrong
> anyways and we are looking only for a specific flags.
>

That's true. The TBROK can highlight the tainted kernel as a good reminder
to the tester.

But in a real testing situation, LTP sometimes not being run in the first,
after we go here cve-2017-17053, the kernel very probably has already been
tainted and reported by other tests. So this new TBROK will drive tester to
double-check if something wrong as new.

Imagine that, if there are many test cases invoke a tainted checking(e.g.
TST_TAINT_W) in LTP, then all of them will be skipped and report TBORK on
such tainted-kernel, that seems not to be friendly to the tester to review
the result.

-- 
Regards,
Li Wang

--00000000000097b3110592f3451a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote"><div dir=3D"lt=
r" class=3D"gmail_attr">On Thu, Sep 19, 2019 at 6:02 PM Cyril Hrubis &lt;<a=
 href=3D"mailto:chrubis@suse.cz">chrubis@suse.cz</a>&gt; wrote:<br></div><b=
lockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-le=
ft:1px solid rgb(204,204,204);padding-left:1ex">Hi!<br>
&gt; As the tst_taint_init comments described, If the tainted-flags are alr=
eady set<br>
&gt; by the kernel, there is no reason to continue and TCONF is generated. =
But in<br>
&gt; the function achieve, it uses TBROK.<br>
&gt; <br>
&gt;=C2=A0 =C2=A0cmdline=3D&quot;cve-2017-17053&quot;<br>
&gt;=C2=A0 =C2=A0tst_test.c:1096: INFO: Timeout per run is 0h 10m 00s<br>
&gt;=C2=A0 =C2=A0tst_taint.c:88: BROK: Kernel is already tainted: 536871424=
<br>
<br>
There is a reason for generating TBROK, we do not want the test to be<br>
skipped silently in this case. If kernel is tainted something went wrong<br=
>
anyways and we are looking only for a specific flags.<br></blockquote><div>=
<br></div><div><div class=3D"gmail_default" style=3D"font-size:small">That&=
#39;s true. The TBROK can highlight the tainted kernel as a good reminder t=
o the tester.</div><div class=3D"gmail_default" style=3D"font-size:small"><=
br></div><div class=3D"gmail_default" style=3D"font-size:small">But in a re=
al testing situation, LTP sometimes not being run in the first, after we go=
 here cve-2017-17053, the kernel very probably has already been tainted and=
 reported by other tests. So this new TBROK will drive tester to double-che=
ck if something wrong as new.=C2=A0</div></div><div class=3D"gmail_default"=
 style=3D"font-size:small"><br></div><div class=3D"gmail_default" style=3D"=
font-size:small">Imagine that, if there are many test cases invoke a tainte=
d checking(e.g. TST_TAINT_W) in LTP, then all of them will be skipped and r=
eport TBORK on such tainted-kernel, that seems not to be friendly to the te=
ster to review the result.</div></div><div><br></div>-- <br><div dir=3D"ltr=
" class=3D"gmail_signature"><div dir=3D"ltr"><div>Regards,<br></div><div>Li=
 Wang<br></div></div></div></div>

--00000000000097b3110592f3451a--

--===============1712224988==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============1712224988==--
