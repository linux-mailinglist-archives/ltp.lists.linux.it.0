Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B1E110D193
	for <lists+linux-ltp@lfdr.de>; Fri, 29 Nov 2019 07:50:05 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id C23F03C22B6
	for <lists+linux-ltp@lfdr.de>; Fri, 29 Nov 2019 07:50:04 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 by picard.linux.it (Postfix) with ESMTP id 598FF3C0EAF
 for <ltp@lists.linux.it>; Fri, 29 Nov 2019 07:49:59 +0100 (CET)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
 by in-5.smtp.seeweb.it (Postfix) with ESMTP id 4D348616E13
 for <ltp@lists.linux.it>; Fri, 29 Nov 2019 07:49:57 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1575010196;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=wI98LFLosQxsDkr4aVE+iv7UXWic3lh7dFluIzmhGgw=;
 b=gzmzacM5BHJGAa1TvCgtAspszqAR6+tq9gfPIBOBBuf6t1kdwSwEavCicnRgKIeELjSwjQ
 QhtAVarHgQVwRtHzs5b5xGKtO3hz9TABkXTGC0L2boiMXXn82o4rCHgWERiMhN9qVGAdIm
 3bt2YZRZLjuyWBfjpv3aDleMvRPSVVQ=
Received: from mail-oi1-f199.google.com (mail-oi1-f199.google.com
 [209.85.167.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-421-79HFlFUAMP2VPEmXdqh5QQ-1; Fri, 29 Nov 2019 01:49:54 -0500
Received: by mail-oi1-f199.google.com with SMTP id 25so9467741oij.19
 for <ltp@lists.linux.it>; Thu, 28 Nov 2019 22:49:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=cNZURBwyRIEpFphodwFffFs10a0pO06KruZTJkfwobo=;
 b=P1v290P3qq1BiaoPw0LfSHmszeW/G6JJVRUS2DWHIIvvi9bLDnqY/k9TXyG/9xuQLQ
 5Bn0g9MftQARDjn9BBxeCnTKD4YrQDSnKjoShhH3BUy2MuqKVzE335DVp5txceoXPvM5
 22+wCiHcIgOB1bQUeZM0fRxayG9aM6Rjjujpi4AN9wS0q3fW7KFMvyjwv45CaQJznaiE
 65dVAmLFmGrDPbUVBW/5rb1PozNMxQl0mCAh2Sjft1yASwoitNO79ZKOVthQFEaOUPES
 D1iSdAVYITq0CST4BgKNi1eNO9J9jDXxsl9Kz26rf+p80qErCRnYzebSjzvc+Y2AR6fs
 gXoA==
X-Gm-Message-State: APjAAAUGnlhli66/zJ4EYnlcBJ17x6AyW2hRcKHcrEdBywBw3d4VWT10
 b6VHVpkiv3r3L5HpREd1OH8u2Npmg0BfWT2Ylqt1LpFiRVNGywrsTiN250nIYD+Ds3kxfdNF+8M
 maqXqBZrCAXO0S+bzOdxSkhW99GQ=
X-Received: by 2002:a9d:a2f:: with SMTP id 44mr3278379otg.264.1575010193801;
 Thu, 28 Nov 2019 22:49:53 -0800 (PST)
X-Google-Smtp-Source: APXvYqyFco9D95H8vDX5fhUBCX/S91532ShVwTKa95CQYoW/7EcprhimR+4xgJh8kfSeGW8y+LXlkZhZtc0Q1vzXbV0=
X-Received: by 2002:a9d:a2f:: with SMTP id 44mr3278360otg.264.1575010193220;
 Thu, 28 Nov 2019 22:49:53 -0800 (PST)
MIME-Version: 1.0
References: <20191128163147.4377-1-mdoucha@suse.cz>
In-Reply-To: <20191128163147.4377-1-mdoucha@suse.cz>
From: Li Wang <liwang@redhat.com>
Date: Fri, 29 Nov 2019 14:49:42 +0800
Message-ID: <CAEemH2ecHFwkTi3eFsc=McU0xJmDA5D9bn2ntuKzbqLTtLz7rA@mail.gmail.com>
To: Martin Doucha <mdoucha@suse.cz>
X-MC-Unique: 79HFlFUAMP2VPEmXdqh5QQ-1
X-Mimecast-Spam-Score: 0
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,HTML_MESSAGE,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] Unshare KSM pages before setting max_page_sharing
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
Content-Type: multipart/mixed; boundary="===============0641760790=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============0641760790==
Content-Type: multipart/alternative; boundary="00000000000015c348059876a3c2"

--00000000000015c348059876a3c2
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 29, 2019 at 12:32 AM Martin Doucha <mdoucha@suse.cz> wrote:

> Setting max_page_sharing is possible only when there are no KSM shared
> pages
> in the system. Otherwise writing to max_page_sharing SysFS file will fail
> with EBUSY.
>
> Signed-off-by: Martin Doucha <mdoucha@suse.cz>

Acked-by: Li Wang <liwang@redhat.com>

--=20
Regards,
Li Wang

--00000000000015c348059876a3c2
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote"><div dir=3D"lt=
r" class=3D"gmail_attr">On Fri, Nov 29, 2019 at 12:32 AM Martin Doucha &lt;=
<a href=3D"mailto:mdoucha@suse.cz">mdoucha@suse.cz</a>&gt; wrote:<br></div>=
<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-=
left:1px solid rgb(204,204,204);padding-left:1ex">Setting max_page_sharing =
is possible only when there are no KSM shared pages<br>
in the system. Otherwise writing to max_page_sharing SysFS file will fail<b=
r>
with EBUSY.<br>
<br>
Signed-off-by: Martin Doucha &lt;<a href=3D"mailto:mdoucha@suse.cz" target=
=3D"_blank">mdoucha@suse.cz</a>&gt;=C2=A0</blockquote><div><span class=3D"g=
mail_default" style=3D"font-size:small">Acked-by: Li Wang &lt;<a href=3D"ma=
ilto:liwang@redhat.com">liwang@redhat.com</a>&gt;</span></div><div><span cl=
ass=3D"gmail_default" style=3D"font-size:small"></span>=C2=A0</div></div>--=
 <br><div dir=3D"ltr" class=3D"gmail_signature"><div dir=3D"ltr"><div>Regar=
ds,<br></div><div>Li Wang<br></div></div></div></div>

--00000000000015c348059876a3c2--


--===============0641760790==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============0641760790==--

