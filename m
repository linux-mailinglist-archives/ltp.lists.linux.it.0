Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id DCA243E1616
	for <lists+linux-ltp@lfdr.de>; Thu,  5 Aug 2021 15:53:37 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id AD62D3C7DBB
	for <lists+linux-ltp@lfdr.de>; Thu,  5 Aug 2021 15:53:37 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 2CD453C5A63
 for <ltp@lists.linux.it>; Thu,  5 Aug 2021 15:53:36 +0200 (CEST)
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 5B737100113B
 for <ltp@lists.linux.it>; Thu,  5 Aug 2021 15:53:35 +0200 (CEST)
Received: by mail-wr1-x429.google.com with SMTP id h14so6646909wrx.10
 for <ltp@lists.linux.it>; Thu, 05 Aug 2021 06:53:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=uVE6Np5NL8VRw2eqQP5X3xgbd/7YwtvnvznJ7Wl+xd8=;
 b=cv+Jrhcsi3jC0vFajZrBT2eXoMs7CrsmNOUoOhsTu6mYJ/0GIA7jzhX+s+uLA8LgIy
 a3hncJuZ1x8qNFKc0YVxaXgtLh+TsX2MMSkuFARV03/VCh6L8Tipo8ROO1D2O1Hx7PSK
 KxMlS87JIUd48EpSPuBmfk/er/OCUupXVeUoD8Na+0r+Zc1c0HZPuZhZWfuti4NUdHm4
 FjDnG6vhNLg33zZpL1zsa7mQY3q1qYLWB0M92HpSRzjag09untlYA9FRWIt9O2CAN+Mx
 6X7gy/aWwcV/BzrII0aqFSYKtbaDg6uloGi2TVTIQW/FDthWm/RGw0zMnaY2A6+rakKh
 xwPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=uVE6Np5NL8VRw2eqQP5X3xgbd/7YwtvnvznJ7Wl+xd8=;
 b=Ls/w3v/QriH45hgysCBXOqmduOFvbDZ8WD84k2v+y0RjF1el4aEXbXYY0s23auFY8d
 Pp3MjMQrffmobuDKU/UOYBNN85m7FCs8dJyzI2tcs4Np8qSsiV24xT46OMwUN2T09lCH
 zTS27y76U8AkUgYae0orW5Lg4JZ+wl/FI/27TEBvJ6XEoB5Lxz+qe1biyDHzz3ADna2y
 yOzHN6GdXgSTybY+luPpVeqJ4V7PXLkufsyR6vhevntv8hayLyHuWW2SiDvAoiBAhnNb
 wDA53aZOXWKnRUodFoMWfsSf42eeMdM7KRQijDJOIjOTEbD6rZrAB3+6OQUJpX2Z3stz
 0sPw==
X-Gm-Message-State: AOAM532l0kaGkScw2Goqm9JckwLdfitNENhRtdgtKJI71KjyhZgj4neL
 yJqkt6iCUCn3frfLhrndFd71LfGyKgvN5McjR8k=
X-Google-Smtp-Source: ABdhPJxb+cp9RVLbJ/QeO+k3fe7aNSlzhwBNOFEec+C91p7fHxzgvnhPGue6EU5U7H2poNtZQViRhpKVm/KoMyP2O98=
X-Received: by 2002:adf:b30a:: with SMTP id j10mr5210325wrd.43.1628171614974; 
 Thu, 05 Aug 2021 06:53:34 -0700 (PDT)
MIME-Version: 1.0
References: <20210804004216.2754304-1-ian.may@canonical.com>
 <YQvUopKSO/qLexhT@yuki>
In-Reply-To: <YQvUopKSO/qLexhT@yuki>
From: Ian M <ian.s.may@gmail.com>
Date: Thu, 5 Aug 2021 08:53:24 -0500
Message-ID: <CAOnvRtEYC+rZrsGy0z0-WGtfVexT08++S+CQo5GAZ582+85n8g@mail.gmail.com>
To: Cyril Hrubis <chrubis@suse.cz>
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,HTML_MESSAGE,SPF_HELO_NONE,
 SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] syscalls/shmget03: Stat and skip existing shared
 segments
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
Cc: ltp@lists.linux.it
Content-Type: multipart/mixed; boundary="===============1456984769=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============1456984769==
Content-Type: multipart/alternative; boundary="000000000000be7bcd05c8d03e7a"

--000000000000be7bcd05c8d03e7a
Content-Type: text/plain; charset="UTF-8"

That looks like a good solution!

Thanks,
Ian

On Thu, Aug 5, 2021 at 7:07 AM Cyril Hrubis <chrubis@suse.cz> wrote:

> Hi!
> Yang Xu is already working on it, see:
>
> http://patchwork.ozlabs.org/project/ltp/list/?series=256752
>
> Thanks for the effort anyway.
>
> --
> Cyril Hrubis
> chrubis@suse.cz
>

--000000000000be7bcd05c8d03e7a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>That looks like a good solution!</div><div><br></div>=
<div>Thanks,</div><div>Ian</div></div><br><div class=3D"gmail_quote"><div d=
ir=3D"ltr" class=3D"gmail_attr">On Thu, Aug 5, 2021 at 7:07 AM Cyril Hrubis=
 &lt;<a href=3D"mailto:chrubis@suse.cz">chrubis@suse.cz</a>&gt; wrote:<br><=
/div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bo=
rder-left:1px solid rgb(204,204,204);padding-left:1ex">Hi!<br>
Yang Xu is already working on it, see:<br>
<br>
<a href=3D"http://patchwork.ozlabs.org/project/ltp/list/?series=3D256752" r=
el=3D"noreferrer" target=3D"_blank">http://patchwork.ozlabs.org/project/ltp=
/list/?series=3D256752</a><br>
<br>
Thanks for the effort anyway.<br>
<br>
-- <br>
Cyril Hrubis<br>
<a href=3D"mailto:chrubis@suse.cz" target=3D"_blank">chrubis@suse.cz</a><br=
>
</blockquote></div>

--000000000000be7bcd05c8d03e7a--

--===============1456984769==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============1456984769==--
