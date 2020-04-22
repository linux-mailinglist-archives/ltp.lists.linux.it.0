Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F6301B371C
	for <lists+linux-ltp@lfdr.de>; Wed, 22 Apr 2020 08:05:41 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 337CA3C2975
	for <lists+linux-ltp@lfdr.de>; Wed, 22 Apr 2020 08:05:41 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 by picard.linux.it (Postfix) with ESMTP id 8F7643C2967
 for <ltp@lists.linux.it>; Wed, 22 Apr 2020 08:05:38 +0200 (CEST)
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [207.211.31.81])
 by in-6.smtp.seeweb.it (Postfix) with ESMTP id 78E6E1400B89
 for <ltp@lists.linux.it>; Wed, 22 Apr 2020 08:05:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1587535535;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=kQXTjZY3dHkhBq5XYrkgAuFoH+SyekRfL5KnlEgfB38=;
 b=atXI0Nz26kCgVwlA2uOtr7pcIlKf16CgxsRK/3qmmc7Jqlh3BudYjcJXFxCIjT71tSKTqT
 ccpHFtuqBlFNX2aXz/AARRci1J2lC0WtC/eJyEsDj7elvLNisR9tsx2xWEBaL/2q+6kosv
 XNTpvzVjK5vJHrVOCgZGEQ0TlO2VSGc=
