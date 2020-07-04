Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 478D7214473
	for <lists+linux-ltp@lfdr.de>; Sat,  4 Jul 2020 09:14:31 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 5FE143C5597
	for <lists+linux-ltp@lfdr.de>; Sat,  4 Jul 2020 09:14:30 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 by picard.linux.it (Postfix) with ESMTP id DC4A73C05A0
 for <ltp@lists.linux.it>; Sat,  4 Jul 2020 09:14:25 +0200 (CEST)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
 by in-5.smtp.seeweb.it (Postfix) with ESMTP id E37316009EB
 for <ltp@lists.linux.it>; Sat,  4 Jul 2020 09:13:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1593846862;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=vWWZT+Ok7c0bGDw33P7X+f8s1o6l/NF8h3IGbVG6pGU=;
 b=WQ59/EytOWdCoNIoX8KS9uN83Y+R2BBqbl06+wElro9U0MPnf3O2+8O/pZ/UX9Uvu9ySch
 bgCclc4z3DCfOiiXPr8eyamz4uetFve9FJP/nv55dKpcmbANO8LVgOHdeN0UOvsX6nQ5tw
 PDrln+a0NuHdrmtLjSXiVU8IbaRMAik=
Received: from mail-lj1-f198.google.com (mail-lj1-f198.google.com
 [209.85.208.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-292-vTZC24ueOtSeqxgw6CHrag-1; Sat, 04 Jul 2020 03:14:19 -0400
X-MC-Unique: vTZC24ueOtSeqxgw6CHrag-1
Received: by mail-lj1-f198.google.com with SMTP id p15so15903615lji.5
 for <ltp@lists.linux.it>; Sat, 04 Jul 2020 00:14:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=vWWZT+Ok7c0bGDw33P7X+f8s1o6l/NF8h3IGbVG6pGU=;
 b=ZgprrjQL8+lPVHFUmVPoHtmtkZit4mZxORwLkqSQOCEvKNJ9POD6dSwMzNww5RWZxZ
 iYPakopvsABVJoiQkN/BaVsIfQSKFahxP78QLR9W+3Oh+Aw6KoCJ1Iwokz+ulnoM2l+L
 zh8az/wIAW7PAT1PyFEDRD/2F6z86L87yDZvdgWX7FecXv/DoTV/sbUQvKaoWNiNl0a4
 kv78+xRe+G5hzksYia0MJwfoJw5maEO+4BQ+O/Acmqc4AFvnGFllN+fzf2OvKh1vRn2T
 uwpj4H4cw73oIlzu6SfUOhhSE0K9Cm90rYavcmwjXMsAuAY6sw+io7Z77zSMhAejrGic
 p2pw==
X-Gm-Message-State: AOAM531837Rajd8M94aqI8kmDI2p9LfhNlHoksLkuEeyzQbpGlmrEcS3
 qzJdejyuCdpCb+vH1Z9ncnKWGWA9CPXhKOqAyfmxclmXMMWkWv3vXYayc90APNCPnuoBEc3/s7e
 bYfoVuAqo9E5mipo7K6K1Ml85i34=
X-Received: by 2002:a2e:8046:: with SMTP id p6mr7156296ljg.100.1593846858448; 
 Sat, 04 Jul 2020 00:14:18 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwg7QjCvKFVxNcLHF4/sg8hm2hQFlI0mqg5pCbX8U9FQtN/d+fXimkPLW3IzTn0pf7yr4gxq/wOdzXHHB+McRk=
X-Received: by 2002:a2e:8046:: with SMTP id p6mr7156284ljg.100.1593846858219; 
 Sat, 04 Jul 2020 00:14:18 -0700 (PDT)
MIME-Version: 1.0
References: <c47220ecab3c7570f5387cd71894c977009ad3d8.1590572545.git.viresh.kumar@linaro.org>
 <9562fdf4debd759439ee7f468008177003db9513.1592457867.git.viresh.kumar@linaro.org>
 <CAEemH2cu_o2eCHQB1_Bo0aQiR2WK6knbBtD83-5_77gZZbA-Ow@mail.gmail.com>
 <20200703125927.GA11556@yuki.lan>
In-Reply-To: <20200703125927.GA11556@yuki.lan>
From: Li Wang <liwang@redhat.com>
Date: Sat, 4 Jul 2020 15:14:06 +0800
Message-ID: <CAEemH2cN735haDmyqbNa_LwDgumFqAspYfJaKRpsOg0Rij9tEA@mail.gmail.com>
To: Cyril Hrubis <chrubis@suse.cz>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=liwan@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,HTML_MESSAGE,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH V4 5/6] syscalls: Don't pass struct timespec to
 tst_syscall()
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
Cc: Viresh Kumar <viresh.kumar@linaro.org>, Donghai Qiao <dqiao@redhat.com>,
 Vincent Guittot <vincent.guittot@linaro.org>, arnd@arndb.de,
 LTP List <ltp@lists.linux.it>
Content-Type: multipart/mixed; boundary="===============1431366678=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============1431366678==
Content-Type: multipart/alternative; boundary="000000000000cfacc805a99863d7"

--000000000000cfacc805a99863d7
Content-Type: text/plain; charset="UTF-8"

Hi Cyril,

On Fri, Jul 3, 2020 at 8:59 PM Cyril Hrubis <chrubis@suse.cz> wrote:

> Hi!
> I guess that we need:
>

This method works for me, plz could you correct some typos as below.


>
> diff --git a/lib/tst_clocks.c b/lib/tst_clocks.c
> index bc0bef273..c0727a34c 100644
> --- a/lib/tst_clocks.c
> +++ b/lib/tst_clocks.c
> @@ -14,11 +14,11 @@
>
>  typedef int (*mysyscall)(clockid_t clk_id, void *ts);
>
> -int syscall_supported_by_kernel(mysyscall func)
> +int syscall_supported_by_kernel(long sysnr)
>  {
>         int ret;
>
> -       ret = func(0, NULL);
> +       ret = syscall(sysnr, func(0, NULL);
>

This line should be: ret = syscall(sysnr, 0, NULL);


>         if (ret == -1 && errno == ENOSYS)
>                 return 0;
>
> @@ -32,13 +32,13 @@ int tst_clock_getres(clockid_t clk_id, struct timespec
> *res)
>         int ret;
>
>  #if (__NR_clock_getres_time64 != __LTP__NR_INVALID_SYSCALL)
> -       if (!func && syscall_supported_by_kernel(sys_clock_getres64)) {
> +       if (!func && syscall_supported_by_kernel(__NR_clock_getres64)) {


if (!func && syscall_supported_by_kernel(__NR_clock_getres_time64 )) {


>

                func = sys_clock_getres64;
>                 tts.type = TST_KERN_TIMESPEC;
>         }
>  #endif
>
> -       if (!func && syscall_supported_by_kernel(sys_clock_getres)) {
> +       if (!func && syscall_supported_by_kernel(__NR_clock_getres)) {
>                 func = sys_clock_getres;
>                 tts.type = TST_KERN_OLD_TIMESPEC;
>         }
> @@ -62,13 +62,13 @@ int tst_clock_gettime(clockid_t clk_id, struct
> timespec *ts)
>         int ret;
>
>  #if (__NR_clock_gettime64 != __LTP__NR_INVALID_SYSCALL)
> -       if (!func && syscall_supported_by_kernel(sys_clock_gettime64)) {
> +       if (!func && syscall_supported_by_kernel(__NR_clock_gettime64)) {
>                 func = sys_clock_gettime64;
>                 tts.type = TST_KERN_TIMESPEC;
>         }
>  #endif
>
> -       if (!func && syscall_supported_by_kernel(sys_clock_gettime)) {
> +       if (!func && syscall_supported_by_kernel(__NR_clock_gettime)) {
>                 func = sys_clock_gettime;
>                 tts.type = TST_KERN_OLD_TIMESPEC;
>         }
> @@ -91,13 +91,13 @@ int tst_clock_settime(clockid_t clk_id, struct
> timespec *ts)
>         static mysyscall func;
>
>  #if (__NR_clock_settime64 != __LTP__NR_INVALID_SYSCALL)
> -       if (!func && syscall_supported_by_kernel(sys_clock_settime64)) {
> +       if (!func && syscall_supported_by_kernel(__NR_clock_settime64)) {
>                 func = sys_clock_settime64;
>                 tts.type = TST_KERN_TIMESPEC;
>         }
>  #endif
>
> -       if (!func && syscall_supported_by_kernel(sys_clock_settime)) {
> +       if (!func && syscall_supported_by_kernel(__NR_clock_settime)) {
>                 func = sys_clock_settime;
>                 tts.type = TST_KERN_OLD_TIMESPEC;
>         }
>
> --
> Cyril Hrubis
> chrubis@suse.cz
>
>

-- 
Regards,
Li Wang

--000000000000cfacc805a99863d7
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small">Hi Cyril,</div></div><br><div class=3D"gmail_quote"><div dir=
=3D"ltr" class=3D"gmail_attr">On Fri, Jul 3, 2020 at 8:59 PM Cyril Hrubis &=
lt;<a href=3D"mailto:chrubis@suse.cz">chrubis@suse.cz</a>&gt; wrote:<br></d=
iv><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bord=
er-left:1px solid rgb(204,204,204);padding-left:1ex">Hi!<br>
I guess that we need:<br></blockquote><div><br></div><div><div class=3D"gma=
il_default" style=3D"font-size:small">This method works for me, plz could y=
ou correct some typos as below.</div></div><div>=C2=A0</div><blockquote cla=
ss=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid =
rgb(204,204,204);padding-left:1ex">
<br>
diff --git a/lib/tst_clocks.c b/lib/tst_clocks.c<br>
index bc0bef273..c0727a34c 100644<br>
--- a/lib/tst_clocks.c<br>
+++ b/lib/tst_clocks.c<br>
@@ -14,11 +14,11 @@<br>
<br>
=C2=A0typedef int (*mysyscall)(clockid_t clk_id, void *ts);<br>
<br>
-int syscall_supported_by_kernel(mysyscall func)<br>
+int syscall_supported_by_kernel(long sysnr)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 int ret;<br>
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D func(0, NULL);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D syscall(sysnr, func(0, NULL);<br></bloc=
kquote><div>=C2=A0</div><div><span class=3D"gmail_default" style=3D"font-si=
ze:small">This line should be: ret =3D syscall(sysnr, 0, NULL);</span></div=
><div><span class=3D"gmail_default" style=3D"font-size:small"></span>=C2=A0=
</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;b=
order-left:1px solid rgb(204,204,204);padding-left:1ex">
=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (ret =3D=3D -1 &amp;&amp; errno =3D=3D ENOSY=
S)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return 0;<br>
<br>
@@ -32,13 +32,13 @@ int tst_clock_getres(clockid_t clk_id, struct timespec =
*res)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 int ret;<br>
<br>
=C2=A0#if (__NR_clock_getres_time64 !=3D __LTP__NR_INVALID_SYSCALL)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if (!func &amp;&amp; syscall_supported_by_kerne=
l(sys_clock_getres64)) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (!func &amp;&amp; syscall_supported_by_kerne=
l(__NR_clock_getres64)) {</blockquote><div>=C2=A0</div><div><span class=3D"=
gmail_default" style=3D"font-size:small">if (!func &amp;&amp; syscall_suppo=
rted_by_kernel(__NR_clock_getres_time64 )) {</span></div><div><span class=
=3D"gmail_default" style=3D"font-size:small"></span>=C2=A0</div><blockquote=
 class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px so=
lid rgb(204,204,204);padding-left:1ex">=C2=A0</blockquote><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex">
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 func =3D sys_clock_=
getres64;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 tts.type =3D TST_KE=
RN_TIMESPEC;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
=C2=A0#endif<br>
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if (!func &amp;&amp; syscall_supported_by_kerne=
l(sys_clock_getres)) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (!func &amp;&amp; syscall_supported_by_kerne=
l(__NR_clock_getres)) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 func =3D sys_clock_=
getres;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 tts.type =3D TST_KE=
RN_OLD_TIMESPEC;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
@@ -62,13 +62,13 @@ int tst_clock_gettime(clockid_t clk_id, struct timespec=
 *ts)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 int ret;<br>
<br>
=C2=A0#if (__NR_clock_gettime64 !=3D __LTP__NR_INVALID_SYSCALL)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if (!func &amp;&amp; syscall_supported_by_kerne=
l(sys_clock_gettime64)) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (!func &amp;&amp; syscall_supported_by_kerne=
l(__NR_clock_gettime64)) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 func =3D sys_clock_=
gettime64;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 tts.type =3D TST_KE=
RN_TIMESPEC;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
=C2=A0#endif<br>
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if (!func &amp;&amp; syscall_supported_by_kerne=
l(sys_clock_gettime)) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (!func &amp;&amp; syscall_supported_by_kerne=
l(__NR_clock_gettime)) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 func =3D sys_clock_=
gettime;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 tts.type =3D TST_KE=
RN_OLD_TIMESPEC;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
@@ -91,13 +91,13 @@ int tst_clock_settime(clockid_t clk_id, struct timespec=
 *ts)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 static mysyscall func;<br>
<br>
=C2=A0#if (__NR_clock_settime64 !=3D __LTP__NR_INVALID_SYSCALL)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if (!func &amp;&amp; syscall_supported_by_kerne=
l(sys_clock_settime64)) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (!func &amp;&amp; syscall_supported_by_kerne=
l(__NR_clock_settime64)) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 func =3D sys_clock_=
settime64;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 tts.type =3D TST_KE=
RN_TIMESPEC;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
=C2=A0#endif<br>
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if (!func &amp;&amp; syscall_supported_by_kerne=
l(sys_clock_settime)) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (!func &amp;&amp; syscall_supported_by_kerne=
l(__NR_clock_settime)) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 func =3D sys_clock_=
settime;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 tts.type =3D TST_KE=
RN_OLD_TIMESPEC;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
<br>
-- <br>
Cyril Hrubis<br>
<a href=3D"mailto:chrubis@suse.cz" target=3D"_blank">chrubis@suse.cz</a><br=
>
<br>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr"=
 class=3D"gmail_signature"><div dir=3D"ltr"><div>Regards,<br></div><div>Li =
Wang<br></div></div></div></div>

--000000000000cfacc805a99863d7--


--===============1431366678==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============1431366678==--

