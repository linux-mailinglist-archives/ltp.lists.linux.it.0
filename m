Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id A99A119737C
	for <lists+linux-ltp@lfdr.de>; Mon, 30 Mar 2020 06:40:10 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 6D1183C313A
	for <lists+linux-ltp@lfdr.de>; Mon, 30 Mar 2020 06:40:10 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 by picard.linux.it (Postfix) with ESMTP id 47FE03C3130
 for <ltp@lists.linux.it>; Mon, 30 Mar 2020 06:40:08 +0200 (CEST)
Received: from us-smtp-delivery-74.mimecast.com
 (us-smtp-delivery-74.mimecast.com [216.205.24.74])
 by in-2.smtp.seeweb.it (Postfix) with ESMTP id 522616010FF
 for <ltp@lists.linux.it>; Mon, 30 Mar 2020 06:40:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1585543205;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=vCkI5T/CoUoEgN5NisclxEiQ660YCIGFdRH3w7Ejv/c=;
 b=MoO6EdOfTxnpVa3wyBkbioxUwQe/RQJ9dN0AL35K690BJtL0fyrcRG1sbgnTlVa9R6eyrv
 vo0ToGamfvgbq6UhULJPFalxG+Dq+p4dsDfXJB24rSNk4eOOQUGF/ZKzcjhRjhldL3DcGV
 k1TPFZ5QqYB5x81Bm4+1xV+9+okidr0=
