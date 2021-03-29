Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id BDC2134D219
	for <lists+linux-ltp@lfdr.de>; Mon, 29 Mar 2021 16:08:30 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id C4FAB3C781A
	for <lists+linux-ltp@lfdr.de>; Mon, 29 Mar 2021 16:08:29 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id C0C0C3C2694
 for <ltp@lists.linux.it>; Mon, 29 Mar 2021 16:08:28 +0200 (CEST)
Received: from mail-pl1-x62b.google.com (mail-pl1-x62b.google.com
 [IPv6:2607:f8b0:4864:20::62b])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id BE9986008A3
 for <ltp@lists.linux.it>; Mon, 29 Mar 2021 16:08:27 +0200 (CEST)
Received: by mail-pl1-x62b.google.com with SMTP id e14so4446809plj.2
 for <ltp@lists.linux.it>; Mon, 29 Mar 2021 07:08:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:message-id:mime-version:subject:date:in-reply-to:cc:to
 :references; bh=+zAn387HdmJLO19CpHAe3Py4j2j8oD6dcsEiqCVSI6Y=;
 b=MmbAoleAu1Y48A8vEU2sL2YkhzzbaWIQ1ZizeO/v0OFLW/8nZKPCWUv54XYtrMXBkM
 1o5gDbbcKTHMx+c/lSR5w+H4WzJdYP0l9kYlzGmIX5yCeVzrMcveId1pG8gNB4powhEO
 C6Bsos7GnLqtzwbOWo9fAvh48OXctF/mPSX6WK1XmHZ2mQCxwqdrsS1cJSGeQY12sFvA
 A8N+CsFt25nw6nkrZbeh51mZBPN/dB3NpYqLygs71akplPrggr94twwnnyEP2ESkivcN
 YntpyqaQqqo3FxK0kS9R4Y/ibpLnxg0nY/xYAOfVLA4Hb9woEH3XXsURxAvzFhz2bl5g
 +40Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:message-id:mime-version:subject:date
 :in-reply-to:cc:to:references;
 bh=+zAn387HdmJLO19CpHAe3Py4j2j8oD6dcsEiqCVSI6Y=;
 b=o3DCcs682va66/4RQ4+QLFvdXV/eL3fNb4HUB+8YELfa+DojwDFlOEBgEPW7HFMptZ
 I4EIxtoZ2HaNQD+pvi/vGDTMmEmuUeMq9bHv+EqOzpZx0nefB/M5Wy6Ty3Raisnb18J+
 iWPaviiAFosUYvSKqrzzCisynE6epfXmwe+6HkCMC0ZtrPXvO6fGGeSmMeqzxZov3F9n
 ltzZ2WsKKM9mT13eZUxjpHaoOX889DODSnsGGXHfxE8XDNQlpVy3OCljgOreyl3Fqodm
 DjIr2S7ahwuf2IFI4FYkEdJJFUirEJEsLQcnLs2mp5KH9I4B2XSG+0bATtVolEX3L/ce
 oMNQ==
X-Gm-Message-State: AOAM5339Ov9XERDjyAuoqDOAKRmtxrSky8CFL5zRgAEQpiB47XaBwqFo
 N2jQKwMSmSwvOchxMqKO6ug=
X-Google-Smtp-Source: ABdhPJz65n5hDejwNXEWzjE+qdgWH+hieGJ3Hhql98E3qTvA3Y6WHWrCeFRKoSS+UgGConoRGWknlg==
X-Received: by 2002:a17:902:bf92:b029:e6:bc0:25ac with SMTP id
 v18-20020a170902bf92b02900e60bc025acmr29230995pls.49.1617026906319; 
 Mon, 29 Mar 2021 07:08:26 -0700 (PDT)
