Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 658D413DFBD
	for <lists+linux-ltp@lfdr.de>; Thu, 16 Jan 2020 17:15:39 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 35B923C23B0
	for <lists+linux-ltp@lfdr.de>; Thu, 16 Jan 2020 17:15:39 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 by picard.linux.it (Postfix) with ESMTP id C45AE3C238B
 for <ltp@lists.linux.it>; Thu, 16 Jan 2020 17:15:36 +0100 (CET)
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [205.139.110.61])
 by in-5.smtp.seeweb.it (Postfix) with ESMTP id 44B8660094F
 for <ltp@lists.linux.it>; Thu, 16 Jan 2020 17:15:33 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1579191333;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=3hyPXI48yuXqcV1zIlCkYuEA1opghqDn34STkuzjl5A=;
 b=UMkr5FTN5sQn5/7HHsw3xHu+jIpxGgdtkxk8Ni+x+9g1TXPy5we6jcKKlLxsubZ+pqIsgA
 wPvYaomr5BnmekdWrHU35GWs5G8kTvRZ7mfn2k+axMMNTDmW6gxwDe45RWU6UNsvMCaYdW
 Fey3MZmpsgBhW08PrIflWxGJ7wqOz64=
Received: from mail-ot1-f71.google.com (mail-ot1-f71.google.com
 [209.85.210.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-144-8-Ae1TTmMNuYOMaPS0dlGQ-1; Thu, 16 Jan 2020 11:15:31 -0500
Received: by mail-ot1-f71.google.com with SMTP id z3so11804165oto.22
 for <ltp@lists.linux.it>; Thu, 16 Jan 2020 08:15:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=O3GRVIGLCrbanLm6j/aVzkztDTuAEcYqI3Y1J2IyA7U=;
 b=rrdn2hDPpC64D5JEDISJQbnFPeCtKp8FxAI0jrM3yRRRVG8ebLw41PyzF/YDiNQjrj
 jVe/M865rioZrqnYUt1ojYhPAozHXlUowzUWZEBjhEKCzrr7bECGdhtrypCtOJrVmcgc
 dnGElS3Sd/zUUt3xvCACylWOfhIYgGQzTbtSol81+fjqyiOOCh/mtaHrJBWMNZy124l5
 1UEXK4dUghsiWTfZRXiDLcZ2EBeimMCLomhwMzjsRbzY7KtegTGgqh75S7s/tMX6Gv2Z
 G9q+F9JVmcvvfNkelSFElRYs/5a0QuU5KG54HLecgpVlP/oI3f+OAZCger9mZLxz7bgb
 drPQ==
X-Gm-Message-State: APjAAAV+ccHQ71nYpsWwDWmbPwfHZYppumphuEJI0k9VaCyomhpYdDQ1
 UR47EVodClrffmmX8Dvu/y/tkOuYmlHVnZdp5Q0GXA9OouGGG+D1/EiDH0FguFeQdaYGksuL5XX
 M+8kEE2vcXbpAAevwDZLL4PhS2dM=
X-Received: by 2002:a05:6808:30d:: with SMTP id
 i13mr4444777oie.144.1579191330593; 
 Thu, 16 Jan 2020 08:15:30 -0800 (PST)
X-Google-Smtp-Source: APXvYqwfFWZGrcOt0lTnM97URDf5QzM/PPAlRMpy2aNtjdojfqKbQs/WC18ic7nI5glvmaraDpNLeAQy9AZ+J46O9z4=
X-Received: by 2002:a05:6808:30d:: with SMTP id
 i13mr4444753oie.144.1579191330208; 
 Thu, 16 Jan 2020 08:15:30 -0800 (PST)
MIME-Version: 1.0
References: <20191213125435.GB20795@rei.lan> <20200115161510.GA6523@rei.lan>
In-Reply-To: <20200115161510.GA6523@rei.lan>
From: Li Wang <liwang@redhat.com>
Date: Thu, 16 Jan 2020 17:15:18 +0100
Message-ID: <CAEemH2fzc4___xYFQTca0MD5gNLxVuOJzFSQqKLiL9L+3Eg1WQ@mail.gmail.com>
To: Cyril Hrubis <chrubis@suse.cz>
X-MC-Unique: 8-Ae1TTmMNuYOMaPS0dlGQ-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,HTML_MESSAGE,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-5.smtp.seeweb.it
Subject: Re: [LTP] LTP Release plans
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
Content-Type: multipart/mixed; boundary="===============0442027661=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============0442027661==
Content-Type: multipart/alternative; boundary="0000000000004519b8059c4422f3"

--0000000000004519b8059c4422f3
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Wed, Jan 15, 2020 at 5:15 PM Cyril Hrubis <chrubis@suse.cz> wrote:

> Hi!
> I've just finished patchwork queue review and I think that we are fine
> and that we should freeze the git for anything but bugfixes at this
> point.
>
> I will do a bit more pre-release testing, however the results so far
> looks good to me.
>

FYI:

I did a round of testing against RHEL6/7/8 and upstream kernel, the test
result looks good except only below tiny issues:

- RHEL6 x86_64 (it is a kernel bug that in old distro)
sysctl02 1 TFAIL: /proc/sys/fs/file-max overflows and is set to 0
sysctl02 2 TINFO: trying to set fs.file-max=3D18446744073709551615
sysctl02 2 TFAIL: /proc/sys/fs/file-max overflows and is set to
18446744073709551615
sysctl02 3 TINFO: trying to set fs.file-max=3D9223372036854775808
sysctl02 3 TFAIL: /proc/sys/fs/file-max overflows and is set to
9223372036854775808

fallocate04, fallocate05, fsetxattr01, fdatasync03, fgetxattr01 have the
same issue as:
tst_test.c:1278: INFO: Testing on vfat
tst_mkfs.c:90: INFO: Formatting /dev/loop0 with vfat opts=3D'' extra opts=
=3D''
mkfs.vfat: unable to open /dev/loop0
tst_mkfs.c:101: BROK: mkfs.vfat:1: tst_test.c failed with 831

- RHEL7.8 x86_64
  copy_file_range02 failed as a known kernel bug

- RHEL7.8 ppc64le (I have confirmed the latest rhel7 kernel has fixed this
bug)
timer_delete01.c:47: FAIL: Aborting test -
timer_create(CLOCK_BOOTTIME_ALARM) failed: ??? (524)
timer_delete01.c:36: INFO: Testing CLOCK_REALTIME_ALARM
timer_delete01.c:47: FAIL: Aborting test -
timer_create(CLOCK_REALTIME_ALARM) failed: ??? (524)
timer_delete01.c:36: INFO: Testing CLOCK_TAI
timer_delete01.c:54: PASS: Timer deleted successfully!

- Upstream kernel-5.5.0-rc5 x86_64/aarch64
system hang at fs_fill, it more like the unstable kernel issue but not LTP

--=20
Regards,
Li Wang

--0000000000004519b8059c4422f3
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_default" style=3D"font-size:small">Hi,=
</div><div class=3D"gmail_default" style=3D"font-size:small"><br></div><div=
 class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, Jan 15=
, 2020 at 5:15 PM Cyril Hrubis &lt;<a href=3D"mailto:chrubis@suse.cz" targe=
t=3D"_blank">chrubis@suse.cz</a>&gt; wrote:<br></div><blockquote class=3D"g=
mail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204=
,204,204);padding-left:1ex">Hi!<br>
I&#39;ve just finished patchwork queue review and I think that we are fine<=
br>
and that we should freeze the git for anything but bugfixes at this<br>
point.<br>
<br>
I will do a bit more pre-release testing, however the results so far<br>
looks good to me.<br></blockquote><div><br></div><div><div class=3D"gmail_d=
efault" style=3D"font-size:small">FYI:</div><br></div><div><div class=3D"gm=
ail_default" style=3D"font-size:small">I did a round of testing against=C2=
=A0RHEL6/7/8 and upstream kernel, the test result looks good except only be=
low tiny issues:</div><div class=3D"gmail_default" style=3D"font-size:small=
"><br></div><div class=3D"gmail_default"><div style=3D"font-size:small"><di=
v class=3D"gmail_default"><span style=3D"color:rgb(0,0,0);white-space:pre-w=
rap">- RHEL6 x86_64 (it is a kernel bug that in old distro)</span></div></d=
iv><div style=3D"font-size:small"><span style=3D"color:rgb(0,0,0);white-spa=
ce:pre-wrap">sysctl02 1 TFAIL: /proc/sys/fs/file-max overflows and is set t=
o 0</span></div><div style=3D"font-size:small"><span style=3D"color:rgb(0,0=
,0);white-space:pre-wrap">sysctl02 2 TINFO: trying to set fs.file-max=3D184=
46744073709551615</span></div><div style=3D"font-size:small"><span style=3D=
"color:rgb(0,0,0);white-space:pre-wrap">sysctl02 2 TFAIL: /proc/sys/fs/file=
-max overflows and is set to 18446744073709551615</span></div><div style=3D=
"font-size:small"><span style=3D"color:rgb(0,0,0);white-space:pre-wrap">sys=
ctl02 3 TINFO: trying to set fs.file-max=3D9223372036854775808</span></div>=
<div style=3D"font-size:small"><span style=3D"color:rgb(0,0,0);white-space:=
pre-wrap">sysctl02 3 TFAIL: /proc/sys/fs/file-max overflows and is set to 9=
223372036854775808</span></div><div style=3D"font-size:small"><span style=
=3D"color:rgb(0,0,0);white-space:pre-wrap"><br></span></div>fallocate04, fa=
llocate05, fsetxattr01,=C2=A0<span style=3D"color:rgb(0,0,0);white-space:pr=
e-wrap">fdatasync03, </span><span style=3D"color:rgb(0,0,0);white-space:pre=
-wrap">fgetxattr01</span>=C2=A0have the same issue as:</div>tst_test.c:1278=
: INFO: Testing on vfat=C2=A0</div><div>tst_mkfs.c:90: INFO: Formatting /de=
v/loop0 with vfat opts=3D&#39;&#39; extra opts=3D&#39;&#39;=C2=A0</div><div=
>mkfs.vfat: unable to open /dev/loop0=C2=A0</div><div>tst_mkfs.c:101: BROK:=
 mkfs.vfat:1: tst_test.c failed with 831<div class=3D"gmail_default"><br></=