Received: from mail-lf1-f71.google.com (mail-lf1-f71.google.com
 [209.85.167.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-265-VLn4XB4SOhSHfEFltLToPw-1; Mon, 30 Mar 2020 00:40:03 -0400
X-MC-Unique: VLn4XB4SOhSHfEFltLToPw-1
Received: by mail-lf1-f71.google.com with SMTP id q4so6994036lff.4
 for <ltp@lists.linux.it>; Sun, 29 Mar 2020 21:40:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=vCkI5T/CoUoEgN5NisclxEiQ660YCIGFdRH3w7Ejv/c=;
 b=IeLoBCqfRr8CZB3zgfQtrWo5ZcS5uZGmV/wJ0mVzuhg3Q6umRg6VSA2HRfkbgHAQcY
 QlvaY8S/gO8X04SU5+rB4vpvq1JkCFh8W9a9Q80jyc0mtjUbjsHdKHu5E3oNMIFmJiBu
 MvjEwKVkdtcxUbdgqoNvoBPIVsv/k/aDlJeaZUEvkMRJklWTjW1YvxctQr1x88n62Y+s
 5Ec6s527ncc0FX1sHPwUREGTYJ9v309Pr8dsn/hJ9gpKpKfRMdCXftkX+guKepfz/pqL
 BwDl/XVzGZg+2a3kG4L4S1QtPdc28Jcfdezu5r86PibID2/rLwAEDgDTUXOnf2OBHrMs
 n1Fw==
X-Gm-Message-State: AGi0PubT4hs7NNZDXBNuaJiINchFFSwXQSKKUyAAVR05NG/NmfrHm/xx
 na28B5DHnr01iBjWYHCy/+pQzrcFnp81zoKNnyT16XFxe2M5jLcXMX0Ay2UbB6sMjQzlpNVUwMt
 q1Uo7pbmF0G5L52vs6jmKMQzDOzM=
X-Received: by 2002:a19:2391:: with SMTP id j139mr6693898lfj.147.1585543201690; 
 Sun, 29 Mar 2020 21:40:01 -0700 (PDT)
X-Google-Smtp-Source: APiQypL/PrbwCySYW0fdtNti77kc3VgMv5GycU+8jYCpjHE/MSVy8f6aCk86ksiBed5MGw5lSUj1JdGjO6DfdHr/ibU=
X-Received: by 2002:a19:2391:: with SMTP id j139mr6693891lfj.147.1585543201526; 
 Sun, 29 Mar 2020 21:40:01 -0700 (PDT)
MIME-Version: 1.0
References: <20200327213924.18816-1-pvorel@suse.cz>
 <4ff84a77-b858-6cae-a320-cfaed3646864@163.com>
 <20200328034253.GA2720439@x230> <5E80323C.5070408@cn.fujitsu.com>
In-Reply-To: <5E80323C.5070408@cn.fujitsu.com>
From: Li Wang <liwang@redhat.com>
Date: Mon, 30 Mar 2020 12:39:50 +0800
Message-ID: <CAEemH2chnkojt0oc9OVodwKOj27_7aTj1nHnkk_DVoOxUP-H7A@mail.gmail.com>
To: Xiao Yang <yangx.jy@cn.fujitsu.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.99.2 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,HTML_MESSAGE,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-2.smtp.seeweb.it
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
Content-Type: multipart/mixed; boundary="===============0603792851=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============0603792851==
Content-Type: multipart/alternative; boundary="0000000000004daadb05a20b0bc2"

--0000000000004daadb05a20b0bc2
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Xiao,

On Sun, Mar 29, 2020 at 1:36 PM Xiao Yang <yangx.jy@cn.fujitsu.com> wrote:

> On 2020/3/28 11:42, Petr Vorel wrote:
> > Hi Xiao,
> >
> >> On 3/28/20 5:39 AM, Petr Vorel wrote:
> >>> + There is a double check (first in
> >>> .needs_cmds, then in SAFE_RUN_CMD()), maybe that's not needed.
> >
> >> Hi Petr,
> >
> >> Why do you need the duplicate .needs_cmds flag?(it introduces the doub=
le
> >> check as you said)
> >
> >> Usually, all tests run commands by tst_run_cmd()/SAFE_RUN_CMD() and
> they can
> >> report TCONF
> >
> >> by passing TST_RUN_CMD_CHECK_CMD so it is fair to be a part of
> >> tst_run_cmd()/SAFE_RUN_CMD().
> >
> > Thanks for your review.
> > I guess Cyril will prefer .needs_cmds, as it can be parsed - metadata
> project:
> > https://people.kernel.org/metan/towards-parallel-kernel-test-runs
> > https://github.com/metan-ucw/ltp/tree/master/docparse
> Hi Petr=EF=BC=8C
>
> Thank you for sharing these info.
> Does Cyril want to get metadata from struct tst_test directly?
>
> How about the rough design?
> 1) .needs_cmds only saves the required commands.(doesn't do any check)
> 2) pass the corresponding member of .needs_cmds to
> tst_run_cmd()/SAFE_RUN_CMD()(do check in these functions).
> For example:
> ----------------------------------------------
> # grep tst_needs_cmds include/tst_cmd.h
> extern const char *const *tst_needs_cmds;
>
> # grep -B1 tst_needs_cmds lib/tst_test.c
>
> const char *const *tst_needs_cmds;
> --
>      if (tst_test->needs_cmds)
>          tst_needs_cmds =3D tst_test->needs_cmds;
>
> # grep -A2 'needs_cmds' testcases/kernel/syscalls/add_key/add_key05.c
>      const char *const cmd_useradd[] =3D {tst_needs_cmds[0], username, NU=
LL};
>      int rc;
>

I don't see any advantage of involving this struct in a test case, and it
also makes things more complicated.

IMO, the '.needs_cmds' should do check and guarantee all the
cmds exist. That's a hard requirement for the test. If a situation that the
commands are only part of the requirement(soft), we could avoid using
'.needs_cmds' in the test and just calling tst_run_cmd() without passing
TST_RUN_CMD_CHECK_CMD flag. This satisfies most situations we have, it is
safe enough and choosable for people.

Or maybe I'm wrong here too:).

--=20
Regards,
Li Wang

--0000000000004daadb05a20b0bc2
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small">Hi Xiao,</div></div><br><div class=3D"gmail_quote"><div dir=
=3D"ltr" class=3D"gmail_attr">On Sun, Mar 29, 2020 at 1:36 PM Xiao Yang &lt=
;<a href=3D"mailto:yangx.jy@cn.fujitsu.com">yangx.jy@cn.fujitsu.com</a>&gt;=
 wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px =
0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On 2020/=
3/28 11:42, Petr Vorel wrote:<br>
&gt; Hi Xiao,<br>
&gt;<br>
&gt;&gt; On 3/28/20 5:39 AM, Petr Vorel wrote:<br>
&gt;&gt;&gt; + There is a double check (first in<br>
&gt;&gt;&gt; .needs_cmds, then in SAFE_RUN_CMD()), maybe that&#39;s not nee=
ded.<br>
&gt;<br>
&gt;&gt; Hi Petr,<br>
&gt;<br>
&gt;&gt; Why do you need the duplicate .needs_cmds flag?(it introduces the =
double<br>
&gt;&gt; check as you said)<br>
&gt;<br>
&gt;&gt; Usually, all tests run commands by tst_run_cmd()/SAFE_RUN_CMD() an=
d they can<br>
&gt;&gt; report TCONF<br>
&gt;<br>
&gt;&gt; by passing TST_RUN_CMD_CHECK_CMD so it is fair to be a part of<br>
&gt;&gt; tst_run_cmd()/SAFE_RUN_CMD().<br>
&gt;<br>
&gt; Thanks for your review.<br>
&gt; I guess Cyril will prefer .needs_cmds, as it can be parsed - metadata =
project:<br>
&gt; <a href=3D"https://people.kernel.org/metan/towards-parallel-kernel-tes=
t-runs" rel=3D"noreferrer" target=3D"_blank">https://people.kernel.org/meta=
n/towards-parallel-kernel-test-runs</a><br>
&gt; <a href=3D"https://github.com/metan-ucw/ltp/tree/master/docparse" rel=
=3D"noreferrer" target=3D"_blank">https://github.com/metan-ucw/ltp/tree/mas=
ter/docparse</a><br>
Hi Petr=EF=BC=8C<br>
<br>
Thank you for sharing these info.<br>
Does Cyril want to get metadata from struct tst_test directly?<br>
<br>
How about the rough design?<br>
1) .needs_cmds only saves the required commands.(doesn&#39;t do any check)<=
br>
2) pass the corresponding member of .needs_cmds to <br>
tst_run_cmd()/SAFE_RUN_CMD()(do check in these functions).<br>
For example:<br>
----------------------------------------------<br>
# grep tst_needs_cmds include/tst_cmd.h<br>
extern const char *const *tst_needs_cmds;<br>
<br>
# grep -B1 tst_needs_cmds lib/tst_test.c<br>
<br>
const char *const *tst_needs_cmds;<br>
-- <br>
=C2=A0 =C2=A0 =C2=A0if (tst_test-&gt;needs_cmds)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tst_needs_cmds =3D tst_test-&gt;needs_cmd=
s;<br>
<br>
# grep -A2 &#39;needs_cmds&#39; testcases/kernel/syscalls/add_key/add_key05=
.c<br>
=C2=A0 =C2=A0 =C2=A0const char *const cmd_useradd[] =3D {tst_needs_cmds[0],=
 username, NULL};<br>
