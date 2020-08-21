Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 0043C24CE55
	for <lists+linux-ltp@lfdr.de>; Fri, 21 Aug 2020 08:57:55 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 8FA7E3C2F82
	for <lists+linux-ltp@lfdr.de>; Fri, 21 Aug 2020 08:57:55 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 by picard.linux.it (Postfix) with ESMTP id E3DB03C2F6D
 for <ltp@lists.linux.it>; Fri, 21 Aug 2020 08:57:50 +0200 (CEST)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 by in-5.smtp.seeweb.it (Postfix) with ESMTP id EB8876006D0
 for <ltp@lists.linux.it>; Fri, 21 Aug 2020 08:57:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1597993067;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=0V7Q4ImjTsspwBUclWlNL0hXM8iEKF8qpMtikMj6O0E=;
 b=jAPzM5pAzSoYIgnArl1aZIPJ8jWy16XGlNjOhZgQhRh7d72fykOlMtFvOrX5hsHLaD2Ub4
 nZ2mDsnm/w+72JB8PD3QcapDuV18cUXUZFxMqIDPSWl8h7UuFUcsL9gbWoadZqp0L8OeX5
 PkisvEivIDrMMtquRALN/9Y9wV5QPVA=
Received: from mail-yb1-f197.google.com (mail-yb1-f197.google.com
 [209.85.219.197]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-491-YIRsmVwlNRmEzRKVyLom6A-1; Fri, 21 Aug 2020 02:57:44 -0400
X-MC-Unique: YIRsmVwlNRmEzRKVyLom6A-1
Received: by mail-yb1-f197.google.com with SMTP id a5so1217465ybh.3
 for <ltp@lists.linux.it>; Thu, 20 Aug 2020 23:57:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=0V7Q4ImjTsspwBUclWlNL0hXM8iEKF8qpMtikMj6O0E=;
 b=BkTm+uJRuJ3M472VdDRyspTL82A0hmGhqO/UTefP+0Rw8tyvo931bgIqs58IaJF/8C
 +nhnMzpA3Eo9o6alakvXOkHbY24y7cpZLAM6D/RiY70eDfIHVTkNy9Qz94vqTdgOzLbB
 +XllEa0x+3Ybgq9pXrbliZEssZ37XQ1jJHNbsp3AXd6uQIF37fyf8FrsYx40EvBQ0N38
 OxwLAIZVFPnvYz/TdDB/ClSvrY+jFydBiMvILs3WSHAtZmak6Iz8rUDanVJ1lSLiLat/
 WkmHMm3VC+X4CdJCnPi9zS51kwwnHlafH/PmyqVGmzmbbArubYk3b82JD8SLz8KdaAEj
 jgUg==
X-Gm-Message-State: AOAM5301xIXxosMcExG9bnWyIKz1qHU/HDNMVFIu+dldDamZhZkENEYJ
 HPsnAOqTPqbEOXtapX3fETFraU4lt33xqkD0AoAWKSOfuNIUktccmoTC0SBnei5fMysyv+XbplW
 +b4AexdHWbNrHRNpKQ4ifTycsrKM=
X-Received: by 2002:a25:ca50:: with SMTP id a77mr1965817ybg.286.1597993064160; 
 Thu, 20 Aug 2020 23:57:44 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw9S9/KFtzA4IS0DSdSJyHEt2Hazed+dd5XsQ0T53MIQbnz0lJC5Fz9BeWC3v9pJr1oFk1jKKwB/cIsLDNpUP0=
X-Received: by 2002:a25:ca50:: with SMTP id a77mr1965792ybg.286.1597993063711; 
 Thu, 20 Aug 2020 23:57:43 -0700 (PDT)
MIME-Version: 1.0
References: <1597919168-10702-1-git-send-email-zhufy.jy@cn.fujitsu.com>
 <1597919168-10702-4-git-send-email-zhufy.jy@cn.fujitsu.com>
In-Reply-To: <1597919168-10702-4-git-send-email-zhufy.jy@cn.fujitsu.com>
From: Li Wang <liwang@redhat.com>
Date: Fri, 21 Aug 2020 14:57:32 +0800
Message-ID: <CAEemH2dPXaV24bT4Ddp47iEWDzV5837SfDtsKEKB7_VbLNg9xA@mail.gmail.com>
To: Feiyu Zhu <zhufy.jy@cn.fujitsu.com>, Yang Xu <xuyang2018.jy@cn.fujitsu.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=liwan@redhat.com
X-Mimecast-Spam-Score: 0.0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-0.0 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,HTML_MESSAGE,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 4/4] syscalls/kill06:Cleanup && Convert to new
 library
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
Content-Type: multipart/mixed; boundary="===============1784373348=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============1784373348==
Content-Type: multipart/alternative; boundary="000000000000ea9d5d05ad5dc0a0"

