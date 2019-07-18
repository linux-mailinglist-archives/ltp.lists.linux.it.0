Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id BF1F86C8EE
	for <lists+linux-ltp@lfdr.de>; Thu, 18 Jul 2019 07:56:49 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 48C813C1D15
	for <lists+linux-ltp@lfdr.de>; Thu, 18 Jul 2019 07:56:49 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 by picard.linux.it (Postfix) with ESMTP id 275493C0358
 for <ltp@lists.linux.it>; Thu, 18 Jul 2019 07:56:45 +0200 (CEST)
Received: from mail-vs1-f54.google.com (mail-vs1-f54.google.com
 [209.85.217.54])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id C63AE1A01149
 for <ltp@lists.linux.it>; Thu, 18 Jul 2019 07:56:44 +0200 (CEST)
Received: by mail-vs1-f54.google.com with SMTP id a186so16659553vsd.7
 for <ltp@lists.linux.it>; Wed, 17 Jul 2019 22:56:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=HmIwexzvBjJqcBvOMWZbVLeYSE0MqFlDLZLlEgEZBfM=;
 b=DzuIsnpulHIUohVoC5GiiMmjYS1R04Pp5tQ23YtagxVwCLC9OYRbRIUZ3UCZD5dIHG
 UWGvgywtQ1GadBepuPWRrGibVdAI9Mg9WkXoaKvNvaA4TnJ2U3ul/MTLnAMbU3oq8FPt
 SXDA66KvTCWOKtaHgqCyJ3dIt0kQ4c7rY0mTIuCIpUkO+3WTm/FpgBuaxhMwvEo+avo8
 bEZhp9H/RfhJmbQJP+zamFN7QuhFpWAiGTpzuF6+LI1htAhngNTWannGJS+1KQss6+/n
 BjJX5Tz2d1xrhEKpewgfhf4pIVwgyIOCN6BvryhyjZ9+xZJHXTdjOMO5Prc0AYY7507c
 XJVA==
X-Gm-Message-State: APjAAAVIZSuPt1+O90ykafldcav7KCfH8SHZyvrzHhUsDkYgjosK22OD
 sgZITATK+whv7klLbZzZ74KHjkxpkVyWBHoNiJUWwg==
X-Google-Smtp-Source: APXvYqz0a/p2U9j4Uu/m/wpLwczx9OigJBnxoayM17iW22YQwpAa5iboLh/ucUKn7atZM+iqCXMYgs3/w0nr2FFOci8=
X-Received: by 2002:a67:e24e:: with SMTP id w14mr9209071vse.124.1563429403608; 
 Wed, 17 Jul 2019 22:56:43 -0700 (PDT)
MIME-Version: 1.0
References: <20190712134328.20528-1-pvorel@suse.cz>
In-Reply-To: <20190712134328.20528-1-pvorel@suse.cz>
From: Li Wang <liwang@redhat.com>
Date: Thu, 18 Jul 2019 13:56:32 +0800
Message-ID: <CAEemH2cdOO1XxmMUm+2VqaExGAPJbxSep4JXHjSZzT48_49Q-A@mail.gmail.com>
To: Petr Vorel <pvorel@suse.cz>
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=HTML_MESSAGE,SPF_HELO_NONE,
 SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] tst_test.sh: Use $LTP_TIMEOUT_MUL also in
 TST_RETRY_FN_EXP_BACKOFF()
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
Content-Type: multipart/mixed; boundary="===============1050860555=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============1050860555==
Content-Type: multipart/alternative; boundary="0000000000003be444058dee465a"

--0000000000003be444058dee465a
Content-Type: text/plain; charset="UTF-8"

Hi Petr,

If timeout occurred in the exp backoff macro, we could pass a bit more time
to it and use prototype directly.

    e.g.   TST_RETRY_FN_EXP_BACKOFF "$1" "$2" "more_time"

And yes, we actually can't guarantee a proper time value for all kinds of
platforms. So I agree on involve $LTP_TIMEOUT_MUL to exp backoff macro.

Btw, shouldn't we also apply this change to the C prototype too?
On Fri, Jul 12, 2019 at 9:43 PM Petr Vorel <pvorel@suse.cz> wrote:

> ...

-                       tst_brk TBROK "\"$tst_fun\" timed out"
> +                       tst_brk TBROK "\"$tst_fun\" timed out! If you are
> running on slow machine, try exporting LTP_TIMEOUT_MUL"
>

"..., try exporting LTP_TIMEOUT_MUL > 1" ?

-- 
Regards,
Li Wang

--0000000000003be444058dee465a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small">Hi=C2=A0Petr,</div><div class=3D"gmail_default" style=3D"font=
-size:small"><br></div></div><div class=3D"gmail_default" style=3D"font-siz=
e:small">If timeout occurred in the exp backoff macro, we could pass a bit =
more time to it and use prototype directly.</div><div class=3D"gmail_defaul=
t" style=3D"font-size:small"><br></div><div class=3D"gmail_default" style=
=3D"font-size:small">=C2=A0 =C2=A0 e.g.=C2=A0 =C2=A0TST_RETRY_FN_EXP_BACKOF=
F &quot;$1&quot; &quot;$2&quot; &quot;more_time&quot;=C2=A0<br></div><div c=
lass=3D"gmail_default" style=3D"font-size:small"><br></div><div class=3D"gm=
ail_default" style=3D"font-size:small">And yes, we actually can&#39;t guara=
ntee a proper time value for all kinds of platforms. So I agree on involve =
$LTP_TIMEOUT_MUL to exp backoff macro.=C2=A0</div><div class=3D"gmail_defau=
lt" style=3D"font-size:small"><br></div><div class=3D"gmail_default" style=
=3D"font-size:small">Btw, shouldn&#39;t we also apply this change to the C =
prototype=C2=A0too?</div><div class=3D"gmail_default" style=3D"font-size:sm=
all"></div><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr"=
>On Fri, Jul 12, 2019 at 9:43 PM Petr Vorel &lt;<a href=3D"mailto:pvorel@su=
se.cz" target=3D"_blank">pvorel@suse.cz</a>&gt; wrote:<br></div><blockquote=
 class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px so=
lid rgb(204,204,204);padding-left:1ex"><span class=3D"gmail_default" style=
=3D"font-size:small">...</span></blockquote><blockquote class=3D"gmail_quot=
e" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204)=
;padding-left:1ex">
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0tst_brk TBROK &quot;\&quot;$tst_fun\&quot; timed out&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0tst_brk TBROK &quot;\&quot;$tst_fun\&quot; timed out! If you are =
running on slow machine, try exporting LTP_TIMEOUT_MUL&quot;<br></blockquot=
e><div><br></div><div><div class=3D"gmail_default" style=3D"font-size:small=
">&quot;..., try exporting LTP_TIMEOUT_MUL &gt; 1&quot; ?</div></div><div><=
br></div></div>-- <br><div dir=3D"ltr" class=3D"m_-303637551760993246gmail_=
signature"><div dir=3D"ltr"><div>Regards,<br></div><div>Li Wang<br></div></=
div></div></div>

--0000000000003be444058dee465a--

--===============1050860555==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============1050860555==--
