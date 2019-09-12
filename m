Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 87CFCB0861
	for <lists+linux-ltp@lfdr.de>; Thu, 12 Sep 2019 07:42:28 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 318AC3C209F
	for <lists+linux-ltp@lfdr.de>; Thu, 12 Sep 2019 07:42:28 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 by picard.linux.it (Postfix) with ESMTP id AC11E3C0638
 for <ltp@lists.linux.it>; Thu, 12 Sep 2019 07:42:24 +0200 (CEST)
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id CAD636025CF
 for <ltp@lists.linux.it>; Thu, 12 Sep 2019 07:42:22 +0200 (CEST)
Received: from mail-oi1-f200.google.com (mail-oi1-f200.google.com
 [209.85.167.200])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id AD68B81DE1
 for <ltp@lists.linux.it>; Thu, 12 Sep 2019 05:42:20 +0000 (UTC)
Received: by mail-oi1-f200.google.com with SMTP id i20so9888204oib.5
 for <ltp@lists.linux.it>; Wed, 11 Sep 2019 22:42:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=IYUAXZacF/yulu8grfdBuuqLm6SvSCzUD4bul+d8Gqs=;
 b=S2EUlYdDs5VFSNye7iPXrB/j1H8vpssfVCSpYHbs+50MG0+zhjKNVgtqxCf2kYs5wn
 D+1C90XGEDz1r2fP23kdnhhDM2rErd8FrSijnjwT2Byk/zZPC/FnnUXV327MPmzA0mN3
 aan2+OZUAFuOX3HrgPmLceuvqE+IAu3EO+8ihn9CZ4L8uy4GCoIKLcN8YEqE55+jKn8k
 B7aD6Lyz7w8ah6kli/6swrxRZybr0rpJHmm6nJ6sWkX99bSSk+F2xmEqRFofkXTWbdR+
 6kkdAcNCox7dtLgMQNH0OmKWaRZTC507wKiWtXeSFbEZcYf/xEKszb2GFN3EIqE76QW9
 7HSw==
X-Gm-Message-State: APjAAAWcvanwHr1M2e5185fTv6MICobbUJ0DVGTHsuefgwhA5a4Ii3aX
 iwnR6+95IPP+qIDy17iYz3CLhkTUl5RRuZ75Hogq4p1B+emhIFcD2yKzoYBELbcuN70BMUxVhjY
 plma64h2gR93IHaPLkGY7iezCqmE=
X-Received: by 2002:a54:480d:: with SMTP id j13mr274936oij.96.1568266940129;
 Wed, 11 Sep 2019 22:42:20 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxZ/GMLwgFMlCjfI94kgsFYS/G6y5dDiLD9/ZhbXCp5uS2H3HbXLgWOGhxjKmiYQ3ah+YgqBnkZznoyCLJsupY=
X-Received: by 2002:a54:480d:: with SMTP id j13mr274926oij.96.1568266939859;
 Wed, 11 Sep 2019 22:42:19 -0700 (PDT)
MIME-Version: 1.0
References: <20190911085536.25546-1-cfamullaconrad@suse.de>
 <20190911165225.2122-1-cfamullaconrad@suse.de>
In-Reply-To: <20190911165225.2122-1-cfamullaconrad@suse.de>
From: Li Wang <liwang@redhat.com>
Date: Thu, 12 Sep 2019 13:42:08 +0800
Message-ID: <CAEemH2fy0hQc0yXJY0BXf8-9nnzkDW9LEsydyhtHC3Jboc_tFA@mail.gmail.com>
To: Clemens Famulla-Conrad <cfamullaconrad@suse.de>
X-Virus-Scanned: clamav-milter 0.99.2 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-0.0 required=7.0 tests=HTML_MESSAGE,SPF_HELO_PASS,
 SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2 1/3] tst_test.sh: Use LTP_TIMEOUT_MUL in
 TST_RETRY_FN()
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
Content-Type: multipart/mixed; boundary="===============1741753446=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============1741753446==
Content-Type: multipart/alternative; boundary="000000000000dd24e7059254998f"

--000000000000dd24e7059254998f
Content-Type: text/plain; charset="UTF-8"

On Thu, Sep 12, 2019 at 12:52 AM Clemens Famulla-Conrad <
cfamullaconrad@suse.de> wrote:

> Because of timeout problems when using TST_RETRY_FN() we do now use
> LTP_TIMEOUT_MUL to adopt the timeout value.
>
> Introduced tst_adjut_timeout function to have a generic place to
> adopt timeout values.
>

