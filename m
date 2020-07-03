Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id C7F91213830
	for <lists+linux-ltp@lfdr.de>; Fri,  3 Jul 2020 11:55:33 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 8C9CB3C2A2A
	for <lists+linux-ltp@lfdr.de>; Fri,  3 Jul 2020 11:55:33 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 by picard.linux.it (Postfix) with ESMTP id 387A63C0EC0
 for <ltp@lists.linux.it>; Fri,  3 Jul 2020 11:55:32 +0200 (CEST)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 by in-5.smtp.seeweb.it (Postfix) with ESMTP id 5061A600E5F
 for <ltp@lists.linux.it>; Fri,  3 Jul 2020 11:54:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1593770130;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=TxAxxyOL3iWaG9AgTYo8p66cy+5EFhcM9Tc4QECO/rc=;
 b=hv03rvOgLy8H1FQgOPqB/YNvJeja6H6RVqYKd0PTD2DlHZU3W8xVlQXXUsuwCnc9bKVcfR
 Ryh5DJUbS3hLQL2BqtxoHIn+xYMxEUV7zalHf/lFK551pIt1FqkqcMVsIN4OmVitJaGy1d
 xGFqrWCTVJg+7jdrvNGV/NlZ2DeuXOE=
Received: from mail-lj1-f197.google.com (mail-lj1-f197.google.com
 [209.85.208.197]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-342-OUWoms63MSO8OJ7RGnWA-Q-1; Fri, 03 Jul 2020 05:55:25 -0400
X-MC-Unique: OUWoms63MSO8OJ7RGnWA-Q-1
Received: by mail-lj1-f197.google.com with SMTP id s25so12326118ljg.23
 for <ltp@lists.linux.it>; Fri, 03 Jul 2020 02:55:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=TxAxxyOL3iWaG9AgTYo8p66cy+5EFhcM9Tc4QECO/rc=;
 b=W2u7/szmnDMNp5PrJNwZuQGq3TtnDmkjKyRVosRkypmeGOkJ9WaODhZH0w+G2FGuWY
 Mz4eDMv7/hQZlLoHp1GR4FXzweH9Tq7W7PvrjQ43ptjq3+h81oevyA83Wyzso+aaO9SP
 FtbnGwTK/pa2TQ1Pp0MRrlMUpv/7H6lVTOz9Jg27dgw88n82t8QDq9O26QSI0Ii1j9Ln
 h5TwHw6dbH9YGhl5f/n+kgLpw2IyigCrBYyOKdRRL30UqkWbyYeVpa/ON6P/Z7vwg8sW
 eU/nFku0J6o7WHUU1BNnh9cjcFGr3S/kPDVb4nqOR+3i6dbqaxEcQLiU89ZhyzRGHGYu
 K+EA==
X-Gm-Message-State: AOAM533nGR2AHeTQTLVGSgyznVlU3If1+Pl8gelDq0aZakTdY9bTWELZ
 5GPArMOos/7DUROqdhQd/XjHUNrzQ46er/WgZTC8WFUbGJktwKGttZAWxiov3scmTNRkyiaZXTe
 GxWE6KDkd1+St3MuIxOJfGWq9Zsw=
X-Received: by 2002:a19:806:: with SMTP id 6mr20856901lfi.171.1593770124370;
 Fri, 03 Jul 2020 02:55:24 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyIQ9/fSUptXr5QZLR/WwnxPzyNRBnEJcytnCeqaszicEQMXgN8dWpT0F94qQy3nCdbFpSo4GXnJPG4ZnSaEvk=
X-Received: by 2002:a19:806:: with SMTP id 6mr20856895lfi.171.1593770124137;
 Fri, 03 Jul 2020 02:55:24 -0700 (PDT)
MIME-Version: 1.0
References: <c47220ecab3c7570f5387cd71894c977009ad3d8.1590572545.git.viresh.kumar@linaro.org>
 <9562fdf4debd759439ee7f468008177003db9513.1592457867.git.viresh.kumar@linaro.org>
In-Reply-To: <9562fdf4debd759439ee7f468008177003db9513.1592457867.git.viresh.kumar@linaro.org>
From: Li Wang <liwang@redhat.com>
Date: Fri, 3 Jul 2020 17:55:12 +0800
Message-ID: <CAEemH2cu_o2eCHQB1_Bo0aQiR2WK6knbBtD83-5_77gZZbA-Ow@mail.gmail.com>
To: Viresh Kumar <viresh.kumar@linaro.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=liwan@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.2 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,HTML_MESSAGE,SPF_HELO_NONE,SPF_PASS,TRACKER_ID
 autolearn=disabled version=3.4.0
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
Cc: Donghai Qiao <dqiao@redhat.com>,
 Vincent Guittot <vincent.guittot@linaro.org>, arnd@arndb.de,
 LTP List <ltp@lists.linux.it>
Content-Type: multipart/mixed; boundary="===============0153525555=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============0153525555==
Content-Type: multipart/alternative; boundary="0000000000001a679105a9868621"

--0000000000001a679105a9868621
Content-Type: text/plain; charset="UTF-8"

Hi Viresh,
Seems this patch involved a new regression:(.

Viresh Kumar <viresh.kumar@linaro.org> wrote:

...
>
> +typedef int (*mysyscall)(clockid_t clk_id, void *ts);
> +
> +int syscall_supported_by_kernel(mysyscall func)
> +{
> +       int ret;
> +
> +       ret = func(0, NULL);

+       if (ret == -1 && errno == ENOSYS)
> +               return 0;
> +
> +       return 1;
> +}
> ... }
>
>  int tst_clock_gettime(clockid_t clk_id, struct timespec *ts)
>  {
> -       return tst_syscall(__NR_clock_gettime, clk_id, ts);
> +       struct tst_ts tts = { 0, };
> +       static mysyscall func;
> +       int ret;
> +
> +#if (__NR_clock_gettime64 != __LTP__NR_INVALID_SYSCALL)
> +       if (!func && syscall_supported_by_kernel(sys_clock_gettime64)) {
>

To invoke sys_clock_gettime64 here makes no chance to choose the correct
syscall version since tst_syscall() will exit directly when getting ENOSYS.

We got many tests TCONF like the mmap18 did as below:
-------------------
# uname -rm
5.8.0-rc2+ aarch64
# ./mmap18
tst_test.c:1247: INFO: Timeout per run is 0h 05m 00s
../include/tst_timer.h:214: CONF: syscall(403) __NR_clock_gettime64 not
supported

the function call trace:
-----------------------------
testrun()
get_time_ms
...
tst_clock_gettime
syscall_supported_by_kernel
sys_clock_gettime64
tst_syscall(__NR_clock_gettime64, ...)


---- syscalls/regen.sh -----
#define tst_syscall(NR, ...) ({ \\
        int tst_ret; \\
        if (NR == __LTP__NR_INVALID_SYSCALL) { \\
                errno = ENOSYS; \\
                tst_ret = -1; \\
        } else { \\
                tst_ret = syscall(NR, ##__VA_ARGS__); \\
        } \\
        if (tst_ret == -1 && errno == ENOSYS) { \\
                tst_brk(TCONF, "syscall(%d) " #NR " not supported", NR); \\
        } \\
        tst_ret; \\
})



> +               func = sys_clock_gettime64;
> +               tts.type = TST_KERN_TIMESPEC;
> +       }
> +#endif
> +
> +       if (!func && syscall_supported_by_kernel(sys_clock_gettime)) {
> +               func = sys_clock_gettime;
> +               tts.type = TST_KERN_OLD_TIMESPEC;
> +       }
> +
> +       if (!func) {
> +               tst_res(TCONF, "clock_gettime() not available");
> +               errno = ENOSYS;
> +               return -1;
> +       }
> +
> +       ret = func(clk_id, tst_ts_get(&tts));
> +       ts->tv_sec = tst_ts_get_sec(tts);
> +       ts->tv_nsec = tst_ts_get_nsec(tts);
> +       return ret;
>  }
>


Regards,
Li Wang

--0000000000001a679105a9868621
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small">Hi Viresh,</div></div><div class=3D"gmail_default" style=3D"f=
ont-size:small"></div><div class=3D"gmail_default" style=3D"font-size:small=
">Seems this patch involved a new regression:(.</div><br><div class=3D"gmai=
l_quote"><div dir=3D"ltr" class=3D"gmail_attr">Viresh Kumar &lt;<a href=3D"=
mailto:viresh.kumar@linaro.org">viresh.kumar@linaro.org</a>&gt; wrote:<br><=
/div><div dir=3D"ltr" class=3D"gmail_attr"><br></div><blockquote class=3D"g=
mail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204=
,204,204);padding-left:1ex"><span class=3D"gmail_default" style=3D"font-siz=
e:small">...</span><br>
<br>
+typedef int (*mysyscall)(clockid_t clk_id, void *ts);<br>
+<br>
+int syscall_supported_by_kernel(mysyscall func)<br>
+{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0int ret;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D func(0, NULL);=C2=A0</blockquote><block=
quote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1=
px solid rgb(204,204,204);padding-left:1ex">
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (ret =3D=3D -1 &amp;&amp; errno =3D=3D ENOSY=
S)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return 0;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0return 1;<br>
+}<br>
<span class=3D"gmail_default" style=3D"font-size:small">...</span>=C2=A0}<b=
r>
<br>
=C2=A0int tst_clock_gettime(clockid_t clk_id, struct timespec *ts)<br>
=C2=A0{<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0return tst_syscall(__NR_clock_gettime, clk_id, =
ts);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0struct tst_ts tts =3D { 0, };<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0static mysyscall func;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0int ret;<br>
+<br>
+#if (__NR_clock_gettime64 !=3D __LTP__NR_INVALID_SYSCALL)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (!func &amp;&amp; syscall_supported_by_kerne=
l(sys_clock_gettime64)) {<br></blockquote><div><br></div><div><div class=3D=
"gmail_default" style=3D"font-size:small"><div><span class=3D"gmail_default=
">To invoke=C2=A0sys_clock_gettime64 here=C2=A0makes no chance to choose=C2=
=A0</span>the correct syscall version since tst_syscall() will=C2=A0exit di=
rectly when getting ENOSYS.</div><div><span class=3D"gmail_default"><br>We =
got many tests TCONF like the mmap18 did as below:</span></div><div><span c=
lass=3D"gmail_default">-------------------<br># uname -rm<br>5.8.0-rc2+ aar=
ch64<br># ./mmap18<br>tst_test.c:1247: INFO: Timeout per run is 0h 05m 00s<=
br>../include/tst_timer.h:214: CONF: syscall(403) __NR_clock_gettime64 not =
supported</span></div><div><span class=3D"gmail_default"><br></span></div><=
div><span class=3D"gmail_default">the function call trace:</span></div><div=
><span class=3D"gmail_default">-----------------------------</span></div><d=
iv><span class=3D"gmail_default"><div><div class=3D"gmail_default">testrun(=
)</div><div class=3D"gmail_default">get_time_ms</div><div class=3D"gmail_de=
fault">...</div></div><div><div class=3D"gmail_default">tst_clock_gettime</=
div><div class=3D"gmail_default">syscall_supported_by_kernel</div><div clas=
s=3D"gmail_default">sys_clock_gettime64</div><div class=3D"gmail_default">t=
st_syscall(__NR_clock_gettime64, ...)</div></div><div><span class=3D"gmail_=
default"><br></span></div><br>---- syscalls/regen.sh -----<br>#define tst_s=
yscall(NR, ...) ({ \\<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 int tst_ret; \\<br>=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 if (NR =3D=3D __LTP__NR_INVALID_SYSCALL) { \\<br>=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 errno =3D ENOSYS; \=
\<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 tst_ret =3D -1=
; \\<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 } else { \\<br>=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 tst_ret =3D syscall(NR, ##__VA_ARGS__); \\<=
br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 } \\<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (tst_=
ret =3D=3D -1 &amp;&amp; errno =3D=3D ENOSYS) { \\<br>=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 tst_brk(TCONF, &quot;syscall(%d) &quot; =
#NR &quot; not supported&quot;, NR); \\<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 } \\=
<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 tst_ret; \\<br>})</span></div></div></div><=
div><br></div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"m=
argin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left=
:1ex">
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0func =3D sys_clock_=
gettime64;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tts.type =3D TST_KE=
RN_TIMESPEC;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+#endif<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (!func &amp;&amp; syscall_supported_by_kerne=
l(sys_clock_gettime)) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0func =3D sys_clock_=
gettime;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tts.type =3D TST_KE=
RN_OLD_TIMESPEC;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (!func) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tst_res(TCONF, &quo=
t;clock_gettime() not available&quot;);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0errno =3D ENOSYS;<b=
r>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -1;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D func(clk_id, tst_ts_get(&amp;tts));<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0ts-&gt;tv_sec =3D tst_ts_get_sec(tts);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0ts-&gt;tv_nsec =3D tst_ts_get_nsec(tts);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0return ret;<br>
=C2=A0}<br>
<span class=3D"gmail_default" style=3D"font-size:small"></span></blockquote=
><div><br></div><div>=C2=A0</div></div><div dir=3D"ltr" class=3D"gmail_sign=
ature"><div dir=3D"ltr"><div>Regards,<br></div><div>Li Wang<br></div></div>=
</div></div>

--0000000000001a679105a9868621--


--===============0153525555==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============0153525555==--