div><div class=3D"gmail_default">- RHEL7.8 x86_64 =C2=A0</div><div class=3D=
"gmail_default">=C2=A0 copy_file_range02 failed as a known kernel bug</div>=
<div class=3D"gmail_default"><br></div><div class=3D"gmail_default">- RHEL7=
.8 ppc64le (I have confirmed the latest rhel7 kernel has fixed this bug)</d=
iv><div class=3D"gmail_default"><span style=3D"color:rgb(0,0,0);white-space=
:pre-wrap">timer_delete01.c:47: FAIL: Aborting test - timer_create(CLOCK_BO=
OTTIME_ALARM) failed: ??? (524)</span></div><div class=3D"gmail_default"><s=
pan style=3D"color:rgb(0,0,0);white-space:pre-wrap">timer_delete01.c:36: IN=
FO: Testing CLOCK_REALTIME_ALARM</span></div><div class=3D"gmail_default"><=
span style=3D"color:rgb(0,0,0);white-space:pre-wrap">timer_delete01.c:47: F=
AIL: Aborting test - timer_create(CLOCK_REALTIME_ALARM) failed: ??? (524)</=
span></div><div class=3D"gmail_default"><span style=3D"color:rgb(0,0,0);whi=
te-space:pre-wrap">timer_delete01.c:36: INFO: Testing CLOCK_TAI</span></div=
><div class=3D"gmail_default"><span style=3D"color:rgb(0,0,0);white-space:p=
re-wrap">timer_delete01.c:54: PASS: Timer deleted successfully!</span></div=
><div class=3D"gmail_default" style=3D"font-size:small"><br></div></div><di=
v class=3D"gmail_default" style=3D"font-size:small"><span style=3D"color:rg=
b(0,0,0);white-space:pre-wrap">- Upstream kernel-5.5.0-rc5 x86_64/aarch64 <=
/span></div><div class=3D"gmail_default" style=3D"font-size:small"><span st=
yle=3D"color:rgb(0,0,0);white-space:pre-wrap"> system hang at </span><span =
style=3D"color:rgb(0,0,0);white-space:pre-wrap">fs_fill, it more like the u=
nstable kernel issue but not LTP</span></div><div><br></div></div>-- <br><d=
iv dir=3D"ltr"><div dir=3D"ltr"><div>Regards,<br></div><div>Li Wang<br></di=
v></div></div></div>

--0000000000004519b8059c4422f3--


--===============0442027661==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============0442027661==--