What about using tst_multipy_timeout as the function name? Since it only
raises the timeout value with a multiplier.


>
> Signed-off-by: Clemens Famulla-Conrad <cfamullaconrad@suse.de>
> ---
>  testcases/lib/tst_test.sh | 12 ++++++++----
>  1 file changed, 8 insertions(+), 4 deletions(-)
>
> diff --git a/testcases/lib/tst_test.sh b/testcases/lib/tst_test.sh
> index e0b24c6b9..03692e503 100644
> --- a/testcases/lib/tst_test.sh
> +++ b/testcases/lib/tst_test.sh
> @@ -164,7 +164,7 @@ TST_RETRY_FN_EXP_BACKOFF()
>  {
>         local tst_fun="$1"
>         local tst_exp=$2
> -       local tst_sec=$(expr $3 \* 1000000)
> +       local tst_sec=$(tst_adjust_timeout $(expr $3 \* 1000000))
>         local tst_delay=1
>
>         if [ $# -ne 3 ]; then
> @@ -371,12 +371,16 @@ _tst_rescmp()
>         fi
>  }
>
> -
> -_tst_setup_timer()
> +tst_adjust_timeout()
>  {
>         LTP_TIMEOUT_MUL=${LTP_TIMEOUT_MUL:-1}
> +       local timeout=$1
> +       echo $(( timeout * LTP_TIMEOUT_MUL))
>

Shouldn't we check the LTP_TIMEOUT_MUL > 1 before using it?

-- 
Regards,
Li Wang

--000000000000dd24e7059254998f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote"><div dir=3D"lt=
r" class=3D"gmail_attr">On Thu, Sep 12, 2019 at 12:52 AM Clemens Famulla-Co=
nrad &lt;<a href=3D"mailto:cfamullaconrad@suse.de">cfamullaconrad@suse.de</=
a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0p=
x 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Be=
cause of timeout problems when using TST_RETRY_FN() we do now use<br>
LTP_TIMEOUT_MUL to adopt the timeout value.<br>
<br>
Introduced tst_adjut_timeout function to have a generic place to<br>
adopt timeout values.<br></blockquote><div><br></div><div><div class=3D"gma=
il_default" style=3D"font-size:small">What about using tst_multipy_timeout =
as the function name? Since it only raises the timeout value with a multipl=
ier.</div></div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D=
"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-le=
ft:1ex">
<br>
Signed-off-by: Clemens Famulla-Conrad &lt;<a href=3D"mailto:cfamullaconrad@=
suse.de" target=3D"_blank">cfamullaconrad@suse.de</a>&gt;<br>
---<br>
=C2=A0testcases/lib/tst_test.sh | 12 ++++++++----<br>
=C2=A01 file changed, 8 insertions(+), 4 deletions(-)<br>
<br>
diff --git a/testcases/lib/tst_test.sh b/testcases/lib/tst_test.sh<br>
index e0b24c6b9..03692e503 100644<br>
--- a/testcases/lib/tst_test.sh<br>
+++ b/testcases/lib/tst_test.sh<br>
@@ -164,7 +164,7 @@ TST_RETRY_FN_EXP_BACKOFF()<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 local tst_fun=3D&quot;$1&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 local tst_exp=3D$2<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0local tst_sec=3D$(expr $3 \* 1000000)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0local tst_sec=3D$(tst_adjust_timeout $(expr $3 =
\* 1000000))<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 local tst_delay=3D1<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 if [ $# -ne 3 ]; then<br>
@@ -371,12 +371,16 @@ _tst_rescmp()<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 fi<br>
=C2=A0}<br>
<br>
-<br>
-_tst_setup_timer()<br>
+tst_adjust_timeout()<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 LTP_TIMEOUT_MUL=3D${LTP_TIMEOUT_MUL:-1}<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0local timeout=3D$1<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0echo $(( timeout * LTP_TIMEOUT_MUL))<br></block=
quote><div><br></div><div><div class=3D"gmail_default" style=3D"font-size:s=
mall">Shouldn&#39;t we check the LTP_TIMEOUT_MUL &gt; 1 before using it?</d=
iv></div></div><div><br></div>-- <br><div dir=3D"ltr" class=3D"gmail_signat=
ure"><div dir=3D"ltr"><div>Regards,<br></div><div>Li Wang<br></div></div></=
div></div>

--000000000000dd24e7059254998f--

--===============1741753446==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============1741753446==--