--000000000000ea9d5d05ad5dc0a0
Content-Type: text/plain; charset="UTF-8"

Feiyu Zhu <zhufy.jy@cn.fujitsu.com> wrote:

...
> +       pid_t pid, child_pid[5];
>

I'd suggest dropping these two variables since it makes no sense to
save the children PIDs in the following testing.



> +       int nsig, i, status;
> +
> +       pid = SAFE_FORK();
> +       if (pid == 0) {
> +               setpgrp();
> +               for (i = 0; i < 5; i++) {
> +                       child_pid[i] = SAFE_FORK();
>

if we drop the arrays, that loop would be like:

                for (i = 0; i < 5; i++) {
                        if (!SAFE_FORK())
                                pause();
                }



> +                       if (!child_pid[i])
> +                               pause();
>                 }
>
> -               /*
> -                * Check to see if the process was terminated with the
> -                * expected signal.
> -                */
> -               nsig = WTERMSIG(status);
> -               if (!nsig) {
> -                       tst_resm(TFAIL, "Did not receive any signal");
> -               } else if (nsig == TEST_SIG) {
> -                       tst_resm(TPASS, "received expected signal %d",
> -                                nsig);
> -               } else {
> -                       tst_resm(TFAIL,
> -                                "expected signal %d received %d",
> -                                TEST_SIG, nsig);
> -               }
> +               TEST(kill(-getpgrp(), SIGKILL));
> +               if (TST_RET != 0)
> +                       tst_res(TFAIL | TTERRNO, "kill failed");
> +               tst_res(TINFO, "%d never received a signal", getpid());
>

This TINFO is a misleading message to people. If the process receives a
signal
but not been killed, how do you say that never received a signal?
So I suggest deleting this line.


> +               exit(0);
>         }
> -
> -       cleanup();
> -       tst_exit();
> -}
> -
> -/*
> - * do_child()
> - */
> -void do_child(void)
> -{
> -       int exno = 1;
> -
> -       sleep(299);
> -
> -       tst_resm(TINFO, "%d never received a" " signal", getpid());
> -       exit(exno);
> -}
> -
> -/*
> - * setup() - performs all ONE TIME setup for this test
> - */
> -void setup(void)
> -{
> -       /* Setup default signal handling */
> -       tst_sig(FORK, DEF_HANDLER, cleanup);
> -
> -       TEST_PAUSE;
> +
> +       SAFE_WAITPID(pid, &status, 0);
>

What about waiting for any child process here?
  SAFE_WAITPID(-1, &status, 0);



> +       nsig = WTERMSIG(status);
> +       if (nsig != SIGKILL) {
> +               tst_res(TFAIL, "wait: unexpected signal %d returned, "
> +                       "expected SIGKILL(9)", nsig);
> +               return;
> +       }
> +       tst_res(TPASS, "receive expected signal SIGKILL(9)");
>  }
>


-- 
Regards,
Li Wang

--000000000000ea9d5d05ad5dc0a0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><div class=3D"gmail_quote"><div dir=3D"ltr" c=
lass=3D"gmail_attr">Feiyu Zhu &lt;<a href=3D"mailto:zhufy.jy@cn.fujitsu.com=
">zhufy.jy@cn.fujitsu.com</a>&gt; wrote:<br></div><div dir=3D"ltr" class=3D=
"gmail_attr"><br></div><blockquote class=3D"gmail_quote" style=3D"margin:0p=
x 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><s=
pan class=3D"gmail_default" style=3D"font-size:small">...</span><br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0pid_t pid, child_pid[5];<br></blockquote><div><=
br></div><div><div class=3D"gmail_default" style=3D"font-size:small">I&#39;=
d suggest dropping these two variables since it makes no sense to</div><div=
 class=3D"gmail_default" style=3D"font-size:small">save the children PIDs i=
