Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 785A4197329
	for <lists+linux-ltp@lfdr.de>; Mon, 30 Mar 2020 06:24:49 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id BC43A3C3206
	for <lists+linux-ltp@lfdr.de>; Mon, 30 Mar 2020 06:24:48 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 by picard.linux.it (Postfix) with ESMTP id 006E13C31C3
 for <ltp@lists.linux.it>; Mon, 30 Mar 2020 06:24:43 +0200 (CEST)
Received: from us-smtp-delivery-74.mimecast.com
 (us-smtp-delivery-74.mimecast.com [63.128.21.74])
 by in-7.smtp.seeweb.it (Postfix) with ESMTP id A27F320090F
 for <ltp@lists.linux.it>; Mon, 30 Mar 2020 06:24:42 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1585542281;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=8OM2HYNKgNBMYDBrbceOvtYgUHHsIsPKuuR7IpUuQpY=;
 b=iX/47YBT+rarzP2vNAJHVi/hIkvokMfeG1R0k+pJMd60iF8MkFYiINlIFYS7hJHYAMwbYo
 8vR4UGgIQtcuNG5VI6dh6DhHjYV56McazWAtsQCADdMjGmNmwmTmLpUR3rDTVoD6IQrBRX
 MroPKPR59umwFYfYkcjFrCK0m8gN3zg=
