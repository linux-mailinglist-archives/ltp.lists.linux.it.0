Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C89A30706
	for <lists+linux-ltp@lfdr.de>; Fri, 31 May 2019 05:37:49 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 678143EA221
	for <lists+linux-ltp@lfdr.de>; Fri, 31 May 2019 05:37:49 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 by picard.linux.it (Postfix) with ESMTP id 37D353EA191
 for <ltp@lists.linux.it>; Fri, 31 May 2019 05:37:48 +0200 (CEST)
Received: from mail-vs1-f65.google.com (mail-vs1-f65.google.com
 [209.85.217.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 4DE7B2010F9
 for <ltp@lists.linux.it>; Fri, 31 May 2019 05:37:47 +0200 (CEST)
Received: by mail-vs1-f65.google.com with SMTP id n21so51667vsp.12
 for <ltp@lists.linux.it>; Thu, 30 May 2019 20:37:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=G5zXqeKtwTx/GkWXLiE50EPT9mnUTq4jZaKo5FGWx48=;
 b=SE5TMHjUcnWmkYWpC7LmUHd+lZTbYyRvt78tb2bQ9UHMPhxq1RQc11XXcIiV0VYqMd
 k2IHu1YWVky7UjMQcNI7FpptmXe2hm0+KJwTgt9q3rQ1NMUHHv2f0oEcDmJgz6+jr495
 UWFyUe/0pH+k/MDGlYx/K0VLBJELbcXXLBuM2g9c7sa/8AbObwkFc85Z2/EVBEEkTK9+
 Y9T+RQqJo82Z2kLitgv0nPaVu9dbMmxHv4AzkYGRwyvAH/U4bQvGZ70VJWXhg6aTW8QK
 5XMHFXX2jTdkv0j09f+5x/o4cn3xV1f60GWorQGeEb7x01QZUJQVt5Ji05A1wjPzy9HL
 3rqw==
X-Gm-Message-State: APjAAAWZCfjx1cAXe/c8n6ms+EOV1oA+HTT5tgK77iEu9s0xGUA2ABPr
 g3m1JpXO5oVWT9bmnX7O/w6qSzYb8PMNL5R2dj46mg==
X-Google-Smtp-Source: APXvYqxhqwPFBhe/GE/NPAJXQWA3fkGJiTj3pTyn3zWBRt78oMgE8tw7d1neE28Jn217//P34Y2dQpI/sI/xs9/KajI=
X-Received: by 2002:a67:e8c8:: with SMTP id y8mr4166197vsn.124.1559273866172; 
 Thu, 30 May 2019 20:37:46 -0700 (PDT)
MIME-Version: 1.0
References: <f11c83459b71fbf399794fb8363f2b538b0b6346.1559207183.git.caspar@casparzhang.com>
 <1985f9e48c4557c2ec52eded11d08f3b7b514962.1559207183.git.caspar@casparzhang.com>
In-Reply-To: <1985f9e48c4557c2ec52eded11d08f3b7b514962.1559207183.git.caspar@casparzhang.com>
From: Li Wang <liwang@redhat.com>
Date: Fri, 31 May 2019 11:37:34 +0800
Message-ID: <CAEemH2cW-zQwfs0ZPjDOTz82zkOXOeTHLunWffRyod3Acv_QCQ@mail.gmail.com>
To: Caspar Zhang <caspar@linux.alibaba.com>
X-Virus-Scanned: clamav-milter 0.99.2 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=HTML_MESSAGE,SPF_HELO_NONE,
 SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-7.smtp.seeweb.it
Cc: LTP List <ltp@lists.linux.it>
Subject: Re: [LTP] [PATCH 3/3] tst_test.sh,
 test.sh: report pass if both TPASS and TCONF exist in shell test
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
Content-Type: multipart/mixed; boundary="===============0476034443=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============0476034443==
Content-Type: multipart/alternative; boundary="000000000000e6b918058a26bc22"

--000000000000e6b918058a26bc22
Content-Type: text/plain; charset="UTF-8"

On Thu, May 30, 2019 at 5:11 PM Caspar Zhang <caspar@linux.alibaba.com>
wrote:

> We don't want the test reporting TCONF if at least one TPASS existed
> during testing. And this is also true in shell tests. So fix it.
>

PATCH 3/3 makes sense to me.

Reviewed-by: Li Wang <liwang@redhat.com>

>
> Signed-off-by: Caspar Zhang <caspar@linux.alibaba.com>
> ---
>  testcases/lib/test.sh     | 9 +++++++++
>  testcases/lib/tst_test.sh | 2 +-
>  2 files changed, 10 insertions(+), 1 deletion(-)
>
> diff --git a/testcases/lib/test.sh b/testcases/lib/test.sh
> index ade8fcdff..7cc3bb2fe 100644
> --- a/testcases/lib/test.sh
> +++ b/testcases/lib/test.sh
> @@ -23,6 +23,7 @@
>
>  export LTP_RET_VAL=0
>  export TST_COUNT=1
> +export TST_PASS_COUNT=0
>  export TST_LIB_LOADED=1
>  export TST_TMPDIR_RHOST=0
>
> @@ -60,6 +61,10 @@ tst_resm()
>         case "$ret" in
>         TPASS|TFAIL|TCONF) TST_COUNT=$((TST_COUNT+1));;
>         esac
> +
> +       if [ "$ret" = TPASS ]; then
> +               TST_PASS_COUNT=$((TST_PASS_COUNT+1))
> +       fi
>  }
>
>  tst_brkm()
> @@ -111,6 +116,10 @@ tst_exit()
>                 rm -f "$LTP_IPC_PATH"
>         fi
>
> +       # Mask out TCONF if no TFAIL/TBROK/TWARN but has TPASS
> +       if [ $((LTP_RET_VAL & 7)) -eq 0 -a $TST_PASS_COUNT -gt 0 ]; then
> +               LTP_RET_VAL=$((LTP_RET_VAL & ~32))
> +       fi
>         # Mask out TINFO
>         exit $((LTP_RET_VAL & ~16))
>  }
> diff --git a/testcases/lib/tst_test.sh b/testcases/lib/tst_test.sh
> index 512732315..bf725fdde 100644
> --- a/testcases/lib/tst_test.sh
> +++ b/testcases/lib/tst_test.sh
> @@ -78,7 +78,7 @@ _tst_do_exit()
>                 ret=$((ret|4))
>         fi
>
> -       if [ $TST_CONF -gt 0 ]; then
> +       if [ $TST_CONF -gt 0 -a $TST_PASS -eq 0 ]; then
>                 ret=$((ret|32))
>         fi
>
> --
> 2.21.0
>
>
> --
> Mailing list info: https://lists.linux.it/listinfo/ltp
>


