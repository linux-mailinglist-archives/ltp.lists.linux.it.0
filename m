Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 87DE234A502
	for <lists+linux-ltp@lfdr.de>; Fri, 26 Mar 2021 10:55:07 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id CBD673C27F5
	for <lists+linux-ltp@lfdr.de>; Fri, 26 Mar 2021 10:55:01 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 by picard.linux.it (Postfix) with ESMTP id 0BEE23C27C9
 for <ltp@lists.linux.it>; Fri, 26 Mar 2021 10:54:59 +0100 (CET)
Received: from mail-pf1-x432.google.com (mail-pf1-x432.google.com
 [IPv6:2607:f8b0:4864:20::432])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 58650200169
 for <ltp@lists.linux.it>; Fri, 26 Mar 2021 10:54:59 +0100 (CET)
Received: by mail-pf1-x432.google.com with SMTP id c204so4540856pfc.4
 for <ltp@lists.linux.it>; Fri, 26 Mar 2021 02:54:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:message-id:mime-version:subject:date:in-reply-to:cc:to
 :references; bh=tSIfyVOPz+arUVqP5i4RBIxbpf8Z6R9oXNJvOrgmGrU=;
 b=jZnoijAHjL+lYivJsAz11vnRdnzW2FiOY0PDfybhj2jRBkK52XYAwpdSZPeVzdGYmZ
 nFPI0WRtlBsGOOnPEnRb1nd/ftyfnZrKjGNJcwF6udAyU0bgjjxwFbVkmcJjI674JwjP
 l/+46Sd2SjU1E7IoJX5O5quxWz0EkkF9iHu8wrasMF8fKmsSd3VgrTd4IZ8zQHzfNpGB
 kt11folXsQ3blOJEfsQBHvSXr7w0jlGpeO+XNwSDbBaEeOge+qu1XAEFCFmRnBYDJtaD
 tXnrrjFGznQZC7Kp726byYrPQW6aX+WURVtum9UK3JR937rb1qJkkwL+kNTDAgsKD+0t
 03ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:message-id:mime-version:subject:date
 :in-reply-to:cc:to:references;
 bh=tSIfyVOPz+arUVqP5i4RBIxbpf8Z6R9oXNJvOrgmGrU=;
 b=nMv5bvOXOTz6I0i6Dr7IFJLrrqnuRByH03DNYdjflnKvQPLeXYLBMwHT5wkrlYoUVn
 bS7EhANs1cn0v4X1wDSAvs1K6L1gQ9CwRA0oTmxyb3HdgrAj1e/uAiWhgDopJLGt5my9
 HC7Kjv3D0rjTF6z/RSHudt4KVJoYt5eu6CV/KFMwAePGa/+O5ZKvP1itqApkLR56LwvS
 ZzlN1gbY5/foEIx2NINFsc0kxf2+x9eA/FtyzkdJTHzx7FmoOyAqDCv9qQbnnosAcsZK
 lkFwCOjaT0GIGmWB93EwyTDZSaEqIb5sK1Ly0Y5Jgxf1ao7qn6GQuaK6aTv6dkACoxzO
 qfVQ==
X-Gm-Message-State: AOAM5328Iqx8K+5+7jT0DgO/zpnvWh73BpjMIuPUhv/XuXl6H34/Sps3
 er7BOH4Fjvt2ROPGq1ilx5s=
X-Google-Smtp-Source: ABdhPJysZfhpwg9DavkzlD1vPMcCyYZrZzJ2T4cfTQG9O1BHAZz9zz9UjRH7/6IKMuIevZU+ceaoBQ==
X-Received: by 2002:aa7:93af:0:b029:1ef:1bb9:b1a1 with SMTP id
 x15-20020aa793af0000b02901ef1bb9b1a1mr12444039pff.49.1616752497686; 
 Fri, 26 Mar 2021 02:54:57 -0700 (PDT)
