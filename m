Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id CBCB1AD41D
	for <lists+linux-ltp@lfdr.de>; Mon,  9 Sep 2019 09:47:04 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 5634D3C2099
	for <lists+linux-ltp@lfdr.de>; Mon,  9 Sep 2019 09:47:04 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 by picard.linux.it (Postfix) with ESMTP id A2D913C2074
 for <ltp@lists.linux.it>; Mon,  9 Sep 2019 09:47:01 +0200 (CEST)
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id CE11D200B29
 for <ltp@lists.linux.it>; Mon,  9 Sep 2019 09:47:00 +0200 (CEST)
Received: from mail-ot1-f72.google.com (mail-ot1-f72.google.com
 [209.85.210.72])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id E86D9C044CC5
 for <ltp@lists.linux.it>; Mon,  9 Sep 2019 07:46:58 +0000 (UTC)
Received: by mail-ot1-f72.google.com with SMTP id c1so8239961otb.22
 for <ltp@lists.linux.it>; Mon, 09 Sep 2019 00:46:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=6Dx9xs1TBaGqp/T2KvAxQiQAbIjysYGkzkVMXSY4Gmg=;
 b=UaRF80fGFmi9qQi/Ab2R3zNA+SSON6OZZp0N4afTrPtW843qzTCADCo5cphUY719Ya
 3ViMENocwyqwhNLJ7714aK/aOlU0bepviBaJlYQzoDntfopCF31BoV2GPxMoFW8v01xj
 bKinoKTC/TZDodlUXls4ZhZ4Hswtv7mlQhfEPeApFxFStW2eTqWqMnuoD71JfpIWa1sb
 V/rgcttCVKnE5MuiM8KvxQMQ6QJIaLg8Cs7CB5l8oJuicrvZu5vq2qn+H5n14XpunI3d
 AU6YuZAnPvtkihCBwzqUtIDYkknsRPw3VIKzmiskmGAJiHaJLmJRhbgaLEM3pX28giJj
 hoLg==
X-Gm-Message-State: APjAAAWamHTVavvw3QclcBXAmOApv+s3k0fXiqw9oSMcfZRrpuYfWJRb
 C4oMgoF15l8bAd903cPIlMK9DEvosNqI1TBwNZeH03Tu27g7wEtG7NSJujBMhbeFT165JMcUS7e
 j0wzr9KsLQz7pOGDupk3yT2hwshU=
X-Received: by 2002:a9d:7411:: with SMTP id n17mr17465749otk.118.1568015218285; 
 Mon, 09 Sep 2019 00:46:58 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzDs7dg5PgeETc0MaWXrpjWVqG9EID8cSzGbF8cZuHpUORM1xeOgAIE1mSwdBZ4GLt8KuXZPD0JTjWvRsjTbGg=
X-Received: by 2002:a9d:7411:: with SMTP id n17mr17465731otk.118.1568015217794; 
 Mon, 09 Sep 2019 00:46:57 -0700 (PDT)
MIME-Version: 1.0
References: <20190906130707.GA7515@rei.lan>
In-Reply-To: <20190906130707.GA7515@rei.lan>
From: Li Wang <liwang@redhat.com>
Date: Mon, 9 Sep 2019 15:46:45 +0800
Message-ID: <CAEemH2frzqyUmgm2mXTG3dusUtggwX4Y3oRBr34p+NCUJFW7_g@mail.gmail.com>
To: Cyril Hrubis <chrubis@suse.cz>
X-Virus-Scanned: clamav-milter 0.99.2 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-0.0 required=7.0 tests=HTML_MESSAGE,SPF_HELO_PASS,
 SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-7.smtp.seeweb.it
Subject: Re: [LTP] LTP Release
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
Content-Type: multipart/mixed; boundary="===============0628927229=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============0628927229==
Content-Type: multipart/alternative; boundary="0000000000000f38e6059219fef5"

--0000000000000f38e6059219fef5
Content-Type: text/plain; charset="UTF-8"

On Fri, Sep 6, 2019 at 9:07 PM Cyril Hrubis <chrubis@suse.cz> wrote:

> Hi!
> As usually we should start prepare for a release somewhere at the end of
> the September.
>
> I will try to review as much patches as possible next week, then I would
> like to start the pre-release testing. So if there is something that
> really should go in before the release let me know.
>

The one to print errno number.
    [PATCH] tst_res: Print errno number in addition to error name


Some test failures:
==============

