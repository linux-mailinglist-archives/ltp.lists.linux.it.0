Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 24EAD2A256E
	for <lists+linux-ltp@lfdr.de>; Mon,  2 Nov 2020 08:41:32 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 879983C3052
	for <lists+linux-ltp@lfdr.de>; Mon,  2 Nov 2020 08:41:31 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 by picard.linux.it (Postfix) with ESMTP id 45FCD3C23B9
 for <ltp@lists.linux.it>; Mon,  2 Nov 2020 08:41:27 +0100 (CET)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [63.128.21.124])
 by in-7.smtp.seeweb.it (Postfix) with ESMTP id 7F1E6200BD2
 for <ltp@lists.linux.it>; Mon,  2 Nov 2020 08:41:25 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1604302885;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=5UURMUEaswr+xebffPOUTaEXLsuljarzBpjQuM9eyQ0=;
 b=XTm7lVOcerYHN9TwhjTjDFtd15I940j4FWEMOK6mE7L/tcSAb4nLY5/XYbzUVT3cr8Dr/Y
 jMKFsDs1NkqYGXGHD3t8DlUCnLzueFBiOa7yO74APS1D0LHUIxc+XbhzP4zgPn5JLPQcia
 mMo014hqGpwUXXuiZn1YC174p8d3eY0=
