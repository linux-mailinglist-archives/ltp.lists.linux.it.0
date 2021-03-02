Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 3145B329714
	for <lists+linux-ltp@lfdr.de>; Tue,  2 Mar 2021 10:00:16 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 7B3C03C6E5C
	for <lists+linux-ltp@lfdr.de>; Tue,  2 Mar 2021 10:00:15 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 by picard.linux.it (Postfix) with ESMTP id 7758A3C4DCF
 for <ltp@lists.linux.it>; Tue,  2 Mar 2021 10:00:10 +0100 (CET)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by in-3.smtp.seeweb.it (Postfix) with ESMTP id DDD441A00A58
 for <ltp@lists.linux.it>; Tue,  2 Mar 2021 10:00:08 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614675607;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ALN6vrlJh3POwXRzFS0HeT4fhxc9InG3o0xJFvh9Jqg=;
 b=OCTRM9LlMtJU+OQNXhN2PjMA3zAWkRYdVKNAclGjFz9QY5PT7Z3Rac8UxCNAa63iSRTbPa
 HqbZ3XYtAiEUQuNPhXMa3iicTBUR/bEtHl4vfNziVUA8ALeYclM02qYMZTS4tikN5+EvAI
 UCHpO09bhDbkJGdDJjl+oSzG+TyIbtY=
