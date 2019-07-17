Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id BCFCF6B77B
	for <lists+linux-ltp@lfdr.de>; Wed, 17 Jul 2019 09:47:55 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 7FC143C1D0E
	for <lists+linux-ltp@lfdr.de>; Wed, 17 Jul 2019 09:47:55 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 by picard.linux.it (Postfix) with ESMTP id A4DC13C13DF
 for <ltp@lists.linux.it>; Wed, 17 Jul 2019 09:47:53 +0200 (CEST)
Received: from mail-vk1-f176.google.com (mail-vk1-f176.google.com
 [209.85.221.176])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 69D711401AAE
 for <ltp@lists.linux.it>; Wed, 17 Jul 2019 09:47:52 +0200 (CEST)
Received: by mail-vk1-f176.google.com with SMTP id b69so4764745vkb.3
 for <ltp@lists.linux.it>; Wed, 17 Jul 2019 00:47:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=W9X/gvrv2Nu2WQtXJu5UevKISQSHcxkiUXaKRy4TDQ0=;
 b=VA955qX9rcAuannV4XTaGS9+pAgdD7VWVjCrjZ5lbUNNRlF3t6Yj0QM+6V/KqaxYTi
 fdjjQAfaQbYcgcj/VSd6IKe48yWQRsWBCb4UyPGsdrPt+e9Z6GS64MJf793D5FE1xerz
 QDZvBl0VuHh8SupAgsXZcc44v2T8buX2b/40TUxx2mY7VN2e6I3fk9MCYCvufgzcy02z
 fG2zSBFhI86KIzLS+yXR4KfgJU3WTgS4c8HnLDug/iCBAypPy16NF/Q0YFxmBDrfXNym
 KYpc68Gp76ukAINF1mfkFBjDoQ1y7wyw8GEiG/vK521UlBfzmwLD3FKQtRsJXjPNIf5t
 yzAA==
X-Gm-Message-State: APjAAAXdKR/qmSJ466r8LIFeNUXpzOMhkoqc2ZUHPmw2RecTmugUKedZ
 iuA0rterZuhjH/A1Cpc1EsmBBu7lhH/YMAGrT0KaKw==
X-Google-Smtp-Source: APXvYqwhHwPCCB24Mog69FB0XbJEQ6IjRAnkGZb2w5uMZaAs+Od1XhCOcMY5xusK7HrQc7U4BYEzFaVmUpS/VXhDoTI=
X-Received: by 2002:a1f:2117:: with SMTP id h23mr14366075vkh.91.1563349671295; 
 Wed, 17 Jul 2019 00:47:51 -0700 (PDT)
MIME-Version: 1.0
References: <20190705051603.24599-1-liwang@redhat.com>
 <02ade9af1634c4681156dceecfd51721284044e3.1562591065.git.jstancek@redhat.com>
 <20190711123441.GA8709@rei>
 <1337100107.32641000.1562849136661.JavaMail.zimbra@redhat.com>
In-Reply-To: <1337100107.32641000.1562849136661.JavaMail.zimbra@redhat.com>
From: Li Wang <liwan@redhat.com>
Date: Wed, 17 Jul 2019 15:47:40 +0800
Message-ID: <CAEemH2dviTYAAcsOgotuOG5gicUVVP2g2RE3MomOp5NVG_4U+Q@mail.gmail.com>
To: Jan Stancek <jstancek@redhat.com>
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=HTML_MESSAGE,SPF_HELO_NONE,
 SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v3.1] lib: add tst_no_corefile()
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
Content-Type: multipart/mixed; boundary="===============0550510008=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============0550510008==
Content-Type: multipart/alternative; boundary="000000000000d15a60058ddbb5dd"

--000000000000d15a60058ddbb5dd
Content-Type: text/plain; charset="UTF-8"

Hi Jan,

On Thu, Jul 11, 2019 at 8:45 PM Jan Stancek <jstancek@redhat.com> wrote:

> ...
> >
> > because otherwise we will print the mesasge even in cases that the
> > corefile is not in fact limited.
>
> Depends on setup of core_pattern, if it's core-to-file it's already
> limited.
> If it's core-to-pipe, then it's no limit, so I agree, we can move it above.
>
>
I helped to push the v3.1 base on Cyril's suggestion. Since I'm going to
apply the pkey testcase. Thanks.

-- 
Regards,
Li Wang

--000000000000d15a60058ddbb5dd
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small">Hi Jan,</div></div><br><div class=3D"gmail_quote"><div dir=3D=
"ltr" class=3D"gmail_attr">On Thu, Jul 11, 2019 at 8:45 PM Jan Stancek &lt;=
<a href=3D"mailto:jstancek@redhat.com">jstancek@redhat.com</a>&gt; wrote:<b=
r></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex=
;border-left:1px solid rgb(204,204,204);padding-left:1ex"><span class=3D"gm=
ail_default" style=3D"font-size:small">...</span><br>
&gt; <br>
&gt; because otherwise we will print the mesasge even in cases that the<br>
&gt; corefile is not in fact limited.<br>
<br>
Depends on setup of core_pattern, if it&#39;s core-to-file it&#39;s already=
 limited.<br>
If it&#39;s core-to-pipe, then it&#39;s no limit, so I agree, we can move i=
t above.<br><br></blockquote><div class=3D"gmail_default" style=3D"font-siz=
e:small"><br></div><div class=3D"gmail_default" style=3D"font-size:small">I=
 helped to push the v3.1 base on Cyril&#39;s suggestion. Since I&#39;m goin=
g to apply the pkey testcase. Thanks.</div></div><div><br></div>-- <br><div=
 dir=3D"ltr" class=3D"gmail_signature"><div dir=3D"ltr"><div><div dir=3D"lt=
r">Regards,<br>Li Wang<br></div></div></div></div></div>

--000000000000d15a60058ddbb5dd--

--===============0550510008==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============0550510008==--
