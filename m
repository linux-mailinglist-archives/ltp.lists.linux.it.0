Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id DE4421D4418
	for <lists+linux-ltp@lfdr.de>; Fri, 15 May 2020 05:37:30 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 5EB603C25D1
	for <lists+linux-ltp@lfdr.de>; Fri, 15 May 2020 05:37:30 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 by picard.linux.it (Postfix) with ESMTP id 03CF43C2412
 for <ltp@lists.linux.it>; Fri, 15 May 2020 05:37:25 +0200 (CEST)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 by in-7.smtp.seeweb.it (Postfix) with ESMTP id 399052009E0
 for <ltp@lists.linux.it>; Fri, 15 May 2020 05:37:23 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1589513842;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=KlfkMT2EP8s1WxGYSJdD4YAuvuVlbiCMUKbCXsod9lU=;
 b=YzX/x8ckuiWpA8tNTegErIxHd8Ynwh+4IMz3fy7+VHhOW1ISQHfiDNzIo+Zq2ONEqE7gBj
 EZFkt9USV24CEu2694AdpvCBkGYIFDWErsj0ld/1M/apewnUGJy+/TbJVEchEwYc0i2Hj/
 eRnjYEk1vQK4XtI1jZtsFilMhDw38Bk=
Received: from mail-lf1-f69.google.com (mail-lf1-f69.google.com
 [209.85.167.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-514-otLbUvB_OqagIZIPTUMLAg-1; Thu, 14 May 2020 23:37:16 -0400
X-MC-Unique: otLbUvB_OqagIZIPTUMLAg-1
Received: by mail-lf1-f69.google.com with SMTP id 125so315866lfk.19
 for <ltp@lists.linux.it>; Thu, 14 May 2020 20:37:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=KlfkMT2EP8s1WxGYSJdD4YAuvuVlbiCMUKbCXsod9lU=;
 b=QTqcUImmS67WrB6eL97vdFOJ4lbAIXqnQ9VHsoePxKWS9wqRsHyjkwgYHQyjrTkDOa
 i7UwLuOo1ESv0ddUK09gmMDbG5r9CVIKUFSj1NTSyUsOpRNhvC7QXQjJJG+XLxNheq8K
 rRa9+LlcLZ2E+FR9tJfLY+04p7bP4uCnWGSLhWk4h5w4Y0Vc7ksDmXcoXl/WjNXvTYzF
 B2pPzsqeP0mJRnmwwrj1WEF/F0E1fN3ecFts0lmEDlJbLHbNBLgyD8rEnxVHbNJZR+2c
 U3fDnmoqYJjACX3JOFiZnAkXSpWgQkxPHoHF69pBnMVAqSk8+wSWRLg6zWJsZBhMGdx8
 zNiA==
X-Gm-Message-State: AOAM530TTNNO9Le+EsrcKr3CjNqp20xEJpu2kuRwKxwghhKNVNQHVSr2
 D98xDKEqhUeP+0RlmaU7FZpx9wNrnwsb5m5DuGAf8thqgvbyQ8psNJw+u5PouIZYnj92OlyRLrW
 gRvk3g0+s56nfqVhFsMFGEL2Ycxw=
X-Received: by 2002:ac2:50c7:: with SMTP id h7mr851868lfm.171.1589513835067;
 Thu, 14 May 2020 20:37:15 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx2wm/YNxbK8yIXySs4uYMwfF+RLbJpSq86cZdDdP5O9TqOumaWTe+KTi876h+vw7csnXoGtL9xhx5kopsyD4c=
X-Received: by 2002:ac2:50c7:: with SMTP id h7mr851852lfm.171.1589513834825;
 Thu, 14 May 2020 20:37:14 -0700 (PDT)
MIME-Version: 1.0
References: <20200504104907.GA3567@yuki.lan> <20200514095444.GB18592@yuki.lan>
In-Reply-To: <20200514095444.GB18592@yuki.lan>
From: Li Wang <liwang@redhat.com>
Date: Fri, 15 May 2020 11:37:02 +0800
Message-ID: <CAEemH2dGpJzRTnn-n26cDBQUhZeX7UK5wtq=fSdVO8HUtJCzAQ@mail.gmail.com>
To: Cyril Hrubis <chrubis@suse.cz>, Yang Xu <xuyang2018.jy@cn.fujitsu.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.99.2 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,HTML_MESSAGE,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-7.smtp.seeweb.it
Subject: Re: [LTP] LTP release
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
Content-Type: multipart/mixed; boundary="===============0723413072=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============0723413072==
Content-Type: multipart/alternative; boundary="0000000000007da6bf05a5a787e0"

--0000000000007da6bf05a5a787e0
Content-Type: text/plain; charset="UTF-8"

Hi Cyril,

I have finished the latest LTP test around RHEL7/8 and mainline kernel
across arches. Apart from many known issues/bugs the test looks good.

The only failure to catch my attention is the ioctl_loop05 still getting
fail on s390x with RHEL8.2 or kernel-v5.7-rc5. I haven't dig into the
details since it looks insignificant.
@Yang Xu <xuyang2018.jy@cn.fujitsu.com> Xu, do you have any idea about that?

# ./ioctl_loop05
tst_test.c:1246: INFO: Timeout per run is 0h 05m 00s
tst_device.c:88: INFO: Found free device 0 '/dev/loop0'
ioctl_loop05.c:116: INFO: /dev/loop0 default logical_block_size is 512
ioctl_loop05.c:62: INFO: Without setting lo_offset or sizelimit
ioctl_loop05.c:63: BROK: ioctl(3,LOOP_SET_DIRECT_IO,...) failed: EINVAL (22)


On Thu, May 14, 2020 at 5:54 PM Cyril Hrubis <chrubis@suse.cz> wrote:

> Hi!
> This is a last call, if you think that something has to be included in
> the release speak up today.
>
> The last thing on my radar is the "syscalls: Fix issues around calling
> syscalls with old timespec" patch that should get in, after that I would
> like to proceed with the release.
>
> --
> Cyril Hrubis
> chrubis@suse.cz
>
> --
> Mailing list info: https://lists.linux.it/listinfo/ltp
>
>

-- 
Regards,
Li Wang

--0000000000007da6bf05a5a787e0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small">Hi=C2=A0Cyril,</div><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div><div class=3D"gmail_default" style=3D"font-size:sma=
ll">I have finished the latest LTP test around RHEL7/8 and mainline kernel =
across arches. Apart=C2=A0from many known issues/bugs the test looks good.<=
/div><div class=3D"gmail_default" style=3D"font-size:small"><br></div><div =
class=3D"gmail_default" style=3D"font-size:small">The only failure to=C2=A0=
catch my attention=C2=A0is the=C2=A0<span style=3D"color:rgb(0,0,0);white-s=
pace:pre-wrap">ioctl_loop05 still getting fail on s390x with RHEL8.2 or ker=
nel-v5.7-rc5. I haven&#39;t dig into the details since it looks </span>insi=
gnificant.=C2=A0</div><div class=3D"gmail_default" style=3D"font-size:small=
"><a class=3D"gmail_plusreply" id=3D"plusReplyChip-0" href=3D"mailto:xuyang=
2018.jy@cn.fujitsu.com" tabindex=3D"-1">@Yang Xu</a>=C2=A0Xu, do you have a=
ny idea about that?<br></div><div class=3D"gmail_default" style=3D"font-siz=
e:small"><span style=3D"color:rgb(0,0,0);white-space:pre-wrap"><br></span><=
/div><div class=3D"gmail_default" style=3D"font-size:small"># ./ioctl_loop0=
5 <br>tst_test.c:1246: INFO: Timeout per run is 0h 05m 00s<br>tst_device.c:=
88: INFO: Found free device 0 &#39;/dev/loop0&#39;<br>ioctl_loop05.c:116: I=
NFO: /dev/loop0 default logical_block_size is 512<br>ioctl_loop05.c:62: INF=
O: Without setting lo_offset or sizelimit<br>ioctl_loop05.c:63: BROK: ioctl=
(3,LOOP_SET_DIRECT_IO,...) failed: EINVAL (22)<br></div><div class=3D"gmail=
_default" style=3D"font-size:small"><br></div></div><br><div class=3D"gmail=
_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, May 14, 2020 at 5:54 =
PM Cyril Hrubis &lt;<a href=3D"mailto:chrubis@suse.cz" target=3D"_blank">ch=
rubis@suse.cz</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" sty=
le=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddi=
ng-left:1ex">Hi!<br>
This is a last call, if you think that something has to be included in<br>
the release speak up today.<br>
<br>
The last thing on my radar is the &quot;syscalls: Fix issues around calling=
<br>
syscalls with old timespec&quot; patch that should get in, after that I wou=
ld<br>
like to proceed with the release.<br>
<br>
-- <br>
Cyril Hrubis<br>
<a href=3D"mailto:chrubis@suse.cz" target=3D"_blank">chrubis@suse.cz</a><br=
>
<br>
-- <br>
Mailing list info: <a href=3D"https://lists.linux.it/listinfo/ltp" rel=3D"n=
oreferrer" target=3D"_blank">https://lists.linux.it/listinfo/ltp</a><br>
<br>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr"=
><div dir=3D"ltr"><div>Regards,<br></div><div>Li Wang<br></div></div></div>=
</div>

--0000000000007da6bf05a5a787e0--


--===============0723413072==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============0723413072==--

