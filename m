Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 144FD306F0
	for <lists+linux-ltp@lfdr.de>; Fri, 31 May 2019 05:17:31 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id D66F53EA221
	for <lists+linux-ltp@lfdr.de>; Fri, 31 May 2019 05:17:30 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 by picard.linux.it (Postfix) with ESMTP id 67CE63EA180
 for <ltp@lists.linux.it>; Fri, 31 May 2019 05:17:29 +0200 (CEST)
Received: from mail-vk1-f193.google.com (mail-vk1-f193.google.com
 [209.85.221.193])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 48B281400986
 for <ltp@lists.linux.it>; Fri, 31 May 2019 05:17:27 +0200 (CEST)
Received: by mail-vk1-f193.google.com with SMTP id d7so1211701vkf.1
 for <ltp@lists.linux.it>; Thu, 30 May 2019 20:17:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=l0KdoPT3KlrWpWBIo9fsU7gO8EWpS/qtgitGwenu8GQ=;
 b=Y+z4Qz48/DmIVC/HZc80gAMfOL798nd7ow0vJ9ljBaRqN/ZyoEHOD4z29AJ/4U8OPw
 PhHLIwOrwnj3tOYrbRPf4/S8+mBq/8J7vzOSPcXoyvhYhQ3xZLbbhDcT65qtnwm+VwFF
 6kbaMhHX8uFRGrU5kqDQFIF4KXoFBrtLWv3QXOgTBF4Ck8fSyhPLr7uBlRnUrgfX+wTN
 mhR31dfrPWeA3S2+DQn47lzAAxYnFNqJOorZqxXINXg58WkGsS2JXddqY2ohyzwkdV0W
 BpQax4wh933zXlXpbn0RpjHw+kIYN/nyiialBR7Rgx9hCsp0L4X6qUTAl7Osh3R4qbVp
 wuUw==
X-Gm-Message-State: APjAAAWXRqL31fJ4kp9bc5RyUZXO8VoKmtycPJhmrMgfa4RV6iVAqvZX
 2us6mikmJXiFiKbSyxV29m19CucvOfihgFZibAmXGQ==
X-Google-Smtp-Source: APXvYqyvX6gIZmLlC0BWxQv85cLCMw0S82EeJPQtgZoOOVUQnjdRGbnaC5ODE65LtzRTJtxMXul5pLEa5rmIQCeljUg=
X-Received: by 2002:a1f:bc4b:: with SMTP id m72mr3013056vkf.36.1559272645901; 
 Thu, 30 May 2019 20:17:25 -0700 (PDT)
MIME-Version: 1.0
References: <f11c83459b71fbf399794fb8363f2b538b0b6346.1559207183.git.caspar@casparzhang.com>
 <5e8374fa7f4ea9d64cdfc39a2ca449761327c257.1559207183.git.caspar@casparzhang.com>
In-Reply-To: <5e8374fa7f4ea9d64cdfc39a2ca449761327c257.1559207183.git.caspar@casparzhang.com>
From: Li Wang <liwang@redhat.com>
Date: Fri, 31 May 2019 11:17:14 +0800
Message-ID: <CAEemH2eV6RZKdZV0MMuogAzyvoXCsuvrfp3v_1TNtO1cOoAPGA@mail.gmail.com>
To: Caspar Zhang <caspar@linux.alibaba.com>
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=HTML_MESSAGE,SPF_HELO_NONE,
 SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
Cc: LTP List <ltp@lists.linux.it>
Subject: Re: [LTP] [PATCH 2/3] lib/test.sh: TCONF needs to be counted
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
Content-Type: multipart/mixed; boundary="===============2087022207=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============2087022207==
Content-Type: multipart/alternative; boundary="0000000000002ae5bc058a2674bd"

--0000000000002ae5bc058a2674bd
Content-Type: text/plain; charset="UTF-8"

On Thu, May 30, 2019 at 5:10 PM Caspar Zhang <caspar@linux.alibaba.com>
wrote:

