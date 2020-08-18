Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 345AC24814F
	for <lists+linux-ltp@lfdr.de>; Tue, 18 Aug 2020 11:03:52 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id E08193C2FEA
	for <lists+linux-ltp@lfdr.de>; Tue, 18 Aug 2020 11:03:51 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 by picard.linux.it (Postfix) with ESMTP id B38213C26C8
 for <ltp@lists.linux.it>; Tue, 18 Aug 2020 11:03:50 +0200 (CEST)
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [205.139.110.61])
 by in-5.smtp.seeweb.it (Postfix) with ESMTP id C3EB16009F4
 for <ltp@lists.linux.it>; Tue, 18 Aug 2020 11:03:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1597741428;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=iBGMvi9WpoRzCz3TdkAg00+k+sp7Mdb7z9Kp8eQXrHk=;
 b=USzO6hhEtzH1ps79oXr8hjs/vskxzCSfU/3KrFtwT4aKhEdVdpPWt78IjUsXUBbHlSFmCF
 EDd7GZ8Ce/cdzFjz4pud88WB+1JLZKT+kOFjgKnlJxZZjc7iTVSIuwHg1j5IbRx0PEgNRW
 XftvTsLgGe9bOSvQfZvOQap0unwoJ4k=
Received: from mail-yb1-f200.google.com (mail-yb1-f200.google.com
 [209.85.219.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-552-BrIENbpdOEa50GM4-A0JLg-1; Tue, 18 Aug 2020 05:03:45 -0400
X-MC-Unique: BrIENbpdOEa50GM4-A0JLg-1
Received: by mail-yb1-f200.google.com with SMTP id x10so21156864ybj.19
 for <ltp@lists.linux.it>; Tue, 18 Aug 2020 02:03:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=iBGMvi9WpoRzCz3TdkAg00+k+sp7Mdb7z9Kp8eQXrHk=;
 b=socNrn/qOwC/izMh4zQqyaRlP1ujdi7CqnnB2oVpPqfLD4F2+JWVLcDzcASKTO3mg/
 wm1t8OVkhbfxEq7LNt2dIQdXA7PsaVaeZ3n/WUhvbEQZASR4ixFicMOfJbuBaeBwSwbo
 sC5eq4ZQiL34/b3lDdpE85WYh4fSGcELMB9VbcpcYWXpO4NIrcoMfpc3OfcL5GFuJQMM
 r2Il30m5CEIUehtpFU284Sx956WbM830P9BUzWhnsGecN4jnjXAWrJzE4/mqXoLOIuro
 RRtMFDrJToABgloW3mKv4HGKW5WE8ChhFTOs3VLPK9llEWvdH0GHSEJSYGLEysPFmeeS
 E3bA==
X-Gm-Message-State: AOAM531kl1UsKrQ9qHQT6AA8H28FIhGO9PeOrzAf70TRjptlXgyge8Ul
 ++Ys6Knzoo9OEaaTZQ9FZ9Tk9SkJuSCTZgdqfd5yGYYsQwxShiW7BPKXbamHBdMJZF2RaKrHiSD
 /9NLLkLn3yx1t9XUxtHpGb7W5olo=
X-Received: by 2002:a5b:44d:: with SMTP id s13mr26092375ybp.403.1597741425093; 
 Tue, 18 Aug 2020 02:03:45 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzBvpQp92gHmiI3gtkdwaKeku6ygT7EqKmvJiaT1Y5z36aUSFRhe8AAG4HpOhoA3AdQyB/gn+hYOboOmJBr7sg=
X-Received: by 2002:a5b:44d:: with SMTP id s13mr26092259ybp.403.1597741423818; 
 Tue, 18 Aug 2020 02:03:43 -0700 (PDT)
MIME-Version: 1.0
References: <20200818061059.14680-1-liwang@redhat.com>
 <20200818083215.GA27964@yuki.lan>
In-Reply-To: <20200818083215.GA27964@yuki.lan>
From: Li Wang <liwang@redhat.com>
Date: Tue, 18 Aug 2020 17:03:32 +0800
Message-ID: <CAEemH2fX+MELKgR17YqwPpAGBHnZYRm3pTLaeHP4KbRnM5fUig@mail.gmail.com>
To: Cyril Hrubis <chrubis@suse.cz>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=liwan@redhat.com
X-Mimecast-Spam-Score: 0.001
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,HTML_MESSAGE,SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] clock_settime03: accept ENOTSUP if
 CLOCK_REALTIME_ALARM unsupported
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
Cc: Viresh Kumar <viresh.kumar@linaro.org>, LTP List <ltp@lists.linux.it>
Content-Type: multipart/mixed; boundary="===============1418594402=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============1418594402==
Content-Type: multipart/alternative; boundary="00000000000002967305ad232a4a"

--00000000000002967305ad232a4a
Content-Type: text/plain; charset="UTF-8"

On Tue, Aug 18, 2020 at 4:31 PM Cyril Hrubis <chrubis@suse.cz> wrote:

> Hi!
> > CLOCK_REALTIME_ALARM requires an RTC with alarm support, which may not be
> > present on a system. In that case, the kernel will return EOPNOTSUPP,
> which
> > is defined as ENOTSUP in userspace.
> >
> > As CLOCK_REALTIME_ALARM is already possibly unsupported, accept that as
> an
> > error besides the EINVAL code.
> >
> > For issue #712:
> >   https://github.com/linux-test-project/ltp/issues/712
>
> Actually I've commented on the issue, do we really need the _ALARM clock
> for anything? I guess that the test would work fine with old plain
> CLOCK_REALTIME as well.
>

You're right, the CLOCK_REALTIME works fine at this point. Also as you
commented, we do not suspend the OS in the middle, so I agree to use
 CLOCK_REALTIME.

-- 
Regards,
Li Wang

--00000000000002967305ad232a4a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote"><div dir=3D"lt=
r" class=3D"gmail_attr">On Tue, Aug 18, 2020 at 4:31 PM Cyril Hrubis &lt;<a=
 href=3D"mailto:chrubis@suse.cz">chrubis@suse.cz</a>&gt; wrote:<br></div><b=
lockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-le=
ft:1px solid rgb(204,204,204);padding-left:1ex">Hi!<br>
&gt; CLOCK_REALTIME_ALARM requires an RTC with alarm support, which may not=
 be<br>
&gt; present on a system. In that case, the kernel will return EOPNOTSUPP, =
which<br>
&gt; is defined as ENOTSUP in userspace.<br>
&gt; <br>
&gt; As CLOCK_REALTIME_ALARM is already possibly unsupported, accept that a=
s an<br>
&gt; error besides the EINVAL code.<br>
&gt; <br>
&gt; For issue #712:<br>
&gt;=C2=A0 =C2=A0<a href=3D"https://github.com/linux-test-project/ltp/issue=
s/712" rel=3D"noreferrer" target=3D"_blank">https://github.com/linux-test-p=
roject/ltp/issues/712</a><br>
<br>
Actually I&#39;ve commented on the issue, do we really need the _ALARM cloc=
k<br>
for anything? I guess that the test would work fine with old plain<br>
<span class=3D"gmail_default" style=3D"font-size:small"></span>CLOCK_REALTI=
ME as well.<br></blockquote><div><br></div><div><div class=3D"gmail_default=
" style=3D"font-size:small">You&#39;re right, the <span class=3D"gmail_defa=
ult"></span>CLOCK_REALTIME works fine at this=C2=A0point. Also as you comme=
nted, we do not suspend the OS in the middle, so=C2=A0<span class=3D"gmail_=
default">I agree to</span>=C2=A0<span class=3D"gmail_default">use</span>=C2=
=A0CLOCK_REALTIME.</div></div><div>=C2=A0</div></div>-- <br><div dir=3D"ltr=
" class=3D"gmail_signature"><div dir=3D"ltr"><div>Regards,<br></div><div>Li=
 Wang<br></div></div></div></div>

--00000000000002967305ad232a4a--


--===============1418594402==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============1418594402==--

