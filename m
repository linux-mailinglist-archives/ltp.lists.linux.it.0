Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B33C190A65
	for <lists+linux-ltp@lfdr.de>; Tue, 24 Mar 2020 11:15:28 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 750EC3C4D48
	for <lists+linux-ltp@lfdr.de>; Tue, 24 Mar 2020 11:15:27 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 by picard.linux.it (Postfix) with ESMTP id 3235A3C4E3A
 for <ltp@lists.linux.it>; Mon, 23 Mar 2020 22:33:11 +0100 (CET)
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 9DCB11A00372
 for <ltp@lists.linux.it>; Mon, 23 Mar 2020 22:33:10 +0100 (CET)
Received: by mail-wm1-x336.google.com with SMTP id d198so1090663wmd.0
 for <ltp@lists.linux.it>; Mon, 23 Mar 2020 14:33:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=A/E+r5YZz+K+mJwbk4Hz96Xw1D53rqCo2ftpiyNAj6k=;
 b=NZzQwhy8FrFCBrdfQT5NsKucuAOSmEwDWm4G4eNS0Q7xXwrV0KpF59MHsMb258CqqO
 G7cTeNmyvw9T186W2zOBlk6x2CmsOTpleX2fZy0BIvhZx6bZD7zOwBEa7xnovGmww4+S
 IEVNdtje2ipwqp6ThPNStvHL3JeVaJCkXaXmGBov9aW8FnvHvzBOEdgoFOB6IeRxrzXW
 bL3rOIQ/KYWfItKAYtSKnFrtStAQJf1x6dpHITS2EvOamfU/5WuMykz/v2N6ZeLO8ELj
 azgLMfyqKRVDCtRymJ4WIZepxmzeDb03mDZcdxlKfiN/K2iT6IbBwDJLiOleSSzrCtsQ
 og4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=A/E+r5YZz+K+mJwbk4Hz96Xw1D53rqCo2ftpiyNAj6k=;
 b=AS98BqDqDhZGW11x9vWKB05TVhzJTEjvhPHszmpJ7U/uzbUw/e4ioBcUoc62dBKW4k
 WfVQZni2h2POecudSkVPj3G4ygzo0hcKTD2t71PJ3xnKmA8h39GFLfeMDLYUFp4PMQzs
 On0mxH4yoV6muoXJKu8ApRmpM0ouV1CD5H4tdhryM4cj8S+BCLU0k4omhH4hTNMnl2aO
 Pd8r8MWZIyepYphl3LRkleHkdJhZHrnRHYnYiUXHWeha2MWmRQX1hhZTy6JF7m3VqBjA
 Fo4cql1KzS+OpgnjIIqo/kiQOtnj/gowKcbbFOFiBLRCuAkBOq4RBtEAZL6WzReZatG7
 KQVg==
X-Gm-Message-State: ANhLgQ0Uiw2Lh0zQ5YSsUsnqbf/2zTLRfDLOhvi7WfMFVJgAb6hUMsAM
 hglWiFXDvCQcL2Fxid7nWmYEerTVbYNwppI66zu+3QPiIB15Vg==
X-Google-Smtp-Source: ADFU+vubeKUJTyCYA51OwWSZVnrWgOOueGFXpNY4vQ88D59So8kbfEXT/Xbw/JYi6dYExkE6X9nkTP+9LCMvZ0K32Tw=
X-Received: by 2002:a7b:cb03:: with SMTP id u3mr1432984wmj.12.1584999189941;
 Mon, 23 Mar 2020 14:33:09 -0700 (PDT)
MIME-Version: 1.0
From: Mouaz Alabsawi <mouaz.alabsawi@gmail.com>
Date: Mon, 23 Mar 2020 22:32:57 +0100
Message-ID: <CAA-7mwZYzbSOg9d4tVn2b7eKrjm1PTdaKw1LUU2OoPvTH8onYA@mail.gmail.com>
To: ltp@lists.linux.it
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,HTML_MESSAGE,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
X-Mailman-Approved-At: Tue, 24 Mar 2020 11:15:23 +0100
Subject: [LTP] LTP project license
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
Content-Type: multipart/mixed; boundary="===============0791182021=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============0791182021==
Content-Type: multipart/alternative; boundary="000000000000af91f905a18c61e9"

--000000000000af91f905a18c61e9
Content-Type: text/plain; charset="UTF-8"

Dears,

I was wondering under which license of https://spdx.org/licenses/ relies
LTP project? https://spdx.org/licenses/GPL-2.0-only.html or
https://spdx.org/licenses/GPL-2.0-or-later.html?

Thanks,
Mouaz

--000000000000af91f905a18c61e9
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Dears,<div><br></div><div>I was wondering under which lice=
nse of=C2=A0<a href=3D"https://spdx.org/licenses/">https://spdx.org/license=
s/</a>=C2=A0relies LTP project?=C2=A0<a href=3D"https://spdx.org/licenses/G=
PL-2.0-only.html">https://spdx.org/licenses/GPL-2.0-only.html</a> or=C2=A0<=
a href=3D"https://spdx.org/licenses/GPL-2.0-or-later.html">https://spdx.org=
/licenses/GPL-2.0-or-later.html</a>?</div><div><br></div><div>Thanks,</div>=
<div>Mouaz</div></div>

--000000000000af91f905a18c61e9--

--===============0791182021==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============0791182021==--
