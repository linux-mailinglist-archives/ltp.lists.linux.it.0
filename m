Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D65B391258
	for <lists+linux-ltp@lfdr.de>; Wed, 26 May 2021 10:31:21 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 3350B3C2B62
	for <lists+linux-ltp@lfdr.de>; Wed, 26 May 2021 10:31:21 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 494813C2ADE
 for <ltp@lists.linux.it>; Wed, 26 May 2021 10:31:19 +0200 (CEST)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 9787A600E2E
 for <ltp@lists.linux.it>; Wed, 26 May 2021 10:31:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1622017877;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=1nR6eKaQ1w8Gyx8R3hDExRoma2bhfHtLVqT8PVa38CE=;
 b=b06QkEnB3jfqIDEuH6z8OPcxmFlJ/HgG3fc3GKYK2QhdXeo5oezrmyiuaI86UXUGs+iY/G
 TdriRraaQy59dTG5RneQwY3xEQ9A3Irscx7tWI5NFRNC52lLUv7HTMP5KfRzDO63Pym/KF
 qDrpt0ibtT5I1Qtfo/XiYOD+4huKO0I=
Received: from mail-yb1-f197.google.com (mail-yb1-f197.google.com
 [209.85.219.197]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-556-kfJVOyzDNwi293JuJ15Y5Q-1; Wed, 26 May 2021 04:31:12 -0400
X-MC-Unique: kfJVOyzDNwi293JuJ15Y5Q-1
Received: by mail-yb1-f197.google.com with SMTP id
 e198-20020a25e7cf0000b029052a1d34778fso801594ybh.13
 for <ltp@lists.linux.it>; Wed, 26 May 2021 01:31:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=1nR6eKaQ1w8Gyx8R3hDExRoma2bhfHtLVqT8PVa38CE=;
 b=spWRdKBkfhqBJYKS57mDfkvUr0u5/bzfybDs1b6EenwF6S9jrmoYPjvnbQPfV+mc3N
 zXOouuBuGszZRVFPTB9qrF+4i/30w4u95aAnKAFDjsKkmqF+T73qfDvc6I5guj4vBt92
 wTxB5BLc/xKJRY3hyCOqUVlRtpXSS/2CdSLnbeodywhbe47r1yXcCj37RYRGZA1BdJiF
 E82ViKVY+HWDJtwprj56piNixfOBKZpp1CaDgmRA396cGHie2a1PEgx+jrBnqmwupnFG
 PPgE5ETFBXb/7xMvaTnpuJxArrkN3ibOODBZuq6fBwh/KWSYKRSmG/wpxJNWK8ZhzB/R
 FMGA==
X-Gm-Message-State: AOAM5318F4JR5UaFme1yUbxsPSpMhzyBAThpBb6tIkEZtDSgVA4T9v3r
 fErp6AeVvNofPdJZapwLynI0hrmrOVxj+BHwTvPQYJ0YYZrvlo52eYo8PYt6q4xWQkMONURbM8C
 Cv40G07sl4aQa5K4LeCC3HhaEu/k=
X-Received: by 2002:a25:b44d:: with SMTP id c13mr46666172ybg.86.1622017872037; 
 Wed, 26 May 2021 01:31:12 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy3O7r5RFBeKlobksyBWpX7LxGCcbASMif4404YMKO5cpOHZ08BFAgVEM4OVzzd/KhHZflqsleoZnuogAmQGH4=
X-Received: by 2002:a25:b44d:: with SMTP id c13mr46666135ybg.86.1622017871707; 
 Wed, 26 May 2021 01:31:11 -0700 (PDT)
MIME-Version: 1.0
References: <20190911124714.GA21670@rei.lan>
 <1571975625-6322-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
 <CAEemH2dxhzBk+fbR8YnxAKqQSYhsb=HW2B2rov18yOjk9a+5Uw@mail.gmail.com>
 <YK0GqLg9AUrOxPdx@yuki> <60ADC7EC.5080706@fujitsu.com>
In-Reply-To: <60ADC7EC.5080706@fujitsu.com>
From: Li Wang <liwang@redhat.com>
Date: Wed, 26 May 2021 16:31:00 +0800
Message-ID: <CAEemH2eSmf+7kGcq3rZS4_RPZ7W58hSyLqdx=zrzJUsEMQf8og@mail.gmail.com>
To: "xuyang2018.jy@fujitsu.com" <xuyang2018.jy@fujitsu.com>,
 Cyril Hrubis <chrubis@suse.cz>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=liwan@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,HTML_MESSAGE,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] syscalls/statx04: use stx_attributes_mask before
 test
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
Content-Type: multipart/mixed; boundary="===============0635223833=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============0635223833==
Content-Type: multipart/alternative; boundary="00000000000010165205c33777c3"

