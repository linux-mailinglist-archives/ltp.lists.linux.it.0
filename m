Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 23B4CDA38F
	for <lists+linux-ltp@lfdr.de>; Thu, 17 Oct 2019 04:19:01 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 9449C3C1865
	for <lists+linux-ltp@lfdr.de>; Thu, 17 Oct 2019 04:19:00 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 by picard.linux.it (Postfix) with ESMTP id DA82C3C147F
 for <ltp@lists.linux.it>; Thu, 17 Oct 2019 04:18:56 +0200 (CEST)
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 69A436018AD
 for <ltp@lists.linux.it>; Thu, 17 Oct 2019 04:18:56 +0200 (CEST)
Received: from mail-ot1-f71.google.com (mail-ot1-f71.google.com
 [209.85.210.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 619E08553A
 for <ltp@lists.linux.it>; Thu, 17 Oct 2019 02:18:54 +0000 (UTC)
Received: by mail-ot1-f71.google.com with SMTP id t14so402561otd.9
 for <ltp@lists.linux.it>; Wed, 16 Oct 2019 19:18:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=4c14el76bzNpoUdYq6BqoIGrxJdquRcAOmO4mnifzTY=;
 b=o4Zv1BjUxL4iydtSKsAQNnepGr1wx5ZHV4aSItsTudWcE/2CThtSjp87/Lqe4gqyQl
 OAVbPY5b/ZlzoK4XrqLufHDJ0Bs2KQ+2j3o5VM+dB2WcE+pvIUDLuqbWqLqGSM396SfF
 fHvk4E+x1tO4P+s3HsMC2DfGvIrceFQhia1doO6DIT/DpDbZCb1v+wNZzQtEOzGLYAUQ
 RmJr/ifSaNu55DY7Lo3CWP/xtMvplvdd7Gu39fZLkNs71QBkP5FjW1XO519gtm1FM2nI
 82Eh50vpFoyP1qibgWtusMEOEPZe5hFrSxbWBsAmgUGdWHeSU/sbjXYlXmwc/nqs7JQC
 TEVA==
X-Gm-Message-State: APjAAAVpRttIp+mzuRGtCszuEcPnbLD0R7C9mpRkvaxGzUyudwdYn+LG
 LHVGoiUtmYDqjpitAb8Cmd/bR4ApQhzeAq3IU5FM4dVm+hJnCktYu3g6D1B6KYD1duUdo4Rw9Ts
 51buRLFmiV0atLgFuBLxkF552MPI=
X-Received: by 2002:a9d:5907:: with SMTP id t7mr996815oth.118.1571278733940;
 Wed, 16 Oct 2019 19:18:53 -0700 (PDT)
X-Google-Smtp-Source: APXvYqw+Dz2Q4KWXaTPuGOwcjO15dSfzIgbl1fC+g1OoNAMbGVsyBg33VgPEa0ktgiCgjmwTCLz9nU1Av4JnBAwAPe8=
X-Received: by 2002:a9d:5907:: with SMTP id t7mr996802oth.118.1571278733664;
 Wed, 16 Oct 2019 19:18:53 -0700 (PDT)
MIME-Version: 1.0
References: <20191016080146.18657-1-liwang@redhat.com>
 <87pnixvwkh.fsf@rpws.prws.suse.cz>
In-Reply-To: <87pnixvwkh.fsf@rpws.prws.suse.cz>
From: Li Wang <liwang@redhat.com>
Date: Thu, 17 Oct 2019 10:18:42 +0800
Message-ID: <CAEemH2f=HUpkCKMDyTf-Tv04P-YfjMHzXTG-ieF9i9TXXNo9jQ@mail.gmail.com>
To: Richard Palethorpe <rpalethorpe@suse.de>
X-Virus-Scanned: clamav-milter 0.99.2 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-0.0 required=7.0 tests=HTML_MESSAGE,SPF_HELO_PASS,
 SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2] include: undefine _LINUX_TYPES_H if including
 old sys/capability.h
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
Cc: LTP List <ltp@lists.linux.it>,
 Richard Palethorpe <richard.palethorpe@suse.com>
Content-Type: multipart/mixed; boundary="===============1404940809=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============1404940809==
Content-Type: multipart/alternative; boundary="000000000000c3884a059511d678"

--000000000000c3884a059511d678
Content-Type: text/plain; charset="UTF-8"

> Ack.
>
Pushed. Thanks for review.

-- 
Regards,
Li Wang

--000000000000c3884a059511d678
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_quote"><div>=C2=A0</div><blockquote cl=
ass=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid=
 rgb(204,204,204);padding-left:1ex">
Ack.<br>
</blockquote></div><div class=3D"gmail_default" style=3D"font-size:small"><=
/div><div class=3D"gmail_default" style=3D"font-size:small">Pushed. Thanks =
for review.</div><div><br></div>-- <br><div dir=3D"ltr" class=3D"gmail_sign=
ature"><div dir=3D"ltr"><div>Regards,<br></div><div>Li Wang<br></div></div>=
</div></div>

--000000000000c3884a059511d678--

--===============1404940809==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============1404940809==--
