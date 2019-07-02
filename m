Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id C70955C6CA
	for <lists+linux-ltp@lfdr.de>; Tue,  2 Jul 2019 03:52:57 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 6E32A3C1DC3
	for <lists+linux-ltp@lfdr.de>; Tue,  2 Jul 2019 03:52:57 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 by picard.linux.it (Postfix) with ESMTP id 237133C1D57
 for <ltp@lists.linux.it>; Tue,  2 Jul 2019 03:52:53 +0200 (CEST)
Received: from mail-ua1-f54.google.com (mail-ua1-f54.google.com
 [209.85.222.54])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 71B5A10007D8
 for <ltp@lists.linux.it>; Tue,  2 Jul 2019 03:52:47 +0200 (CEST)
Received: by mail-ua1-f54.google.com with SMTP id 8so5846842uaz.11
 for <ltp@lists.linux.it>; Mon, 01 Jul 2019 18:52:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=RQEHhQz+89jrxEWWxiOBt1vp+jtTievGHi4ffnw5MOU=;
 b=rzRkaC5eCFwsLecVh6TzuyDk72Ak10WseRX4ibCL9vagXkAGuX9cDIx8ufBLZCcRBd
 LQatLwBnzgpLB3Bj9Z1mLusQL8e7NqfywIWYsnRXI8um/S2wvXA2R/sfcMBVUvtdHUFT
 azveBfAuVS6b1WeWRFDSnov6OMoayf1RlWvvy11arxIRkbHwkpHFtyl1M595hutjgtZk
 rzRGA2LkNZ4IVk+exPn1BqkDiL8jYf1QcJ7m1dxF52FxMFZo64Q6VlL045MyjCiOXsd3
 Sq5PodobmkBlsje6TzAlw+ZEm+rX/i0cGi7uaoHgM5gvUGe+bOJlU+JyFsjrS/AG9uW2
 JxeA==
X-Gm-Message-State: APjAAAUscKZegtd7Y3Iv2vkLyK/94ixNTIDGwSDohx5vtiWoRDlb/9B2
 hPj7aeQlQwgIBR8OIO1rm9vuylDBfonMqDjWguucZg==
X-Google-Smtp-Source: APXvYqxu8zMHk+ZxHFmilS7r9Z8vkWpC3Grg0Z/YZI2Lyu9pv5ggiV7DWN8OTwR07wmx135HkLstTSt4SWkv+kAYe+k=
X-Received: by 2002:a9f:3105:: with SMTP id m5mr15803547uab.142.1562032370896; 
 Mon, 01 Jul 2019 18:52:50 -0700 (PDT)
MIME-Version: 1.0
References: <CAEemH2cg01cdz=amrCWU00Xof9+cxmfR_DqCBaQe36QoGsakmA@mail.gmail.com>
 <5622c0ac-236f-4e3e-a132-c8d3bd8fadc4@redhat.com>
 <CAEemH2fqMpoiBo+asyawHsOWgdXy-ggV0mwQs9A9EJ1kh=uhAA@mail.gmail.com>
 <20190701160352.GA19921@ranerica-svr.sc.intel.com>
In-Reply-To: <20190701160352.GA19921@ranerica-svr.sc.intel.com>
From: Li Wang <liwang@redhat.com>
Date: Tue, 2 Jul 2019 09:52:39 +0800
Message-ID: <CAEemH2fR98TBHaOM37aGmzbgdZ_XPokJeUNN6dU1r=1WhOSmEw@mail.gmail.com>
To: Ricardo Neri <ricardo.neri-calderon@linux.intel.com>
X-Virus-Scanned: clamav-milter 0.99.2 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=HTML_MESSAGE,SPF_HELO_NONE,
 SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-4.smtp.seeweb.it
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
Cc: kernellwp@gmail.com, ricardo.neri@intel.com,
 linux-kernel <linux-kernel@vger.kernel.org>, Ping Fang <pifang@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, tglx@linutronix.de,
 LTP List <ltp@lists.linux.it>
Content-Type: multipart/mixed; boundary="===============0874910484=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============0874910484==
Content-Type: multipart/alternative; boundary="000000000000986da4058ca90054"

--000000000000986da4058ca90054
Content-Type: text/plain; charset="UTF-8"

On Tue, Jul 2, 2019 at 12:04 AM Ricardo Neri <
ricardo.neri-calderon@linux.intel.com> wrote:

