Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D90F3B707F
	for <lists+linux-ltp@lfdr.de>; Tue, 29 Jun 2021 12:20:37 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 6517B3C6CB4
	for <lists+linux-ltp@lfdr.de>; Tue, 29 Jun 2021 12:20:37 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id A56173C1C73
 for <ltp@lists.linux.it>; Tue, 29 Jun 2021 12:20:36 +0200 (CEST)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id DB79F1400E44
 for <ltp@lists.linux.it>; Tue, 29 Jun 2021 12:20:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1624962034;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=myWKMzBZ84MafV8Is47dugp0+HpB7Tazraj1WKGFy9M=;
 b=WIqCBQ7DvIRXDpa623YMGtqoNY3fLdvGEuLjfXghOaSkKINMaIjGSp9SyYkaphl8rzwr8b
 s5Nj0OYuDeyjNJpnkQs8/nJaZ5UqZyncRUoRgyuOFf3bqZGN4uOZLm82PK2rpSjQ+mM5Yt
 ozD96GRLQNz7urtVmUC1UGVbLjVVpSI=
Received: from mail-yb1-f197.google.com (mail-yb1-f197.google.com
 [209.85.219.197]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-483-Yfbxtp9HPf2LwK1Zpd80Zw-1; Tue, 29 Jun 2021 06:20:32 -0400
X-MC-Unique: Yfbxtp9HPf2LwK1Zpd80Zw-1
Received: by mail-yb1-f197.google.com with SMTP id
 o12-20020a5b050c0000b02904f4a117bd74so20337772ybp.17
 for <ltp@lists.linux.it>; Tue, 29 Jun 2021 03:20:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=myWKMzBZ84MafV8Is47dugp0+HpB7Tazraj1WKGFy9M=;
 b=SZ8mKKWB7fkDqnzkIgUMGetdV/r9m1W0Omu3W1WJQkHtbpvOKSIVXe0Rbl9YlLaaG/
 VOIQlZwW6cv3WhDhLUnVluzVsZhV4+y+Mly+QrhCmQ911tr1dq8HunGu6dkp2IWDBJas
 Ux6Onnkk6Au7/p/ZQNAoT2jR9KMZh8du2ZHU+6Xp7fXo8akFVpm7X5zdTtqgAqOxLuDN
 yvRHISRgOtIqhfryxqABBvucjEP8jiVYlX2+uzoGpBDUBko7fvBF9uVzcRbN8SVlDgHQ
 v3PNW8StyfQX72mX3oQLJulRTj1bxj/eI4AxZiJ9TPhXsHmy4ZE9JpKiYm0lDHJ1wd/1
 +Slg==
X-Gm-Message-State: AOAM5314r5/A1NFvzfM0pzu7AfLM/L97hXO4SvdQY0mP2ogz7AXB1Czq
 aywSB65WCWdla44KjcDmQUTnNz6L02As9km3oT9wk/93wwFOE9qv1MEs2snn4Cd16y/+sf9W4zq
 qnzs7XZWJ83n2G+it2laI4BdcjRs=
X-Received: by 2002:a05:6902:1145:: with SMTP id
 p5mr3773421ybu.286.1624962031516; 
 Tue, 29 Jun 2021 03:20:31 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx4xycbz/ZynnOToDu5Cingk+iP1rdYx6XOOG9JwJLMLiz5yqHb6tM84coHSG4N7+LY2b355FcoMlkORway/Ow=
X-Received: by 2002:a05:6902:1145:: with SMTP id
 p5mr3773406ybu.286.1624962031371; 
 Tue, 29 Jun 2021 03:20:31 -0700 (PDT)
MIME-Version: 1.0
References: <1624958759-5562-1-git-send-email-xuyang2018.jy@fujitsu.com>
 <1624958759-5562-2-git-send-email-xuyang2018.jy@fujitsu.com>
In-Reply-To: <1624958759-5562-2-git-send-email-xuyang2018.jy@fujitsu.com>
From: Li Wang <liwang@redhat.com>
Date: Tue, 29 Jun 2021 18:20:19 +0800
Message-ID: <CAEemH2dL=bZdP_X+YkZuOFK2dCV8RTq5CyZYPTrKh+_2yjHK5g@mail.gmail.com>
To: Yang Xu <xuyang2018.jy@fujitsu.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=liwan@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,HTML_MESSAGE,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 2/2] lib/newlib_tests/test_macros*.c: Include more
 test macros
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
Content-Type: multipart/mixed; boundary="===============0128768419=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============0128768419==
Content-Type: multipart/alternative; boundary="000000000000a7593305c5e4f4d4"