> TCONF should also be one of exit statuses in a single test, else the
> output of TST_COUNT in shell tests could be wrong.
>
> Wrong:
> <<<test_output>>>
> memcg_use_hierarchy_test 1 TINFO: Starting test 1
> memcg_use_hierarchy_test 1 TINFO: set /dev/memcg/memory.use_hierarchy to 0
> failed
> memcg_use_hierarchy_test 1 TPASS: process 28658 is killed
> memcg_use_hierarchy_test 2 TINFO: Starting test 2
> memcg_use_hierarchy_test 2 TINFO: set /dev/memcg/memory.use_hierarchy to 0
> failed
> memcg_use_hierarchy_test 2 TCONF: memory.use_hierarchy already been 1,
> blame systemd, skip
> memcg_use_hierarchy_test 2 TINFO: Starting test 3
> memcg_use_hierarchy_test 2 TINFO: set /dev/memcg/memory.use_hierarchy to 0
> failed
> memcg_use_hierarchy_test 2 TPASS: echo 0 > subgroup/memory.use_hierarchy
> failed as expected
> <<<execution_status>>>
>
> Right:
> <<<test_output>>>
> memcg_use_hierarchy_test 1 TINFO: Starting test 1
> memcg_use_hierarchy_test 1 TINFO: set /dev/memcg/memory.use_hierarchy to 0
> failed
> memcg_use_hierarchy_test 1 TPASS: process 26825 is killed
> memcg_use_hierarchy_test 2 TINFO: Starting test 2
> memcg_use_hierarchy_test 2 TINFO: set /dev/memcg/memory.use_hierarchy to 0
> failed
> memcg_use_hierarchy_test 2 TCONF: memory.use_hierarchy already been 1,
> blame systemd, skip
> memcg_use_hierarchy_test 3 TINFO: Starting test 3
> memcg_use_hierarchy_test 3 TINFO: set /dev/memcg/memory.use_hierarchy to 0
> failed
> memcg_use_hierarchy_test 3 TPASS: echo 0 > subgroup/memory.use_hierarchy
> failed as expected
> <<<execution_status>>>
>

This is a good catch, but maybe it's not wise to simply regard the TCONF as
a single test, because there are many system-config detections in setup()
function, that will make LTP gives a mendacious report on the test numbers
if applying this patch.

e.g.

if tst_kvcmp -lt "3.10"; then
    tst_brk TCONF "test must be run with kernel 3.10 or newer"
fi
if dir path not exist; then
    tst_brk TCONF "system does not have xxxx/"
fi
and so on...



>
> Signed-off-by: Caspar Zhang <caspar@linux.alibaba.com>
> ---
>  testcases/lib/test.sh | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>
> diff --git a/testcases/lib/test.sh b/testcases/lib/test.sh
> index 670248ee5..ade8fcdff 100644
> --- a/testcases/lib/test.sh
> +++ b/testcases/lib/test.sh
> @@ -58,8 +58,7 @@ tst_resm()
>         echo " $@"
>
>         case "$ret" in
> -       TPASS|TFAIL)
> -       TST_COUNT=$((TST_COUNT+1));;
> +       TPASS|TFAIL|TCONF) TST_COUNT=$((TST_COUNT+1));;
>         esac
>  }
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

--0000000000002ae5bc058a2674bd
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote"><div dir=3D"lt=
r" class=3D"gmail_attr">On Thu, May 30, 2019 at 5:10 PM Caspar Zhang &lt;<a=
 href=3D"mailto:caspar@linux.alibaba.com">caspar@linux.alibaba.com</a>&gt; =
wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0=
px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">TCONF sho=
uld also be one of exit statuses in a single test, else the<br>
output of TST_COUNT in shell tests could be wrong.<br>
<br>
Wrong:<br>
&lt;&lt;&lt;test_output&gt;&gt;&gt;<br>
memcg_use_hierarchy_test 1 TINFO: Starting test 1<br>
memcg_use_hierarchy_test 1 TINFO: set /dev/memcg/memory.use_hierarchy to 0 =
failed<br>
memcg_use_hierarchy_test 1 TPASS: process 28658 is killed<br>
memcg_use_hierarchy_test 2 TINFO: Starting test 2<br>
memcg_use_hierarchy_test 2 TINFO: set /dev/memcg/memory.use_hierarchy to 0 =
failed<br>
memcg_use_hierarchy_test 2 TCONF: memory.use_hierarchy already been 1, blam=
e systemd, skip<br>
memcg_use_hierarchy_test 2 TINFO: Starting test 3<br>
memcg_use_hierarchy_test 2 TINFO: set /dev/memcg/memory.use_hierarchy to 0 =
failed<br>
memcg_use_hierarchy_test 2 TPASS: echo 0 &gt; subgroup/memory.use_hierarchy=
 failed as expected<br>