Received: from ?IPv6:2400:2411:d20:8500:a8c8:eda5:4ae8:f601?
 ([2400:2411:d20:8500:a8c8:eda5:4ae8:f601])
 by smtp.gmail.com with ESMTPSA id s19sm8663580pfh.168.2021.03.26.02.54.56
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 26 Mar 2021 02:54:57 -0700 (PDT)
From: QI Fuli <fukuri.sai@gmail.com>
Message-Id: <234CFF0B-4141-4F80-9977-E91085DABCB6@gmail.com>
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.60.0.2.21\))
Date: Fri, 26 Mar 2021 18:54:54 +0900
In-Reply-To: <CAEemH2fFciCEAdVFETCEuoWegiVrYL6pp9Vv_t3atXivPzhEDg@mail.gmail.com>
To: Li Wang <liwang@redhat.com>
References: <20210325181906.40688-1-qi.fuli@fujitsu.com>
 <CAEemH2fFciCEAdVFETCEuoWegiVrYL6pp9Vv_t3atXivPzhEDg@mail.gmail.com>
X-Mailer: Apple Mail (2.3654.60.0.2.21)
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,HTML_MESSAGE,SPF_HELO_NONE,
 SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 0/4] Convert swapon/swapon0{1..3} to the new API
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
Content-Type: multipart/mixed; boundary="===============1603875611=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>


--===============1603875611==
Content-Type: multipart/alternative;
	boundary="Apple-Mail=_2C98D61A-CFF2-4CE9-88B6-E715469778F2"


--Apple-Mail=_2C98D61A-CFF2-4CE9-88B6-E715469778F2
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii

Hi Li Wang,

> On Mar 26, 2021, at 18:01, Li Wang <liwang@redhat.com> wrote:
>=20
> Hi Fuli,
>=20
>=20
> On Fri, Mar 26, 2021 at 2:20 AM QI Fuli <fukuri.sai@gmail.com =
<mailto:fukuri.sai@gmail.com>> wrote:
> From: QI Fuli <qi.fuli@fujitsu.com <mailto:qi.fuli@fujitsu.com>>
>=20
> Convert syscalls/swapon/swapon0{1..3} to the new API
>=20
> QI Fuli (4):
>   libs/libltpswap: Rename and Convert libs/libltpswapon to the new API
>=20
> I appreciate your help to convert the libltpswapon to the new API, but =
at
> the first sight of your patchset, I was quite curious why not complete =
the
> leftover two test swapoff/ to new then we can remove the old API =
totally.
>=20
> So in other words, it probably makes people confusing that there exist=20=

> libltpswap/ and libltpswapon/ at the same time.=20
>=20
> Could you help finish the rest work? :)

Thanks for your comments.

Yes, I will make a patchset to convert the swapoff/ and to remove the =
libltpswapon/.

Best,
QI

>=20
> =20
>   syscalls/swapon/swapon01: Convert swapon01 to the new API
>   syscalls/swapon/swapon02: Convert swapon02 to the new API
>   syscalls/swapon/swapon03: Convert swapon03 to the new API
>=20
>  include/libswap.h                           |  24 +++
>  libs/libltpswap/Makefile                    |  12 ++
>  libs/libltpswap/libswap.c                   |  63 ++++++
>  testcases/kernel/syscalls/swapon/Makefile   |   4 +-
>  testcases/kernel/syscalls/swapon/swapon01.c |  83 ++-----
>  testcases/kernel/syscalls/swapon/swapon02.c | 145 +++++--------
>  testcases/kernel/syscalls/swapon/swapon03.c | 227 =
++++++++------------
>  7 files changed, 258 insertions(+), 300 deletions(-)
>  create mode 100644 include/libswap.h
>  create mode 100644 libs/libltpswap/Makefile
>  create mode 100644 libs/libltpswap/libswap.c
>=20
> --
> 2.30.2
>=20
>=20
> --=20
> Mailing list info: https://lists.linux.it/listinfo/ltp =
<https://lists.linux.it/listinfo/ltp>
>=20
>=20
>=20
> --=20
> Regards,
> Li Wang


