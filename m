Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A9C0B37DB
	for <lists+linux-ltp@lfdr.de>; Mon, 16 Sep 2019 12:15:34 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id B77F53C2082
	for <lists+linux-ltp@lfdr.de>; Mon, 16 Sep 2019 12:15:33 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 by picard.linux.it (Postfix) with ESMTP id E66E13C1821
 for <ltp@lists.linux.it>; Mon, 16 Sep 2019 12:15:31 +0200 (CEST)
Received: from us-smtp-delivery-1.mimecast.com
 (us-smtp-delivery-1.mimecast.com [205.139.110.120])
 by in-5.smtp.seeweb.it (Postfix) with ESMTP id 87DB5600981
 for <ltp@lists.linux.it>; Mon, 16 Sep 2019 12:15:33 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1568628929;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=+AisvQGu7dog9t8Vf+Y4fVHVaYzm2vn+yabrFRqR4XA=;
 b=SxIfIR/Wt8OjaFWTTprLI1K5s/294xrkvPePAaBaIxvXHhIoevzaDLH76G716gXr9BSe3+
 G8vatIR0FdaQ0GGE0e+K0HIgrzytgWiaDASVtgnY3l6Gozir2ikzSu6DvsOJpwXKOtS5Rx
 YmAB6F//IooTxg18r4ukNtC+aZ7Rud0=
Received: from mail-ot1-f72.google.com (mail-ot1-f72.google.com
 [209.85.210.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-330-faUFVOyUOma5UAsIE1WrSw-1; Mon, 16 Sep 2019 06:15:27 -0400
Received: by mail-ot1-f72.google.com with SMTP id y24so4906396otk.15
 for <ltp@lists.linux.it>; Mon, 16 Sep 2019 03:15:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=9o9ZyDYkhOj7NdCSp2yyQ68qKxaeww2UeJ7xKjPet3Y=;
 b=ReW4UtUHZoVO/aZftpWgvaNB6XJsie6siTJAZjMqIgJymMIHC+H4yoJeC0XXK6A/95
 fH4HE0eWAll++Ro2MIJBQgC2jOHgqjzGXQAYk/yerbCNbSAEbLrgukcocjQ87FUVD2Z+
 Iebg4F81hN1vysU5eyOuVVQFJ/IYSAAZ7HXWFlDcHs7xUbGGUlFDbpcV7HVi3i7lCjrz
 SsUGcVl5zhN74vB/FekwKSby4PzZf747faXr+4whuzUM/iIKql9n2iQ3FYFw3zxtRl19
 RIPtUY6GtfKj0IDEVscW40lfhSPnkQy8PFvwkUePV9zxSPgAflIAtAph0wUJJv15NJBm
 TEgQ==
X-Gm-Message-State: APjAAAVXy5TXY8U9/Ty2AAwopMJ4StL8ISRNV9mRZcHHOXZkQEnZ0eR5
 foht8Fsb/bkQqwD1puwgSxv9oMGCOKosjrRDs6jZB1c4tuGp3aZRi2cqdS+GkKySljzHuMFvDqP
 Ynle9wtAyKDEalITQaa8jY+ZAX/0=
X-Received: by 2002:a54:480d:: with SMTP id j13mr11473301oij.96.1568628926739; 
 Mon, 16 Sep 2019 03:15:26 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxOUUw0P/LIkphAQIto0Z8yCUBO7HJs87ExGdKyhOOqdrwLqGQWYvqJ6YWtpY9fPZVZGQDpye9R41COZq7mfeI=
X-Received: by 2002:a54:480d:: with SMTP id j13mr11473288oij.96.1568628926472; 
 Mon, 16 Sep 2019 03:15:26 -0700 (PDT)
MIME-Version: 1.0
References: <20190913125823.17314-1-pvorel@suse.cz>
 <20190913125823.17314-3-pvorel@suse.cz>
In-Reply-To: <20190913125823.17314-3-pvorel@suse.cz>
From: Li Wang <liwang@redhat.com>
Date: Mon, 16 Sep 2019 18:15:15 +0800
Message-ID: <CAEemH2f4oeSvN-p7xSzjo2ZFvndxjX2sQ+M9f6fYV_bN2ewn=A@mail.gmail.com>
To: Petr Vorel <pvorel@suse.cz>
X-MC-Unique: faUFVOyUOma5UAsIE1WrSw-1
X-Mimecast-Spam-Score: 0
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,HTML_MESSAGE,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2 2/3] shell: Introduce TST_TIMEOUT variable
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
Content-Type: multipart/mixed; boundary="===============0688895242=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============0688895242==
Content-Type: multipart/alternative; boundary="000000000000f2820d0592a8e13c"

--000000000000f2820d0592a8e13c
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi Petr,

Thanks for your working.

On Fri, Sep 13, 2019 at 8:58 PM Petr Vorel <pvorel@suse.cz> wrote:

>
> <snip>

>
> --- a/testcases/kernel/controllers/memcg/stress/memcg_stress_test.sh
> +++ b/testcases/kernel/controllers/memcg/stress/memcg_stress_test.sh
> @@ -17,7 +17,7 @@ TST_NEEDS_CMDS=3D"mount umount cat kill mkdir rmdir gre=
p
> awk cut"
>
>  # Each test case runs for 900 secs when everything fine
>  # therefore the default 5 mins timeout is not enough.
> -LTP_TIMEOUT_MUL=3D7
> +TST_TIMEOUT=3D2100
>
>  . cgroup_lib.sh
>
> diff --git a/testcases/lib/tst_test.sh b/testcases/lib/tst_test.sh
> index ca63745fd..b206fc0bb 100644
> --- a/testcases/lib/tst_test.sh
> +++ b/testcases/lib/tst_test.sh
> @@ -379,9 +379,41 @@ _tst_rescmp()
>
>  _tst_setup_timer()
>  {
> +       TST_TIMEOUT=3D${TST_TIMEOUT:-300}
>         LTP_TIMEOUT_MUL=3D${LTP_TIMEOUT_MUL:-1}
>
> -       local sec=3D$((300 * LTP_TIMEOUT_MUL))
> +       if [ "$TST_TIMEOUT" =3D -1 ]; then
> +               tst_res TINFO "Timeout per run is disabled"
> +               return
> +       fi
> +
> +       local err is_float
> +       if tst_is_num "$LTP_TIMEOUT_MUL"; then
> +               if tst_is_int "$LTP_TIMEOUT_MUL"; then
> +                       [ "$LTP_TIMEOUT_MUL" -ge 1 ] || err=3D1
> +               else
> +                       tst_test_cmds awk
> +                       echo | awk '{if ('"$LTP_TIMEOUT_MUL"' < 1) {exit
> 1}}' || err=3D1
> +                       is_float=3D1
> +               fi
> +       else
> +               err=3D1
> +       fi
>