Received: from ?IPv6:2400:2411:d20:8500:fc9e:5cf9:6773:5bf9?
 ([2400:2411:d20:8500:fc9e:5cf9:6773:5bf9])
 by smtp.gmail.com with ESMTPSA id w5sm17429782pge.55.2021.03.29.07.08.24
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 29 Mar 2021 07:08:25 -0700 (PDT)
From: QI Fuli <fukuri.sai@gmail.com>
Message-Id: <A54D5F52-9E92-4372-A4C8-C6795F1B3AE6@gmail.com>
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.60.0.2.21\))
Date: Mon, 29 Mar 2021 23:08:23 +0900
In-Reply-To: <CAEemH2dQPS+zhp0gEcTjPswjwX+csN72xbCuHzwW=ExcgUPKNQ@mail.gmail.com>
To: Li Wang <liwang@redhat.com>
References: <20210327103226.99073-1-qi.fuli@fujitsu.com>
 <CAEemH2dQPS+zhp0gEcTjPswjwX+csN72xbCuHzwW=ExcgUPKNQ@mail.gmail.com>
X-Mailer: Apple Mail (2.3654.60.0.2.21)
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,HTML_MESSAGE,SPF_HELO_NONE,
 SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 0/6] Convert syscalls/swap{on, off}/ to the new API
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
Cc: QI Fuli <qi.fuli@fujitsu.com>, LTP List <ltp@lists.linux.it>
Content-Type: multipart/mixed; boundary="===============1170213809=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>


--===============1170213809==
Content-Type: multipart/alternative;
	boundary="Apple-Mail=_74CB1DA3-5595-4C13-B39B-5CC6A15669FA"


--Apple-Mail=_74CB1DA3-5595-4C13-B39B-5CC6A15669FA
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii

Hi Li Wang,

> On Mar 29, 2021, at 14:33, Li Wang <liwang@redhat.com> wrote:
>=20
> Hi Fuli,
>=20
> QI Fuli <fukuri.sai@gmail.com <mailto:fukuri.sai@gmail.com>> wrote:
>=20
> From: QI Fuli <qi.fuli@fujitsu.com <mailto:qi.fuli@fujitsu.com>>
>=20
> Rename libs/libltpswapon libs/libltpswap and Convert it to the new API
> Convert syscalls/swap{on,off}/ to the new API
>=20
> QI Fuli (6):
>   libs/libltpswap: Add libs/libltpswap by using the new API
>   syscalls/swapon/swapon01: Convert swapon01 to the new API
>   syscalls/swapon/swapon02: Convert swapon02 to the new API
>   syscalls/swapon/swapon03: Convert swapon03 to the new API
>   syscalls/swapoff/swapoff01: Convert swapoff01 to the new API
>   syscalls/swapoff/swapoff02: Convert swapoff02 to the new API
>=20
> I made some changes based on your patchset and pushed it.
>=20
> * remove the libs/libltpswapon from patch 1/6
> * add [Description] in the comment to make ltp/docparse happy
> * fix some TTERRNO/TERRNO usage issues
> * code indent issue e.g. add brackets while more than two lines in =
if...else sentence
>=20
> Btw, next time you can add '-v2' parameter when generating the second =
patch version.
>=20
> `git format-patch -v2 -6 ...`

Thank you very much for the help.

Best,
QI=20

>=20
> --=20
> Regards,
> Li Wang


--Apple-Mail=_74CB1DA3-5595-4C13-B39B-5CC6A15669FA
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html;
	charset=us-ascii

