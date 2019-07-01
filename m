Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EB555BC31
	for <lists+linux-ltp@lfdr.de>; Mon,  1 Jul 2019 14:57:42 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 6DDFD3C1D8A
	for <lists+linux-ltp@lfdr.de>; Mon,  1 Jul 2019 14:57:42 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 by picard.linux.it (Postfix) with ESMTP id 3D5943C1D74
 for <ltp@lists.linux.it>; Mon,  1 Jul 2019 14:57:41 +0200 (CEST)
Received: from mail-vs1-f42.google.com (mail-vs1-f42.google.com
 [209.85.217.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 169E26013B0
 for <ltp@lists.linux.it>; Mon,  1 Jul 2019 14:57:40 +0200 (CEST)
Received: by mail-vs1-f42.google.com with SMTP id k9so8817097vso.5
 for <ltp@lists.linux.it>; Mon, 01 Jul 2019 05:57:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=lLsWrc22/S3rdputZFeN8hO+C5zbI+wezHpp9fq//3o=;
 b=Tx2EQ2eIPNLv3y1RDHJ5kS2ZZyc9r9oyR271hsQHONVy7tGsc0TcCY3bbuW7sq36th
 xkL61tRXgZp1Hl8fcCGQ/CU41rcr1e2OZTwHYgqswNESCFjM0GYS2LUQD/gPwJA60i9C
 Uts0TeuEdnqs3S4jwb3IptvdGjDMWkPPheUx9HO+/D5vVFigbd9Em2N12xQ3mcpnLETE
 hmviZPZPvvlljJheGsgE/ujSW7y0uiiO4Sv0q9PNqYCjdv+ttX7nLnWWtn21m0V8hmnl
 yJO75lX1XeCLdr5Rk2tOqE0NEbz8E/fiANOXHyQ7tOROWwSc/PKZAkrg4DtsDzQWHSC1
 IT0Q==
X-Gm-Message-State: APjAAAU4v8KDQ2Ra/9VPxhzAn5udDss2Zc6mFzAiQw9eNpE0dbDJsgTZ
 yGKxxKJ3FT5n/k37tL/3DyOCiMQZ7JS5ljjp1uGiJw==
X-Google-Smtp-Source: APXvYqwQSEywf3f8oqlxhEh902nMug3pptFun/yvjLoPRaAReJoJZ2gMFJUohLI5TIua8vh3bhMzjebNbZZE4eUa6Zg=
X-Received: by 2002:a67:e24e:: with SMTP id w14mr13927477vse.124.1561985859009; 
 Mon, 01 Jul 2019 05:57:39 -0700 (PDT)
MIME-Version: 1.0
References: <CAEemH2cg01cdz=amrCWU00Xof9+cxmfR_DqCBaQe36QoGsakmA@mail.gmail.com>
 <5622c0ac-236f-4e3e-a132-c8d3bd8fadc4@redhat.com>
In-Reply-To: <5622c0ac-236f-4e3e-a132-c8d3bd8fadc4@redhat.com>
From: Li Wang <liwang@redhat.com>
Date: Mon, 1 Jul 2019 20:57:28 +0800
Message-ID: <CAEemH2fqMpoiBo+asyawHsOWgdXy-ggV0mwQs9A9EJ1kh=uhAA@mail.gmail.com>
To: Paolo Bonzini <pbonzini@redhat.com>
X-Virus-Scanned: clamav-milter 0.99.2 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=HTML_MESSAGE,SPF_HELO_NONE,
 SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [Kernel BUG?] SMSW operation get success on UMIP KVM guest
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
Cc: kernellwp@gmail.com, ricardo.neri-calderon@linux.intel.com,
 ricardo.neri@intel.com, linux-kernel <linux-kernel@vger.kernel.org>,
 Ping Fang <pifang@redhat.com>, tglx@linutronix.de,
 LTP List <ltp@lists.linux.it>
Content-Type: multipart/mixed; boundary="===============0215658397=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============0215658397==
Content-Type: multipart/alternative; boundary="0000000000004564c9058c9e2c09"

--0000000000004564c9058c9e2c09
Content-Type: text/plain; charset="UTF-8"

On Mon, Jul 1, 2019 at 8:02 PM Paolo Bonzini <pbonzini@redhat.com> wrote:

> On 01/07/19 09:50, Li Wang wrote:
> > Hello there,
> >
> > LTP/umip_basic_test get failed on KVM UMIP
> > system(kernel-v5.2-rc4.x86_64). The test is only trying to do
> >      asm volatile("smsw %0\n" : "=m" (val));
> > and expect to get SIGSEGV in this SMSW operation, but it exits with 0
> > unexpectedly.
>
> In addition to what Thomas said, perhaps you are using a host that does
> *not* have UMIP, and configuring KVM to emulate it(*).  In that case, it
> is not possible to intercept SMSW, and therefore it will incorrectly
> succeed.
>

Right, I checked the host system, and confirmed that CPU doesn't support
UMIP.

>
> Paolo
>
> (*) before the x86 people jump at me, this won't happen unless you
> explicitly pass an option to QEMU, such as "-cpu host,+umip". :)  The
> incorrect emulation of SMSW when CR4.UMIP=1 is why.
>
Good to know this, is there any document for that declaration? It seems
neither LTP issue nor kernel bug here. But anyway we'd better do something
to avoid the error in the test.

-- 
Regards,
Li Wang

--0000000000004564c9058c9e2c09
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote"><div dir=3D"lt=
r" class=3D"gmail_attr">On Mon, Jul 1, 2019 at 8:02 PM Paolo Bonzini &lt;<a=
 href=3D"mailto:pbonzini@redhat.com">pbonzini@redhat.com</a>&gt; wrote:<br>=
</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;b=
order-left:1px solid rgb(204,204,204);padding-left:1ex">On 01/07/19 09:50, =
Li Wang wrote:<br>
&gt; Hello there,<br>
&gt; <br>
&gt; LTP/umip_basic_test get failed on KVM UMIP<br>
&gt; system(kernel-v5.2-rc4.x86_64). The test is only trying to do<br>
&gt; =C2=A0 =C2=A0 =C2=A0asm volatile(&quot;smsw %0\n&quot; : &quot;=3Dm&qu=
ot; (val));<br>
&gt; and expect to get SIGSEGV in this SMSW operation, but it exits with 0<=
br>
&gt; unexpectedly.<br>
<br>
In addition to what Thomas said, perhaps you are using a host that does<br>
*not* have UMIP, and configuring KVM to emulate it(*).=C2=A0 In that case, =
it<br>
is not possible to intercept SMSW, and therefore it will incorrectly<br>
succeed.<br></blockquote><div><br></div><div class=3D"gmail_default" style=
=3D"font-size:small">Right, I checked the host system, and confirmed that C=
PU doesn&#39;t support UMIP.</div><div class=3D"gmail_default" style=3D"fon=
t-size:small"></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0=
px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
Paolo<br>
<br>
(*) before the x86 people jump at me, this won&#39;t happen unless you<br>
explicitly pass an option to QEMU, such as &quot;-cpu host,+umip&quot;. :)=
=C2=A0 The<br>
incorrect emulation of SMSW when CR4.UMIP=3D1 is why.<br>
</blockquote></div><div class=3D"gmail_default" style=3D"font-size:small"><=
/div><div class=3D"gmail_default" style=3D"font-size:small">Good to know th=
is, is there any document for that declaration? It seems neither LTP issue =
nor kernel bug here. But anyway we&#39;d better do something to avoid the e=
rror in the test.</div><div><br></div>-- <br><div dir=3D"ltr" class=3D"gmai=
l_signature"><div dir=3D"ltr"><div>Regards,<br></div><div>Li Wang<br></div>=
</div></div></div>

--0000000000004564c9058c9e2c09--

--===============0215658397==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============0215658397==--