Received: from mail-lf1-f71.google.com (mail-lf1-f71.google.com
 [209.85.167.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-181-ElXoIm4uNIm18AkBESIbRw-1; Wed, 22 Apr 2020 02:05:31 -0400
X-MC-Unique: ElXoIm4uNIm18AkBESIbRw-1
Received: by mail-lf1-f71.google.com with SMTP id b16so498883lfb.19
 for <ltp@lists.linux.it>; Tue, 21 Apr 2020 23:05:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=yqVJ7bxUI5O5sGrA7yWw9gRLBN4y0Gfx0P779w/IheU=;
 b=Ct58PohDF3ww/aLNY6eZsAkzDvoY6PSr44dsob/OC6vB1P1Xiy108Jhp/+Ux57i6H/
 2iJQSKwIDkCByDPBroBqi4S/uco2UpX1CWDPDUTygjzk/HEMaRBBNvebkoIUMfFvoQCh
 sEb9oyiTqjH+TP4xGFGVLuU2jFMU9VcfhUFfwnmdJh6slDVXmhiBhvnVxp75aZkCQqQn
 3hB/0x0BmlkwdB09SE+fRtry4Ni2Y7KoBiO92Q9UfEpoqU51RiKWa3vcX3T2aS9e8ymT
 yJuQtfMvTaLzIvKxCDwQ4zwYC8wrCHZ6n/zrW108hWo6aT/Ko0E70KRd7gJV0j3pd1gA
 7V8g==
X-Gm-Message-State: AGi0PubobRLjJX7R14CxwBlRRu0G7tNb8a7X74iDEe+S+EG2m9Avj7zp
 WzDNuJJ2ivxdHjT1oX6/d8M7b0vhH+dQtkugWPi8Gajhr9oMAwdLuYB3KDudw9PFviZDrftW4k+
 fQRVClqGpqGRT9BNYlQlnojhuOBk=
X-Received: by 2002:ac2:4853:: with SMTP id 19mr15645956lfy.171.1587535529040; 
 Tue, 21 Apr 2020 23:05:29 -0700 (PDT)
X-Google-Smtp-Source: APiQypJzY1CTjzhqoqpxY4juDVccGUs1+gVhx4K9K/DeAU9EUIBqzyaS/ghn/tb3uwH4vg8DPAod/dElmbth3xOiKX4=
X-Received: by 2002:ac2:4853:: with SMTP id 19mr15645949lfy.171.1587535528863; 
 Tue, 21 Apr 2020 23:05:28 -0700 (PDT)
MIME-Version: 1.0
References: <1586927503-10827-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
 <1587022142-32122-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
 <1587022142-32122-4-git-send-email-xuyang2018.jy@cn.fujitsu.com>
 <CAEemH2eeUa0XJSGeyid2J373FnvqSAQCjdO1AkbpHGTFisGGNA@mail.gmail.com>
 <be1c1761-c518-f3ee-ef19-b4f45d36df80@cn.fujitsu.com>
In-Reply-To: <be1c1761-c518-f3ee-ef19-b4f45d36df80@cn.fujitsu.com>
From: Li Wang <liwang@redhat.com>
Date: Wed, 22 Apr 2020 14:05:16 +0800
Message-ID: <CAEemH2diTUc226+Lr7ksyTw9BPMg2M5awZvrYo-j7oMT=pTPQQ@mail.gmail.com>
To: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,HTML_MESSAGE,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v3 3/3] syscalls/pipe2_03: Add new test for pipe2
 O_DIRECT flag
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
Content-Type: multipart/mixed; boundary="===============0836231896=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============0836231896==
Content-Type: multipart/alternative; boundary="0000000000004447fe05a3daebc2"

--0000000000004447fe05a3daebc2
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Xu,

On Tue, Apr 21, 2020 at 6:24 PM Yang Xu <xuyang2018.jy@cn.fujitsu.com>
wrote:

> ...
> >
> >     +       if (pid =3D=3D 0) {
> >     +               (*test_func[n])();
> >
> >     +               tst_reap_children();
> >     +               SAFE_CLOSE(fds[0]);
> >     +               SAFE_CLOSE(fds[1]);
> >
> >
> > I tend to move the cloese(fd) to the test process to nearby pipe2().
> > Otherwise, it causes an unclear error like:
> >
> > # ./pipe2_03
> > tst_test.c:1246: INFO: Timeout per run is 0h 05m 00s
> > pipe2_03.c:48: PASS: Each write(2) uses a separate packet
> > pipe2_03.c:61: PASS: Each read(2) reads a separate packet
> > pipe2_03.c:81: PASS: write(higner than PIPE_BUF) split into multiple
> packet
> > pipe2_03.c:108: FAIL: the excess bytes in the packet is discarded by
> > read, expect 1 got 1%A
> Even I use one fork and exit(0), I don't meet this problem. Or, I miss
> something?
>

My test env is kernel-5.7.0-rc1+ x86_64, I haven't figured out why the
read() get more words from the pipe, but the error has gone one I move the
safe_close(fd) part to the test main process.


> --- a/testcases/kernel/syscalls/pipe2/pipe2_03.c
> +++ b/testcases/kernel/syscalls/pipe2/pipe2_03.c
> @@ -59,6 +59,7 @@ static void check_peer_rw(void)
>                                          "Each read(2) doesn't read a
> separate packet, return %ld", TST_RET);
>                  }
>                  tst_res(TPASS, "Each read(2) reads a separate packet");
> +                _exit(0);
>          }
>   }
>
> @@ -79,6 +80,7 @@ static void check_split(void)
>                                          "write(higner than PIPE_BUF)
> split into multiple packet, return %ld", TST_RET);
>                  }
>                  tst_res(TPASS, "write(higner than PIPE_BUF) split into
> multiple packet");
> +                _exit(0);
>          }
>   }
>
> @@ -107,21 +109,17 @@ static void check_discard(void)
>                                  tst_res(TFAIL,
>                                          "the excess bytes in the packet
> is discarded by read, expect 1 got %s", tmp_secondbuf);
>                  }
> +                _exit(0);
>          }
>   }
>
>   static void verify_pipe2(unsigned int n)
>   {
> -       int pid;
> -
> -       pid =3D SAFE_FORK();
> -       if (pid =3D=3D 0) {
> -               (*test_func[n])();
> -               tst_reap_children();
> -               SAFE_CLOSE(fds[0]);
> -               SAFE_CLOSE(fds[1]);
> -       }
> +       (*test_func[n])();
> +       SAFE_CLOSE(fds[0]);
> +       SAFE_CLOSE(fds[1]);
>          tst_reap_children();
>

In my opinion, it is not a good habit to wait for children's status after
the test function, we'd better do that at the behind of fork() in the test
main process. I'd only keep the  (*test_func[n])(); in this verify_pipe2()
but no more else.

--=20
Regards,
Li Wang

--0000000000004447fe05a3daebc2
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small">Xu,</div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr=
" class=3D"gmail_attr">On Tue, Apr 21, 2020 at 6:24 PM Yang Xu &lt;<a href=
=3D"mailto:xuyang2018.jy@cn.fujitsu.com" target=3D"_blank">xuyang2018.jy@cn=
.fujitsu.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" styl=
e=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddin=
g-left:1ex"><span class=3D"gmail_default" style=3D"font-size:small">...</sp=
an><br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (pid =3D=3D 0) {<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0(*test_func[n])();<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0tst_reap_children();<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0SAFE_CLOSE(fds[0]);<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0SAFE_CLOSE(fds[1]);<br>
&gt; <br>
&gt; <br>
&gt; I tend to move the cloese(fd) to the test process to nearby=C2=A0pipe2=
(). <br>
&gt; Otherwise, it causes an unclear error like:<br>
&gt; <br>
&gt; # ./pipe2_03<br>
&gt; tst_test.c:1246: INFO: Timeout per run is 0h 05m 00s<br>
&gt; pipe2_03.c:48: PASS: Each write(2) uses a separate packet<br>
&gt; pipe2_03.c:61: PASS: Each read(2) reads a separate packet<br>
&gt; pipe2_03.c:81: PASS: write(higner than PIPE_BUF) split into multiple p=
acket<br>
&gt; pipe2_03.c:108: FAIL: the excess bytes in the packet is discarded by <=
br>
&gt; read, expect 1 got 1%A<br>
Even I use one fork and exit(0), I don&#39;t meet this problem. Or, I miss =
<br>
something?<br></blockquote><div><br></div><div><div class=3D"gmail_default"=
 style=3D"font-size:small">My test env is kernel-5.7.0-rc1+ x86_64, I haven=
&#39;t figured out why the read() get more words from the pipe, but the err=
or has gone one I move the safe_close(fd) part to the test main process.=C2=
=A0</div></div><div class=3D"gmail_default" style=3D"font-size:small"><br><=
/div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bo=
rder-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
--- a/testcases/kernel/syscalls/pipe2/pipe2_03.c<br>
+++ b/testcases/kernel/syscalls/pipe2/pipe2_03.c<br>
@@ -59,6 +59,7 @@ static void check_peer_rw(void)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&q=
uot;Each read(2) doesn&#39;t read a <br>
separate packet, return %ld&quot;, TST_RET);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tst_res(TPASS=
, &quot;Each read(2) reads a separate packet&quot;);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 _exit(0);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
=C2=A0 }<br>
<br>
@@ -79,6 +80,7 @@ static void check_split(void)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&q=
uot;write(higner than PIPE_BUF) <br>
split into multiple packet, return %ld&quot;, TST_RET);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tst_res(TPASS=
, &quot;write(higner than PIPE_BUF) split into <br>
multiple packet&quot;);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 _exit(0);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
=C2=A0 }<br>
<br>
@@ -107,21 +109,17 @@ static void check_discard(void)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tst_res(TFAIL,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&q=
uot;the excess bytes in the packet <br>
is discarded by read, expect 1 got %s&quot;, tmp_secondbuf);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 _exit(0);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
=C2=A0 }<br>
<br>
=C2=A0 static void verify_pipe2(unsigned int n)<br>
=C2=A0 {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0int pid;<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0pid =3D SAFE_FORK();<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if (pid =3D=3D 0) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(*test_func[n])();<=
br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tst_reap_children()=
;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0SAFE_CLOSE(fds[0]);=
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0SAFE_CLOSE(fds[1]);=
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+=C2=A0 =C2=A0 =C2=A0 <span class=3D"gmail_default" style=3D"font-size:smal=
l"></span>=C2=A0(*test_func[n])();<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0SAFE_CLOSE(fds[0]);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0SAFE_CLOSE(fds[1]);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tst_reap_children();<br></blockquote><div=
><br></div><div><div class=3D"gmail_default" style=3D"font-size:small">In m=
y opinion, it is not a good habit to wait for children&#39;s status after t=
he test function, we&#39;d better do that at the behind of fork() in the te=
st main process. I&#39;d only keep the=C2=A0<span class=3D"gmail_default"><=
/span>=C2=A0(*test_func[n])(); in this verify_pipe2() but no more else.</di=
v></div><div>=C2=A0</div></div>-- <br><div dir=3D"ltr"><div dir=3D"ltr"><di=
v>Regards,<br></div><div>Li Wang<br></div></div></div></div>

--0000000000004447fe05a3daebc2--


--===============0836231896==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============0836231896==--