--000000000000a7593305c5e4f4d4
Content-Type: text/plain; charset="UTF-8"

Hi Xu,

On Tue, Jun 29, 2021 at 5:27 PM Yang Xu <xuyang2018.jy@fujitsu.com> wrote:

> 1) test TST_EXP_FD_SILENT macro in test_macros01.c
>

I'm thinking maybe we should add more info to indicate the TST_PASS result
from which TST_EXP_FD_SILENT? Because as TST_EXP_FD_SILENT will
keep silent, the only returned looks strange to us.

e.g.

        TST_EXP_FD_SILENT(pass_fd(), "%s", "SCALL");
-       tst_res(TINFO, "TST_PASS = %i", TST_PASS);
+       tst_res(TINFO, "TST_PASS = %i from TST_EXP_FD_SILENT(pass_fd,
...)", TST_PASS);



> 2) test TST_EXP_FAIL2 macro in test_macros02.c
>


> 3) test TST_EXP_PASS_SILENT macro in test_macros03.c
>

here as well.

> 4) add test_macros04.c to test TST_EXP_PID and TST_EXP_PID_SILENT macros
>

and here.

Btw, the remaining part looks good to me.

-- 
Regards,
Li Wang

--000000000000a7593305c5e4f4d4
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small">Hi Xu,</div></div><br><div class=3D"gmail_quote"><div dir=3D"=
ltr" class=3D"gmail_attr">On Tue, Jun 29, 2021 at 5:27 PM Yang Xu &lt;<a hr=
ef=3D"mailto:xuyang2018.jy@fujitsu.com">xuyang2018.jy@fujitsu.com</a>&gt; w=
rote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0p=
x 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">1) test <s=
pan class=3D"gmail_default" style=3D"font-size:small"></span>TST_EXP_FD_SIL=
ENT macro in test_macros01.c<br></blockquote><div><br></div><div><div class=
=3D"gmail_default" style=3D"font-size:small">I&#39;m thinking maybe we shou=
ld add more info to indicate the TST_PASS result</div><div class=3D"gmail_d=
efault" style=3D"font-size:small">from which=C2=A0<span class=3D"gmail_defa=
ult"></span>TST_EXP_FD_SILENT? Because=C2=A0as=C2=A0<span class=3D"gmail_de=
fault"></span>TST_EXP_FD_SILENT will</div><div class=3D"gmail_default" styl=
e=3D"font-size:small">keep silent, the only returned looks strange to us.</=
div><div class=3D"gmail_default" style=3D"font-size:small"><br></div><div c=
lass=3D"gmail_default" style=3D"font-size:small">e.g.</div><div class=3D"gm=
ail_default" style=3D"font-size:small"><br></div><div class=3D"gmail_defaul=
t" style=3D"font-size:small">=C2=A0 =C2=A0 =C2=A0 =C2=A0 TST_EXP_FD_SILENT(=
pass_fd(), &quot;%s&quot;, &quot;SCALL&quot;);<br>- =C2=A0 =C2=A0 =C2=A0 ts=
t_res(TINFO, &quot;TST_PASS =3D %i&quot;, TST_PASS);<br>+ =C2=A0 =C2=A0 =C2=
=A0 tst_res(TINFO, &quot;TST_PASS =3D %i from TST_EXP_FD_SILENT(pass_fd, ..=
.)&quot;, TST_PASS);<br></div><br></div><div>=C2=A0</div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex">
2) test TST_EXP_FAIL2 macro in test_macros02.c<br>
</blockquote><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"ma=
rgin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:=
1ex">3) test TST_EXP_PASS_SILENT macro in test_macros03.c<br></blockquote><=
div><br></div><div class=3D"gmail_default" style=3D"font-size:small">here a=
s well.</div><div class=3D"gmail_default" style=3D"font-size:small"></div><=
blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-l=
eft:1px solid rgb(204,204,204);padding-left:1ex">
4) add test_macros04.c to test TST_EXP_PID and TST_EXP_PID_SILENT macros<br=
></blockquote><div><br></div><div class=3D"gmail_default" style=3D"font-siz=
e:small">and here.</div><div><br></div><div class=3D"gmail_default" style=
=3D"font-size:small">Btw, the remaining part looks good to me.</div></div><=
div><br></div>-- <br><div dir=3D"ltr" class=3D"gmail_signature"><div dir=3D=
"ltr"><div>Regards,<br></div><div>Li Wang<br></div></div></div></div>

--000000000000a7593305c5e4f4d4--


--===============0128768419==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============0128768419==--

