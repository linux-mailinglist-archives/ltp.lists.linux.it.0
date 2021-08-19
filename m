Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id D50D43F1229
	for <lists+linux-ltp@lfdr.de>; Thu, 19 Aug 2021 05:59:43 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id A5EAA3C67FC
	for <lists+linux-ltp@lfdr.de>; Thu, 19 Aug 2021 05:59:43 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id AB9513C248D
 for <ltp@lists.linux.it>; Thu, 19 Aug 2021 05:59:41 +0200 (CEST)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 7143B1000EC4
 for <ltp@lists.linux.it>; Thu, 19 Aug 2021 05:59:40 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1629345578;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=gflYZd+S6u/xEIBz4StkHdrmF9ntjjti5ZCCq46lt3Q=;
 b=Fo+TdJLQYQc7vAyGGeizJ4jd1rNHE3RRkJ9rlp2H2ecTT4fnc9Cg8wTqWYEhCnSBuBZL7W
 TjpvDFyzHAXOWlmr+FK2LnjVZe3nZLKwZoKzosrJKN+WJ7FP8yuQF3Pzbpm5WtirHTH2xm
 mBuRGKI7iTssdHurQVfgQd4GWXKU8ts=
Received: from mail-yb1-f199.google.com (mail-yb1-f199.google.com
 [209.85.219.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-309-i9-3KdI8OfuF2lIuL3KtrA-1; Wed, 18 Aug 2021 23:59:34 -0400
X-MC-Unique: i9-3KdI8OfuF2lIuL3KtrA-1
Received: by mail-yb1-f199.google.com with SMTP id
 j21-20020a25d2150000b029057ac4b4e78fso5241244ybg.4
 for <ltp@lists.linux.it>; Wed, 18 Aug 2021 20:59:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=gflYZd+S6u/xEIBz4StkHdrmF9ntjjti5ZCCq46lt3Q=;
 b=uRux9YTyDz6/nL0VSMmzuyDRHvNFh3ciY7/Kc7ax4JvPkbCcLivoopiSOaYn8jTCjh
 CWjFoh/+ZNAbjY2L+7aMDipm4vIynX6oFg+bR+1QJgg/+c66wDV+Vw0tBDG2cL9uKeju
 Jejl33ZYsIUML3i/yCNkOwt/M+49svC8qffEBXXSyvw2gSMaCo78vqAOGdAbPzvPiMHE
 lMw2z8+oZb5WRALke5ImXe+0k0JGvhaXf007LaCWewfhbHzNZpQ3go1OeRza2MaEWoct
 DxFXSp9m9Ugx0vdSS9ctlyXPzrv2qiEjKRHzN2apoOl0rM40xqRmHJyuoQgdRAoPYLax
 9gtg==
X-Gm-Message-State: AOAM532vN3bATEXS2tTP0luHHuKJZtCCyaopJCd8jH5vk+CpgFqJXPpA
 trj4GQ8If9MtEzqW+VNl9joWuUJecEXNxYGOdh6GvhNMuiKvSuoxOXC4PgXYoU5MXpFBovpwzlx
 zecLxhcIXlYxiW5ngDUJk1dm2LyE=
X-Received: by 2002:a25:9bc5:: with SMTP id w5mr15365737ybo.110.1629345574210; 
 Wed, 18 Aug 2021 20:59:34 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxhrvh0iC2vyJ49cN8uNW/omBQwgoRrgl144bgV6UOwhBsCxjqgiZ0xzAEQJ4Tmx0Mwu/SC4qXvWNEkoOq8e+A=
X-Received: by 2002:a25:9bc5:: with SMTP id w5mr15365723ybo.110.1629345574063; 
 Wed, 18 Aug 2021 20:59:34 -0700 (PDT)
MIME-Version: 1.0
References: <20210818091224.27578-1-pvorel@suse.cz>
 <20210818091224.27578-2-pvorel@suse.cz>
 <7ac7a1d6-2d97-f8f5-8d60-040eb0753681@jv-coder.de> <YRzVpQT1zYOvxlWe@pevik>
In-Reply-To: <YRzVpQT1zYOvxlWe@pevik>
From: Li Wang <liwang@redhat.com>
Date: Thu, 19 Aug 2021 11:59:22 +0800
Message-ID: <CAEemH2es_CzWugkyOworVLFe+ZbtFxpYXK5HjdE_g_w4wHvzVQ@mail.gmail.com>
To: Petr Vorel <pvorel@suse.cz>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=liwan@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,HTML_MESSAGE,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 1/3] tst_test.sh: Simplify tst_cmd_available()
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
Cc: Elliott Hughes <enh@google.com>, LTP List <ltp@lists.linux.it>,
 Joerg Vehlow <joerg.vehlow@aox-tech.de>
Content-Type: multipart/mixed; boundary="===============0740756871=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============0740756871==
Content-Type: multipart/alternative; boundary="00000000000028a79b05c9e1946d"

--00000000000028a79b05c9e1946d
Content-Type: text/plain; charset="UTF-8"

On Wed, Aug 18, 2021 at 5:41 PM Petr Vorel <pvorel@suse.cz> wrote:

> Hi Joerg,
>
> ...
> > > +   type $1 >/dev/null 2>&1
> > I guess there was a reason, why command was used here in the first place.
> > Iirc type is often a shell builtin, that can have different behavior,
> while
> > command -v is posix and should be extremely portable.
> > So maybe it is better to use "command -v" instead of type here. I hope
> most
> > distributions have a command-command...
> Well, I wrote that code, in dba1d50cb :). IMHO both are POSIX and both are
> shell
> builtin.
>