--00000000000010165205c33777c3
Content-Type: text/plain; charset="UTF-8"

Hi all,

> >> This patch makes sense to me, I'm not sure if any blocker issue for
> >> holding the apply process. If _no_ I would help to merge it:).
> >
> > See:
> >
> > https://github.com/linux-test-project/ltp/issues/557
> >
> > Basically this change hides a kernel bug.
> I don't think it is a kernel bug and it is only an non-supported feature
> before linux 5.1 when not using ext4 driver for ext2.

Cyril hopes to have a reproducer to cover the bug [1] (though
you think it a non-support problem), but that is responsible
advice for FileSystem:).
Actually, the worth to say, there already a separate test
(xfstest/generic/424) for reproducing this problem[2].
See: https://github.com/kdave/xfstests/blob/master/tests/generic/424
I believe FS QE/Dev will run it for all filesystems regularly.

So maybe we can safely apply this patch in LTP without
adding a duplicated test?

[1] https://bugs.linaro.org/show_bug.cgi?id=4012
[2]
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=93bc420ed41df63

-- 
Regards,
Li Wang

--00000000000010165205c33777c3
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_default" style=3D"font-size:small">Hi =
all,</div><br>&gt; &gt;&gt; This patch makes sense to me, I&#39;m not sure =
if any blocker issue for<br>&gt; &gt;&gt; holding the apply process. If _no=
_ I would help to merge it:).<br>&gt; &gt;<br>&gt; &gt; See:<br>&gt; &gt;<b=
r>&gt; &gt; <a href=3D"https://github.com/linux-test-project/ltp/issues/557=
" target=3D"_blank">https://github.com/linux-test-project/ltp/issues/557</a=
><br>&gt; &gt;<br>&gt; &gt; Basically this change hides a kernel bug.<br>&g=
t; I don&#39;t think it is a kernel bug and it is only an non-supported fea=
ture<br>&gt; before linux 5.1 when not using ext4 driver for ext2.<br><div =
class=3D"gmail_default" style=3D"font-size:small"><br></div>Cyril hopes to =
have a reproducer to cover the bug [1]<span class=3D"gmail_default" style=
=3D"font-size:small"> </span>(<span class=3D"gmail_default" style=3D"font-s=
ize:small">though</span>=C2=A0<div><span class=3D"gmail_default" style=3D"f=
ont-size:small">you</span>=C2=A0<span class=3D"gmail_default" style=3D"font=
-size:small">think=C2=A0</span>it a non-support problem),=C2=A0<span class=
=3D"gmail_default">but that is</span>=C2=A0<span class=3D"gmail_default">re=
sponsible</span></div><div><span class=3D"gmail_default">advice</span><span=
 class=3D"gmail_default"> for FileSystem:)</span>.<div><span class=3D"gmail=
_default" style=3D"font-size:small"></span><div><div class=3D"gmail_default=
" style=3D"font-size:small"></div><div class=3D"gmail_default" style=3D"fon=
t-size:small">Actually, the worth to say, there already=C2=A0a separate tes=
t</div><div class=3D"gmail_default" style=3D"font-size:small">(xfstest/gene=
ric/424) for reproducing this problem[2].</div><div class=3D"gmail_default"=
 style=3D"font-size:small">See:=C2=A0<a href=3D"https://github.com/kdave/xf=
stests/blob/master/tests/generic/424" target=3D"_blank">https://github.com/=
kdave/xfstests/blob/master/tests/generic/424</a></div><div class=3D"gmail_d=
efault" style=3D"font-size:small">I believe FS QE/Dev will run it for all f=
ilesystems regularly.<br></div><div class=3D"gmail_default" style=3D"font-s=
ize:small"><br></div><div class=3D"gmail_default" style=3D"font-size:small"=
>So maybe we can safely apply this patch in LTP without</div><div class=3D"=
gmail_default" style=3D"font-size:small">adding a duplicated test?</div><di=
v class=3D"gmail_default" style=3D"font-size:small"><br></div><div class=3D=
"gmail_default" style=3D"font-size:small"><span class=3D"gmail_default"></s=
pan>[1] <a href=3D"https://bugs.linaro.org/show_bug.cgi?id=3D4012" target=
=3D"_blank">https://bugs.linaro.org/show_bug.cgi?id=3D4012</a><br></div><di=
v class=3D"gmail_default" style=3D"">[2] <a href=3D"https://git.kernel.org/=
pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=3D93bc420ed41df63">h=
ttps://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?i=
d=3D93bc420ed41df63</a></div><br>-- <br>Regards,<br>Li Wang<br></div></div>=
</div></div>

--00000000000010165205c33777c3--


--===============0635223833==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============0635223833==--

