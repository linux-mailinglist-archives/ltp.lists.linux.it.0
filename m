Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id A1EC3329709
	for <lists+linux-ltp@lfdr.de>; Tue,  2 Mar 2021 09:53:37 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 2CABB3C56CB
	for <lists+linux-ltp@lfdr.de>; Tue,  2 Mar 2021 09:53:37 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 by picard.linux.it (Postfix) with ESMTP id 366113C4D06
 for <ltp@lists.linux.it>; Tue,  2 Mar 2021 09:53:34 +0100 (CET)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by in-2.smtp.seeweb.it (Postfix) with ESMTP id 9357A600297
 for <ltp@lists.linux.it>; Tue,  2 Mar 2021 09:53:32 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614675211;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=1Fk95O7zHYwSuuwdMY1slRBE0mvdoT6mydKFJK3qqcg=;
 b=ejVxSqrSPFPMqx5tY37uCVPsPgq/tEVPnVu6ibr+/PmDhhUBZ9vAujFLw+ZHvGclR92DU+
 sFFEsaGmfF7nHa3YPe0SMz2/2Mpz3wqTlnipI8EH2e2A/UMk7KYg/Q6LFWwGLlPZNBBQQT
 TPOwyMAWP3xhk37/1qjuVFBKjOWlJX0=
