Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id AF1401CBD11
	for <lists+linux-ltp@lfdr.de>; Sat,  9 May 2020 05:50:43 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 0C9833C27E2
	for <lists+linux-ltp@lfdr.de>; Sat,  9 May 2020 05:50:43 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 by picard.linux.it (Postfix) with ESMTP id ABCB53C25F6
 for <ltp@lists.linux.it>; Sat,  9 May 2020 05:50:36 +0200 (CEST)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
 by in-6.smtp.seeweb.it (Postfix) with ESMTP id E56B51400DFB
 for <ltp@lists.linux.it>; Sat,  9 May 2020 05:50:34 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1588996232;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=+GgZ20RJGV+Ui8hQhExi504lLYNKVqzR/vCnyt9HVRo=;
 b=QsWhUCalZ+mjcDtSEhQR86nERizU9lwaKIdy4ZgtDq2YU+UAQI6mJRekrQI++2wu6Dt7Os
 tHRjRa8CL5KFs8YpE0sOsFwCTYLLLMZcO/mHIC/YrfMrPYljrvG4xl3/JRaZKlHuoDekde
 xFq/Bqczs/MHSD+93FdpTBWOZxAB2Do=
Received: from mail-lf1-f69.google.com (mail-lf1-f69.google.com
 [209.85.167.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-408-DaQWXo64Nr2FGBrB43Lk0g-1; Fri, 08 May 2020 23:50:28 -0400
X-MC-Unique: DaQWXo64Nr2FGBrB43Lk0g-1
Received: by mail-lf1-f69.google.com with SMTP id c7so1345302lfp.13
 for <ltp@lists.linux.it>; Fri, 08 May 2020 20:50:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=+GgZ20RJGV+Ui8hQhExi504lLYNKVqzR/vCnyt9HVRo=;
 b=fOAgw5RmzWduLSe8WzbU9dn4jtQer3vJ80ZnmQH00q0MJzH3TNEvV214WNms+Q3Q77
 dWXj1ok24wBLynsiv7UztbD7zIXqjHz1b2rA+mTOOATCsgtnu5VfnUlJTBPvHPnAngCg
 OxkakjSJHM2cIkdnriMEnBhMSHZ8EksPwY17RRWXYyblQOW/Nf4rkT3Rw1xl99yevrRR
 ZJoU0AXwQcIQymVLUx6hu/QjIC6E1bhe23snhWbeMhMWQE/khCgL2UzG9HEsiUVrOEgL
 H5857xtVIOWBO/9DvunSOAUcUPK/XyMLKC3+8Pg2qF1uukXe2VX7RBnZjTYv5z3ONVje
 MZrA==
X-Gm-Message-State: AOAM531ONigt0qCyht0Dn44F5ZBMZPmNw9ZEGZgaJUCMnzHY44LP8HGH
 XG6ZWWa2Db7d2HaxuIwrtURlPTn1tk87ewwXv+aNz00Qw8HkhKvxjRPG4RAPmYQBjg2eLm9hvQ3
 8fVjPA1PIicjYUIM1H2M6fwEvayE=
X-Received: by 2002:a2e:7508:: with SMTP id q8mr3721840ljc.234.1588996226227; 
 Fri, 08 May 2020 20:50:26 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJysoW2gLe6kwwyP8D9ZYPdDgpc3QXyI4+WwlzHffTEArTolbh8CsGwXPPvl2RnY1kwEylPNVvpyVIk7Az3wAbk=
X-Received: by 2002:a2e:7508:: with SMTP id q8mr3721834ljc.234.1588996226042; 
 Fri, 08 May 2020 20:50:26 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1588911607.git.viresh.kumar@linaro.org>
 <e03c9d77116e9f7f2b6a179644aab18bd9ece9e1.1588911607.git.viresh.kumar@linaro.org>
In-Reply-To: <e03c9d77116e9f7f2b6a179644aab18bd9ece9e1.1588911607.git.viresh.kumar@linaro.org>
From: Li Wang <liwang@redhat.com>
Date: Sat, 9 May 2020 11:50:13 +0800
Message-ID: <CAEemH2eNPdvn=g-Br5euJ=qnOJi4KraUcpLmM1RZD+iN_K7FpA@mail.gmail.com>
To: Viresh Kumar <viresh.kumar@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,HTML_MESSAGE,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [PATCH V2 16/17] syscalls/utimensat: Migrate to new test
 framework
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
Content-Type: multipart/mixed; boundary="===============0841843610=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============0841843610==
Content-Type: multipart/alternative; boundary="0000000000009a6abc05a52f034d"

--0000000000009a6abc05a52f034d
Content-Type: text/plain; charset="UTF-8"

Hi Viresh,

On Fri, May 8, 2020 at 12:28 PM Viresh Kumar <viresh.kumar@linaro.org>
wrote:

> This gets rid of the test script and updates the utimensat01.c file to
> handle most of the tests covered earlier (apart from testing the same
> for files owned by root, as the test is run as root right now).
>

Since we have removed the utimensat01_test.sh script, the Makefile,
runtest/syscalls should be updated too.
--- a/runtest/syscalls
+++ b/runtest/syscalls
@@ -1600,7 +1600,7 @@ utime06 utime06
 utimes01 utimes01

 # Introduced from Kernel 2.6.22 onwards
-utimensat01 utimensat_tests.sh
+utimensat01 utimensat01

 vfork01 vfork01
 vfork02 vfork02
diff --git a/testcases/kernel/syscalls/utimensat/Makefile
b/testcases/kernel/syscalls/utimensat/Makefile
index 69cab8dbc..044619fb8 100644
--- a/testcases/kernel/syscalls/utimensat/Makefile
+++ b/testcases/kernel/syscalls/utimensat/Makefile
@@ -5,8 +5,4 @@ top_srcdir              ?= ../../../..

 include $(top_srcdir)/include/mk/testcases.mk

-vpath %.c $(srcdir):$(top_srcdir)/lib
-
-INSTALL_TARGETS                := utimensat_tests.sh
-
 include $(top_srcdir)/include/mk/generic_leaf_target.mk

-- 
Regards,
Li Wang

--0000000000009a6abc05a52f034d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small">Hi=C2=A0Viresh,</div></div><br><div class=3D"gmail_quote"><di=
v dir=3D"ltr" class=3D"gmail_attr">On Fri, May 8, 2020 at 12:28 PM Viresh K=
umar &lt;<a href=3D"mailto:viresh.kumar@linaro.org">viresh.kumar@linaro.org=
</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:=
0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">=
This gets rid of the test script and updates the utimensat01.c file to<br>
handle most of the tests covered earlier (apart from testing the same<br>
for files owned by root, as the test is run as root right now).<br></blockq=
uote><div><br></div><div class=3D"gmail_default" style=3D"font-size:small">=
Since we have removed the=C2=A0<span style=3D"color:rgb(0,0,0);white-space:=
pre-wrap">utimensat01_test.sh script, the Makefile, </span>runtest/syscalls=
<span style=3D"color:rgb(0,0,0);white-space:pre-wrap"> should be updated to=
o.</span></div><div class=3D"gmail_default" style=3D"font-size:small"></div=
><div class=3D"gmail_default" style=3D"font-size:small">--- a/runtest/sysca=
lls<br>+++ b/runtest/syscalls<br>@@ -1600,7 +1600,7 @@ utime06 utime06<br>=
=C2=A0utimes01 utimes01<br>=C2=A0<br>=C2=A0# Introduced from Kernel 2.6.22 =
onwards<br>-utimensat01 utimensat_tests.sh<br>+utimensat01 utimensat01<br>=
=C2=A0<br>=C2=A0vfork01 vfork01<br>=C2=A0vfork02 vfork02<br>diff --git a/te=
stcases/kernel/syscalls/utimensat/Makefile b/testcases/kernel/syscalls/utim=
ensat/Makefile<br>index 69cab8dbc..044619fb8 100644<br>--- a/testcases/kern=
el/syscalls/utimensat/Makefile<br>+++ b/testcases/kernel/syscalls/utimensat=
/Makefile<br>@@ -5,8 +5,4 @@ top_srcdir =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0?=3D ../../../..<br>=C2=A0<br>=C2=A0include $(top_srcdir)/incl=
ude/mk/<a href=3D"http://testcases.mk">testcases.mk</a><br>=C2=A0<br>-vpath=
 %.c $(srcdir):$(top_srcdir)/lib<br>-<br>-INSTALL_TARGETS =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0:=3D utimensat_tests.sh<br>-<br>=C2=
=A0include $(top_srcdir)/include/mk/<a href=3D"http://generic_leaf_target.m=
k">generic_leaf_target.mk</a><br></div><div class=3D"gmail_default" style=
=3D"font-size:small"><br></div></div>-- <br><div dir=3D"ltr" class=3D"gmail=
_signature"><div dir=3D"ltr"><div>Regards,<br></div><div>Li Wang<br></div><=
/div></div></div>

--0000000000009a6abc05a52f034d--


--===============0841843610==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============0841843610==--