acct02 (s390x):
acct02.c:174: INFO: Verifying using 'struct acct_v3'
acct02.c:140: INFO: Number of accounting file entries tested: 2
acct02.c:145: FAIL: acct() wrote incorrect file contents!

timer_create01 (s390x, ppc64le, aarch64):
timer_create01.c:48: INFO: Testing notification type: SIGEV_THREAD_ID
timer_create01.c:93: PASS: Timer successfully created for CLOCK_REALTIME
timer_create01.c:93: PASS: Timer successfully created for CLOCK_MONOTONIC
timer_create01.c:93: PASS: Timer successfully created for
CLOCK_PROCESS_CPUTIME_ID
timer_create01.c:93: PASS: Timer successfully created for
CLOCK_THREAD_CPUTIME_ID
timer_create01.c:93: PASS: Timer successfully created for CLOCK_BOOTTIME
timer_create01.c:87: FAIL: Failed to create timer for CLOCK_BOOTTIME_ALARM:
???
timer_create01.c:87: FAIL: Failed to create timer for CLOCK_REALTIME_ALARM:
???
timer_create01.c:93: PASS: Timer successfully created for CLOCK_TAI

-- 
Regards,
Li Wang

--0000000000000f38e6059219fef5
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote"><div dir=3D"lt=
r" class=3D"gmail_attr">On Fri, Sep 6, 2019 at 9:07 PM Cyril Hrubis &lt;<a =
href=3D"mailto:chrubis@suse.cz" target=3D"_blank">chrubis@suse.cz</a>&gt; w=
rote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0p=
x 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Hi!<br>
As usually we should start prepare for a release somewhere at the end of<br=
>
the September.<br>
<br>
I will try to review as much patches as possible next week, then I would<br=
>
like to start the pre-release testing. So if there is something that<br>
really should go in before the release let me know.<br></blockquote><div><b=
r></div><div><div class=3D"gmail_default" style=3D"font-size:small">The one=
 to print errno number.</div></div><span class=3D"gmail_default" style=3D"f=
ont-size:small">=C2=A0 =C2=A0 </span>[PATCH] tst_res: Print errno number in=
 addition to error name</div><div><br></div><div><br></div><div><div class=
=3D"gmail_default" style=3D"font-size:small">Some test failures:</div><div =
class=3D"gmail_default" style=3D"font-size:small">=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D</div><div class=3D"gmail_default" style=3D"font-size:sma=
ll"><br></div>acct02 (s390x)<span class=3D"gmail_default" style=3D"font-siz=
e:small">:</span><br>acct02.c:174: INFO: Verifying using &#39;struct acct_v=
3&#39;<br><span class=3D"gmail_default" style=3D"font-size:small"></span>ac=
ct02.c:140: INFO: Number of accounting file entries tested: 2<br>acct02.c:1=
45: FAIL: acct() wrote incorrect file contents!</div><div><br></div>timer_c=
reate01 (s390x, ppc64<span class=3D"gmail_default" style=3D"font-size:small=
">le</span>, aarch64)<span class=3D"gmail_default" style=3D"font-size:small=
">:</span><div><div>timer_create01.c:48: INFO: Testing notification type: S=
IGEV_THREAD_ID<br>timer_create01.c:93: PASS: Timer successfully created for=
 CLOCK_REALTIME<br>timer_create01.c:93: PASS: Timer successfully created fo=
r CLOCK_MONOTONIC<br>timer_create01.c:93: PASS: Timer successfully created =
for CLOCK_PROCESS_CPUTIME_ID<br>timer_create01.c:93: PASS: Timer successful=
ly created for CLOCK_THREAD_CPUTIME_ID<br>timer_create01.c:93: PASS: Timer =
successfully created for CLOCK_BOOTTIME<br>timer_create01.c:87: FAIL: Faile=
d to create timer for CLOCK_BOOTTIME_ALARM: ???<br>timer_create01.c:87: FAI=
L: Failed to create timer for CLOCK_REALTIME_ALARM: ??? <br>timer_create01.=
c:93: PASS: Timer successfully created for CLOCK_TAI<div><br></div>-- <br><=
div dir=3D"ltr" class=3D"m_6342854980942340924m_5924523302898506160m_201864=
5957931755355m_-6801971889439053821m_6699574307742023525m_24698309542011096=
1gmail_signature"><div dir=3D"ltr"><div>Regards,<br></div><div>Li Wang<br><=
/div></div></div></div></div></div>

--0000000000000f38e6059219fef5--

--===============0628927229==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============0628927229==--