-- 
Regards,
Li Wang

--000000000000e6b918058a26bc22
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote"><div dir=3D"lt=
r" class=3D"gmail_attr">On Thu, May 30, 2019 at 5:11 PM Caspar Zhang &lt;<a=
 href=3D"mailto:caspar@linux.alibaba.com">caspar@linux.alibaba.com</a>&gt; =
wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0=
px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">We don&#3=
9;t want the test reporting TCONF if at least one TPASS existed<br>
during testing. And this is also true in shell tests. So fix it.<br></block=
quote><div><br></div><div><div class=3D"gmail_default" style=3D"font-size:s=
mall">PATCH 3/3 makes sense to me.</div><br></div><div class=3D"gmail_defau=
lt" style=3D"font-size:small">Reviewed-by: Li Wang &lt;<a href=3D"mailto:li=
wang@redhat.com">liwang@redhat.com</a>&gt;</div><div class=3D"gmail_default=
" style=3D"font-size:small"></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">
<br>
Signed-off-by: Caspar Zhang &lt;<a href=3D"mailto:caspar@linux.alibaba.com"=
 target=3D"_blank">caspar@linux.alibaba.com</a>&gt;<br>
---<br>
=C2=A0testcases/lib/test.sh=C2=A0 =C2=A0 =C2=A0| 9 +++++++++<br>
=C2=A0testcases/lib/tst_test.sh | 2 +-<br>
=C2=A02 files changed, 10 insertions(+), 1 deletion(-)<br>
<br>
diff --git a/testcases/lib/test.sh b/testcases/lib/test.sh<br>
index ade8fcdff..7cc3bb2fe 100644<br>
--- a/testcases/lib/test.sh<br>
+++ b/testcases/lib/test.sh<br>
@@ -23,6 +23,7 @@<br>
<br>
=C2=A0export LTP_RET_VAL=3D0<br>
=C2=A0export TST_COUNT=3D1<br>
+export TST_PASS_COUNT=3D0<br>
=C2=A0export TST_LIB_LOADED=3D1<br>
=C2=A0export TST_TMPDIR_RHOST=3D0<br>
<br>
@@ -60,6 +61,10 @@ tst_resm()<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 case &quot;$ret&quot; in<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 TPASS|TFAIL|TCONF) TST_COUNT=3D$((TST_COUNT+1))=
;;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 esac<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if [ &quot;$ret&quot; =3D TPASS ]; then<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0TST_PASS_COUNT=3D$(=
(TST_PASS_COUNT+1))<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0fi<br>
=C2=A0}<br>
<br>
=C2=A0tst_brkm()<br>
@@ -111,6 +116,10 @@ tst_exit()<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 rm -f &quot;$LTP_IP=
C_PATH&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 fi<br>
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0# Mask out TCONF if no TFAIL/TBROK/TWARN but ha=
s TPASS<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if [ $((LTP_RET_VAL &amp; 7)) -eq 0 -a $TST_PAS=
S_COUNT -gt 0 ]; then<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0LTP_RET_VAL=3D$((LT=
P_RET_VAL &amp; ~32))<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0fi<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 # Mask out TINFO<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 exit $((LTP_RET_VAL &amp; ~16))<br>
=C2=A0}<br>
diff --git a/testcases/lib/tst_test.sh b/testcases/lib/tst_test.sh<br>
index 512732315..bf725fdde 100644<br>
--- a/testcases/lib/tst_test.sh<br>
+++ b/testcases/lib/tst_test.sh<br>
@@ -78,7 +78,7 @@ _tst_do_exit()<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ret=3D$((ret|4))<br=
>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 fi<br>
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if [ $TST_CONF -gt 0 ]; then<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if [ $TST_CONF -gt 0 -a $TST_PASS -eq 0 ]; then=
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ret=3D$((ret|32))<b=
r>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 fi<br>
<br>
-- <br>
2.21.0<br>
<br>
<br>
-- <br>
Mailing list info: <a href=3D"https://lists.linux.it/listinfo/ltp" rel=3D"n=
oreferrer" target=3D"_blank">https://lists.linux.it/listinfo/ltp</a><br>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr"=
 class=3D"gmail_signature"><div dir=3D"ltr"><div>Regards,<br></div><div>Li =
Wang<br></div></div></div></div>

--000000000000e6b918058a26bc22--

--===============0476034443==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

Ci0tIApNYWlsaW5nIGxpc3QgaW5mbzogaHR0cHM6Ly9saXN0cy5saW51eC5pdC9saXN0aW5mby9s
dHAK

--===============0476034443==--