I'm OK to allow $LTP_TIMEOUT_MUL being float. But here I don't see what's
enough reason to add the is_float variable. Because we could use the float
expression for both types comparing, isn't it?


> +       if [ "$err" ]; then
> +               tst_brk TCONF "LTP_TIMEOUT_MUL must be number >=3D 1!
> ($LTP_TIMEOUT_MUL)"
> +       fi
> +
> +       if ! tst_is_int "$TST_TIMEOUT" || [ "$TST_TIMEOUT" -lt 1 ]; then
> +               tst_brk TBROK "TST_TIMEOUT must be int >=3D 1!
> ($TST_TIMEOUT)"
> +       fi
> +
> +       local sec
> +       if [ "$is_float" ]; then
> +               sec=3D`echo |awk '{printf("%d\n", '$TST_TIMEOUT' *
> '$LTP_TIMEOUT_MUL')}'`
> +       else
> +               sec=3D$((TST_TIMEOUT * LTP_TIMEOUT_MUL))
> +       fi
>

Here as well, why we need to distinguish the float and int, is the float
expression does not work for integer?

--=20
Regards,
Li Wang

--000000000000f2820d0592a8e13c
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small">Hi Petr,</div><div class=3D"gmail_default" style=3D"font-size=
:small"><br></div><div class=3D"gmail_default" style=3D"font-size:small">Th=
anks for your working.</div></div><br><div class=3D"gmail_quote"><div dir=
=3D"ltr" class=3D"gmail_attr">On Fri, Sep 13, 2019 at 8:58 PM Petr Vorel &l=
t;<a href=3D"mailto:pvorel@suse.cz">pvorel@suse.cz</a>&gt; wrote:<br></div>=
<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-=
left:1px solid rgb(204,204,204);padding-left:1ex"><br></blockquote><div cla=
ss=3D"gmail_default" style=3D"font-size:small">&lt;snip&gt;</div><blockquot=
e class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px s=
olid rgb(204,204,204);padding-left:1ex"><br>
--- a/testcases/kernel/controllers/memcg/stress/memcg_stress_test.sh<br>
+++ b/testcases/kernel/controllers/memcg/stress/memcg_stress_test.sh<br>
@@ -17,7 +17,7 @@ TST_NEEDS_CMDS=3D&quot;mount umount cat kill mkdir rmdir =
grep awk cut&quot;<br>
<br>
=C2=A0# Each test case runs for 900 secs when everything fine<br>
=C2=A0# therefore the default 5 mins timeout is not enough.<br>
-LTP_TIMEOUT_MUL=3D7<br>
+TST_TIMEOUT=3D2100<br>
<br>
=C2=A0. cgroup_lib.sh<br>
<br>
diff --git a/testcases/lib/tst_test.sh b/testcases/lib/tst_test.sh<br>
index ca63745fd..b206fc0bb 100644<br>
--- a/testcases/lib/tst_test.sh<br>
+++ b/testcases/lib/tst_test.sh<br>
@@ -379,9 +379,41 @@ _tst_rescmp()<br>
<br>
=C2=A0_tst_setup_timer()<br>
=C2=A0{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0TST_TIMEOUT=3D${TST_TIMEOUT:-300}<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 LTP_TIMEOUT_MUL=3D${LTP_TIMEOUT_MUL:-1}<br>
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0local sec=3D$((300 * LTP_TIMEOUT_MUL))<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if [ &quot;$TST_TIMEOUT&quot; =3D -1 ]; then<br=
>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tst_res TINFO &quot=
;Timeout per run is disabled&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0fi<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0local err is_float<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if tst_is_num &quot;$LTP_TIMEOUT_MUL&quot;; the=
n<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if tst_is_int &quot=
;$LTP_TIMEOUT_MUL&quot;; then<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0[ &quot;$LTP_TIMEOUT_MUL&quot; -ge 1 ] || err=3D1<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0else<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0tst_test_cmds awk<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0echo | awk &#39;{if (&#39;&quot;$LTP_TIMEOUT_MUL&quot;&#39; &lt; =
1) {exit 1}}&#39; || err=3D1<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0is_float=3D1<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fi<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0else<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0err=3D1<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0fi<br></blockquote><div><br></div><div><div cla=
ss=3D"gmail_default" style=3D"font-size:small">I&#39;m OK to allow $LTP_TIM=
EOUT_MUL being float. But here I don&#39;t see what&#39;s enough reason to =
add the is_float variable. Because we could use the float expression for bo=
th types comparing, isn&#39;t it?</div></div><div>=C2=A0</div><blockquote c=
lass=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px soli=
d rgb(204,204,204);padding-left:1ex">
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if [ &quot;$err&quot; ]; then<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tst_brk TCONF &quot=
;LTP_TIMEOUT_MUL must be number &gt;=3D 1! ($LTP_TIMEOUT_MUL)&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0fi<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if ! tst_is_int &quot;$TST_TIMEOUT&quot; || [ &=
quot;$TST_TIMEOUT&quot; -lt 1 ]; then<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tst_brk TBROK &quot=
;TST_TIMEOUT must be int &gt;=3D 1! ($TST_TIMEOUT)&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0fi<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0local sec<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if [ &quot;$is_float&quot; ]; then<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0sec=3D`echo |awk &#=
39;{printf(&quot;%d\n&quot;, &#39;$TST_TIMEOUT&#39; * &#39;$LTP_TIMEOUT_MUL=
&#39;)}&#39;`<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0else<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0sec=3D$((TST_TIMEOU=
T * LTP_TIMEOUT_MUL))<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0fi<br></blockquote><div><br></div><div><div cla=
ss=3D"gmail_default" style=3D"font-size:small">Here as well, why we need to=
 distinguish the float and int, is the float expression does not work for i=
nteger?=C2=A0</div></div></div><div><br></div>-- <br><div dir=3D"ltr" class=
=3D"gmail_signature"><div dir=3D"ltr"><div>Regards,<br></div><div>Li Wang<b=
r></div></div></div></div>

--000000000000f2820d0592a8e13c--


--===============0688895242==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============0688895242==--

