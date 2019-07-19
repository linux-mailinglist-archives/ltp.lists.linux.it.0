Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FAB06E05C
	for <lists+linux-ltp@lfdr.de>; Fri, 19 Jul 2019 06:56:32 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id EF4343C1D13
	for <lists+linux-ltp@lfdr.de>; Fri, 19 Jul 2019 06:56:31 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 by picard.linux.it (Postfix) with ESMTP id D9A6C3C1C5A
 for <ltp@lists.linux.it>; Fri, 19 Jul 2019 06:56:29 +0200 (CEST)
Received: from mail-vs1-f68.google.com (mail-vs1-f68.google.com
 [209.85.217.68])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 31E971000936
 for <ltp@lists.linux.it>; Fri, 19 Jul 2019 06:56:22 +0200 (CEST)
Received: by mail-vs1-f68.google.com with SMTP id a186so19097767vsd.7
 for <ltp@lists.linux.it>; Thu, 18 Jul 2019 21:56:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=TCtxL33BhQfIht8BDQop5gJwutEOCHLcnc29uZASC18=;
 b=l/qOEmCLdb2SXskxU6mDNDVS4wN85qK/8onoeE1/IOeDxTcJiWtUPgoLXCggPn97OD
 khkwL1v6HMuJIsi/2lhZicFrsrKXIuH2KcxyyixNdEoLBpJwtoCga4f3t/5CBRFVP2tI
 A/XQS61Qr8ulnOJEGxfQsntts2WzT7amY36nkakqSBjOb+kjqAyXuZjdOVjDtfR65HEv
 LYeZgbhCWwpLM85zIUpOhYCsgqYBB8IDkaFoIxIYygVp1F7oszY1RzoNdqJsfCTdkZzn
 NgNahiNi3baiUDZ2i05JT00kXezqurecLEdhaC98BOhwiMHYhvLeSBOqdNEJp6Alf4HK
 Wszw==
X-Gm-Message-State: APjAAAWuUGi91378RF5PlsW8n+13GKIjCbVebU/edtkW3C7w9weM+NlH
 jxzHuVw9ouoTPKJe1MzGiOlD+8kZ/o1wBXRcKAIrrCweiTM=
X-Google-Smtp-Source: APXvYqxKdu24WWwMiqCxIWFR/fWg2yPF01w72tHKsZ2ppun5d7nukTg0czBLCbFcOxjib+aXN8Xt8R2AkhQGkxDGuAQ=
X-Received: by 2002:a67:e24e:: with SMTP id w14mr13060269vse.124.1563512186142; 
 Thu, 18 Jul 2019 21:56:26 -0700 (PDT)
MIME-Version: 1.0
References: <20190718083943.7687-1-pvorel@suse.cz>
In-Reply-To: <20190718083943.7687-1-pvorel@suse.cz>
From: Li Wang <liwang@redhat.com>
Date: Fri, 19 Jul 2019 12:56:15 +0800
Message-ID: <CAEemH2etXFYC-R1znaKCm_WyQDvAqT0fZafKLJGzTUU6uMEN1A@mail.gmail.com>
To: Petr Vorel <pvorel@suse.cz>
X-Virus-Scanned: clamav-milter 0.99.2 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=HTML_MESSAGE,SPF_HELO_NONE,
 SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 1/2] shell: Use $LTP_TIMEOUT_MUL also in retry
 functions
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
Content-Type: multipart/mixed; boundary="===============1516335479=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============1516335479==
Content-Type: multipart/alternative; boundary="00000000000075163c058e018c13"

--00000000000075163c058e018c13
Content-Type: text/plain; charset="UTF-8"

On Thu, Jul 18, 2019 at 4:39 PM Petr Vorel <pvorel@suse.cz> wrote:

> in TST_RETRY_FN_EXP_BACKOFF() and thus in TST_RETRY_FUNC() in new shell
> API.
>
> This function should also address possibility of slow machine.
>
> Because using on 2 places moved the default definition to the beginning
> of the script.
> + use $((...)) instead of expr.
> + move expression using $3 after check whether we have enough parameters
>
> + document LTP_TIMEOUT_MUL environment variable in wiki.
>
> Signed-off-by: Petr Vorel <pvorel@suse.cz>
> ---
> Hi,
>
> I can squash these 2 commits.
>
> General question about Test Writing Guidelines in wiki [1]:
> 1) we have separate section for C and shell API, which is probably a good
> choice, but we're trying to sync them. That leads to things like retry
> function documented under chapter for shell API (2.3).
>

Thanks for point out this.

>
> + That page is too long and without table of contents (not easy to
> navigate in it; I tried to add TOC, but without success). Maybe adding
> TOC or split the page to 3: 1) general info 2) C API 3) shell API would
> help. WDYT?
>

Personally, I think adding TOC may be a better choice, since we don't have
the whole picture for the guidelines and usually hard to navigate in it.

To split the guideline that probably leads to the new LTP-user to read more
document pages. That's an annoying thing for me at least :).


>
> Kind regards,
> Petr
>
> [1] https://github.com/linux-test-project/ltp/wiki/Test-Writing-Guidelines
> [2]
> https://github.com/linux-test-project/ltp/wiki/Test-Writing-Guidelines#retry-a-function-in-limited-time
>
>  doc/test-writing-guidelines.txt | 2 ++
>  testcases/lib/tst_test.sh       | 9 +++++----
>  2 files changed, 7 insertions(+), 4 deletions(-)
>
> diff --git a/doc/test-writing-guidelines.txt
> b/doc/test-writing-guidelines.txt
> index 869e6ed35..782e14f32 100644
> --- a/doc/test-writing-guidelines.txt
> +++ b/doc/test-writing-guidelines.txt
> @@ -1881,6 +1881,8 @@ simply by setting right '$TST_NEEDS_FOO'.
>                         the test (see below).
>  | 'TST_NEEDS_MODULE' | Test module name needed for the test (see below).
>  | 'TST_NEEDS_DRIVERS'| Checks kernel drivers support for the test.
> +| 'LTP_TIMEOUT_MUL'  | Multiply timeout (> 1 is useful for slow machines
> to
> +                       avoid unexpected timeout).
>
>  |=============================================================================
>
>  Checking for presence of commands
> diff --git a/testcases/lib/tst_test.sh b/testcases/lib/tst_test.sh
> index 31b3a3951..60d765424 100644
> --- a/testcases/lib/tst_test.sh
> +++ b/testcases/lib/tst_test.sh
> @@ -17,6 +17,8 @@ export TST_ITERATIONS=1
>  export TST_TMPDIR_RHOST=0
>  export TST_LIB_LOADED=1
>
> +export LTP_TIMEOUT_MUL=${LTP_TIMEOUT_MUL:-1}
> +
>  . tst_ansi_color.sh
>  . tst_security.sh
>
> @@ -164,12 +166,13 @@ TST_RETRY_FN_EXP_BACKOFF()
>  {
>         local tst_fun="$1"
>         local tst_exp=$2
> -       local tst_sec=$(expr $3 \* 1000000)
>         local tst_delay=1
> +       local tst_sec
>
>         if [ $# -ne 3 ]; then
>                 tst_brk TBROK "TST_RETRY_FN_EXP_BACKOFF expects 3
> parameters"
>         fi
> +       tst_sec=$(($3 * LTP_TIMEOUT_MUL * 1000000))


>         if ! tst_is_int "$tst_sec"; then
>                 tst_brk TBROK "TST_RETRY_FN_EXP_BACKOFF: tst_sec must be
> integer ('$tst_sec')"
> @@ -185,7 +188,7 @@ TST_RETRY_FN_EXP_BACKOFF()
>                         tst_sleep ${tst_delay}us
>                         tst_delay=$((tst_delay*2))
>                 else
> -                       tst_brk TBROK "\"$tst_fun\" timed out"
> +                       tst_brk TBROK "\"$tst_fun\" timed out! If you are
> running on slow machine, try exporting LTP_TIMEOUT_MUL > 1"
>                 fi
>         done
>
> @@ -374,8 +377,6 @@ _tst_rescmp()
>
>  _tst_setup_timer()
>  {
> -       LTP_TIMEOUT_MUL=${LTP_TIMEOUT_MUL:-1}
> -
>         local sec=$((300 * LTP_TIMEOUT_MUL))
>

Maybe we need to check if the LTP_TIMEOUT_MUL is valid(>1) as what we do
for C API?

-- 
Regards,
Li Wang

--00000000000075163c058e018c13
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote"><div dir=3D"lt=
r" class=3D"gmail_attr">On Thu, Jul 18, 2019 at 4:39 PM Petr Vorel &lt;<a h=
ref=3D"mailto:pvorel@suse.cz" target=3D"_blank">pvorel@suse.cz</a>&gt; wrot=
e:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0=
.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">in TST_RETRY_=
FN_EXP_BACKOFF() and thus in TST_RETRY_FUNC() in new shell API.<br>
<br>
This function should also address possibility of slow machine.<br>
<br>
Because using on 2 places moved the default definition to the beginning<br>
of the script.<br>
+ use $((...)) instead of expr.<br>
+ move expression using $3 after check whether we have enough parameters<br=
>
<br>
+ document LTP_TIMEOUT_MUL environment variable in wiki.<br>
<br>
Signed-off-by: Petr Vorel &lt;<a href=3D"mailto:pvorel@suse.cz" target=3D"_=
blank">pvorel@suse.cz</a>&gt;<br>
---<br>
Hi,<br>
<br>
I can squash these 2 commits.<br>
<br>
General question about Test Writing Guidelines in wiki [1]:<br>
1) we have separate section for C and shell API, which is probably a good<b=
r>
choice, but we&#39;re trying to sync them. That leads to things like retry<=
br>
function documented under chapter for shell API (2.3).<br></blockquote><div=
><br></div><div class=3D"gmail_default" style=3D"font-size:small">Thanks fo=
r point out this.</div><div class=3D"gmail_default" style=3D"font-size:smal=
l"></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8e=
x;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
+ That page is too long and without table of contents (not easy to<br>
navigate in it; I tried to add TOC, but without success). Maybe adding<br>
TOC or split the page to 3: 1) general info 2) C API 3) shell API would<br>
help. WDYT?<br></blockquote><div><br></div><div><div class=3D"gmail_default=
" style=3D"font-size:small">Personally, I think adding TOC may be a better =
choice, since we don&#39;t have the whole picture for the guidelines and us=
ually hard to navigate in it.=C2=A0</div><div class=3D"gmail_default" style=
=3D"font-size:small"><br></div><div class=3D"gmail_default" style=3D"font-s=
ize:small">To split the guideline that probably leads to the new LTP-user t=
o read more document pages. That&#39;s an=C2=A0annoying thing for me at lea=
st :).</div></div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">
<br>
Kind regards,<br>
Petr<br>
<br>
[1] <a href=3D"https://github.com/linux-test-project/ltp/wiki/Test-Writing-=
Guidelines" rel=3D"noreferrer" target=3D"_blank">https://github.com/linux-t=
est-project/ltp/wiki/Test-Writing-Guidelines</a><br>
[2] <a href=3D"https://github.com/linux-test-project/ltp/wiki/Test-Writing-=
Guidelines#retry-a-function-in-limited-time" rel=3D"noreferrer" target=3D"_=
blank">https://github.com/linux-test-project/ltp/wiki/Test-Writing-Guidelin=
es#retry-a-function-in-limited-time</a><br>
<br>
=C2=A0doc/test-writing-guidelines.txt | 2 ++<br>
=C2=A0testcases/lib/tst_test.sh=C2=A0 =C2=A0 =C2=A0 =C2=A0| 9 +++++----<br>
=C2=A02 files changed, 7 insertions(+), 4 deletions(-)<br>
<br>
diff --git a/doc/test-writing-guidelines.txt b/doc/test-writing-guidelines.=
txt<br>
index 869e6ed35..782e14f32 100644<br>
--- a/doc/test-writing-guidelines.txt<br>
+++ b/doc/test-writing-guidelines.txt<br>
@@ -1881,6 +1881,8 @@ simply by setting right &#39;$TST_NEEDS_FOO&#39;.<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 the test (see below).<br>
=C2=A0| &#39;TST_NEEDS_MODULE&#39; | Test module name needed for the test (=
see below).<br>
=C2=A0| &#39;TST_NEEDS_DRIVERS&#39;| Checks kernel drivers support for the =
test.<br>
+| &#39;LTP_TIMEOUT_MUL&#39;=C2=A0 | Multiply timeout (&gt; 1 is useful for=
 slow machines to<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0avoid unexpected timeout).<br>
