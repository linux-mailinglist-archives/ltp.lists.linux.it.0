Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 03C58375EF5
	for <lists+linux-ltp@lfdr.de>; Fri,  7 May 2021 05:02:50 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 58FD13C71EA
	for <lists+linux-ltp@lfdr.de>; Fri,  7 May 2021 05:02:49 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 0E41D3C19D6
 for <ltp@lists.linux.it>; Fri,  7 May 2021 05:02:44 +0200 (CEST)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id B4F1D601E87
 for <ltp@lists.linux.it>; Fri,  7 May 2021 05:02:43 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620356562;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=xAa+XKexORmWH2Byklymaa13IDQu10GSk1Po1qJG738=;
 b=VLMBgZFogcv5QexN6zs1P3TK/VkPp9/erskBED1HtRsu5jKCddmafpLwbZvRJVnDiMRsk/
 +IeoxqhFsQf2icluA4R8TavfzmkgtlXFYfJu893esno3eXKVbJQujdpQ3jWEcU5K19g/gv
 VsWBvrSOr+yqCL4FN/DCZdrFX2s7hAU=
Received: from mail-yb1-f198.google.com (mail-yb1-f198.google.com
 [209.85.219.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-323-cav1bnxoMP2K-AWUOjZeIQ-1; Thu, 06 May 2021 23:02:39 -0400
X-MC-Unique: cav1bnxoMP2K-AWUOjZeIQ-1
Received: by mail-yb1-f198.google.com with SMTP id
 c8-20020a5b01480000b02904f8087bdbf4so8392512ybp.9
 for <ltp@lists.linux.it>; Thu, 06 May 2021 20:02:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=xAa+XKexORmWH2Byklymaa13IDQu10GSk1Po1qJG738=;
 b=YGv2euXQkCtjsXUXWAesZ4LvCEyYocfPHE2oU86Hkws/EjXfIO4ex0WxgmmZAFQWhF
 QDhMQCLq3rzrK65B9RGBLbofV7z3nmrWEflp8po9LmIX3HmsLK82G2GXYobdUOyXWIPH
 w3Ln8n2dUFmA4CO5elzXQ48H5s9zm8r/cqM0nag7VlVZR1RtV5WJEUOnAQDrYTVBw9P7
 lupZmhfmLyf8DNwZVkSDbp/dJ/sUIG4laHfY7cqX/KHBnp8/KbygtB/E7WI0+qH8UP3N
 Jd+6dTkZIWZh2EH09nDgIVSzodL4VjvC4oGMU+wdqsig5K16tGW9+dXY+aP9YmaQgFpL
 +cTA==
X-Gm-Message-State: AOAM532KUth0ZfZocplb8x/wIvOjjSAtiHoY5bm4iRSd+UoXP9ktsWf2
 4Y7nVosmNFXcr6klh22PeKvibeZVbocxtIo8zKMRbuvAT6uOiHjQqolVS0dJ3w5YwQbYJBIpAC1
 8pF9Xm981ag9HeZpa+GXwAxnwszg=
X-Received: by 2002:a25:1189:: with SMTP id 131mr10562669ybr.286.1620356559294; 
 Thu, 06 May 2021 20:02:39 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxnQ+Tl14RqKt+cKnBZpTwfbe7xGTSCCJg7UMXwrPlnLos5twL2vaT4QHPaEQu2xFeI8p3+N8j4muIx9kGhqBc=
X-Received: by 2002:a25:1189:: with SMTP id 131mr10562641ybr.286.1620356559066; 
 Thu, 06 May 2021 20:02:39 -0700 (PDT)
MIME-Version: 1.0
References: <20210224213114.2976705-1-Liam.Howlett@Oracle.com>
 <20210224213114.2976705-2-Liam.Howlett@Oracle.com>
 <CAEemH2cKR98HvHZ6OYJpLpaX9-5hfhTak650=DtU-q2Yoo6kbA@mail.gmail.com>
 <20210323162714.t5dm5vbo35vl4t2l@revolver>
 <CAEemH2fnyB_dGzQWUb7SBi9S01vYGXaZBczj2ZwaYF-Rqv9UsA@mail.gmail.com>
 <20210325131545.jwrzhdy474utqjpa@revolver>
 <CAEemH2fOBjn-HkcrDZAam1YZkKLm1rLwOnG-KoGGjRQH59e3Pg@mail.gmail.com>
 <YF26tr2CKGSjRsq5@pevik> <20210326161348.vcztygn5kb5ki2hn@revolver>
In-Reply-To: <20210326161348.vcztygn5kb5ki2hn@revolver>
From: Li Wang <liwang@redhat.com>
Date: Fri, 7 May 2021 11:02:27 +0800
Message-ID: <CAEemH2f0vBDuBPH9teZzmEhcfVLhm0ieK7qCZ5UDLTmyc61-5Q@mail.gmail.com>
To: Liam Howlett <liam.howlett@oracle.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=liwan@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,HTML_MESSAGE,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2 1/1] brk02: Add test for removing more than one
 VMA
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
Cc: "ltp@lists.linux.it" <ltp@lists.linux.it>
Content-Type: multipart/mixed; boundary="===============0211555683=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============0211555683==
Content-Type: multipart/alternative; boundary="0000000000001cef7205c1b4a9ee"

--0000000000001cef7205c1b4a9ee
Content-Type: text/plain; charset="UTF-8"

Hi Laim and all,

On Sat, Mar 27, 2021 at 12:14 AM Liam Howlett <liam.howlett@oracle.com>
wrote:

> * Petr Vorel <pvorel@suse.cz> [210326 06:43]:
> > Hi Liam, Li,
> >
> > > > This was my test platform.  I also sent it to the Travis CI which
> passed
> > > > for x86_64.  I will re-examine the accepted code to ensure the
> cosmetic
> > > > changes didn't invalidate my testing.
> >
> > > FWIK, the Travis CI does not run test case, it just compiles/builds LTP
> > > across
> > > many arches/platforms.
> >
> > Yes, while KernelCI and some enterprise / embedded distros for their
> kernels run
> > LTP testcases, the project does not run it. Cyril run some regression
> tests for
> > few most important runtests before release manually. But having a server
> it'd be
> > handy to run them.
>
>
> Thank you for clarification.  What is the best way to re-test my
> changes?  As I had said, I made a change that will not add EXEC but will
>

No best way I guess, it would be great if you can do more arches
verification before patch sending, but then the maintainers would
help do that also.



> still test removal of more than one VMA.  We cannot just mprotect
> PROT_READ|PROT_WRITE as this will allow VMA merging to occur.  My
> solution is to change the anon vma to just PROT_READ.  It passes in my
> x86_64 test but since that was the case for me regardless, I cannot say
> that I have fixed the issue, but I have verified that the test still
> does what I expect it to do.
>

I'm fine with just test PROT_READ. And we can take this way to fix
the FAIL before the next LTP release.

But there is still a query in my mind, whether the FAIL I mentioned before
is a kernel bug or just caused by preventing process Self Modiefed Code,
that probably needs more investigation.



>
>
> Thanks,
> Liam
>
> Patch below.
> -------------------------------------------
>
> +++ b/testcases/kernel/syscalls/brk/brk02.c
> @@ -36,8 +36,7 @@ void brk_down_vmas(void)
>                 return;
>         }
>
> -       if (mprotect(addr - page_size, page_size,
> -                    PROT_READ|PROT_WRITE|PROT_EXEC)) {
> +       if (mprotect(addr - page_size, page_size, PROT_READ)) {
>                 tst_res(TFAIL, "Cannot mprotect new VMA");
>                 return;
>         }
>
>

-- 
Regards,
Li Wang

--0000000000001cef7205c1b4a9ee
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small">Hi Laim and all,</div><div class=3D"gmail_default" style=3D"f=
ont-size:small"><br></div></div><div class=3D"gmail_quote"><div dir=3D"ltr"=
 class=3D"gmail_attr">On Sat, Mar 27, 2021 at 12:14 AM Liam Howlett &lt;<a =
href=3D"mailto:liam.howlett@oracle.com" target=3D"_blank">liam.howlett@orac=
le.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"m=
argin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left=
:1ex">* Petr Vorel &lt;<a href=3D"mailto:pvorel@suse.cz" target=3D"_blank">=
pvorel@suse.cz</a>&gt; [210326 06:43]:<br>
&gt; Hi Liam, Li,<br>
&gt; <br>
&gt; &gt; &gt; This was my test platform.=C2=A0 I also sent it to the Travi=
s CI which passed<br>
&gt; &gt; &gt; for x86_64.=C2=A0 I will re-examine the accepted code to ens=
ure the cosmetic<br>
&gt; &gt; &gt; changes didn&#39;t invalidate my testing.<br>
&gt; <br>
&gt; &gt; FWIK, the Travis CI does not run test case, it just compiles/buil=
ds LTP<br>
&gt; &gt; across<br>
&gt; &gt; many arches/platforms.<br>
&gt; <br>
&gt; Yes, while KernelCI and some enterprise / embedded distros for their k=
ernels run<br>
&gt; LTP testcases, the project does not run it. Cyril run some regression =
tests for<br>
&gt; few most important runtests before release manually. But having a serv=
er it&#39;d be<br>
&gt; handy to run them.<br>
<br>
<br>
Thank you for clarification.=C2=A0 What is the best way to re-test my<br>
changes?=C2=A0 As I had said, I made a change that will not add EXEC but wi=
ll<br></blockquote><div><br></div><div><div class=3D"gmail_default" style=
=3D"font-size:small">No best way I guess, it would be great if you can do m=
ore arches</div><div class=3D"gmail_default" style=3D"font-size:small">veri=
fication before patch sending, but then the maintainers would</div><div cla=
ss=3D"gmail_default" style=3D"font-size:small">help do that also.</div><br>=
</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0p=
x 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
still test removal of more than one VMA.=C2=A0 We cannot just mprotect<br>
PROT_READ|PROT_WRITE as this will allow VMA merging to occur.=C2=A0 My<br>
solution is to change the anon vma to just PROT_READ.=C2=A0 It passes in my=
<br>
x86_64 test but since that was the case for me regardless, I cannot say<br>
that I have fixed the issue, but I have verified that the test still<br>
does what I expect it to do.<br></blockquote><div><br></div><div><div class=
=3D"gmail_default" style=3D"font-size:small">I&#39;m fine with just test PR=
OT_READ. And we can take this way to fix</div><div class=3D"gmail_default" =
style=3D"font-size:small">the FAIL before the next LTP release.</div><div c=
lass=3D"gmail_default" style=3D"font-size:small"><br></div><div class=3D"gm=
ail_default" style=3D"font-size:small">But there is still a query in my min=
d, whether the FAIL I mentioned before</div><div class=3D"gmail_default" st=
yle=3D"font-size:small">is a kernel bug or just caused by preventing proces=
s Self Modiefed=C2=A0Code,</div><div class=3D"gmail_default" style=3D"font-=
size:small">that probably needs more investigation.</div><br></div><div>=C2=
=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8e=
x;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
<br>
Thanks,<br>
Liam<br>
<br>
Patch below.<br>
-------------------------------------------<br>
<br>
+++ b/testcases/kernel/syscalls/brk/brk02.c<br>
@@ -36,8 +36,7 @@ void brk_down_vmas(void)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if (mprotect(addr - page_size, page_size,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 PROT=
_READ|PROT_WRITE|PROT_EXEC)) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (mprotect(addr - page_size, page_size, PROT_=
READ)) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 tst_res(TFAIL, &quo=
t;Cannot mprotect new VMA&quot;);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
<br>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr"=
><div dir=3D"ltr"><div>Regards,<br></div><div>Li Wang<br></div></div></div>=
</div>

--0000000000001cef7205c1b4a9ee--


--===============0211555683==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============0211555683==--

