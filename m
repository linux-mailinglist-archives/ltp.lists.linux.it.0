Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 9748D4FF8E
	for <lists+linux-ltp@lfdr.de>; Mon, 24 Jun 2019 04:56:19 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 60B8A3C1911
	for <lists+linux-ltp@lfdr.de>; Mon, 24 Jun 2019 04:56:19 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 by picard.linux.it (Postfix) with ESMTP id A9A6F3C1832
 for <ltp@lists.linux.it>; Mon, 24 Jun 2019 04:56:15 +0200 (CEST)
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com
 [209.85.167.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 2EFD8140076F
 for <ltp@lists.linux.it>; Mon, 24 Jun 2019 04:56:15 +0200 (CEST)
Received: by mail-lf1-f47.google.com with SMTP id u10so8798497lfm.12
 for <ltp@lists.linux.it>; Sun, 23 Jun 2019 19:56:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=C4mRE5+hgQNetwKBgp9lWBc/pa2ymeBvSIyYDtwPGDk=;
 b=QNQyv0tHzqI+pDrsypSUe7eGNXgNZTCZTV26VcTBxd1utocmS/2fvOR6rFsbYWUks6
 qk8QhcTwVHo1/zDPp8H48A2pwv5ZHLTbcmJLNxZ2xBSoSEP7gcIhEAJvjEqIHmRaIT78
 HLuRCUKfK1ojHamocn8H5MXV0ECBk9bl7Ccp3751xwpItKt2D/nf1pum8YRiiBW7P0BA
 GydBgMASGsIXMUkJoaV8Z2VJBF1CAz97Ye+HsYGp7Ub0Ln4EhMuEUL2bS+mt6nsuDeDS
 AmXTAyCyN/gD/20MWNZRMuSTVRAjuBAW37dettkDMfguYIHmmJYqncNpCsUU2wZmg8Ys
 9Uzw==
X-Gm-Message-State: APjAAAXL/lTkpFi71LlvF7Y7ImW/aVu4bRRxqVmDwCTPn6UuWS+g8Y4o
 ZfZxm/89YtMYq2d9ubQWu8AZOsUzMlIqyogZKlYKXg==
X-Google-Smtp-Source: APXvYqw4eWukXNPFoAfBLOakKNjCrSq681Y38nNWGCINEyH7bJ+ZBiMHVVVSA35MQRwsvVyBCboRTIFEVEUeFOl5WZk=
X-Received: by 2002:ac2:5ec6:: with SMTP id d6mr31062208lfq.131.1561344974624; 
 Sun, 23 Jun 2019 19:56:14 -0700 (PDT)
MIME-Version: 1.0
References: <20190621095134.12604-1-pifang@redhat.com>
In-Reply-To: <20190621095134.12604-1-pifang@redhat.com>
From: Li Wang <liwan@redhat.com>
Date: Mon, 24 Jun 2019 10:56:02 +0800
Message-ID: <CAEemH2dJAqJRY4ZM_oJ+rjoYOkqGQm=At2boHRfJZ=RLfP_+yg@mail.gmail.com>
To: Ping Fang <pifang@redhat.com>
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=HTML_MESSAGE,SPF_HELO_NONE,
 SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
Cc: LTP List <ltp@lists.linux.it>
Subject: Re: [LTP] [PATCH] syscalls/clock_adjtime: Fix unsupported WARN
X-BeenThere: ltp@lists.linux.it
X-Mailman-Version: 2.1.18
Precedence: list
List-Id: Linux Test Project <ltp.lists.linux.it>
List-Unsubscribe: <https://lists.linux.it/options/ltp>,
 <mailto:ltp-request@lists.linux.it?subject=unsubscribe>
List-Archive: <http://lists.linux.it/pipermail/ltp/>
List-Post: <mailto:ltp@lists.linux.it>
List-Help: <mailto:ltp-request@lists.linux.it?subject=help>
List-Subscribe: <https://lists.linux.it/listinfo/ltp>,
 <mailto:ltp-request@lists.linux.it?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============1414814326=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============1414814326==
Content-Type: multipart/alternative; boundary="00000000000095b5ee058c08f486"

--00000000000095b5ee058c08f486
Content-Type: text/plain; charset="UTF-8"

On Fri, Jun 21, 2019 at 5:51 PM Ping Fang <pifang@redhat.com> wrote:

> When clock_adjtime is not implemented, cleanup will
> still try this call, then enter tst_cvres WARN handler.
>
> tst_test.c:1096: INFO: Timeout per run is 0h 05m 00s
> ../../../../include/tst_safe_clocks.h:57: CONF: syscall(-1)
> __NR_clock_adjtime not supported
> ../../../../include/tst_safe_clocks.h:57: CONF: syscall(-1)
> __NR_clock_adjtime not supported
> ../../../../include/tst_safe_clocks.h:60: WARN: clock_adjtime02.c:211
> clock_adjtime() failed -1: ENOSYS
>
> Summary:
> passed   0
> failed   0
> skipped  1
> warnings 1
>
> Signed-off-by: Ping Fang <pifang@redhat.com>
>

Reviewed-by: Li Wang <liwang@redhat.com>
-- 
Regards,
Li Wang

--00000000000095b5ee058c08f486
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote"><div dir=3D"lt=
r" class=3D"gmail_attr">On Fri, Jun 21, 2019 at 5:51 PM Ping Fang &lt;<a hr=
ef=3D"mailto:pifang@redhat.com">pifang@redhat.com</a>&gt; wrote:<br></div><=
blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-l=
eft:1px solid rgb(204,204,204);padding-left:1ex">When clock_adjtime is not =
implemented, cleanup will<br>
still try this call, then enter tst_cvres WARN handler.<br>
<br>
tst_test.c:1096: INFO: Timeout per run is 0h 05m 00s<br>
../../../../include/tst_safe_clocks.h:57: CONF: syscall(-1)<br>
__NR_clock_adjtime not supported<br>
../../../../include/tst_safe_clocks.h:57: CONF: syscall(-1)<br>
__NR_clock_adjtime not supported<br>
../../../../include/tst_safe_clocks.h:60: WARN: clock_adjtime02.c:211<br>
clock_adjtime() failed -1: ENOSYS<br>
<br>
Summary:<br>
passed=C2=A0 =C2=A00<br>
failed=C2=A0 =C2=A00<br>
skipped=C2=A0 1<br>
warnings 1<br>
<br>
Signed-off-by: Ping Fang &lt;<a href=3D"mailto:pifang@redhat.com" target=3D=
"_blank">pifang@redhat.com</a>&gt;<br></blockquote><div><br></div><div clas=
s=3D"gmail_default" style=3D"font-size:small">Reviewed-by: Li Wang &lt;<a h=
ref=3D"mailto:liwang@redhat.com">liwang@redhat.com</a>&gt;</div><div class=
=3D"gmail_default" style=3D"font-size:small"></div></div>-- <br><div dir=3D=
"ltr" class=3D"gmail_signature"><div dir=3D"ltr"><div><div dir=3D"ltr">Rega=
rds,<br>Li Wang<br></div></div></div></div></div>

--00000000000095b5ee058c08f486--

--===============1414814326==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

Ci0tIApNYWlsaW5nIGxpc3QgaW5mbzogaHR0cHM6Ly9saXN0cy5saW51eC5pdC9saXN0aW5mby9s
dHAK

--===============1414814326==--