Received: from mail-yb1-f198.google.com (mail-yb1-f198.google.com
 [209.85.219.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-285-ka0ef0_6OkSmVS8CgKIaWA-1; Tue, 02 Mar 2021 04:00:03 -0500
X-MC-Unique: ka0ef0_6OkSmVS8CgKIaWA-1
Received: by mail-yb1-f198.google.com with SMTP id s187so22024659ybs.22
 for <ltp@lists.linux.it>; Tue, 02 Mar 2021 01:00:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ALN6vrlJh3POwXRzFS0HeT4fhxc9InG3o0xJFvh9Jqg=;
 b=gtkqHj0CB1Cs2qR8pZRFn0p3/Jb3sUzJ36tL77BJ1NMOR7GK/4pMJe2Rm8aU3TQLqf
 ld63urO2JMbN8ASWQ99lEmmA2BuAFkov8tCu3CQ4M7Mx6DIJSVX9UIeQPDRWhEN3+pmY
 XhhE3dQcxBtcbGU1RTTcwAQmr3WgEzM7XR3mIxA0/aaoh7Bt5UqeBdm5V2Fi1EXSo33g
 wgPHFpecURVBX+PdMt0nz8mkmunybvMDTVJoO/OPduy4EwLXekC2YQ3aGmlly4EcLUEm
 bKLa5h3ynGx8WmvL9SGp5LrgQ2tuaJ1txhNzO4HtwKOGvQlantYyqz3cCF7lPGb79vOe
 z7oA==
X-Gm-Message-State: AOAM533z2/RL1NAdgPuJDY9TNLhiLdDh11rz/ciboC/kQ8ICwlfqheWi
 BOK1uhbzK734AUqT8vPBA37FcmAFog43cYVy8fvN1mPKb8ydAlgd6wWMB96RjTGRi6H9FHRGJq+
 bN64nPgga06/1w31nq8DGFeZxOR8=
X-Received: by 2002:a25:af05:: with SMTP id a5mr30154030ybh.86.1614675603113; 
 Tue, 02 Mar 2021 01:00:03 -0800 (PST)
X-Google-Smtp-Source: ABdhPJy4n6vijG0FzqfHakQFVWBZ08vJhcwlUeolry7tcby4/NSt5v33kcFSWGacibBs/l3boT5dADm03qjO0j5TuIw=
X-Received: by 2002:a25:af05:: with SMTP id a5mr30153992ybh.86.1614675602906; 
 Tue, 02 Mar 2021 01:00:02 -0800 (PST)
MIME-Version: 1.0
References: <20210301220222.22705-1-pvorel@suse.cz>
 <20210301220222.22705-7-pvorel@suse.cz>
In-Reply-To: <20210301220222.22705-7-pvorel@suse.cz>
From: Li Wang <liwang@redhat.com>
Date: Tue, 2 Mar 2021 16:59:51 +0800
Message-ID: <CAEemH2c2Bma-xXTcf+1M4CFVjM7ZQS36rV_6i9kJ6Es-19kghA@mail.gmail.com>
To: Petr Vorel <pvorel@suse.cz>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=liwan@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,HTML_MESSAGE,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 6/7] tst_test.sh: Run cleanup also after test
 timeout
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
Cc: Joerg Vehlow <joerg.vehlow@aox-tech.de>, LTP List <ltp@lists.linux.it>
Content-Type: multipart/mixed; boundary="===============0370836990=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============0370836990==
Content-Type: multipart/alternative; boundary="000000000000bd3b7905bc89f5fa"

--000000000000bd3b7905bc89f5fa
Content-Type: text/plain; charset="UTF-8"

On Tue, Mar 2, 2021 at 6:02 AM Petr Vorel <pvorel@suse.cz> wrote:

> Also timeout requires to run a test cleanup (e.g. zram01.sh).
> Thus send first SIGINT, but keep also SIGKILL for safety reasons
> (after 5 sec to give some time to the cleanup function and
> _tst_check_security_modules()).
>
> Signed-off-by: Petr Vorel <pvorel@suse.cz>
> ---
> Originally posted in
>
> https://patchwork.ozlabs.org/project/ltp/patch/20210202101942.31328-1-pvorel@suse.cz/
>
> * renamed function
> * use signal names instead of numbers in kill parameters
>
>  testcases/lib/tst_test.sh | 13 ++++++++++---
>  1 file changed, 10 insertions(+), 3 deletions(-)
>
> diff --git a/testcases/lib/tst_test.sh b/testcases/lib/tst_test.sh
> index 58056e28b..097f672a1 100644
> --- a/testcases/lib/tst_test.sh
> +++ b/testcases/lib/tst_test.sh
> @@ -21,7 +21,7 @@ export TST_LIB_LOADED=1
>  . tst_security.sh
>
>  # default trap function
> -trap "tst_brk TBROK 'test interrupted'" INT
> +trap "tst_brk TBROK 'test interrupted or timed out'" INT
>
>  _tst_cleanup_timer()
>  {
> @@ -442,6 +442,14 @@ _tst_multiply_timeout()
>         return 0
>  }
>
> +_tst_run_timer()
>

Hmm, this name is not good than before, or rename to _tst_kill_timer_pid(),
_tst_stop_timer()?



> +{
> +       tst_res TBROK "test killed, timeout! If you are running on slow
> machine, try exporting LTP_TIMEOUT_MUL > 1"
> +       kill -INT -$pid
> +       sleep 5
> +       kill -KILL -$pid
> +}
> +
>  _tst_setup_timer()
>  {
>         TST_TIMEOUT=${TST_TIMEOUT:-300}
> @@ -465,8 +473,7 @@ _tst_setup_timer()
>         tst_res TINFO "timeout per run is ${h}h ${m}m ${s}s"
>
>         _tst_cleanup_timer
> -
> -       sleep $sec && tst_res TBROK "test killed, timeout! If you are
> running on slow machine, try exporting LTP_TIMEOUT_MUL > 1" && kill -9
> -$pid &
> +       sleep $sec && _tst_run_timer &
>
>         _tst_setup_timer_pid=$!
>  }
> --
> 2.30.1
>
>

-- 
Regards,
Li Wang

--000000000000bd3b7905bc89f5fa
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote"><div dir=3D"lt=
r" class=3D"gmail_attr">On Tue, Mar 2, 2021 at 6:02 AM Petr Vorel &lt;<a hr=
ef=3D"mailto:pvorel@suse.cz" target=3D"_blank">pvorel@suse.cz</a>&gt; wrote=
:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.=
8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Also timeout r=
equires to run a test cleanup (e.g. zram01.sh).<br>
Thus send first SIGINT, but keep also SIGKILL for safety reasons<br>
(after 5 sec to give some time to the cleanup function and<br>
_tst_check_security_modules()).<br>
<br>
Signed-off-by: Petr Vorel &lt;<a href=3D"mailto:pvorel@suse.cz" target=3D"_=
blank">pvorel@suse.cz</a>&gt;<br>
---<br>
Originally posted in <br>
<a href=3D"https://patchwork.ozlabs.org/project/ltp/patch/20210202101942.31=
328-1-pvorel@suse.cz/" rel=3D"noreferrer" target=3D"_blank">https://patchwo=
rk.ozlabs.org/project/ltp/patch/20210202101942.31328-1-pvorel@suse.cz/</a><=
br>
<br>
* renamed function<br>
* use signal names instead of numbers in kill parameters<br>
<br>
=C2=A0testcases/lib/tst_test.sh | 13 ++++++++++---<br>
=C2=A01 file changed, 10 insertions(+), 3 deletions(-)<br>
<br>
diff --git a/testcases/lib/tst_test.sh b/testcases/lib/tst_test.sh<br>
index 58056e28b..097f672a1 100644<br>
--- a/testcases/lib/tst_test.sh<br>
+++ b/testcases/lib/tst_test.sh<br>
@@ -21,7 +21,7 @@ export TST_LIB_LOADED=3D1<br>
=C2=A0. tst_security.sh<br>
<br>
=C2=A0# default trap function<br>
-trap &quot;tst_brk TBROK &#39;test interrupted&#39;&quot; INT<br>
+trap &quot;tst_brk TBROK &#39;test interrupted or timed out&#39;&quot; INT=
<br>
<br>
=C2=A0_tst_cleanup_timer()<br>
=C2=A0{<br>
@@ -442,6 +442,14 @@ _tst_multiply_timeout()<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 return 0<br>
=C2=A0}<br>
<br>
+_tst_run_timer()<br></blockquote><div><br></div><div><div class=3D"gmail_d=
efault" style=3D"font-size:small">Hmm, this name is not good than before, o=
r rename to _tst_kill_timer_pid(), _tst_stop_timer()?</div><br></div><div>=
=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0=
.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
+{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0tst_res TBROK &quot;test killed, timeout! If yo=
u are running on slow machine, try exporting LTP_TIMEOUT_MUL &gt; 1&quot;<b=
r>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0kill -INT -$pid<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0sleep 5<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0kill -KILL -$pid<br>
+}<br>
+<br>
=C2=A0_tst_setup_timer()<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 TST_TIMEOUT=3D${TST_TIMEOUT:-300}<br>
@@ -465,8 +473,7 @@ _tst_setup_timer()<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 tst_res TINFO &quot;timeout per run is ${h}h ${=
m}m ${s}s&quot;<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 _tst_cleanup_timer<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0sleep $sec &amp;&amp; tst_res TBROK &quot;test =
killed, timeout! If you are running on slow machine, try exporting LTP_TIME=
OUT_MUL &gt; 1&quot; &amp;&amp; kill -9 -$pid &amp;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0sleep $sec &amp;&amp; _tst_run_timer &amp;<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 _tst_setup_timer_pid=3D$!<br>
=C2=A0}<br>
-- <br>
2.30.1<br>
<br>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr"=
><div dir=3D"ltr"><div>Regards,<br></div><div>Li Wang<br></div></div></div>=
</div>

--000000000000bd3b7905bc89f5fa--


--===============0370836990==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============0370836990==--