=C2=A0|=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D<br>
<br>
=C2=A0Checking for presence of commands<br>
diff --git a/testcases/lib/tst_test.sh b/testcases/lib/tst_test.sh<br>
index 31b3a3951..60d765424 100644<br>
--- a/testcases/lib/tst_test.sh<br>
+++ b/testcases/lib/tst_test.sh<br>
@@ -17,6 +17,8 @@ export TST_ITERATIONS=3D1<br>
=C2=A0export TST_TMPDIR_RHOST=3D0<br>
=C2=A0export TST_LIB_LOADED=3D1<br>
<br>
+export LTP_TIMEOUT_MUL=3D${LTP_TIMEOUT_MUL:-1}<br>
+<br>
=C2=A0. tst_ansi_color.sh<br>
=C2=A0. tst_security.sh<br>
<br>
@@ -164,12 +166,13 @@ TST_RETRY_FN_EXP_BACKOFF()<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 local tst_fun=3D&quot;$1&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 local tst_exp=3D$2<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0local tst_sec=3D$(expr $3 \* 1000000)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 local tst_delay=3D1<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0local tst_sec<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 if [ $# -ne 3 ]; then<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 tst_brk TBROK &quot=
;TST_RETRY_FN_EXP_BACKOFF expects 3 parameters&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 fi<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0tst_sec=3D$(($3 * LTP_TIMEOUT_MUL * 1000000))</=
blockquote><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.=
8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 if ! tst_is_int &quot;$tst_sec&quot;; then<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 tst_brk TBROK &quot=
;TST_RETRY_FN_EXP_BACKOFF: tst_sec must be integer (&#39;$tst_sec&#39;)&quo=
t;<br>
@@ -185,7 +188,7 @@ TST_RETRY_FN_EXP_BACKOFF()<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 tst_sleep ${tst_delay}us<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 tst_delay=3D$((tst_delay*2))<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 else<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0tst_brk TBROK &quot;\&quot;$tst_fun\&quot; timed out&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0tst_brk TBROK &quot;\&quot;$tst_fun\&quot; timed out! If you are =
running on slow machine, try exporting LTP_TIMEOUT_MUL &gt; 1&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fi<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 done<br>
<br>
@@ -374,8 +377,6 @@ _tst_rescmp()<br>
<br>
=C2=A0_tst_setup_timer()<br>
=C2=A0{<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0LTP_TIMEOUT_MUL=3D${LTP_TIMEOUT_MUL:-1}<br>
-<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 local sec=3D$((300 * LTP_TIMEOUT_MUL))<br></blo=
ckquote><div><br></div><div class=3D"gmail_default" style=3D"font-size:smal=
l">Maybe we need to check if the LTP_TIMEOUT_MUL is valid(&gt;1) as what we=
 do for C API?=C2=A0<br></div></div><div><br></div>-- <br><div dir=3D"ltr" =
class=3D"m_6408866957368653632gmail_signature"><div dir=3D"ltr"><div>Regard=
s,<br></div><div>Li Wang<br></div></div></div></div>

--00000000000075163c058e018c13--

--===============1516335479==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============1516335479==--
