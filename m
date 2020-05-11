Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id E31A01CD9D4
	for <lists+linux-ltp@lfdr.de>; Mon, 11 May 2020 14:30:04 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 46BA73C561A
	for <lists+linux-ltp@lfdr.de>; Mon, 11 May 2020 14:30:04 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 by picard.linux.it (Postfix) with ESMTP id 63FB33C268D
 for <ltp@lists.linux.it>; Mon, 11 May 2020 14:30:00 +0200 (CEST)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 by in-5.smtp.seeweb.it (Postfix) with ESMTP id 94C2C6007B7
 for <ltp@lists.linux.it>; Mon, 11 May 2020 14:29:42 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1589200198;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ArwibheDCzDI7ss/NWGJRpxNj8stVn4GRvExaM/og/o=;
 b=Xd2ajcwl25TLu00YZu2PHKD1pFV4J6P7VDboMA2Y1j0YIoZ34/oW37qq+FqMoN4Z2IvYmx
 sfbKQKqRyhB6qYfDH32gPHq3XnRhX1kMDtZcjjCOpkllXuHsBbWSgzIYIUGOH3AUSUoKm9
 PVWA3u9XespFGb3eu54QR82HYrnzEZQ=
Received: from mail-lf1-f69.google.com (mail-lf1-f69.google.com
 [209.85.167.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-180-NRvhdaHqPGeflqAd1HhrSA-1; Mon, 11 May 2020 08:29:56 -0400
X-MC-Unique: NRvhdaHqPGeflqAd1HhrSA-1
Received: by mail-lf1-f69.google.com with SMTP id n13so3503093lfb.2
 for <ltp@lists.linux.it>; Mon, 11 May 2020 05:29:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ArwibheDCzDI7ss/NWGJRpxNj8stVn4GRvExaM/og/o=;
 b=Xd8xz8mHUqZCI2N7AoD6ubCXANu7TeISyvAZY9ef0R/vRGpjaOKIY6dloOPl7dbiMv
 VdPDTdFCU4bBy0E5oCPQVkmVawuZEp/hdZAttvd2WaPiuTPhoIiyq0MxNgBG2nbeohth
 QTbUA+8DjkE5syDdjzHeMmz572bd2GD6Ff4Xomiij+GbQ5416uaLKuOxas/2loACwapA
 zsStnYaCC3rxwoINbnYiAp4hiGU+eifBzbV+4gDjE0TXMf/mZ0xnJo9PVUhfpPHGW8Zh
 bNfO3+n6w+m+zMIY4HFrCVgaSLsNC3fGUGc61CtukUl6cjIoXDSBMdi5icSAnSavdjJF
 DhFg==
X-Gm-Message-State: AOAM5332rdo+uHJhkp6KxQZiokwbYohnosIb5dnB6DNaYFUKoyhOfAQc
 ORciS8vF6c7yyKKizaj5asIRGHPlzdYl1ZMnvlPS7Q7bBEV6AFheLq02ujQSrbDCSuZAeruI+N+
 HCe4gaPDAuF6DVbv2bdJ2II9brbo=
X-Received: by 2002:a2e:9018:: with SMTP id h24mr10033329ljg.217.1589200194201; 
 Mon, 11 May 2020 05:29:54 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJye4blX2xPaJ3shUaL3LysPsA1e7kJqF33h8+HaeUn2HKkz8DELdOLTbKE/PR7GuesIIh7PzpZIyFo+BHWRkNw=
X-Received: by 2002:a2e:9018:: with SMTP id h24mr10033318ljg.217.1589200194014; 
 Mon, 11 May 2020 05:29:54 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1588911607.git.viresh.kumar@linaro.org>
 <8a675726b6e553e740016390c774bce19efc5a12.1588911607.git.viresh.kumar@linaro.org>
 <CAEemH2cX=zyULO6qZBV5fBQv74dm2yuiUeRJ8SMe7OXYWJJ_sQ@mail.gmail.com>
 <20200511104306.x4sit6vy2a4bmcgc@vireshk-i7>
In-Reply-To: <20200511104306.x4sit6vy2a4bmcgc@vireshk-i7>
From: Li Wang <liwang@redhat.com>
Date: Mon, 11 May 2020 20:29:42 +0800
Message-ID: <CAEemH2dps8ib=GQKd+GftKYFdefFM+9sgvJw8SWccSDcXTRHaQ@mail.gmail.com>
To: Viresh Kumar <viresh.kumar@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,HTML_MESSAGE,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH V2 15/17] syscalls/semtimedop: Add support for
 semtimedop and its time64 version
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
Cc: Vincent Guittot <vincent.guittot@linaro.org>, arnd@arndb.de,
 LTP List <ltp@lists.linux.it>
Content-Type: multipart/mixed; boundary="===============1666078491=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============1666078491==
Content-Type: multipart/alternative; boundary="0000000000000aa4a305a55e81ab"

--0000000000000aa4a305a55e81ab
Content-Type: text/plain; charset="UTF-8"

On Mon, May 11, 2020 at 6:43 PM Viresh Kumar <viresh.kumar@linaro.org>
wrote:

> On 09-05-20, 12:21, Li Wang wrote:
> > RHEL8.2(x84_64) failed as:
> >
> > # ./semop05
> > tst_test.c:1246: INFO: Timeout per run is 0h 05m 00s
> > semop05.c:147: INFO: Testing variant: semop: vDSO or syscall
> > semop05.c:132: PASS: expected failure: EIDRM (43)
> > semop05.c:132: PASS: expected failure: EIDRM (43)
> > semop05.c:132: PASS: expected failure: EINTR (4)
> > semop05.c:132: PASS: expected failure: EINTR (4)
> > tst_test.c:1246: INFO: Timeout per run is 0h 05m 00s
> > semop05.c:147: INFO: Testing variant: semtimedop: syscall with kernel
> spec64
> > semop05.c:134: FAIL: unexpected failure: EAGAIN/EWOULDBLOCK (11)
> > Test timeouted, sending SIGKILL!
> > tst_test.c:1286: INFO: If you are running on slow machine, try exporting
> > LTP_TIMEOUT_MUL > 1
> > tst_test.c:1287: BROK: Test killed! (timeout?)
> >
> >
> > RHEL8.2(s390x) failed as:
> >
> > tst_test.c:1246: INFO: Timeout per run is 0h 05m 00s
> > semop05.c:147: INFO: Testing variant: semop: vDSO or syscall
> > semop05.c:132: PASS: expected failure: EIDRM (43)
> > semop05.c:132: PASS: expected failure: EIDRM (43)
> > semop05.c:132: PASS: expected failure: EINTR (4)
> > semop05.c:132: PASS: expected failure: EINTR (4)
> > tst_test.c:1246: INFO: Timeout per run is 0h 05m 00s
> > semop05.c:147: INFO: Testing variant: semtimedop: syscall with kernel
> spec64
> > semop.h:13: CONF: syscall(392) __NR_semtimedop not supported
> > Test timeouted, sending SIGKILL!
> > tst_test.c:1286: INFO: If you are running on slow machine, try exporting
> > LTP_TIMEOUT_MUL > 1
> > tst_test.c:1287: BROK: Test killed! (timeout?)
>
> Some part of the timeout was left uninitialized and so was causing
> some issues. Can you please try with this delta:
>

This delta works(on x86_64) for me. But the s390x issue looks like the same
as the futex TCONF in another email.

-- 
Regards,
Li Wang

--0000000000000aa4a305a55e81ab
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote"><div dir=3D"lt=
r" class=3D"gmail_attr">On Mon, May 11, 2020 at 6:43 PM Viresh Kumar &lt;<a=
 href=3D"mailto:viresh.kumar@linaro.org" target=3D"_blank">viresh.kumar@lin=
aro.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"=
margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-lef=
t:1ex">On 09-05-20, 12:21, Li Wang wrote:<br>
&gt; RHEL8.2(x84_64) failed as:<br>
&gt; <br>
&gt; # ./semop05<br>
&gt; tst_test.c:1246: INFO: Timeout per run is 0h 05m 00s<br>
&gt; semop05.c:147: INFO: Testing variant: semop: vDSO or syscall<br>
&gt; semop05.c:132: PASS: expected failure: EIDRM (43)<br>
&gt; semop05.c:132: PASS: expected failure: EIDRM (43)<br>
&gt; semop05.c:132: PASS: expected failure: EINTR (4)<br>
&gt; semop05.c:132: PASS: expected failure: EINTR (4)<br>
&gt; tst_test.c:1246: INFO: Timeout per run is 0h 05m 00s<br>
&gt; semop05.c:147: INFO: Testing variant: semtimedop: syscall with kernel =
spec64<br>
&gt; semop05.c:134: FAIL: unexpected failure: EAGAIN/EWOULDBLOCK (11)<br>
&gt; Test timeouted, sending SIGKILL!<br>
&gt; tst_test.c:1286: INFO: If you are running on slow machine, try exporti=
ng<br>
&gt; LTP_TIMEOUT_MUL &gt; 1<br>
&gt; tst_test.c:1287: BROK: Test killed! (timeout?)<br>
&gt; <br>
&gt; <br>
&gt; RHEL8.2(s390x) failed as:<br>
&gt; <br>
&gt; tst_test.c:1246: INFO: Timeout per run is 0h 05m 00s<br>
&gt; semop05.c:147: INFO: Testing variant: semop: vDSO or syscall<br>
&gt; semop05.c:132: PASS: expected failure: EIDRM (43)<br>
&gt; semop05.c:132: PASS: expected failure: EIDRM (43)<br>
&gt; semop05.c:132: PASS: expected failure: EINTR (4)<br>
&gt; semop05.c:132: PASS: expected failure: EINTR (4)<br>
&gt; tst_test.c:1246: INFO: Timeout per run is 0h 05m 00s<br>
&gt; semop05.c:147: INFO: Testing variant: semtimedop: syscall with kernel =
spec64<br>
&gt; semop.h:13: CONF: syscall(392) __NR_semtimedop not supported<br>
&gt; Test timeouted, sending SIGKILL!<br>
&gt; tst_test.c:1286: INFO: If you are running on slow machine, try exporti=
ng<br>
&gt; LTP_TIMEOUT_MUL &gt; 1<br>
&gt; tst_test.c:1287: BROK: Test killed! (timeout?)<br>
<br>
Some part of the timeout was left uninitialized and so was causing<br>
some issues. Can you please try with this delta:<br></blockquote><div><br><=
/div><div><div class=3D"gmail_default" style=3D"font-size:small">This delta=
 works(on x86_64) for me. But the s390x issue looks like the same as the fu=
tex TCONF in another=C2=A0email.</div></div><div><br></div></div>-- <br><di=
v dir=3D"ltr"><div dir=3D"ltr"><div>Regards,<br></div><div>Li Wang<br></div=
></div></div></div>

--0000000000000aa4a305a55e81ab--


--===============1666078491==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============1666078491==--