> On Mon, Jul 01, 2019 at 08:57:28PM +0800, Li Wang wrote:
> > On Mon, Jul 1, 2019 at 8:02 PM Paolo Bonzini <pbonzini@redhat.com>
> wrote:
> >
> > > On 01/07/19 09:50, Li Wang wrote:
> > > > Hello there,
> > > >
> > > > LTP/umip_basic_test get failed on KVM UMIP
> > > > system(kernel-v5.2-rc4.x86_64). The test is only trying to do
> > > >      asm volatile("smsw %0\n" : "=m" (val));
> > > > and expect to get SIGSEGV in this SMSW operation, but it exits with 0
> > > > unexpectedly.
> > >
> > > In addition to what Thomas said, perhaps you are using a host that does
> > > *not* have UMIP, and configuring KVM to emulate it(*).  In that case,
> it
> > > is not possible to intercept SMSW, and therefore it will incorrectly
> > > succeed.
> > >
> >
> > Right, I checked the host system, and confirmed that CPU doesn't support
> > UMIP.
> >
> > >
> > > Paolo
> > >
> > > (*) before the x86 people jump at me, this won't happen unless you
> > > explicitly pass an option to QEMU, such as "-cpu host,+umip". :)  The
> > > incorrect emulation of SMSW when CR4.UMIP=1 is why.
> > >
> > Good to know this, is there any document for that declaration? It seems
> > neither LTP issue nor kernel bug here. But anyway we'd better do
> something
> > to avoid the error in the test.
>
> The test case already checks for umip in /proc/cpuinfo, right? And in
> long mode it always expects a SIGSEGV signal. If you did not add -cpu
> host,+umip,
> how come umip was present in /proc/cpuinfo?
>

Yes, right.

But the KVM guest is not customized in manual, I reserved that system for
automation test and did not aware of the '-cpu host,+umip,' parameter until
Paolo points it out. In the last email, I was hoping to find a way to
recognize this situation for the LTP test intelligently.

Thank you all for a reply to this.

-- 
Regards,
Li Wang

--000000000000986da4058ca90054
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote"><div dir=3D"lt=
r" class=3D"gmail_attr">On Tue, Jul 2, 2019 at 12:04 AM Ricardo Neri &lt;<a=
 href=3D"mailto:ricardo.neri-calderon@linux.intel.com">ricardo.neri-caldero=
n@linux.intel.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote"=
 style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);p=
adding-left:1ex">On Mon, Jul 01, 2019 at 08:57:28PM +0800, Li Wang wrote:<b=
r>
&gt; On Mon, Jul 1, 2019 at 8:02 PM Paolo Bonzini &lt;<a href=3D"mailto:pbo=
nzini@redhat.com" target=3D"_blank">pbonzini@redhat.com</a>&gt; wrote:<br>
&gt; <br>
&gt; &gt; On 01/07/19 09:50, Li Wang wrote:<br>
&gt; &gt; &gt; Hello there,<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; LTP/umip_basic_test get failed on KVM UMIP<br>
&gt; &gt; &gt; system(kernel-v5.2-rc4.x86_64). The test is only trying to d=
o<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 asm volatile(&quot;smsw %0\n&quot; : &qu=
ot;=3Dm&quot; (val));<br>
&gt; &gt; &gt; and expect to get SIGSEGV in this SMSW operation, but it exi=
ts with 0<br>
&gt; &gt; &gt; unexpectedly.<br>
&gt; &gt;<br>
&gt; &gt; In addition to what Thomas said, perhaps you are using a host tha=
t does<br>
&gt; &gt; *not* have UMIP, and configuring KVM to emulate it(*).=C2=A0 In t=
hat case, it<br>
&gt; &gt; is not possible to intercept SMSW, and therefore it will incorrec=
tly<br>
&gt; &gt; succeed.<br>
&gt; &gt;<br>
&gt; <br>
&gt; Right, I checked the host system, and confirmed that CPU doesn&#39;t s=
upport<br>
&gt; UMIP.<br>
&gt; <br>
&gt; &gt;<br>
&gt; &gt; Paolo<br>
&gt; &gt;<br>
&gt; &gt; (*) before the x86 people jump at me, this won&#39;t happen unles=
s you<br>
&gt; &gt; explicitly pass an option to QEMU, such as &quot;-cpu host,+umip&=
quot;. :)=C2=A0 The<br>
&gt; &gt; incorrect emulation of SMSW when CR4.UMIP=3D1 is why.<br>
&gt; &gt;<br>
&gt; Good to know this, is there any document for that declaration? It seem=
s<br>
&gt; neither LTP issue nor kernel bug here. But anyway we&#39;d better do s=
omething<br>
&gt; to avoid the error in the test.<br>
<br>
The test case already checks for umip in /proc/cpuinfo, right? And in<br>
long mode it always expects a SIGSEGV signal. If you did not add -cpu host,=
+umip,<br>
how come umip was present in /proc/cpuinfo?<br></blockquote><div><br></div>=
<div><div class=3D"gmail_default" style=3D"font-size:small">Yes, right.=C2=
=A0</div><div class=3D"gmail_default" style=3D"font-size:small"><br></div><=
div class=3D"gmail_default" style=3D"font-size:small">But the KVM guest is =
not customized in manual, I reserved that system for automation test and di=
d not aware of the &#39;-cpu host,+umip,&#39; parameter until Paolo points =
it out. In the last email, I was hoping to find a way to recognize this sit=
uation for the LTP test intelligently.</div></div><div><br></div></div><div=
 class=3D"gmail_default" style=3D"font-size:small">Thank you all for a repl=
y to this.</div><div><br></div>-- <br><div dir=3D"ltr" class=3D"gmail_signa=
ture"><div dir=3D"ltr"><div>Regards,<br></div><div>Li Wang<br></div></div><=
/div></div>

--000000000000986da4058ca90054--

--===============0874910484==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============0874910484==--
