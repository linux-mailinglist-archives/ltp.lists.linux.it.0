Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F7E870FC0
	for <lists+linux-ltp@lfdr.de>; Tue, 23 Jul 2019 05:14:26 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id E61683C1CA0
	for <lists+linux-ltp@lfdr.de>; Tue, 23 Jul 2019 05:14:25 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 by picard.linux.it (Postfix) with ESMTP id 394BF3C0794
 for <ltp@lists.linux.it>; Tue, 23 Jul 2019 05:14:23 +0200 (CEST)
Received: from mail-vs1-f66.google.com (mail-vs1-f66.google.com
 [209.85.217.66])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id B91C3600F2F
 for <ltp@lists.linux.it>; Tue, 23 Jul 2019 05:14:22 +0200 (CEST)
Received: by mail-vs1-f66.google.com with SMTP id v129so27837809vsb.11
 for <ltp@lists.linux.it>; Mon, 22 Jul 2019 20:14:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=wDcYRkoT3gop9obXlVD7nYWjtKAq0ZBzSFZNwh2RPHs=;
 b=hvqCz0EczFzGo5NT4u+VBwhfZMiRScFu9sKsoY2MMORKw19Bz1jcAvuJYZCUm5TRnZ
 wWwWBm0Hd8E43H6osIDvI4HFvfOFnmCGSVY1GcurGnrNkOBAU2WLPBxPxdnEc/BT9xzc
 /jSHvMlZTcDR0mUTmY9D059IvU8CDosDlzy7lnv7Q8iQdqkCJCUhKrCMpTNRCGrCWPm8
 EoU36UoplQSNWFyy8HCjloOj+Ujt9qwnj5TLYM8FRgWCffltIoBRiW0b0tpWPu2exvwE
 2M+dfz6ZI8UoInzvLgKQEH2o1b+AcoFjLThX04Ax7Mwjz1g1y3lo5CRTf0tf0VX+khOj
 pISw==
X-Gm-Message-State: APjAAAWx7gk7zr0r7jBw98v8+rKZ+awuxN/Quot8COodRMbFBsUF7lwr
 dRXaPfwTxuaK41sR3prt3tlxjG9h46RtTRcNIaBlNQ==
X-Google-Smtp-Source: APXvYqzw+k9jPW9YPRQ1eN5wOBwwVe91FDokV5r+3HxrbEIqwZ9zuAif5tf6hgtPp1D2Leg7c/OXC1CCTYCM3jK3WdI=
X-Received: by 2002:a67:11c1:: with SMTP id 184mr45034111vsr.217.1563851661408; 
 Mon, 22 Jul 2019 20:14:21 -0700 (PDT)
MIME-Version: 1.0
References: <20190719124817.5140-1-steven.price@arm.com>
 <CAEemH2fv0AXXVKDNWgATCdS2WKufV1YPDsKHhPBZbk1Dxv77LQ@mail.gmail.com>
In-Reply-To: <CAEemH2fv0AXXVKDNWgATCdS2WKufV1YPDsKHhPBZbk1Dxv77LQ@mail.gmail.com>
From: Li Wang <liwang@redhat.com>
Date: Tue, 23 Jul 2019 11:14:10 +0800
Message-ID: <CAEemH2d9Jx5G-fF469Ue=cyhpttAEw-u62R-4Nr7Lqva2Fpe3Q@mail.gmail.com>
To: Steven Price <steven.price@arm.com>
X-Virus-Scanned: clamav-milter 0.99.2 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] ustat02: Fix EFAULT in 32bit compatibility mode
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

On Mon, Jul 22, 2019 at 5:55 PM Li Wang <liwang@redhat.com> wrote:
>
> On Fri, Jul 19, 2019 at 11:19 PM Steven Price <steven.price@arm.com> wrote:
> >
> > The size of dev_t is larger than 32 bits which causes the dev argument
> > to be passed incorrectly. On Arm this means that the EFAULT test case
> > actually returns EINVAL because the device number isn't recognised.
> >
> > Signed-off-by: Steven Price <steven.price@arm.com>
> Acked-by: Li Wang <liwang@redhat.com>

Pushed.

-- 
Regards,
Li Wang

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