Received: from mail-lf1-f70.google.com (mail-lf1-f70.google.com
 [209.85.167.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-460-eVV5fCPdNA6V46ULxAiIhg-1; Mon, 30 Mar 2020 00:24:35 -0400
X-MC-Unique: eVV5fCPdNA6V46ULxAiIhg-1
Received: by mail-lf1-f70.google.com with SMTP id m12so7043065lfj.5
 for <ltp@lists.linux.it>; Sun, 29 Mar 2020 21:24:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=b1HiVR55LvBtOjR2Hjy15s2RFftrF6qOaTSJDFezmjQ=;
 b=cVaTPOjIvzk47Sr3C10x1OFxhFTtTun7I2eK5N0dqnX2iSW1jWAdzijq9ESiRm1dT0
 7QIaCRy9BKfhlVq2BuR0ASU2THivZwZIWfpDyLJRSUIyuLDSVmgrj1pX81cT7VhnTO0A
 Gw0QhM2PDVGSPpzak2jfg1PlHwGqXw2OCj41033SrhvOWzJyIQthroUGR2+kCFbH1ztV
 AH+ZkiU+AgF+7/UGpoOJJavtjNXv33q0j9RiLRIWRW3/loHpi1S9iscPoZAIPSaAAmBV
 pjKuKE3Fcl0usYIKMtSx4LeAlpKBOfr+PaYAHKe7ZeBeFMXhpQPWWbI8r/zLbo7yGXZw
 xojQ==
X-Gm-Message-State: AGi0PuavpGCjJMPpBj2G9whir9AdSXOJTMp+qcHRF8CDuivb3sdX+RAu
 gbWdlJe7uIk5nSPhSHmw4iwXbTbe2FlCm1YvxeAVLwO2PIoo7PN2PACt4DhOySNT+UQNs9L69Do
 u/C+N4cmNjlvS36XJQThFVldd0t4=
X-Received: by 2002:a2e:a584:: with SMTP id m4mr6122540ljp.194.1585542274087; 
 Sun, 29 Mar 2020 21:24:34 -0700 (PDT)
X-Google-Smtp-Source: APiQypJPdyW5NMWlqp0TAdRt5TtNlaX39FcW2VqaXoAkGiPP/H0qXe+o/Tek7fjrf6wPElYRlNHkrioB2z1oebV5mPg=
X-Received: by 2002:a2e:a584:: with SMTP id m4mr6122531ljp.194.1585542273903; 
 Sun, 29 Mar 2020 21:24:33 -0700 (PDT)
MIME-Version: 1.0
References: <20200327213924.18816-1-pvorel@suse.cz>
 <4ff84a77-b858-6cae-a320-cfaed3646864@163.com>
 <20200328034253.GA2720439@x230>
In-Reply-To: <20200328034253.GA2720439@x230>
From: Li Wang <liwang@redhat.com>
Date: Mon, 30 Mar 2020 12:24:22 +0800
Message-ID: <CAEemH2e5i_N5FGsY6KZnfAN4k7cfLZU=XJvsg_AP8n=bV2JdrQ@mail.gmail.com>
To: Petr Vorel <pvorel@suse.cz>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.99.2 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,HTML_MESSAGE,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 0/6] C API: .needs_cmds and SAFE_RUN_CMD()
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
Content-Type: multipart/mixed; boundary="===============0404822606=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============0404822606==
Content-Type: multipart/alternative; boundary="00000000000003428605a20ad41a"

--00000000000003428605a20ad41a
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Mar 28, 2020 at 11:43 AM Petr Vorel <pvorel@suse.cz> wrote:

> Hi Xiao,
>
> > On 3/28/20 5:39 AM, Petr Vorel wrote:
> > > + There is a double check (first in
> > > .needs_cmds, then in SAFE_RUN_CMD()), maybe that's not needed.
>
> > Hi Petr,
>
> > Why do you need the duplicate .needs_cmds flag?(it introduces the doubl=
e
> > check as you said)
>
> > Usually, all tests run commands by tst_run_cmd()/SAFE_RUN_CMD() and the=
y
> can
> > report TCONF
>
> > by passing TST_RUN_CMD_CHECK_CMD so it is fair to be a part of
> > tst_run_cmd()/SAFE_RUN_CMD().
>
> Thanks for your review.
> I guess Cyril will prefer .needs_cmds, as it can be parsed - metadata
> project:
> https://people.kernel.org/metan/towards-parallel-kernel-test-runs
> https://github.com/metan-ucw/ltp/tree/master/docparse
>
> I put it there because some command might be run just under some conditio=
n
> (not
> always), thus not suitable for .needs_cmds, but still nice to have reliab=
le
> check. But maybe I'm wrong.
>

+1 you're right, I believe that is safer and choosable for the test.

--=20
Regards,
Li Wang

--00000000000003428605a20ad41a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote"><div dir=3D"lt=
r" class=3D"gmail_attr">On Sat, Mar 28, 2020 at 11:43 AM Petr Vorel &lt;<a =
href=3D"mailto:pvorel@suse.cz" target=3D"_blank">pvorel@suse.cz</a>&gt; wro=
te:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px =
0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Hi Xiao,<br>
<br>
&gt; On 3/28/20 5:39 AM, Petr Vorel wrote:<br>
&gt; &gt; + There is a double check (first in<br>
&gt; &gt; .needs_cmds, then in SAFE_RUN_CMD()), maybe that&#39;s not needed=
.<br>
<br>
&gt; Hi Petr,<br>
<br>
&gt; Why do you need the duplicate .needs_cmds flag?(it introduces the doub=
le<br>
&gt; check as you said)<br>
<br>
&gt; Usually, all tests run commands by tst_run_cmd()/SAFE_RUN_CMD() and th=
ey can<br>
&gt; report TCONF<br>
<br>
&gt; by passing TST_RUN_CMD_CHECK_CMD so it is fair to be a part of<br>
&gt; tst_run_cmd()/SAFE_RUN_CMD().<br>
<br>
Thanks for your review.<br>
I guess Cyril will prefer .needs_cmds, as it can be parsed - metadata proje=
ct:<br>
<a href=3D"https://people.kernel.org/metan/towards-parallel-kernel-test-run=
s" rel=3D"noreferrer" target=3D"_blank">https://people.kernel.org/metan/tow=
ards-parallel-kernel-test-runs</a><br>
<a href=3D"https://github.com/metan-ucw/ltp/tree/master/docparse" rel=3D"no=
referrer" target=3D"_blank">https://github.com/metan-ucw/ltp/tree/master/do=
cparse</a><br>
<br>
I put it there because some command might be run just under some condition =
(not<br>
always), thus not suitable for .needs_cmds, but still nice to have reliable=
<br>
check. But maybe I&#39;m wrong.<br></blockquote><div><span class=3D"gmail_d=
efault" style=3D"font-size:small"><br></span></div><div><span class=3D"gmai=
l_default" style=3D"font-size:small">+1 you&#39;re right, I believe that is=
 safer and choosable for the test.</span></div></div><div><br></div>-- <br>=
<div dir=3D"ltr"><div dir=3D"ltr"><div>Regards,<br></div><div>Li Wang<br></=
div></div></div></div>

--00000000000003428605a20ad41a--


--===============0404822606==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============0404822606==--

