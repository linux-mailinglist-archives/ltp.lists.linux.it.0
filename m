Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 74C12597213
	for <lists+linux-ltp@lfdr.de>; Wed, 17 Aug 2022 17:04:21 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id C92173C9F0F
	for <lists+linux-ltp@lfdr.de>; Wed, 17 Aug 2022 17:04:20 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 7B8733C98D4
 for <ltp@lists.linux.it>; Wed, 17 Aug 2022 17:04:16 +0200 (CEST)
Received: from mail-vk1-xa32.google.com (mail-vk1-xa32.google.com
 [IPv6:2607:f8b0:4864:20::a32])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id D5E4E1A0068E
 for <ltp@lists.linux.it>; Wed, 17 Aug 2022 17:04:15 +0200 (CEST)
Received: by mail-vk1-xa32.google.com with SMTP id bj43so6822305vkb.4
 for <ltp@lists.linux.it>; Wed, 17 Aug 2022 08:04:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc;
 bh=d5Algv5slMjzxmkJfWG5sUOLb+g9FprA7EFKQ6Z2H1U=;
 b=quW8G4LxaqQuLc4dV2+o3oBmYpNZzd0FMdZIWlHEZZ2aiDbpUZj/gUUksnCRvHbqrH
 uKtXN22gNGy1ECLEhWiWPnUE7GBCMqLC+MrLo1c6iEZZUYlJaRkau4So3iUTGHx7AYlo
 +60PfAKd1FFngIAmh1y7AOKYEyffFhNb9bfuBbvmER2IkHOsUs84+nKLh4/OHUet1Dui
 2XxFpthr5iIkKZbE0QZMOHTmPiFefEjniK3yuTV/1jJ4T9gNxkecsja9MIAmvE99KeAw
 HmEDAwMd9xeF12dsunZdB7eITCccR296MSlTe/xESMxAcS0fiWXRl+iG4wGqlYlbfmfN
 T4yQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=d5Algv5slMjzxmkJfWG5sUOLb+g9FprA7EFKQ6Z2H1U=;
 b=AIfMaNeNAFH5/35OX7+bM3PzgSzQrRpK1r8ez+ba80KVCTfSxqi3XMILpymNyWQjsA
 qnhV1evQI3IpbNgQgV1dqMZQxBM5ZbhPzetOqGYPynOJqXT1OvOM3VYZEJRE1+liRzo8
 r+CJlt3v/LyRiI+HT9TI2z+SYn36a/QO9tbSEuFW9hvksMhAnWueCEgP6cnItcARzI+n
 TMCqdd3fYMb754PC03m/t/McfDrLUhmr57TN0jlGVCGQZ1J4Y8oK8LN/luDIoPt5lT+B
 /k3ie2OF8OIkMvyhD5T4DenerpGlgOWCx3vOSb5boXNtCxLbrlRdrhxmmkt9A+TSZoVJ
 3bqg==
X-Gm-Message-State: ACgBeo2EGqlBjkeVNdKvWKl8CWePNrYzN6i2tsmAQDKcKPGOHRzgHDmM
 GZykqKtNAjI6ruOwQ6T+ZaZNAeuuF7yJCC3mHcLPtQ==
X-Google-Smtp-Source: AA6agR6Imx5tHG23MdlH+rYrFexpyzIq9YsGqBE4xIygorGMFfWwoGk7uRUmxF5nr8fuAxWEdnkQOxtzrAGhWqOAbvA=
X-Received: by 2002:a05:6122:218f:b0:37c:fe5c:9967 with SMTP id
 j15-20020a056122218f00b0037cfe5c9967mr11283909vkd.8.1660748654432; Wed, 17
 Aug 2022 08:04:14 -0700 (PDT)
MIME-Version: 1.0
References: <20220712173921.2623135-1-edliaw@google.com> <YtaFddMFjVPMTpme@rei>
 <CAG4es9Wn+wZRu6xr-FgZ=pTq4ReGdrmsmGYO4ZXvKj8ee3QH8w@mail.gmail.com>
 <CAG4es9XhZ7ksvLxwRNO73FC4DQc7KteUQAUPwipbks6kGsvFmw@mail.gmail.com>
 <YvUhZ/9Yf7eZ4a32@yuki> <YvuRAR1DSi67PDzh@pevik>
 <CAG4es9XdXgmPOQK3i+FL3VD-Y8C39sAShwdM6bi7U-CJjk7BQg@mail.gmail.com>
 <YvyxCXTGYpLd8kbQ@pevik>
In-Reply-To: <YvyxCXTGYpLd8kbQ@pevik>
Date: Wed, 17 Aug 2022 08:04:03 -0700
Message-ID: <CAG4es9XkRDYnwDr9huepzGhEiHxWdu40DOK9ouA2yWGqv842ow@mail.gmail.com>
To: Petr Vorel <pvorel@suse.cz>
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-14.9 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,ENV_AND_HDR_SPF_MATCH,HTML_MESSAGE,
 SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,USER_IN_DEF_DKIM_WL,
 USER_IN_DEF_SPF_WL autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v1] syscalls/signal06: add volatile to loop
 variable
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
From: Edward Liaw via ltp <ltp@lists.linux.it>
Reply-To: Edward Liaw <edliaw@google.com>
Cc: kernel-team <kernel-team@android.com>, LTP List <ltp@lists.linux.it>
Content-Type: multipart/mixed; boundary="===============1576434920=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============1576434920==
Content-Type: multipart/alternative; boundary="0000000000009c566f05e6712d62"

--0000000000009c566f05e6712d62
Content-Type: text/plain; charset="UTF-8"

On Wed, Aug 17, 2022, 2:12 AM Petr Vorel <pvorel@suse.cz> wrote:

> Hi Edward,
>
> > We are currently building with clang 14.0.6.  I haven't filed a bug
> report
> > with llvm, will work on doing that.
> Thanks for info. I expected it'd be for aarch64 arch, but I can reproduce
> it on
> the same clang version on x86_64 on openSUSE Tumbleweed.
>
> Would you mind we delay merging after you fill the bug in llvm, so that we
> can
> add it to git commit message?
>

Sure thing, not a problem.

>

--0000000000009c566f05e6712d62
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" clas=
s=3D"gmail_attr">On Wed, Aug 17, 2022, 2:12 AM Petr Vorel &lt;<a href=3D"ma=
ilto:pvorel@suse.cz">pvorel@suse.cz</a>&gt; wrote:<br></div><blockquote cla=
ss=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;pa=
dding-left:1ex">Hi Edward,<br>
<br>
&gt; We are currently building with clang 14.0.6.=C2=A0 I haven&#39;t filed=
 a bug report<br>
&gt; with llvm, will work on doing that.<br>
Thanks for info. I expected it&#39;d be for aarch64 arch, but I can reprodu=
ce it on<br>
the same clang version on x86_64 on openSUSE Tumbleweed.<br>
<br>
Would you mind we delay merging after you fill the bug in llvm, so that we =
can<br>
add it to git commit message?<br></blockquote></div></div><div dir=3D"auto"=
><br></div><div dir=3D"auto">Sure thing, not a problem.</div><div dir=3D"au=
to"><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"m=
argin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"></blockquote>=
</div></div></div>

--0000000000009c566f05e6712d62--

--===============1576434920==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============1576434920==--
