Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 534961B7F60
	for <lists+linux-ltp@lfdr.de>; Fri, 24 Apr 2020 21:54:36 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 05BBA3C290B
	for <lists+linux-ltp@lfdr.de>; Fri, 24 Apr 2020 21:54:36 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 by picard.linux.it (Postfix) with ESMTP id E52133C28F4
 for <ltp@lists.linux.it>; Fri, 24 Apr 2020 21:54:33 +0200 (CEST)
Received: from mail-ej1-x641.google.com (mail-ej1-x641.google.com
 [IPv6:2a00:1450:4864:20::641])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id A00A86013F6
 for <ltp@lists.linux.it>; Fri, 24 Apr 2020 21:54:29 +0200 (CEST)
Received: by mail-ej1-x641.google.com with SMTP id gr25so8441310ejb.10
 for <ltp@lists.linux.it>; Fri, 24 Apr 2020 12:54:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=mQOmBgRFu8tdNp44x7qKgIzOWp6zwAarQ+AA7wnfs/M=;
 b=KbOwhxwXDIvUQTkL7+eDQerUUgpJMhNqFztHyO5MNlLh2yS1aLu39vsM4oQq6YsPLP
 QtLrPmtSlQOIa3x+zGCZA07ZkfwYmUlNwLYXxEAag5Td5bqpqGJ5I4TK4aYGlnDX7BIh
 fBJqEH9bI/ZOQ4lSmHoge5STWqbEgPt3w/Fqgrt+Ftci1vV4DfTAbxC0GVOnaSLxG+Dt
 wuJ7gwPCMLyfVUmauMY6Irxwjdg5P81wHAlA69qVuAkAyGkNmUOC7OaDm2NYnK4iNJtT
 ith9NtXbHEdaQrfkv9QsMQsCU8letmdVCp39nwK8xTESb+hP7lc3ZcBS0GThyitkaH0M
 6Bug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=mQOmBgRFu8tdNp44x7qKgIzOWp6zwAarQ+AA7wnfs/M=;
 b=Ni5OFpIy8e6WMx6naxA9ExqF8e54ayizeUz4XgswgU2ESrzXisXOls2ZlY/WH7tUY5
 dtyHKMVauuZd7PKBt92NBoaS71HTlGKhIBHK7pwNSgZJmdhj4d4EcZpHUl6oHz9mINd9
 MZunleQSf6HCtLgjnjTWk4qyiLJa4IcaQLlXtiVMS+OxUavrwCo0Ac6YeX4FR26nIanu
 97r8axBFbv5MOKxnULbDYKFOag78d15qa5aZf//Kjts0mm6MTv0U5Z13x84n9mq4l4Nd
 PJMTFyuBCMX0Z98qhGcHCvgy9B88JsRj/FLrLUoaaIs8TvxgLJs/g2ECuxqI+5dHda9I
 erDw==
X-Gm-Message-State: AGi0PuasGd/P7ZcHwHkr5CmPTgmGD4Vrg23dZgxescj58LykayHkNI1T
 ovLhHBKRF94bQAxcIqHyN1hcRPOq6eC2YYmZWmwv7EDdt+s=
X-Google-Smtp-Source: APiQypLqY1mYJ+EDD6c0GmOJ7dd/jKFMYKzGClmVzBLNQiD3XtHlAhUim7eHUgSEJkmhBEq4G6kndhJPuAoK9rvy0Gg=
X-Received: by 2002:a17:906:c281:: with SMTP id
 r1mr8860820ejz.310.1587758072909; 
 Fri, 24 Apr 2020 12:54:32 -0700 (PDT)
MIME-Version: 1.0
References: <20200423150626.12672-1-fbozuta1@gmail.com>
 <20200424145838.GA3421@yuki.lan>
In-Reply-To: <20200424145838.GA3421@yuki.lan>
From: Filip Bozuta <fbozuta1@gmail.com>
Date: Fri, 24 Apr 2020 21:54:21 +0200
Message-ID: <CAGbDZEonwc3TALEE0EsmU1=K3pxQuhdY_hZKDKGNWck1JPw2tQ@mail.gmail.com>
To: Cyril Hrubis <chrubis@suse.cz>
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.3 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,HTML_MESSAGE,
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2 0/3] Add tests for a group of real time clock
 ioctls
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
Cc: Aleksandar Markovic <Aleksandar.Markovic@rt-rk.com>, laurent@vivier.eu,
 ltp@lists.linux.it
