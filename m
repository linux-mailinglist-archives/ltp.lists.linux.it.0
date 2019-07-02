Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C4FB5D474
	for <lists+linux-ltp@lfdr.de>; Tue,  2 Jul 2019 18:40:32 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id B907C3C1DA6
	for <lists+linux-ltp@lfdr.de>; Tue,  2 Jul 2019 18:40:31 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 by picard.linux.it (Postfix) with ESMTP id EA9333C1D49
 for <ltp@lists.linux.it>; Tue,  2 Jul 2019 18:40:27 +0200 (CEST)
Received: from youngberry.canonical.com (youngberry.canonical.com
 [91.189.89.112])
 by in-5.smtp.seeweb.it (Postfix) with ESMTP id E2417600B88
 for <ltp@lists.linux.it>; Tue,  2 Jul 2019 18:40:29 +0200 (CEST)
Received: from mail-wr1-f70.google.com ([209.85.221.70])
 by youngberry.canonical.com with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.76) (envelope-from <po-hsu.lin@canonical.com>)
 id 1hiLpS-0006oO-7C
 for ltp@lists.linux.it; Tue, 02 Jul 2019 16:40:26 +0000
Received: by mail-wr1-f70.google.com with SMTP id v14so7124075wrm.23
 for <ltp@lists.linux.it>; Tue, 02 Jul 2019 09:40:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=/NrNcC1ByBgtQ8UyeM8cXW8phHczsF3nY9Xt+U0Mqso=;
 b=ciK3lysDhKRCNrpunft8JdRVFGgjKk5I/d/ZTgQDS3L0Hb/MRpBbm7TQrotlK1b2JR
 cvdrTGzdweEM69WNgkCEISIXGFHvjZOAaUdyaSvZm2a7rgcMtjfCJ0OALW9Ve4/30iRN
 Lyv9cRzJe+httyPpzRRMdM/ZYxnzdlJ2mi7aTpSlE+eHHGvUv4py0U2AOCtBrDkthVco
 WB5NdqWM6aZ3cWxCa/+aPnEHXkWyUskWNB9ZNOAuvz6uTpleTFG3g1d+wq8VYecWe8dW
 enJTTg2LWMktLtvaEzjE1izOFNmRwB/FdpCjvgeKrYRhWEep0Ql1utm/jtDrRd++6KPe
 05eQ==
X-Gm-Message-State: APjAAAWvVgUtO1h4Z1AMqohVdvOWM8w04o83C4z4kZYvEQuZVmv1ek/e
 Vjn6/d/qmdqVL/pzj7DxwqtleIy3hNBr5gX3iJeQaLHS+BD0fVaRE0AYAMh3WMePLueAqRliv6s
 x1Wc1hnI4kuGaizuavOH9XFQvVnuwdoqcrAqhuO26XH4=
X-Received: by 2002:a7b:c313:: with SMTP id k19mr3899025wmj.2.1562085625924;
 Tue, 02 Jul 2019 09:40:25 -0700 (PDT)
X-Google-Smtp-Source: APXvYqyaw1R5p+ULeB13jldOe3gSyHx8tOqk9LmqjXi9o22SsoYh908WOL38Ioxi9RHM1LsAVUkWDsMlCH3OKMCd4WA=
X-Received: by 2002:a7b:c313:: with SMTP id k19mr3899014wmj.2.1562085625706;
 Tue, 02 Jul 2019 09:40:25 -0700 (PDT)
MIME-Version: 1.0
References: <20190628103900.10113-1-po-hsu.lin@canonical.com>
 <5D19A7E1.10607@cn.fujitsu.com> <20190702130513.GB11122@rei>
In-Reply-To: <20190702130513.GB11122@rei>
From: Po-Hsu Lin <po-hsu.lin@canonical.com>
Date: Wed, 3 Jul 2019 00:40:15 +0800
Message-ID: <CAMy_GT-Snxu5axLR6j=1yeDRNWJavofVAjdJH2FyBfCsnj=Hdw@mail.gmail.com>
To: Cyril Hrubis <chrubis@suse.cz>
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] scenario_groups/default: run the kernel_misc test
 after the cve test
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hello,
thanks for the review,
do you think if we should put a comment (if possible) inside that file
to avoid getting re-ordered for some reason in the future?

On Tue, Jul 2, 2019 at 9:05 PM Cyril Hrubis <chrubis@suse.cz> wrote:
>
> Hi!
> > Your patch just workarounds the issue for now, because it still happens
> > if a new test designed to taint
> > kernel is added to the group before cve group in future.
>
> Unfortunately there is no better solution for this, so I pushed the
> patch.
>
> --
> Cyril Hrubis
> chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
