Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 69AC73B5851
	for <lists+linux-ltp@lfdr.de>; Mon, 28 Jun 2021 06:27:52 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 2DEFE3C5771
	for <lists+linux-ltp@lfdr.de>; Mon, 28 Jun 2021 06:27:52 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id C7FA03C21F2
 for <ltp@lists.linux.it>; Mon, 28 Jun 2021 06:27:50 +0200 (CEST)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 5CD731A0081A
 for <ltp@lists.linux.it>; Mon, 28 Jun 2021 06:27:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1624854467;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=A88g9AUduFdDeKi1TkN2bgR0S6HHsxzcjfnyGrro/nY=;
 b=Oee2g0mTytl6y/G+qJxcpe9ta0FqPFeVkK+URtbbOkDaqM7C0qLF33P7M6A1KKU4qVT0ii
 6cPXVhx8AYMndN/2MmMwxkk42avh+Hj2U54ZCh5/yN/C5cvu2IT+CDZhMg+iu2DNWI9Ide
 TxrlTUzkZqSSq1VwwX4lmg4E2uKtQ8U=
Received: from mail-yb1-f197.google.com (mail-yb1-f197.google.com
 [209.85.219.197]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-142-ixCSGCXBMny2BYiwCeQkeQ-1; Mon, 28 Jun 2021 00:27:45 -0400
X-MC-Unique: ixCSGCXBMny2BYiwCeQkeQ-1
Received: by mail-yb1-f197.google.com with SMTP id
 k32-20020a25b2a00000b0290557cf3415f8so3465331ybj.1
 for <ltp@lists.linux.it>; Sun, 27 Jun 2021 21:27:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=IGLcMaMgsa9LJ3775mh79kwPA+lcSGShlQVkJpWu2Ww=;
 b=OqheD8eUL6QJZWGjvufQMmMPVRUI5o8RJ+H5OPtpsDJU2sAPKDeQOgY0UYFb3f4pbr
 MW4POQSGiDdPXlx9KHtLJTAzWxJU5qqVdNwi45cONfIvDdbM/ZID9qvxvA9i5ZZ6DHYG
 pqvfpMai38q5Z5UyMYl/O6gWeyn/gru9GwUaCjLmAkcaACJFIw1kQGd+DaUa4sA2fuNe
 jbBlAsZZ9U0V+mNjZjRb2T8rN87XWQUttgAmrCkhO8RHFJ4mstyg9c5SQKGWGogxCNRM
 NKCHWsdgkN1bzevK4w/SOsWmCUF+AeK5DqNDRF2Khx1gN3ApLj2qctBMajnHL2+JV8+s
 hl0Q==
X-Gm-Message-State: AOAM530Vl6CTMfHPoM6Q1Z+DCRLnOW5S9wk2EZooAoYOUYppsouOsEI6
 CjxpWqobiQWLsBHYc5TGgzcFr0PQnB+QiUnEpV0OqwStpQ3N9VooIzjHUxYn2aARoqALEVB1z83
 3KQ+edmzEpIzCM0UFAe1ElDfGolg=
X-Received: by 2002:a25:3882:: with SMTP id
 f124mr27454982yba.110.1624854464487; 
 Sun, 27 Jun 2021 21:27:44 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwXKQNx9Zw7tMEgvqFOcxzrnnRljaxlwwXu2FnXn035qsrX9J+MqSwuuxPvt/jA5WUpKVQUGmDL4kObe6sDses=
X-Received: by 2002:a25:3882:: with SMTP id
 f124mr27454954yba.110.1624854464224; 
 Sun, 27 Jun 2021 21:27:44 -0700 (PDT)
MIME-Version: 1.0
References: <20210628115740.5da3dbfda1c263f95d66c77a@uniontech.com>
In-Reply-To: <20210628115740.5da3dbfda1c263f95d66c77a@uniontech.com>
From: Li Wang <liwang@redhat.com>
Date: Mon, 28 Jun 2021 12:27:32 +0800
Message-ID: <CAEemH2cMAEuf_Qx-UE8LFX_1zB6N=p=RzJUXr2+tLAFLHuqg9A@mail.gmail.com>
To: gouhao@uniontech.com
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=liwan@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,HTML_MESSAGE,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] fix cpuhotplug04 check last cpu error
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
Cc: weidong@uniontech.com, jiaofenfang@uniontech.com,
 LTP List <ltp@lists.linux.it>
Content-Type: multipart/mixed; boundary="===============1661315605=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============1661315605==
Content-Type: multipart/alternative; boundary="00000000000026f66505c5cbe9bc"

--00000000000026f66505c5cbe9bc
Content-Type: text/plain; charset="UTF-8"

On Mon, Jun 28, 2021 at 11:58 AM <gouhao@uniontech.com> wrote:

> This change makes sense.
>
> On my computer, the last CPU can't be offline, which causes the execution
> of this testcase to fail.
>

But the CPU0 on your system will always online, so the last one should be
offline safely.
If it not, that might a kernel issue I guess.

>
> However, the testcase makes special treatment to the last CPU. If the last
> CPU cannot be offline, the execution result of the testcase should not be
> affected.
>

Yes, but from cpuhotplug04.sh comment line#84:

# If all the CPUs are hotpluggable, we expect
# that the kernel will refuse to offline the last CPU.
# If only some of the CPUs are hotpluggable,
# they all can be offlined.

How do you think of this description? In your system, it obviously belongs
to
the second scenario that the cpu0 is online and you should be able to
offline
all the remaining hotplugged one, isn't it?

>
> Therefore, if cpu0 does not have an online file, it will lead to an error
> in the judgment of the last CPU.
>

If cpu0 does not have an online file, that means the last CPU (hotplugged)
can be offline as well.
To verify this assumption, you can try manually offline CPU one by one,
this time I suggest you
try the last one first.

-- 
Regards,
Li Wang

--00000000000026f66505c5cbe9bc
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote"><div dir=3D"lt=
r" class=3D"gmail_attr">On Mon, Jun 28, 2021 at 11:58 AM &lt;<a href=3D"mai=
lto:gouhao@uniontech.com">gouhao@uniontech.com</a>&gt; wrote:<br></div><blo=
ckquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left=
:1px solid rgb(204,204,204);padding-left:1ex"> <div><div><div id=3D"gmail-m=
_-854401823071140671MailBelowDiv"></div><div style=3D"overflow-wrap: break-=
word;"><div>This change makes sense.</div><div><br></div><div>On my compute=
r, the last CPU can&#39;t be offline, which causes the execution of this te=
stcase to fail.</div></div></div></div></blockquote><div><br></div><div cla=
ss=3D"gmail_default" style=3D"font-size:small">But the CPU0 on your system =
will always online, so the last one should be offline=C2=A0safely.</div><di=
v class=3D"gmail_default" style=3D"font-size:small">If it not, that might a=
 kernel issue I guess.</div><div class=3D"gmail_default" style=3D"font-size=
:small"></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px=
 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div><div><=
div style=3D"overflow-wrap: break-word;"><div><br></div><div>However, the t=
estcase makes special treatment to the last CPU. If the last CPU cannot be =
offline, the execution result of the testcase should not be affected.</div>=
</div></div></div></blockquote><div><br></div><div class=3D"gmail_default" =
style=3D"font-size:small">Yes, but from cpuhotplug04.sh comment line#84: </=
div><div class=3D"gmail_default" style=3D"font-size:small"><br></div><div c=
lass=3D"gmail_default" style=3D"font-size:small">=09=09# If all the CPUs ar=
e hotpluggable, we expect<br>=09=09# that the kernel will refuse to offline=
 the last CPU.<br>=09=09# If only some of the CPUs are hotpluggable,<br>=09=
=09# they all can be offlined.<br></div><div class=3D"gmail_default" style=
=3D"font-size:small"><br></div><div class=3D"gmail_default" style=3D"font-s=
ize:small">How do you think of this description? In your system, it obvious=
ly=C2=A0belongs to</div><div class=3D"gmail_default" style=3D"font-size:sma=
ll">the second scenario that the cpu0 is online and you should be able to o=
ffline</div><div class=3D"gmail_default" style=3D"font-size:small">all the =
remaining hotplugged=C2=A0one, isn&#39;t=C2=A0it?</div><div class=3D"gmail_=
default" style=3D"font-size:small"></div><blockquote class=3D"gmail_quote" =
style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);pa=
dding-left:1ex"><div><div><div style=3D"overflow-wrap: break-word;"><div><b=
r></div><div>Therefore, if cpu0 does not have an online file, it will lead =
to an error in the judgment of the last CPU.</div></div></div></div></block=
quote><div><br></div><div class=3D"gmail_default" style=3D"font-size:small"=
>If cpu0 does not have an online file, that means the last CPU (hotplugged)=
 can be offline as well.</div><div class=3D"gmail_default" style=3D"font-si=
ze:small">To verify this assumption, you can try manually offline CPU one b=
y one, this time I suggest you</div><div class=3D"gmail_default" style=3D"f=
ont-size:small">try the last one first.</div></div><div><br></div>-- <br><d=
iv dir=3D"ltr" class=3D"gmail_signature"><div dir=3D"ltr"><div>Regards,<br>=
</div><div>Li Wang<br></div></div></div></div>

--00000000000026f66505c5cbe9bc--


--===============1661315605==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============1661315605==--