&lt;&lt;&lt;execution_status&gt;&gt;&gt;<br>
<br>
Right:<br>
&lt;&lt;&lt;test_output&gt;&gt;&gt;<br>
memcg_use_hierarchy_test 1 TINFO: Starting test 1<br>
memcg_use_hierarchy_test 1 TINFO: set /dev/memcg/memory.use_hierarchy to 0 =
failed<br>
memcg_use_hierarchy_test 1 TPASS: process 26825 is killed<br>
memcg_use_hierarchy_test 2 TINFO: Starting test 2<br>
memcg_use_hierarchy_test 2 TINFO: set /dev/memcg/memory.use_hierarchy to 0 =
failed<br>
memcg_use_hierarchy_test 2 TCONF: memory.use_hierarchy already been 1, blam=
e systemd, skip<br>
memcg_use_hierarchy_test 3 TINFO: Starting test 3<br>
memcg_use_hierarchy_test 3 TINFO: set /dev/memcg/memory.use_hierarchy to 0 =
failed<br>
memcg_use_hierarchy_test 3 TPASS: echo 0 &gt; subgroup/memory.use_hierarchy=
 failed as expected<br>
&lt;&lt;&lt;execution_status&gt;&gt;&gt;<br></blockquote><div><br></div><di=
v><div class=3D"gmail_default" style=3D"font-size:small">This is a good cat=
ch, but maybe it&#39;s not wise to simply regard the TCONF as a single test=
, because there are many system-config detections in setup() function, that=
 will make LTP gives=C2=A0<span style=3D"color:rgb(51,51,51);font-size:14px=
">a mendacious report on the test numbers if applying this patch.</span></d=
iv><br></div><div><div class=3D"gmail_default" style=3D"font-size:small">e.=
g.</div><br></div><div><div class=3D"gmail_default" style=3D"font-size:smal=
l">if tst_kvcmp -lt &quot;3.10&quot;; then</div>		<span class=3D"gmail_defa=
ult" style=3D"font-size:small">=C2=A0 =C2=A0 </span>tst_brk TCONF &quot;tes=
t must be run with kernel 3.10 or newer&quot;<br>	fi<br><div class=3D"gmail=
_default" style=3D"font-size:small"></div><div class=3D"gmail_default" styl=
e=3D"font-size:small">if dir path not exist; then</div><div class=3D"gmail_=
default" style=3D"font-size:small">=C2=A0 =C2=A0 tst_brk TCONF &quot;system=
 does not have xxxx/&quot;</div><div class=3D"gmail_default" style=3D"font-=
size:small">fi</div><div class=3D"gmail_default" style=3D"font-size:small">=
</div><div class=3D"gmail_default" style=3D"font-size:small">and so on...</=
div><br></div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"m=
argin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left=
:1ex">
<br>
Signed-off-by: Caspar Zhang &lt;<a href=3D"mailto:caspar@linux.alibaba.com"=
 target=3D"_blank">caspar@linux.alibaba.com</a>&gt;<br>
---<br>
=C2=A0testcases/lib/test.sh | 3 +--<br>
=C2=A01 file changed, 1 insertion(+), 2 deletions(-)<br>
<br>
diff --git a/testcases/lib/test.sh b/testcases/lib/test.sh<br>
index 670248ee5..ade8fcdff 100644<br>
--- a/testcases/lib/test.sh<br>
+++ b/testcases/lib/test.sh<br>
@@ -58,8 +58,7 @@ tst_resm()<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 echo &quot; $@&quot;<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 case &quot;$ret&quot; in<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0TPASS|TFAIL)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0TST_COUNT=3D$((TST_COUNT+1));;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0TPASS|TFAIL|TCONF) TST_COUNT=3D$((TST_COUNT+1))=
;;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 esac<br>
=C2=A0}<br>
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

--0000000000002ae5bc058a2674bd--

--===============2087022207==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

Ci0tIApNYWlsaW5nIGxpc3QgaW5mbzogaHR0cHM6Ly9saXN0cy5saW51eC5pdC9saXN0aW5mby9s
dHAK

--===============2087022207==--
