Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B20C4B0C69
	for <lists+linux-ltp@lfdr.de>; Thu, 10 Feb 2022 12:33:16 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id F068E3C9E46
	for <lists+linux-ltp@lfdr.de>; Thu, 10 Feb 2022 12:33:15 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 1CC703C9B4F
 for <ltp@lists.linux.it>; Thu, 10 Feb 2022 12:33:13 +0100 (CET)
Received: from mail-pf1-x42c.google.com (mail-pf1-x42c.google.com
 [IPv6:2607:f8b0:4864:20::42c])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 679F460090B
 for <ltp@lists.linux.it>; Thu, 10 Feb 2022 12:33:13 +0100 (CET)
Received: by mail-pf1-x42c.google.com with SMTP id u16so4000483pfg.3
 for <ltp@lists.linux.it>; Thu, 10 Feb 2022 03:33:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:from:date:message-id:subject:to;
 bh=HI60bqkTmNL/tpVsm4trFFviZtQYmYvJpu+y8NkOsZs=;
 b=qio8a1bdFPMwDDQomYWeaFNvCJGOi99IrNfpaSSt+dACFsmKyvLZ1ZkM/gYVE9/TTH
 MJUa51/VmkW3m+9ZZ63c/HP8uplO/L9wUgNEB28JrTtdhR18EzoqbXL0J3TtTIPGLAuI
 AFKHg162ebvf+4oTco74+/CtmlzJTeLiJFmP9MM1pQEaRHc0O9LxfuEOwbLnZm5tFulw
 gKgroCGRZiHJ44Doptv+BT+dpoy5My8u7gwcSkeidliPVtqrtJVSEEN0iN5wdpYsPzRq
 NWubDnWLTxgRIidAhcbfa3YEkpNX1VoOH8QUtaeAvRpqTAjhO3uhPgFFDBL7+d7jgDX1
 UxOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=HI60bqkTmNL/tpVsm4trFFviZtQYmYvJpu+y8NkOsZs=;
 b=GpC8WcXdumR8HOy3Y2NNSPxAUQ3A8k2dgDKsCDkJrw5xqQnoktm8PZIwc+Xf4U9YNU
 zxNuokimCXpv7cBIBnE7cvTbyxjEaM18RxbA9QBjl1iAlv8l8au5BKpVUMI+gyAd0sI8
 5eXh2XkhbAPzQ+TSjD4hwXKfCIxcRNRBrv1NoAR/Rzgy8hZ0ocoxP15o/emB019Y7GKu
 iuyhoZ9kYuNIsvdPVkBilo8l1MriiIYMVZ5/wZZQDX4LhiPHAlf87QfyGRTJnQjacsWb
 kKZKMZDIO5PS8Vp4c1iOxlAy7XjYlTnzqdCo3d8rYcr610wgoz+ldyH0YnShqHPiMXu+
 hWIg==
X-Gm-Message-State: AOAM533DN3VI2T+NIh9XwJYNbOPrMgOmTNxfTHfkFUuJKE6pwHQOrO+W
 /kKwEd2I8DVuw8np9MvuwnOR93N6pGx4iq/2YWHNJezv
X-Google-Smtp-Source: ABdhPJyW9eRcrptQylhJxCYm4QlPu6uuJc1XWdxDT87o5hxg4FOPyrdcB950J3iZbtrDHx4UKWoZGPi/zjFQM4IOw+w=
X-Received: by 2002:a63:6847:: with SMTP id d68mr5868518pgc.273.1644492791867; 
 Thu, 10 Feb 2022 03:33:11 -0800 (PST)
MIME-Version: 1.0
From: Kautuk Consul <kautuk.consul.80@gmail.com>
Date: Thu, 10 Feb 2022 17:03:01 +0530
Message-ID: <CAKWYkK03vnioG=XBmGOzAruwVo_XtZgn9k+dw8HPXyvTwfaVQQ@mail.gmail.com>
To: ltp@lists.linux.it
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.3 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,
 HTML_MESSAGE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: [LTP] Open Question about KVM test-cases.
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
Content-Type: multipart/mixed; boundary="===============1629183194=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============1629183194==
Content-Type: multipart/alternative; boundary="000000000000b1ed3005d7a850eb"

--000000000000b1ed3005d7a850eb
Content-Type: text/plain; charset="UTF-8"

Hi,

I just wanted to ask if there are any test-cases to test out the KVM
hardware
virtualization infrastructure in the Linux kernel ?

If yes, then where can I access these test-cases from ?

Thanks.

--000000000000b1ed3005d7a850eb
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi,<div><br></div><div>I just wanted to ask if there are a=
ny test-cases to test out the KVM hardware</div><div>virtualization infrast=
ructure=C2=A0in the Linux kernel ?</div><div><br></div><div>If yes, then wh=
ere can I access these test-cases from ?</div><div><br></div><div>Thanks.</=
div></div>

--000000000000b1ed3005d7a850eb--

--===============1629183194==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============1629183194==--