=C2=A0 =C2=A0 =C2=A0int rc;<br></blockquote><div><br></div><div><div class=
=3D"gmail_default" style=3D"font-size:small">I don&#39;t see any advantage =
of involving this struct in a test case, and it also makes things more comp=
licated.</div><div class=3D"gmail_default" style=3D"font-size:small"><br></=
div><div class=3D"gmail_default" style=3D"font-size:small">IMO, the &#39;.n=
eeds_cmds&#39; should do check and guarantee=C2=A0all the cmds=C2=A0exist.=
=C2=A0That&#39;s a hard requirement for the test. If a situation that the c=
ommands are only part of the requirement(soft), we could avoid using &#39;.=
needs_cmds&#39; in the test and just calling tst_run_cmd() without passing =
TST_RUN_CMD_CHECK_CMD flag. This satisfies most situations we have, it is s=
afe enough and choosable for people.</div><div class=3D"gmail_default" styl=
e=3D"font-size:small"><br></div></div><div class=3D"gmail_default" style=3D=
"font-size:small">Or maybe I&#39;m wrong here too:).</div><div class=3D"gma=
il_default" style=3D"font-size:small"><br></div></div>-- <br><div dir=3D"lt=
r" class=3D"gmail_signature"><div dir=3D"ltr"><div>Regards,<br></div><div>L=
i Wang<br></div></div></div></div>

--0000000000004daadb05a20b0bc2--


--===============0603792851==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============0603792851==--

