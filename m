Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 17C0F34146B
	for <lists+linux-ltp@lfdr.de>; Fri, 19 Mar 2021 05:57:24 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 475103C90B8
	for <lists+linux-ltp@lfdr.de>; Fri, 19 Mar 2021 05:57:23 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 by picard.linux.it (Postfix) with ESMTP id CA53F3C608D
 for <ltp@lists.linux.it>; Fri, 19 Mar 2021 05:57:19 +0100 (CET)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by in-3.smtp.seeweb.it (Postfix) with ESMTP id BE2B21A0091B
 for <ltp@lists.linux.it>; Fri, 19 Mar 2021 05:57:17 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616129836;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=RJSKj77JLRrNQ2vkRRkNY3dm1CEjwJdFI7599BUUzmQ=;
 b=X1METcyGuF76l5CtnvB3bY5oEfmYXnCI5mN2a1eBipF+mxSI8qRRQICDgmXsUcnI2M6p+P
 iZ/wI7nPzi9VqjfFZ2nqxHomVGEG0K/KY1DATS1JCY7qte2YQdF3dEY0u6C3cqi10KvihP
 FJ6iPrCmSOlaprD0FVigl75g8Er+3Ps=
Received: from mail-yb1-f200.google.com (mail-yb1-f200.google.com
 [209.85.219.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-495-anVdjl1HP_O9WWAqbTcRKQ-1; Fri, 19 Mar 2021 00:57:11 -0400
X-MC-Unique: anVdjl1HP_O9WWAqbTcRKQ-1
Received: by mail-yb1-f200.google.com with SMTP id 131so51425800ybp.16
 for <ltp@lists.linux.it>; Thu, 18 Mar 2021 21:57:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=RJSKj77JLRrNQ2vkRRkNY3dm1CEjwJdFI7599BUUzmQ=;
 b=JMISdGlq69QRlpSMLLDj+9gGCmq72edm+s2zM/JuL02n94xXwlZG7QdnfYlE/zcNby
 7Rl4AJs4eVaVyD+xWnLph+4pbNUXFWnsnE+FLnG11lvP1qoaOO5M7R4fT85VcIsokLuz
 Ag0OP3x8HrFWR1gqI2XH6dXJ+SYL89lQAmNoPeN4W/qzWUzWjG0BT2q6pab6Xg5IT74/
 t3OnE95JHenRDttESOygVa0Phd3ct0jFtX4JJs2zNLrj2MnrXfOtHI92rdLTAvPNvXCO
 0CJJckHDlldAInkqcfb64U7mRdE+M7jMxy09RlNPgPMcM5M5ybhHa2URsy72Srb5ylHB
 A2/A==
X-Gm-Message-State: AOAM533HFJ3G9DC7zX4Z52sgBqkPdlgWUjdniG+hKHjmoVJ9I4his35O
 Ukyc55C77VTJwgrrlrWXFiDJAFQVoyd4Q6SWnkoFqhvH9qzRn0JRHiX1K9tjXP4/XeVZ8JIIaYX
 jRZrF3ojE2TJrun5SihuhRuyx/Ao=
X-Received: by 2002:a25:e7d7:: with SMTP id e206mr4003205ybh.110.1616129831331; 
 Thu, 18 Mar 2021 21:57:11 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxTjxdtDwzHVtehCpXQfJINpL6jGxrgcVRmvNnAWEEsyxf7vEr/p3ZRkX7f+8wkYBhtzXe1scmJjFrY7Ett14c=
X-Received: by 2002:a25:e7d7:: with SMTP id e206mr4003190ybh.110.1616129831175; 
 Thu, 18 Mar 2021 21:57:11 -0700 (PDT)
MIME-Version: 1.0
References: <20210318181641.2062-1-pvorel@suse.cz>
 <20210318181641.2062-3-pvorel@suse.cz>
 <CAEemH2fUGFY6YH=m4SfGpJ_nbYWJmUK1_-mLK8n74zM_WNFLng@mail.gmail.com>
In-Reply-To: <CAEemH2fUGFY6YH=m4SfGpJ_nbYWJmUK1_-mLK8n74zM_WNFLng@mail.gmail.com>
From: Li Wang <liwang@redhat.com>
Date: Fri, 19 Mar 2021 12:56:59 +0800
Message-ID: <CAEemH2dRU-3Q-qjE+t_O6Zh8MKDg4C+1vPAnUR+Js9_fHvFykA@mail.gmail.com>
To: Petr Vorel <pvorel@suse.cz>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=liwan@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,HTML_MESSAGE,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2 2/2] doc: Add Maintainer Patch Review Checklist
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
Cc: Yang Xu <xuyang2018.jy@cn.fujitsu.com>, LTP List <ltp@lists.linux.it>
Content-Type: multipart/mixed; boundary="===============0912547791=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============0912547791==
Content-Type: multipart/alternative; boundary="0000000000007f96cf05bddc8c14"

--0000000000007f96cf05bddc8c14
Content-Type: text/plain; charset="UTF-8"

Li Wang <liwang@redhat.com> wrote:


> +Commit messages should have
>> +
>> +* Author's `Signed-off-by` tag
>> +* Committer's `Reviewed-by` or `Signed-off-by` tag
>>
>
> Or adding `Acked-by:` also acceptable?
>
> I'm not sure what's the difference between Acked-by and Reviewed-by,
> but personally feel the Acked-by has more confidence in the reviewing.
>
> In my mind,
>
> `Acked-by` means:
> code review OK, compiled OK, executed OK, has confidence it OK for all
> arches
>
> `Reviewed-by` means:
> code review OK, compiled and executed OK just locally or optional, still room
> for improvement/discussion
>

Plz ignore my rough understanding, I find a precise description at kernel
process/submitting-patches.rst.

https://github.com/torvalds/linux/blob/master/Documentation/process/submitting-patches.rst#when-to-use-acked-by-cc-and-co-developed-by

-- 
Regards,
Li Wang

--0000000000007f96cf05bddc8c14
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small">Li Wang &lt;<a href=3D"mailto:liwang@redhat.com">liwang@redha=
t.com</a>&gt; wrote:<br></div></div><div class=3D"gmail_quote"><div>=C2=A0<=
/div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bo=
rder-left:1px solid rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr"><di=
v class=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"margin:0=
px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
+Commit messages should have<br>
+<br>
+* Author&#39;s `Signed-off-by` tag<br>
+* Committer&#39;s `Reviewed-by` or `Signed-off-by` tag<br></blockquote><di=
v><br></div><div><div style=3D"font-size:small">Or adding `Acked-by:` also =
acceptable?</div><div style=3D"font-size:small"><br></div><div style=3D"fon=
t-size:small">I&#39;m not sure what&#39;s the difference between Acked-by a=
nd Reviewed-by,</div><div style=3D"font-size:small">but personally feel the=
 Acked-by has more confidence in the reviewing.</div><div style=3D"font-siz=
e:small"><br></div><div style=3D"font-size:small">In my mind,</div><div sty=
le=3D"font-size:small"><br></div><div style=3D"font-size:small">`Acked-by` =
means:</div><div style=3D"font-size:small">code review OK, compiled OK, exe=
cuted=C2=A0OK, has confidence it OK for all arches</div><div style=3D"font-=
size:small"><br></div><div style=3D"font-size:small">`Reviewed-by` means:</=
div><div style=3D"font-size:small">code review OK, compiled and executed OK=
 just locally or optional, still<span style=3D"color:rgb(51,51,51);font-siz=
e:14px">=C2=A0room for improvement/discussion</span></div></div></div></div=
></blockquote><div><br></div><div class=3D"gmail_default" style=3D"font-siz=
e:small">Plz ignore my rough understanding, I find a precise description at=
 kernel process/submitting-patches.rst.</div><div class=3D"gmail_quote"><br=
></div><div class=3D"gmail_default" style=3D"font-size:small"><a href=3D"ht=
tps://github.com/torvalds/linux/blob/master/Documentation/process/submittin=
g-patches.rst#when-to-use-acked-by-cc-and-co-developed-by" target=3D"_blank=
">https://github.com/torvalds/linux/blob/master/Documentation/process/submi=
tting-patches.rst#when-to-use-acked-by-cc-and-co-developed-by</a></div></di=
v><div><br></div>-- <br><div dir=3D"ltr" class=3D"gmail_signature"><div dir=
=3D"ltr"><div>Regards,<br></div><div>Li Wang<br></div></div></div></div>

--0000000000007f96cf05bddc8c14--


--===============0912547791==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============0912547791==--

