Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id B85E1215443
	for <lists+linux-ltp@lfdr.de>; Mon,  6 Jul 2020 10:57:53 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 5CE213C29D9
	for <lists+linux-ltp@lfdr.de>; Mon,  6 Jul 2020 10:57:53 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 by picard.linux.it (Postfix) with ESMTP id 8DBDC3C04FD
 for <ltp@lists.linux.it>; Mon,  6 Jul 2020 10:57:51 +0200 (CEST)
Received: from us-smtp-delivery-1.mimecast.com
 (us-smtp-delivery-1.mimecast.com [205.139.110.120])
 by in-6.smtp.seeweb.it (Postfix) with ESMTP id 0D9551401191
 for <ltp@lists.linux.it>; Mon,  6 Jul 2020 10:57:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1594025868;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=mMIkRbffQsg1vYaUWJEVJQZ8tK1XRFUbcHPrFArRLOw=;
 b=S5KVxW+J/RQrqHakPWRCRgNSKvT8btmhW7JVeD8Q+c4gAJ485m/KLl6gq49aTRelhYb54u
 iSoh2PYDGKdxm53FpZmqB2d1XH10UhLJo7TORB/U3WL2uzGfTdAqvfREZNxxy+feoVrxT4
 8EE8J1ljd1KKRXX1+b9f7Gnx1joqJSQ=
Received: from mail-lf1-f69.google.com (mail-lf1-f69.google.com
 [209.85.167.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-394-VYSjD9AjNCm0xPjJC0LhIw-1; Mon, 06 Jul 2020 04:57:46 -0400
X-MC-Unique: VYSjD9AjNCm0xPjJC0LhIw-1
Received: by mail-lf1-f69.google.com with SMTP id o65so28565081lff.19
 for <ltp@lists.linux.it>; Mon, 06 Jul 2020 01:57:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=mMIkRbffQsg1vYaUWJEVJQZ8tK1XRFUbcHPrFArRLOw=;
 b=Qm36vYLPPtvFguYilqonaE+nSgH6CuedYbFWRXGk4IjJVK7sQ+mlwcMEX5jWVCp4oT
 Novika/eZIEdMz0d5tk0QXhfm5hM1kGMxJf4QyxAlesCT0JvauhHJykGs7OvqNjtoeEh
 xh8lQiPH6Lun+T5TmwAuAwfmEtzmteFkvX3cpjfDbiyS8Gnqegp4pfP5lo/rJ+Yc+Xju
 WdmXuMoECk1e9cwAyHPneW0b3YE23Do+zPWxFxyO1rqmoDCaD27dm4iUFA+JBYZmF6PL
 Go9BjK6FO7YKb9Jo+Bz9wMAgD8Rb+jROwnvAYzOdM0j0Gj6b4gigHQ5CCpPWMnvmGygs
 tFrw==
X-Gm-Message-State: AOAM533hSC6Z5pCGKlEoJ2z/SoNeL0Zu10LwmdrK/ep5JP5FzRAsL7oJ
 OTCnEHYhHN0ramewmn85rN/7OcLa5aS/nxbIMlX2elXhq6VhxVJE1RaJv3hEibn3+3qk3UxYTfN
 iWAZtgMV6y6bosxYj17M64AXH0iY=
X-Received: by 2002:a2e:864e:: with SMTP id i14mr24330592ljj.441.1594025864887; 
 Mon, 06 Jul 2020 01:57:44 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwbI51md7OU1ToDC0N0ItecmeNwKSrbexwzR5De6SYRo40VRCTchi+eJRmMBVLg0xP1ljPxhEb6XK8mZ7xo5AM=
X-Received: by 2002:a2e:864e:: with SMTP id i14mr24330584ljj.441.1594025864696; 
 Mon, 06 Jul 2020 01:57:44 -0700 (PDT)
MIME-Version: 1.0
References: <c47220ecab3c7570f5387cd71894c977009ad3d8.1590572545.git.viresh.kumar@linaro.org>
 <9562fdf4debd759439ee7f468008177003db9513.1592457867.git.viresh.kumar@linaro.org>
 <CAEemH2cu_o2eCHQB1_Bo0aQiR2WK6knbBtD83-5_77gZZbA-Ow@mail.gmail.com>
 <20200703125927.GA11556@yuki.lan>
 <CAEemH2cN735haDmyqbNa_LwDgumFqAspYfJaKRpsOg0Rij9tEA@mail.gmail.com>
 <1513894e-d23e-055e-df27-d8cf36b8c609@linux.ibm.com>
In-Reply-To: <1513894e-d23e-055e-df27-d8cf36b8c609@linux.ibm.com>
From: Li Wang <liwang@redhat.com>
Date: Mon, 6 Jul 2020 16:57:33 +0800
Message-ID: <CAEemH2eSer9ewwSqfs5SA491veL1sy7Xhktkoi6gOT+r3uDQtg@mail.gmail.com>
To: Harish <harish@linux.ibm.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=liwan@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,HTML_MESSAGE,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [PATCH V4 5/6] syscalls: Don't pass struct timespec to
 tst_syscall()
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
Cc: Donghai Qiao <dqiao@redhat.com>,
 Vincent Guittot <vincent.guittot@linaro.org>, arnd@arndb.de,
 Viresh Kumar <viresh.kumar@linaro.org>, LTP List <ltp@lists.linux.it>
Content-Type: multipart/mixed; boundary="===============1892949162=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============1892949162==
Content-Type: multipart/alternative; boundary="0000000000006db1e905a9c211fd"

--0000000000006db1e905a9c211fd
Content-Type: text/plain; charset="UTF-8"

Harish <harish@linux.ibm.com> wrote:

> Hi,
>
> I tried the suggested patch, but was unsuccessful in running the test.
> Here is my diff.
> ...
> Is there anything I am missing here? Thanks in advance.
>
Your diff version looks correct.

I doubt have you rebuild your LTP or at least rebuild the ltp-lib?

-- 
Regards,
Li Wang

--0000000000006db1e905a9c211fd
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><div class=3D"gmail_quote"><div dir=3D"ltr" c=
lass=3D"gmail_attr">Harish &lt;<a href=3D"mailto:harish@linux.ibm.com">hari=
sh@linux.ibm.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" =
style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);pa=
dding-left:1ex">
 =20
   =20
 =20
  <div>
    <p><font size=3D"-1">Hi,<br>
        <br>
        I tried the suggested patch, but was unsuccessful in running the
        test. Here is my diff.<br>
        <span class=3D"gmail_default" style=3D"font-size:small">...</span><=
br>
        Is there anything I am missing here? Thanks in advance.<br></font><=
/p></div></blockquote><div><div class=3D"gmail_default" style=3D"font-size:=
small">Your diff version looks correct.</div><br></div><div class=3D"gmail_=
default" style=3D"font-size:small">I doubt have you rebuild your LTP or at =
least rebuild the ltp-lib?</div><div><br></div></div>-- <br><div dir=3D"ltr=
" class=3D"gmail_signature"><div dir=3D"ltr"><div>Regards,<br></div><div>Li=
 Wang<br></div></div></div></div>

--0000000000006db1e905a9c211fd--


--===============1892949162==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============1892949162==--