Received: from mail-yb1-f199.google.com (mail-yb1-f199.google.com
 [209.85.219.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-19-RFCdFRQtNLaXs9re79dSDQ-1; Tue, 02 Mar 2021 03:53:28 -0500
X-MC-Unique: RFCdFRQtNLaXs9re79dSDQ-1
Received: by mail-yb1-f199.google.com with SMTP id l3so22025033ybf.17
 for <ltp@lists.linux.it>; Tue, 02 Mar 2021 00:53:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=1Fk95O7zHYwSuuwdMY1slRBE0mvdoT6mydKFJK3qqcg=;
 b=B9hMGzY0+AXo9P29toWTWuxZL4jlRQsAGyArH9ueXXmD0lVnwX4UE/yLYyMvunNG5A
 ngvj7NaDAwyOMrOrlSJAdPWx1zWbPgFrJjF09DqscYl6XEx1tSYPPlZyu4mDLw6/3QqH
 ZFkBV0KLYWtxxrZ/KVV32i2OIAsE+euWgpgkj9+ZwhNUG1/sofp0Q6iHKeMZlystIJqN
 4tQxaUGzdHcj4puqdNL1KH83OVP7C9RL8ZyNGJBAgzkAzo1PcZZpn/3rR4l2yjS0GcdW
 AFnoDjUOz99FbExmCqLV4Rqskr5JR47fctPUafHDWN4+a24YyR7m/acsFnUBDPUGfEUZ
 pl0Q==
X-Gm-Message-State: AOAM532NEXU3p0jNoixfg5RoWAsT2usjr86wxeujbVBw84FmOBwXB8DM
 hvEsW/T43dUYlmbEtW6+TPKvE5dN3Wi3vMP0+VDUsF/yZivgL3NoXi6AofS5ricKyFKjwOMyqLs
 S0to8Pe7h+5aMdVPt5miak2HSmqQ=
X-Received: by 2002:a25:bd12:: with SMTP id f18mr30189542ybk.403.1614675208282; 
 Tue, 02 Mar 2021 00:53:28 -0800 (PST)
X-Google-Smtp-Source: ABdhPJx2dG7B4CtgGPwwk205hmcfcOM4xqd379evgk5gjI0BMGxEgHGgfH8H37hxV4ofqpldx3euPMvXRXzOMr/GQ6U=
X-Received: by 2002:a25:bd12:: with SMTP id f18mr30189528ybk.403.1614675208055; 
 Tue, 02 Mar 2021 00:53:28 -0800 (PST)
MIME-Version: 1.0
References: <20210301220222.22705-1-pvorel@suse.cz>
 <20210301220222.22705-6-pvorel@suse.cz>
In-Reply-To: <20210301220222.22705-6-pvorel@suse.cz>
From: Li Wang <liwang@redhat.com>
Date: Tue, 2 Mar 2021 16:53:16 +0800
Message-ID: <CAEemH2cr0TFvFiis_05Fh4bEe1ZUmFtMO5ysYFped5ZQYucvAg@mail.gmail.com>
To: Petr Vorel <pvorel@suse.cz>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=liwan@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,HTML_MESSAGE,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 5/7] tst_test.sh: Introduce
 tst_set_timeout(timeout)
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
Content-Type: multipart/mixed; boundary="===============0459797484=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============0459797484==
Content-Type: multipart/alternative; boundary="0000000000003446cc05bc89dedc"

--0000000000003446cc05bc89dedc
Content-Type: text/plain; charset="UTF-8"

Hi Petr,

On Tue, Mar 2, 2021 at 6:02 AM Petr Vorel <pvorel@suse.cz> wrote:

> to sync with C API. This allows to setup timer after test has started.
> It's useful when test length depends on input decided during setup.
>
> Suggested-by: Cyril Hrubis <chrubis@suse.cz>
> Signed-off-by: Petr Vorel <pvorel@suse.cz>
> ---
> New in v3.
>
>  doc/test-writing-guidelines.txt | 16 ++++++++++++----
>  testcases/lib/tst_test.sh       | 23 ++++++++++++++++++-----
>  2 files changed, 30 insertions(+), 9 deletions(-)
>
> diff --git a/doc/test-writing-guidelines.txt
> b/doc/test-writing-guidelines.txt
> index dd1911ceb..50696e14a 100644
> --- a/doc/test-writing-guidelines.txt
> +++ b/doc/test-writing-guidelines.txt
> @@ -2393,8 +2393,8 @@ tst_run
>  '$TST_TEST_DATA' can be used with '$TST_CNT'. If '$TST_TEST_DATA_IFS' not
> specified,
>  space as default value is used. Of course, it's possible to use separate
> functions.
>
> -2.3.2 Library environment variables for shell
> -^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
> +2.3.2 Library environment variables and functions for shell
> +^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
>
>  Similarily to the C library various checks and preparations can be
> requested
>  simply by setting right '$TST_NEEDS_FOO'.
> @@ -2415,11 +2415,19 @@ simply by setting right '$TST_NEEDS_FOO'.
>  | 'TST_TIMEOUT'      | Maximum timeout set for the test in sec. Must be
> int >= 1,
>                         or -1 (special value to disable timeout), default
> is 300.
>                         Variable is meant be set in tests, not by user.
> -                       It's equivalent of `tst_test.timeout` in C.
> +                       It's an equivalent of `tst_test.timeout` in C, can
> be set
> +                       via 'tst_set_timeout(timeout)' after test has
> started.
>
> +|=============================================================================
> +
> +[options="header"]
>
> +|=============================================================================
> +| Function name              | Action done
> +| 'tst_set_timeout(timeout)' | Maximum timeout set for the test in sec.
> +                               See 'TST_TIMEOUT' variable.
>
>  |=============================================================================
>
>  NOTE: Network tests (see testcases/network/README.md) use additional
> variables
> -in 'tst_net.sh'.
> +and functions in 'tst_net.sh'.
>
>  Checking for presence of commands
>  +++++++++++++++++++++++++++++++++
> diff --git a/testcases/lib/tst_test.sh b/testcases/lib/tst_test.sh
> index 69f007d89..58056e28b 100644
> --- a/testcases/lib/tst_test.sh
> +++ b/testcases/lib/tst_test.sh
> @@ -1,6 +1,6 @@
>  #!/bin/sh
>  # SPDX-License-Identifier: GPL-2.0-or-later
> -# Copyright (c) Linux Test Project, 2014-2020
> +# Copyright (c) Linux Test Project, 2014-2021
>  # Author: Cyril Hrubis <chrubis@suse.cz>
>  #
>  # LTP test library for shell.
> @@ -23,6 +23,14 @@ export TST_LIB_LOADED=1
>  # default trap function
>  trap "tst_brk TBROK 'test interrupted'" INT
>
> +_tst_cleanup_timer()
> +{
> +       if [ -n "$_tst_setup_timer_pid" ]; then
> +               kill $_tst_setup_timer_pid 2>/dev/null
> +               wait $_tst_setup_timer_pid 2>/dev/null
> +       fi
> +}
> +
>  _tst_do_exit()
>  {
>         local ret=0
> @@ -48,10 +56,7 @@ _tst_do_exit()
>                 [ "$TST_TMPDIR_RHOST" = 1 ] && tst_cleanup_rhost
>         fi
>
> -       if [ -n "$_tst_setup_timer_pid" ]; then
> -               kill $_tst_setup_timer_pid 2>/dev/null
> -               wait $_tst_setup_timer_pid 2>/dev/null
> -       fi
> +       _tst_cleanup_timer
>
>         if [ $TST_FAIL -gt 0 ]; then
>                 ret=$((ret|1))
> @@ -459,6 +464,8 @@ _tst_setup_timer()
>
>         tst_res TINFO "timeout per run is ${h}h ${m}m ${s}s"
>
> +       _tst_cleanup_timer
> +
>         sleep $sec && tst_res TBROK "test killed, timeout! If you are
> running on slow machine, try exporting LTP_TIMEOUT_MUL > 1" && kill -9
> -$pid &
>
>         _tst_setup_timer_pid=$!
> @@ -492,6 +499,12 @@ tst_require_module()
>         tst_res TINFO "Found module at '$TST_MODPATH'"
>  }
>
> +tst_set_timeout()
> +{
> +       TST_TIMEOUT="$1"
>

Not sure if we should check "$1" is valid again before using it.

I guess in most scenarios, the function is invoked by tests, so
just needs to guarantee $1 > $TST_TIMEOUT, otherwise, it
looks meaningless to reset TST_TIMEOUT?
(especially to avoid people set a smaller value by a typo)



> +       _tst_setup_timer
> +}
> +
>  tst_run()
>  {
>         local _tst_i
> --
> 2.30.1
>
>

-- 
Regards,
Li Wang

--0000000000003446cc05bc89dedc
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small">Hi Petr,</div></div><br><div class=3D"gmail_quote"><div dir=
=3D"ltr" class=3D"gmail_attr">On Tue, Mar 2, 2021 at 6:02 AM Petr Vorel &lt=
;<a href=3D"mailto:pvorel@suse.cz" target=3D"_blank">pvorel@suse.cz</a>&gt;=
 wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px =
0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">to sync =
with C API. This allows to setup timer after test has started.<br>
It&#39;s useful when test length depends on input decided during setup.<br>
<br>
Suggested-by: Cyril Hrubis &lt;<a href=3D"mailto:chrubis@suse.cz" target=3D=
"_blank">chrubis@suse.cz</a>&gt;<br>
Signed-off-by: Petr Vorel &lt;<a href=3D"mailto:pvorel@suse.cz" target=3D"_=
blank">pvorel@suse.cz</a>&gt;<br>
---<br>
New in v3.<br>
<br>
=C2=A0doc/test-writing-guidelines.txt | 16 ++++++++++++----<br>
=C2=A0testcases/lib/tst_test.sh=C2=A0 =C2=A0 =C2=A0 =C2=A0| 23 ++++++++++++=
++++++-----<br>
=C2=A02 files changed, 30 insertions(+), 9 deletions(-)<br>
<br>
diff --git a/doc/test-writing-guidelines.txt b/doc/test-writing-guidelines.=
txt<br>
index dd1911ceb..50696e14a 100644<br>
--- a/doc/test-writing-guidelines.txt<br>
+++ b/doc/test-writing-guidelines.txt<br>
@@ -2393,8 +2393,8 @@ tst_run<br>
=C2=A0&#39;$TST_TEST_DATA&#39; can be used with &#39;$TST_CNT&#39;. If &#39=
;$TST_TEST_DATA_IFS&#39; not specified,<br>
=C2=A0space as default value is used. Of course, it&#39;s possible to use s=
eparate functions.<br>
<br>
-2.3.2 Library environment variables for shell<br>
-^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^<br>
+2.3.2 Library environment variables and functions for shell<br>
+^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^<br>
<br>
=C2=A0Similarily to the C library various checks and preparations can be re=
quested<br>
=C2=A0simply by setting right &#39;$TST_NEEDS_FOO&#39;.<br>
@@ -2415,11 +2415,19 @@ simply by setting right &#39;$TST_NEEDS_FOO&#39;.<b=
r>
=C2=A0| &#39;TST_TIMEOUT&#39;=C2=A0 =C2=A0 =C2=A0 | Maximum timeout set for=
 the test in sec. Must be int &gt;=3D 1,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 or -1 (special value to disable timeout), default is 300.<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 Variable is meant be set in tests, not by user.<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0It&#39;s equivalent of `tst_test.timeout` in C.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0It&#39;s an equivalent of `tst_test.timeout` in C, can be set<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0via &#39;tst_set_timeout(timeout)&#39; after test has started.<br=
>
+|=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D<br>
+<br>
+[options=3D&quot;header&quot;]<br>
+|=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D<br>
+| Function name=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | Action d=
one<br>
+| &#39;tst_set_timeout(timeout)&#39; | Maximum timeout set for the test in=
 sec.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0See &#39;TST_TIMEOUT&#39; variable.<b=
r>
=C2=A0|=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D<br>
<br>
=C2=A0NOTE: Network tests (see testcases/network/README.md) use additional =
variables<br>
-in &#39;tst_net.sh&#39;.<br>
+and functions in &#39;tst_net.sh&#39;.<br>
<br>
=C2=A0Checking for presence of commands<br>
=C2=A0+++++++++++++++++++++++++++++++++<br>
diff --git a/testcases/lib/tst_test.sh b/testcases/lib/tst_test.sh<br>
index 69f007d89..58056e28b 100644<br>
--- a/testcases/lib/tst_test.sh<br>
+++ b/testcases/lib/tst_test.sh<br>
@@ -1,6 +1,6 @@<br>
=C2=A0#!/bin/sh<br>
=C2=A0# SPDX-License-Identifier: GPL-2.0-or-later<br>
-# Copyright (c) Linux Test Project, 2014-2020<br>
+# Copyright (c) Linux Test Project, 2014-2021<br>
=C2=A0# Author: Cyril Hrubis &lt;<a href=3D"mailto:chrubis@suse.cz" target=
=3D"_blank">chrubis@suse.cz</a>&gt;<br>
=C2=A0#<br>
=C2=A0# LTP test library for shell.<br>
@@ -23,6 +23,14 @@ export TST_LIB_LOADED=3D1<br>
=C2=A0# default trap function<br>
=C2=A0trap &quot;tst_brk TBROK &#39;test interrupted&#39;&quot; INT<br>
<br>
+_tst_cleanup_timer()<br>
+{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if [ -n &quot;$_tst_setup_timer_pid&quot; ]; th=
en<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0kill $_tst_setup_ti=
mer_pid 2&gt;/dev/null<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0wait $_tst_setup_ti=
mer_pid 2&gt;/dev/null<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0fi<br>
+}<br>
+<br>
=C2=A0_tst_do_exit()<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 local ret=3D0<br>
@@ -48,10 +56,7 @@ _tst_do_exit()<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 [ &quot;$TST_TMPDIR=
_RHOST&quot; =3D 1 ] &amp;&amp; tst_cleanup_rhost<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 fi<br>
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if [ -n &quot;$_tst_setup_timer_pid&quot; ]; th=
en<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0kill $_tst_setup_ti=
mer_pid 2&gt;/dev/null<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0wait $_tst_setup_ti=
mer_pid 2&gt;/dev/null<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0fi<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0_tst_cleanup_timer<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 if [ $TST_FAIL -gt 0 ]; then<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ret=3D$((ret|1))<br=
>
@@ -459,6 +464,8 @@ _tst_setup_timer()<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 tst_res TINFO &quot;timeout per run is ${h}h ${=
m}m ${s}s&quot;<br>
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0_tst_cleanup_timer<br>
+<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 sleep $sec &amp;&amp; tst_res TBROK &quot;test =
killed, timeout! If you are running on slow machine, try exporting LTP_TIME=
OUT_MUL &gt; 1&quot; &amp;&amp; kill -9 -$pid &amp;<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 _tst_setup_timer_pid=3D$!<br>
@@ -492,6 +499,12 @@ tst_require_module()<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 tst_res TINFO &quot;Found module at &#39;$TST_M=
ODPATH&#39;&quot;<br>
=C2=A0}<br>
<br>
+tst_set_timeout()<br>
+{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0TST_TIMEOUT=3D&quot;$1&quot;<br></blockquote><d=
iv><br></div><div><div class=3D"gmail_default" style=3D"font-size:small">No=
t sure if we should=C2=A0check &quot;$1&quot; is valid again before using i=
t.</div><div class=3D"gmail_default" style=3D"font-size:small"><br></div><d=
iv class=3D"gmail_default">I guess in most scenarios, the function is invok=
ed by tests, so</div><div class=3D"gmail_default">just needs to guarantee $=
1 &gt; $TST_TIMEOUT, otherwise, it</div><div class=3D"gmail_default">looks =
meaningless to reset TST_TIMEOUT?</div><div class=3D"gmail_default">(especi=
ally to avoid people set a smaller value by a typo)</div><br></div><div>=C2=
=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8e=
x;border-left:1px solid rgb(204,204,204);padding-left:1ex">
+=C2=A0 =C2=A0 =C2=A0 =C2=A0_tst_setup_timer<br>
+}<br>
+<br>
=C2=A0tst_run()<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 local _tst_i<br>
-- <br>
2.30.1<br>
<br>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr"=
><div dir=3D"ltr"><div>Regards,<br></div><div>Li Wang<br></div></div></div>=
</div>

--0000000000003446cc05bc89dedc--


--===============0459797484==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============0459797484==--