--Apple-Mail=_2C98D61A-CFF2-4CE9-88B6-E715469778F2
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html;
	charset=us-ascii

<html><head><meta http-equiv=3D"Content-Type" content=3D"text/html; =
charset=3Dus-ascii"></head><body style=3D"word-wrap: break-word; =
-webkit-nbsp-mode: space; line-break: after-white-space;" class=3D"">Hi =
Li Wang,<br class=3D""><div><br class=3D""><blockquote type=3D"cite" =
class=3D""><div class=3D"">On Mar 26, 2021, at 18:01, Li Wang &lt;<a =
href=3D"mailto:liwang@redhat.com" class=3D"">liwang@redhat.com</a>&gt; =
wrote:</div><br class=3D"Apple-interchange-newline"><div class=3D""><meta =
charset=3D"UTF-8" class=3D""><div dir=3D"ltr" style=3D"caret-color: =
rgb(0, 0, 0); font-family: Helvetica; font-size: 12px; font-style: =
normal; font-variant-caps: normal; font-weight: normal; letter-spacing: =
normal; text-align: start; text-indent: 0px; text-transform: none; =
white-space: normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none;" class=3D""><div dir=3D"ltr" class=3D""><div =
class=3D"gmail_default" style=3D"font-size: small;">Hi Fuli,</div><div =
class=3D"gmail_default" style=3D"font-size: small;"><br =
class=3D""></div></div><br class=3D""><div class=3D"gmail_quote"><div =
dir=3D"ltr" class=3D"gmail_attr">On Fri, Mar 26, 2021 at 2:20 AM QI Fuli =
&lt;<a href=3D"mailto:fukuri.sai@gmail.com" =
class=3D"">fukuri.sai@gmail.com</a>&gt; wrote:<br =
class=3D""></div><blockquote class=3D"gmail_quote" style=3D"margin: 0px =
0px 0px 0.8ex; border-left-width: 1px; border-left-style: solid; =
border-left-color: rgb(204, 204, 204); padding-left: 1ex;">From: QI Fuli =
&lt;<a href=3D"mailto:qi.fuli@fujitsu.com" target=3D"_blank" =
class=3D"">qi.fuli@fujitsu.com</a>&gt;<br class=3D""><br =
class=3D"">Convert syscalls/swapon/swapon0{1..3} to the new API<br =
class=3D""><br class=3D"">QI Fuli (4):<br class=3D"">&nbsp;<span =
class=3D"Apple-converted-space">&nbsp;</span>libs/libltpswap: Rename and =
Convert libs/libltpswapon to the new API<br class=3D""></blockquote><div =
class=3D""><br class=3D""></div><div class=3D""><div =
class=3D"gmail_default" style=3D"font-size: small;">I appreciate your =
help to convert the libltpswapon&nbsp;to the new API, but at</div><div =
class=3D"gmail_default" style=3D"font-size: small;">the first sight of =
your patchset, I was quite curious why not complete the</div><div =
class=3D"gmail_default" style=3D"font-size: small;">leftover two test =
swapoff/ to new then we can remove the old API totally.</div></div><div =
class=3D"gmail_default" style=3D"font-size: small;"><br =
class=3D""></div><div class=3D"gmail_default" style=3D"font-size: =
small;">So in other words, it probably makes people confusing that there =
exist&nbsp;</div><div class=3D"gmail_default" style=3D"font-size: =
small;">libltpswap/ and libltpswapon/ at the same time.&nbsp;</div><div =
class=3D"gmail_default" style=3D"font-size: small;"><br =
class=3D""></div><div class=3D"gmail_default" style=3D"font-size: =
small;">Could you help finish the rest work? =
:)</div></div></div></div></blockquote><div><br class=3D""></div>Thanks =
for your comments.</div><div><br class=3D""></div><div>Yes, I will make =
a patchset to convert the swapoff/ and to remove the =
libltpswapon/.</div><div><br =
class=3D""></div><div>Best,</div><div>QI</div><div><br =
class=3D""></div><div><blockquote type=3D"cite" class=3D""><div =
class=3D""><div dir=3D"ltr" style=3D"caret-color: rgb(0, 0, 0); =
font-family: Helvetica; font-size: 12px; font-style: normal; =
font-variant-caps: normal; font-weight: normal; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none;" class=3D""><div class=3D"gmail_quote"><div =
class=3D""><br class=3D""></div><div class=3D"">&nbsp;</div><blockquote =
class=3D"gmail_quote" style=3D"margin: 0px 0px 0px 0.8ex; =
border-left-width: 1px; border-left-style: solid; border-left-color: =
rgb(204, 204, 204); padding-left: 1ex;">&nbsp;<span =
class=3D"Apple-converted-space">&nbsp;</span>syscalls/swapon/swapon01: =
Convert swapon01 to the new API<br class=3D"">&nbsp;<span =
class=3D"Apple-converted-space">&nbsp;</span>syscalls/swapon/swapon02: =
Convert swapon02 to the new API<br class=3D"">&nbsp;<span =
class=3D"Apple-converted-space">&nbsp;</span>syscalls/swapon/swapon03: =
Convert swapon03 to the new API<br class=3D""><br =
class=3D"">&nbsp;include/libswap.h&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;|&nbsp; 24 =
+++<br class=3D"">&nbsp;libs/libltpswap/Makefile&nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; |&nbsp; 12 ++<br =
class=3D"">&nbsp;libs/libltpswap/libswap.c&nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;|&nbsp; 63 ++++++<br =
class=3D"">&nbsp;testcases/kernel/syscalls/swapon/Makefile&nbsp; =
&nbsp;|&nbsp; &nbsp;4 +-<br =
class=3D"">&nbsp;testcases/kernel/syscalls/swapon/swapon01.c |&nbsp; 83 =
++-----<br class=3D"">&nbsp;testcases/kernel/syscalls/swapon/swapon02.c =
| 145 +++++--------<br =
class=3D"">&nbsp;testcases/kernel/syscalls/swapon/swapon03.c | 227 =
++++++++------------<br class=3D"">&nbsp;7 files changed, 258 =
insertions(+), 300 deletions(-)<br class=3D"">&nbsp;create mode 100644 =
include/libswap.h<br class=3D"">&nbsp;create mode 100644 =
libs/libltpswap/Makefile<br class=3D"">&nbsp;create mode 100644 =
libs/libltpswap/libswap.c<br class=3D""><br class=3D"">--<br =
class=3D"">2.30.2<br class=3D""><br class=3D""><br class=3D"">--<span =
class=3D"Apple-converted-space">&nbsp;</span><br class=3D"">Mailing list =
info:<span class=3D"Apple-converted-space">&nbsp;</span><a =
href=3D"https://lists.linux.it/listinfo/ltp" rel=3D"noreferrer" =
target=3D"_blank" class=3D"">https://lists.linux.it/listinfo/ltp</a><br =
class=3D""><br class=3D""></blockquote></div><br clear=3D"all" =
class=3D""><div class=3D""><br class=3D""></div>--<span =
class=3D"Apple-converted-space">&nbsp;</span><br class=3D""><div =
dir=3D"ltr" class=3D"gmail_signature"><div dir=3D"ltr" class=3D""><div =
class=3D"">Regards,<br class=3D""></div><div class=3D"">Li =
Wang</div></div></div></div></div></blockquote></div><br =
class=3D""></body></html>=

--Apple-Mail=_2C98D61A-CFF2-4CE9-88B6-E715469778F2--

--===============1603875611==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============1603875611==--