Received: from mail-yb1-f200.google.com (mail-yb1-f200.google.com
 [209.85.219.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-238-ARD24wXXPr2lXAKfurCkDw-1; Mon, 02 Nov 2020 02:41:22 -0500
X-MC-Unique: ARD24wXXPr2lXAKfurCkDw-1
Received: by mail-yb1-f200.google.com with SMTP id y11so13259839ybm.22
 for <ltp@lists.linux.it>; Sun, 01 Nov 2020 23:41:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=5UURMUEaswr+xebffPOUTaEXLsuljarzBpjQuM9eyQ0=;
 b=F0qeezVY0xYexbMabHuM6CUHX7T9TzWuuamY6jOW6rjBd/O+Wi3J9Weeg0ILAj+i9a
 dHPAYmkmhfeI29tfQaXC2d3/6wF/4LPp6m8Dvpdp8lYJBKU1ygcOubZp4QKI+64AA+Ye
 pYscIPW0x950YNZbmBlW30kvqcJPNsfnrwdRSwWRqrXHmCUcdbLxLdTAVaLczm21mG9f
 TYaKKGnh77CiLjiB6Chps4CilVHFlTdPfYiv67OSz5AlN8ct/EZRp912aFEDngNyEtGm
 zrfwZYVLqMyTxH8s4NokBO2vEvAbPJ6Xfp4N3feNnFTAk2gwuOrk2vLQhwyjG+8WZPEc
 Sm5A==
X-Gm-Message-State: AOAM531g8OqVqrj04fiz3TcEuzYf54rHPRzYlGRFFXUaCxXRYNkXVANk
 hxW6eHt/yrToqNdZfw6f2CVliiz4JM4WIAI6IzA6GB4VZ/1uQS1cBL+yYymWadzZydXRtkLRQqJ
 eEG4H/HrIiVJOjRG0kLuOqfhYNCI=
X-Received: by 2002:a25:ae47:: with SMTP id g7mr20180075ybe.110.1604302881978; 
 Sun, 01 Nov 2020 23:41:21 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxrTBi0HfURD6xaebb6q0IwbHzHRTDF3JplX7PgoIbkm8WsJ8Tmiw7oVS1A3cNtSCOUxejWyuoRMuM5eK00oYA=
X-Received: by 2002:a25:ae47:: with SMTP id g7mr20180061ybe.110.1604302881726; 
 Sun, 01 Nov 2020 23:41:21 -0800 (PST)
MIME-Version: 1.0
References: <1604298483-18563-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
In-Reply-To: <1604298483-18563-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
From: Li Wang <liwang@redhat.com>
Date: Mon, 2 Nov 2020 15:41:10 +0800
Message-ID: <CAEemH2dLV3g7P4+FwuBaL06UDt3Ae_k+6JCQMJ_221AGqCRDNQ@mail.gmail.com>
To: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=liwan@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,HTML_MESSAGE,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] syscalls/ptrace08: Add another linux tag
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
Content-Type: multipart/mixed; boundary="===============1415249754=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============1415249754==
Content-Type: multipart/alternative; boundary="00000000000060c4b705b31adf65"

--00000000000060c4b705b31adf65
Content-Type: text/plain; charset="UTF-8"

On Mon, Nov 2, 2020 at 2:28 PM Yang Xu <xuyang2018.jy@cn.fujitsu.com> wrote:

> Since "syscall/ptrace08: Simplify the test", on older kernels we check
> that the
> POKEUSER to dr7 that enables the breakpoint fails properly after the dr0
> has been
> set to an address in the kernel range.
>
> on centos7.8GA, it can expose a failure as below:
> tst_test.c:1250: TINFO: Timeout per run is 0h 05m 00s
> tst_kernel.c:79: TINFO: uname.machine=x86_64 kernel is 64bit
> ptrace08.c:90: TINFO: Trying address 0xffff800000000000
> ptrace08.c:120: TPASS: ptrace() breakpoint with kernel addr failed: EINVAL
> (22)
> ptrace08.c:129: TINFO: 0xffff800000000000
> ptrace08.c:90: TINFO: Trying address 0xffffffffffffffff
> ptrace08.c:116: TFAIL: ptrace() breakpoint with kernel addr succeeded
> ptrace08.c:129: TINFO: 0xffffffffffffffff
> ptrace08.c:90: TINFO: Trying address 0xffffbfffffffffff
> ptrace08.c:120: TPASS: ptrace() breakpoint with kernel addr failed: EINVAL
> (22)
> ptrace08.c:129: TINFO: 0xffffbfffffffffff
>
> It fails because x86 hw_breakpoint code can't parse this
> 0xffffffffffffffff kernel
> address on x86_64 platform.
>
> arch/x86/kernel/hw_breakpoint.c
>  int arch_check_bp_in_kernelspace(struct perf_event *bp)
>         return (va >= TASK_SIZE) && ((va + len - 1) >= TASK_SIZE);
>
> TASK_SIZE is small and value will overflow if we use 0xffffffffffffffff
> address
> (va is unsigned long and len is unsigned int).
>
> Signed-off-by: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
>

Patch applied. Thanks!

-- 
Regards,
Li Wang

--00000000000060c4b705b31adf65
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote"><div dir=3D"lt=
r" class=3D"gmail_attr">On Mon, Nov 2, 2020 at 2:28 PM Yang Xu &lt;<a href=
=3D"mailto:xuyang2018.jy@cn.fujitsu.com">xuyang2018.jy@cn.fujitsu.com</a>&g=
t; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0p=
x 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Since =
&quot;syscall/ptrace08: Simplify the test&quot;, on older kernels we check =
that the<br>
POKEUSER to dr7 that enables the breakpoint fails properly after the dr0 ha=
s been<br>
set to an address in the kernel range.<br>
<br>
on centos7.8GA, it can expose a failure as below:<br>
tst_test.c:1250: TINFO: Timeout per run is 0h 05m 00s<br>
tst_kernel.c:79: TINFO: uname.machine=3Dx86_64 kernel is 64bit<br>
ptrace08.c:90: TINFO: Trying address 0xffff800000000000<br>
ptrace08.c:120: TPASS: ptrace() breakpoint with kernel addr failed: EINVAL =
(22)<br>
ptrace08.c:129: TINFO: 0xffff800000000000<br>
ptrace08.c:90: TINFO: Trying address 0xffffffffffffffff<br>
ptrace08.c:116: TFAIL: ptrace() breakpoint with kernel addr succeeded<br>
ptrace08.c:129: TINFO: 0xffffffffffffffff<br>
ptrace08.c:90: TINFO: Trying address 0xffffbfffffffffff<br>
ptrace08.c:120: TPASS: ptrace() breakpoint with kernel addr failed: EINVAL =
(22)<br>
ptrace08.c:129: TINFO: 0xffffbfffffffffff<br>
<br>
It fails because x86 hw_breakpoint code can&#39;t parse this 0xffffffffffff=
ffff kernel<br>
address on x86_64 platform.<br>
<br>
arch/x86/kernel/hw_breakpoint.c<br>
=C2=A0int arch_check_bp_in_kernelspace(struct perf_event *bp)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 return (va &gt;=3D TASK_SIZE) &amp;&amp; ((va +=
 len - 1) &gt;=3D TASK_SIZE);<br>
<br>
TASK_SIZE is small and value will overflow if we use 0xffffffffffffffff add=
ress<br>
(va is unsigned long and len is unsigned int).<br>
<br>
Signed-off-by: Yang Xu &lt;<a href=3D"mailto:xuyang2018.jy@cn.fujitsu.com" =
target=3D"_blank">xuyang2018.jy@cn.fujitsu.com</a>&gt;<br></blockquote><div=
><br></div><div class=3D"gmail_default" style=3D"font-size:small">Patch app=
lied. Thanks!</div></div><div><br></div>-- <br><div dir=3D"ltr" class=3D"gm=
ail_signature"><div dir=3D"ltr"><div>Regards,<br></div><div>Li Wang<br></di=
v></div></div></div>

--00000000000060c4b705b31adf65--


--===============1415249754==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============1415249754==--