Another reason, I guess, is `command -v ` looks to match the function name
more:).
But it depends on you, I'm OK with any of them.

Reviewed-by: Li Wang <liwang@redhat.com>



>
> I tested it on all implementations and the only difference is that both
> "type"
> and "command -v" on dash and busybox sh returns 127 on missing command,
> the rest
> return 1.
>

Sounds great!

-- 
Regards,
Li Wang

--00000000000028a79b05c9e1946d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote"><div dir=3D"lt=
r" class=3D"gmail_attr">On Wed, Aug 18, 2021 at 5:41 PM Petr Vorel &lt;<a h=
ref=3D"mailto:pvorel@suse.cz">pvorel@suse.cz</a>&gt; wrote:<br></div><block=
quote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1=
px solid rgb(204,204,204);padding-left:1ex">Hi Joerg,<br>
<br>
...<br>
&gt; &gt; +=C2=A0 =C2=A0type $1 &gt;/dev/null 2&gt;&amp;1<br>
&gt; I guess there was a reason, why command was used here in the first pla=
ce.<br>
&gt; Iirc type is often a shell builtin, that can have different behavior, =
while<br>
&gt; command -v is posix and should be extremely portable.<br>
&gt; So maybe it is better to use &quot;command -v&quot; instead of type he=
re. I hope most<br>
&gt; distributions have a command-command...<br>
Well, I wrote that code, in dba1d50cb :). IMHO both are POSIX and both are =
shell<br>
builtin.<br></blockquote><div><br></div><div><div class=3D"gmail_default" s=
tyle=3D"font-size:small">Another reason, I guess, is `command -v ` looks to=
 match the function name more:).</div><div class=3D"gmail_default" style=3D=
"font-size:small">But it depends on you, I&#39;m OK with=C2=A0any of them.<=
/div><div class=3D"gmail_default" style=3D"font-size:small"><br></div><div =
class=3D"gmail_default" style=3D"font-size:small">Reviewed-by: Li Wang &lt;=
<a href=3D"mailto:liwang@redhat.com">liwang@redhat.com</a>&gt;=C2=A0</div><=
br></div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin=
:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"=
>
<br>
I tested it on all implementations and the only difference is that both &qu=
ot;type&quot;<br>
and &quot;command -v&quot; on dash and busybox sh returns 127 on missing co=
mmand, the rest<br>
return 1.<br></blockquote><div><br></div><div><div class=3D"gmail_default" =
style=3D"font-size:small">Sounds great!</div></div><div><br></div></div>-- =
<br><div dir=3D"ltr" class=3D"gmail_signature"><div dir=3D"ltr"><div>Regard=
s,<br></div><div>Li Wang<br></div></div></div></div>

--00000000000028a79b05c9e1946d--


--===============0740756871==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============0740756871==--

