Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F7F91FFFAC
	for <lists+linux-ltp@lfdr.de>; Fri, 19 Jun 2020 03:31:32 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 06D0E3C2CA1
	for <lists+linux-ltp@lfdr.de>; Fri, 19 Jun 2020 03:31:32 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 by picard.linux.it (Postfix) with ESMTP id 3509A3C1D1C
 for <ltp@lists.linux.it>; Fri, 19 Jun 2020 03:31:29 +0200 (CEST)
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [207.211.31.81])
 by in-7.smtp.seeweb.it (Postfix) with ESMTP id 7C4FD201097
 for <ltp@lists.linux.it>; Fri, 19 Jun 2020 03:31:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1592530285;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=xr1V6cabaSdvbS8AIcG//sSTgGmqxDPSpwdH+VVFcr4=;
 b=KzzFtkw2FkPyI3qEW+M6PzcI6aOSVzSaBeO8FFXe0Sy8uXnZf4uiO845LBi8Tg7I3RA+8b
 GifNsv0JuLmYOhmbkFaw+A9NqtMvYPDBzWldtGIEaykW6Z7xd3L7G7QBT8hSA1QodnsJwu
 Zxj1MoOe3CStNUazOhM/zfzpaUqlB9U=
Received: from mail-lf1-f70.google.com (mail-lf1-f70.google.com
 [209.85.167.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-463-GcoYZ2ESM0K98qFgHVZDaw-1; Thu, 18 Jun 2020 21:31:22 -0400
X-MC-Unique: GcoYZ2ESM0K98qFgHVZDaw-1
Received: by mail-lf1-f70.google.com with SMTP id a10so2699461lfo.23
 for <ltp@lists.linux.it>; Thu, 18 Jun 2020 18:31:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=xr1V6cabaSdvbS8AIcG//sSTgGmqxDPSpwdH+VVFcr4=;
 b=N0HzFStTL6h+cNKSLV0ohXxwbj5YtHkHSGNK4i/oHoDysXFO2V4qFYNsOwckpKh3Hu
 REX+TXaZ4WwR3POMynkc4o+DUSifjI826mkDeNTtcYLHoHXxN67zRq2+XTx5cmPwPQh5
 jIVxI8lEnARGPxrFVg5gSy/ig5LAeJl/dnrEPZkrfObazkt3EndOIu9BgRPZSCKQKuKc
 Mvt7Weh+fW09I8CJEjOAPAF5D90UEuiqCLn43/jIL3wv9X8S5Y8YUxJf478I703qKgtJ
 Z6qpWUA5LcoVQToGeRr+3501KPoyr5TbArm7Ntf/dB4u9i0Ourra8LdQavq1cWI0PILL
 gNEQ==
X-Gm-Message-State: AOAM5318MWlc8odpJH9Fmv8na2jrO04/r1VoTe9UuGD/lvF3laotEoTS
 idP3GJTaOFhDh09RBOHXpiyUxHCqmiDs39XwedZxJn5GiF+vJDfiSZFNXTHCibb3M+nnx0NfD8O
 YD4KvH4kGY9Cs35tMGiJDNQUlzEA=
X-Received: by 2002:a2e:4812:: with SMTP id v18mr561028lja.353.1592530281024; 
 Thu, 18 Jun 2020 18:31:21 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzdU9nmQFZKLdnhiE+uisali7ksopvtF1hqydS7it/KdOxK4qBeYdNu69Ljha+Cc82yXZvrZnQ8qIAzOT9ZeGY=
X-Received: by 2002:a2e:4812:: with SMTP id v18mr561019lja.353.1592530280804; 
 Thu, 18 Jun 2020 18:31:20 -0700 (PDT)
MIME-Version: 1.0
References: <53a3e9975f00c50c78528994472ec7e9f8adeb90.1592475774.git.jstancek@redhat.com>
In-Reply-To: <53a3e9975f00c50c78528994472ec7e9f8adeb90.1592475774.git.jstancek@redhat.com>
From: Li Wang <liwang@redhat.com>
Date: Fri, 19 Jun 2020 09:31:08 +0800
Message-ID: <CAEemH2fgg9KOO5KxTwr0LpGdL2X0p_aGefNuwQQjajkRNJKk9Q@mail.gmail.com>
To: Jan Stancek <jstancek@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.99.2 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,HTML_MESSAGE,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] clocks/invaliddates.c: relax acceptable delta
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
Content-Type: multipart/mixed; boundary="===============1058684772=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============1058684772==
Content-Type: multipart/alternative; boundary="000000000000ae8df505a865d92b"

--000000000000ae8df505a865d92b
Content-Type: text/plain; charset="UTF-8"

On Thu, Jun 18, 2020 at 6:24 PM Jan Stancek <jstancek@redhat.com> wrote:

> Test allows just 5ms delta for PASS, and test randomly fails in
> environments with shared resources and increased steal time.
>
> Relax the condition and also print deltas if test fails.
> Remove DEBUG ifdefs and main parameters to avoid unused variable
> warning.
>
> Signed-off-by: Jan Stancek <jstancek@redhat.com>
> ---
>  .../functional/timers/clocks/invaliddates.c   | 25 +++++++------------
>  1 file changed, 9 insertions(+), 16 deletions(-)
>
> diff --git
> a/testcases/open_posix_testsuite/functional/timers/clocks/invaliddates.c
> b/testcases/open_posix_testsuite/functional/timers/clocks/invaliddates.c
> index face334fd250..d4116b1e9bc0 100644
> ---
> a/testcases/open_posix_testsuite/functional/timers/clocks/invaliddates.c
> +++
> b/testcases/open_posix_testsuite/functional/timers/clocks/invaliddates.c
> @@ -18,8 +18,7 @@
>
>  #define NUMTESTS 5
>
> -#define ACCEPTABLESECDELTA 0
> -#define ACCEPTABLENSECDELTA 5000000
> +#define ACCEPTABLESECDELTA 2
>

It's hard to say what size of the second-delta is a proper value, but to
increase it can obviously decrease the failure probability. If there is no
better way I'd go with this patch.

Reviewed-by: Li Wang <liwang@redhat.com>



>
>  static int testtimes[NUMTESTS][2] = {
>         {INT32_MAX, 999999999}, // large number
> @@ -29,7 +28,7 @@ static int testtimes[NUMTESTS][2] = {
>         {1049623200, 999999999},        // daylight savings 2003
>  };
>
> -int main(int argc, char *argv[])
> +int main(void)
>  {
>         struct timespec tpset, tpget, tsreset;
>         int secdelta, nsecdelta;
> @@ -44,9 +43,6 @@ int main(int argc, char *argv[])
>         for (i = 0; i < NUMTESTS; i++) {
>                 tpset.tv_sec = testtimes[i][0];
>                 tpset.tv_nsec = testtimes[i][1];
> -#ifdef DEBUG
> -               printf("Test: %ds %dns\n", testtimes[i][0],
> testtimes[i][1]);
> -#endif
>                 if (clock_settime(CLOCK_REALTIME, &tpset) == 0) {
>                         if (clock_gettime(CLOCK_REALTIME, &tpget) == -1) {
>                                 printf("Error in clock_gettime()\n");
> @@ -58,16 +54,13 @@ int main(int argc, char *argv[])
>                                 nsecdelta = nsecdelta + 1000000000;
>                                 secdelta = secdelta - 1;
>                         }
> -#ifdef DEBUG
> -                       printf("Delta:  %ds %dns\n", secdelta, nsecdelta);
> -#endif
> -                       if ((secdelta > ACCEPTABLESECDELTA) || (secdelta <
> 0)) {
> -                               printf("clock does not appear to be
> set\n");
> -                               failure = 1;
> -                       }
> -                       if ((nsecdelta > ACCEPTABLENSECDELTA) ||
> -                           (nsecdelta < 0)) {
> -                               printf("clock does not appear to be
> set\n");
> +
> +                       if ((secdelta > ACCEPTABLESECDELTA)
> +                               || (secdelta < 0)) {
> +                               printf("FAIL: test(%d,%d), secdelta: %d,"
> +                                       " nsecdelta: %d\n",
> +                                       testtimes[i][0], testtimes[i][1],
> +                                       secdelta, nsecdelta);
>                                 failure = 1;
>                         }
>                 } else {
> --
> 2.18.1
>
>

-- 
Regards,
Li Wang

--000000000000ae8df505a865d92b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote"><div dir=3D"lt=
r" class=3D"gmail_attr">On Thu, Jun 18, 2020 at 6:24 PM Jan Stancek &lt;<a =
href=3D"mailto:jstancek@redhat.com" target=3D"_blank">jstancek@redhat.com</=
a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0p=
x 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Te=
st allows just 5ms delta for PASS, and test randomly fails in<br>
environments with shared resources and increased steal time.<br>
<br>
Relax the condition and also print deltas if test fails.<br>
Remove DEBUG ifdefs and main parameters to avoid unused variable<br>
warning.<br>
<br>
Signed-off-by: Jan Stancek &lt;<a href=3D"mailto:jstancek@redhat.com" targe=
t=3D"_blank">jstancek@redhat.com</a>&gt;<br>
---<br>
=C2=A0.../functional/timers/clocks/invaliddates.c=C2=A0 =C2=A0| 25 +++++++-=
-----------<br>
=C2=A01 file changed, 9 insertions(+), 16 deletions(-)<br>
<br>
diff --git a/testcases/open_posix_testsuite/functional/timers/clocks/invali=
ddates.c b/testcases/open_posix_testsuite/functional/timers/clocks/invalidd=
ates.c<br>
index face334fd250..d4116b1e9bc0 100644<br>
--- a/testcases/open_posix_testsuite/functional/timers/clocks/invaliddates.=
c<br>
+++ b/testcases/open_posix_testsuite/functional/timers/clocks/invaliddates.=
c<br>
@@ -18,8 +18,7 @@<br>
<br>
=C2=A0#define NUMTESTS 5<br>
<br>
-#define ACCEPTABLESECDELTA 0<br>
-#define ACCEPTABLENSECDELTA 5000000<br>
+#define ACCEPTABLESECDELTA 2<br></blockquote><div><br></div><div><div clas=
s=3D"gmail_default" style=3D"font-size:small">It&#39;s hard to say what siz=
e of the second-delta is a proper value, but to increase it can obviously d=
ecrease=C2=A0the failure=C2=A0probability. If there is no better way I&#39;=
d go with this patch.=C2=A0</div><div class=3D"gmail_default" style=3D"font=
-size:small"><br></div><div class=3D"gmail_default" style=3D"font-size:smal=
l">Reviewed-by: Li Wang &lt;<a href=3D"mailto:liwang@redhat.com" target=3D"=
_blank">liwang@redhat.com</a>&gt;<br></div><br></div><div>=C2=A0</div><bloc=
kquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:=
1px solid rgb(204,204,204);padding-left:1ex">
<br>
=C2=A0static int testtimes[NUMTESTS][2] =3D {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 {INT32_MAX, 999999999}, // large number<br>
@@ -29,7 +28,7 @@ static int testtimes[NUMTESTS][2] =3D {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 {1049623200, 999999999},=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 // daylight savings 2003<br>
=C2=A0};<br>
<br>
-int main(int argc, char *argv[])<br>
+int main(void)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 struct timespec tpset, tpget, tsreset;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 int secdelta, nsecdelta;<br>
@@ -44,9 +43,6 @@ int main(int argc, char *argv[])<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 for (i =3D 0; i &lt; NUMTESTS; i++) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 tpset.tv_sec =3D te=
sttimes[i][0];<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 tpset.tv_nsec =3D t=
esttimes[i][1];<br>
-#ifdef DEBUG<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0printf(&quot;Test: =
%ds %dns\n&quot;, testtimes[i][0], testtimes[i][1]);<br>
-#endif<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (clock_settime(C=
LOCK_REALTIME, &amp;tpset) =3D=3D 0) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 if (clock_gettime(CLOCK_REALTIME, &amp;tpget) =3D=3D -1) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 printf(&quot;Error in clock_gettime(=
)\n&quot;);<br>
@@ -58,16 +54,13 @@ int main(int argc, char *argv[])<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 nsecdelta =3D nsecdelta + 1000000000=
;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 secdelta =3D secdelta - 1;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 }<br>
-#ifdef DEBUG<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0printf(&quot;Delta:=C2=A0 %ds %dns\n&quot;, secdelta, nsecdelta);=
<br>
-#endif<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0if ((secdelta &gt; ACCEPTABLESECDELTA) || (secdelta &lt; 0)) {<br=
>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0printf(&quot;clock does not appear to=
 be set\n&quot;);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0failure =3D 1;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0}<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0if ((nsecdelta &gt; ACCEPTABLENSECDELTA) ||<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0(nsecdelta &lt; 0)) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0printf(&quot;clock does not appear to=
 be set\n&quot;);<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0if ((secdelta &gt; ACCEPTABLESECDELTA)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|| (secdelta &lt; 0)) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0printf(&quot;FAIL: test(%d,%d), secde=
lta: %d,&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot; ns=
ecdelta: %d\n&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0testtimes=
[i][0], testtimes[i][1],<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0secdelta,=
 nsecdelta);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 failure =3D 1;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 }<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 } else {<br>
-- <br>
2.18.1<br>
<br>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr"=
><div dir=3D"ltr"><div>Regards,<br></div><div>Li Wang<br></div></div></div>=
</div>

--000000000000ae8df505a865d92b--


--===============1058684772==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============1058684772==--