Content-Type: multipart/mixed; boundary="===============1176246198=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============1176246198==
Content-Type: multipart/alternative; boundary="000000000000ecd78105a40ebb0c"

--000000000000ecd78105a40ebb0c
Content-Type: text/plain; charset="UTF-8"

Hello Cyrill,

Thank you for your response!

I didn't take a look at the file
testcases/kernel/device-drivers/rtc/rtc01.c when writing rtc ioctl tests.
I see that it runs tests for certain ioctls that are covered in the patches
I sent (i.e. RTC_RD_TIME, RTC_SET_TIME, RTC_AIE_ON,...).

As I see, this file runs tests for certain ioctls more thoroughly than my
test since it is meant to test the functionality of the rtc driver. My
tests are only meant to test the functionalities of rtc ioctls without
testing whether the driver works correctly. For instance, when running
tests for ioctls used for interrupts (RTC_AIE_ON, RTC_AIE_OFF,
RTC_PIE_ON,...), I only check whether these ioctls work to turn on/off rtc
interrupts (alarm, periodic, update, watchdog). I don't check whether the
interrupts work on the driver correctly.

Anyway, I am new to LTP so I am not that familiar with the scope of
functionalities ioctl tests should cover. Any feedback you can give me on
this would be greatly appreciated.

I am looking forward to your review of my patches.

Best regards,
Filip

On Fri, Apr 24, 2020 at 4:58 PM Cyril Hrubis <chrubis@suse.cz> wrote:

> Hi!
> Looking at these I guess that we should also delete the
> testcases/kernel/device-drivers/rtc/ as a last patch in this series
> since these tests seems to cover a bit more than the original test.
>
> I will have a closer look at the patchset next week.
>
> --
> Cyril Hrubis
> chrubis@suse.cz
>

--000000000000ecd78105a40ebb0c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hello Cyrill,</div><div><br></div><div>Thank you for =
your response!<br></div><div><br></div><div>I didn&#39;t take a look at the=
 file testcases/kernel/device-drivers/rtc/rtc01.c when writing rtc ioctl te=
sts. <br></div><div>I see that it runs tests for certain ioctls that are co=
vered in the patches I sent (i.e. RTC_RD_TIME, RTC_SET_TIME, RTC_AIE_ON,...=
).</div><div><br></div><div>As I see, this file runs tests for certain ioct=
ls more thoroughly than my test since it is meant to test the functionality=
 of the rtc driver. My tests are only meant to test the functionalities of =
rtc ioctls without testing whether the driver works correctly. For instance=
, when running tests for ioctls used for interrupts (RTC_AIE_ON, RTC_AIE_OF=
F, RTC_PIE_ON,...), I only check whether these ioctls work to turn on/off r=
tc interrupts (alarm, periodic, update, watchdog). I don&#39;t check whethe=
r the interrupts work on the driver correctly.</div><div><br></div><div>Any=
way, I am new to LTP so I am not that familiar with the scope of functional=
ities ioctl tests should cover. Any feedback you can give me on this would =
be greatly appreciated.</div><div><br></div><div>I am looking forward to yo=
ur review of my patches.</div><div><br></div><div>Best regards,</div><div>F=
ilip<br></div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Fri, Apr 24, 2020 at 4:58 PM Cyril Hrubis &lt;<a href=3D=
"mailto:chrubis@suse.cz">chrubis@suse.cz</a>&gt; wrote:<br></div><blockquot=
e class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px s=
olid rgb(204,204,204);padding-left:1ex">Hi!<br>
Looking at these I guess that we should also delete the<br>
testcases/kernel/device-drivers/rtc/ as a last patch in this series<br>
since these tests seems to cover a bit more than the original test.<br>
<br>
I will have a closer look at the patchset next week.<br>
<br>
-- <br>
Cyril Hrubis<br>
<a href=3D"mailto:chrubis@suse.cz" target=3D"_blank">chrubis@suse.cz</a><br=
>
</blockquote></div>

--000000000000ecd78105a40ebb0c--

--===============1176246198==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============1176246198==--