n the following testing.</div><br></div><div>=C2=A0</div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex">
+=C2=A0 =C2=A0 =C2=A0 =C2=A0int nsig, i, status;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0pid =3D SAFE_FORK();<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (pid =3D=3D 0) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0setpgrp();<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0for (i =3D 0; i &lt=
; 5; i++) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0child_pid[i] =3D SAFE_FORK();<br></blockquote><div><br></div><div=
><div class=3D"gmail_default" style=3D"font-size:small">if we drop the arra=
ys, that loop would be like:</div><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 for (i =3D 0; i &lt; 5; i++) {<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!SAFE_FORK())<br>=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pause();<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br><div class=3D"gmail_default" style=3D"font=
-size:small"></div><br></div><div>=C2=A0</div><blockquote class=3D"gmail_qu=
ote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,20=
4);padding-left:1ex">
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0if (!child_pid[i])<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0pause();<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/*<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * Check to see if =
the process was terminated with the<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * expected signal.=
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0nsig =3D WTERMSIG(s=
tatus);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (!nsig) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0tst_resm(TFAIL, &quot;Did not receive any signal&quot;);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0} else if (nsig =3D=
=3D TEST_SIG) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0tst_resm(TPASS, &quot;received expected signal %d&quot;,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 nsig);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0} else {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0tst_resm(TFAIL,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;expected signal %d received %d=
&quot;,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 TEST_SIG, nsig);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0TEST(kill(-getpgrp(=
), SIGKILL));<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (TST_RET !=3D 0)=
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0tst_res(TFAIL | TTERRNO, &quot;kill failed&quot;);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tst_res(TINFO, &quo=
t;%d never received a signal&quot;, getpid());<br></blockquote><div><br></d=
iv><div><div class=3D"gmail_default" style=3D"font-size:small">This TINFO i=
s a misleading message to people. If the process receives a signal</div><di=
v class=3D"gmail_default" style=3D"font-size:small">but not been killed, ho=
w do you say that never received a signal?=C2=A0</div><div class=3D"gmail_d=
efault" style=3D"font-size:small">So I suggest deleting this line.<br></div=
><div class=3D"gmail_default" style=3D"font-size:small">=C2=A0<br></div></d=
iv><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bord=
er-left:1px solid rgb(204,204,204);padding-left:1ex">
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0exit(0);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0cleanup();<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0tst_exit();<br>
-}<br>
-<br>
-/*<br>
- * do_child()<br>
- */<br>
-void do_child(void)<br>
-{<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0int exno =3D 1;<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0sleep(299);<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0tst_resm(TINFO, &quot;%d never received a&quot;=
 &quot; signal&quot;, getpid());<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0exit(exno);<br>
-}<br>
-<br>
-/*<br>
- * setup() - performs all ONE TIME setup for this test<br>
- */<br>
-void setup(void)<br>
-{<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0/* Setup default signal handling */<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0tst_sig(FORK, DEF_HANDLER, cleanup);<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0TEST_PAUSE;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0SAFE_WAITPID(pid, &amp;status, 0);<br></blockqu=
ote><div><br></div><div><div class=3D"gmail_default" style=3D"font-size:sma=
ll">What about waiting=C2=A0for any child process here?</div><div class=3D"=
gmail_default" style=3D"font-size:small">=C2=A0 SAFE_WAITPID(-1, &amp;statu=
s, 0);</div><br></div><div>=C2=A0</div><blockquote class=3D"gmail_quote" st=
yle=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padd=
ing-left:1ex">
+=C2=A0 =C2=A0 =C2=A0 =C2=A0nsig =3D WTERMSIG(status);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (nsig !=3D SIGKILL) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tst_res(TFAIL, &quo=
t;wait: unexpected signal %d returned, &quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0&quot;expected SIGKILL(9)&quot;, nsig);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0tst_res(TPASS, &quot;receive expected signal SI=
GKILL(9)&quot;);<br>
=C2=A0}<br></blockquote><div><br></div><div>=C2=A0</div></div>-- <br><div d=
ir=3D"ltr" class=3D"gmail_signature"><div dir=3D"ltr"><div>Regards,<br></di=
v><div>Li Wang<br></div></div></div></div>

--000000000000ea9d5d05ad5dc0a0--


--===============1784373348==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============1784373348==--