<html><head><meta http-equiv=3D"Content-Type" content=3D"text/html; =
charset=3Dus-ascii"></head><body style=3D"word-wrap: break-word; =
-webkit-nbsp-mode: space; line-break: after-white-space;" class=3D"">Hi =
Li Wang,<br class=3D""><div><br class=3D""><blockquote type=3D"cite" =
class=3D""><div class=3D"">On Mar 29, 2021, at 14:33, Li Wang &lt;<a =
href=3D"mailto:liwang@redhat.com" class=3D"">liwang@redhat.com</a>&gt; =
wrote:</div><br class=3D"Apple-interchange-newline"><div class=3D""><div =
dir=3D"ltr" class=3D""><div dir=3D"ltr" class=3D""><div =
class=3D"gmail_default" style=3D"font-size:small">Hi =
Fuli,</div></div><br class=3D""><div class=3D"gmail_quote"><div =
dir=3D"ltr" class=3D"gmail_attr">QI Fuli &lt;<a =
href=3D"mailto:fukuri.sai@gmail.com" target=3D"_blank" =
class=3D"">fukuri.sai@gmail.com</a>&gt; wrote:<br class=3D""></div><div =
dir=3D"ltr" class=3D"gmail_attr"><br class=3D""></div><blockquote =
class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px =
solid rgb(204,204,204);padding-left:1ex">From: QI Fuli &lt;<a =
href=3D"mailto:qi.fuli@fujitsu.com" target=3D"_blank" =
class=3D"">qi.fuli@fujitsu.com</a>&gt;<br class=3D"">
<br class=3D"">
Rename libs/libltpswapon libs/libltpswap and Convert it to the new =
API<br class=3D"">
Convert syscalls/swap{on,off}/ to the new API<br class=3D"">
<br class=3D"">
QI Fuli (6):<br class=3D"">
&nbsp; libs/libltpswap: Add libs/libltpswap by using the new API<br =
class=3D"">
&nbsp; syscalls/swapon/swapon01: Convert swapon01 to the new API<br =
class=3D"">
&nbsp; syscalls/swapon/swapon02: Convert swapon02 to the new API<br =
class=3D"">
&nbsp; syscalls/swapon/swapon03: Convert swapon03 to the new API<br =
class=3D"">
&nbsp; syscalls/swapoff/swapoff01: Convert swapoff01 to the new API<br =
class=3D"">
&nbsp; syscalls/swapoff/swapoff02: Convert swapoff02 to the new API<br =
class=3D""></blockquote><div class=3D""><br class=3D""></div><div =
class=3D"gmail_default" style=3D"font-size:small">I made some changes =
based on your patchset and pushed it.</div><div class=3D"gmail_default" =
style=3D"font-size:small"><br class=3D""></div><div =
class=3D"gmail_default" style=3D"font-size:small">* remove =
the&nbsp;libs/libltpswapon from patch 1/6</div><div =
class=3D"gmail_default" style=3D"font-size:small">* add [Description] in =
the comment to make ltp/docparse happy</div><div class=3D"gmail_default" =
style=3D"font-size:small">* fix some TTERRNO/TERRNO&nbsp;usage =
issues</div><div class=3D"gmail_default" style=3D"font-size:small">* =
code indent issue e.g. add brackets while more than two lines in =
if...else sentence</div><div class=3D"gmail_default" =
style=3D"font-size:small"><br class=3D""></div><div =
class=3D"gmail_default" style=3D"font-size:small">Btw, next time you can =
add '-v2' parameter when generating the second patch version.</div><div =
class=3D"gmail_default" style=3D"font-size:small"><br =
class=3D""></div><div class=3D"gmail_default" =
style=3D"font-size:small">`git format-patch -v2 -6 =
...`</div></div></div></div></blockquote><div><br class=3D""></div>Thank =
you very much for the help.</div><div><br =
class=3D""></div><div>Best,</div><div>QI&nbsp;</div><div><br =
class=3D""><blockquote type=3D"cite" class=3D""><div class=3D""><div =
dir=3D"ltr" class=3D""><div class=3D""><br class=3D""></div>-- <br =
class=3D""><div dir=3D"ltr" class=3D""><div dir=3D"ltr" class=3D""><div =
class=3D"">Regards,<br class=3D""></div><div class=3D"">Li Wang<br =
class=3D""></div></div></div></div>
</div></blockquote></div><br class=3D""></body></html>=

--Apple-Mail=_74CB1DA3-5595-4C13-B39B-5CC6A15669FA--

--===============1170213809==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============1170213809==--
