Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id B7C507BB4D
	for <lists+linux-ltp@lfdr.de>; Wed, 31 Jul 2019 10:13:34 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 66E193C1D3E
	for <lists+linux-ltp@lfdr.de>; Wed, 31 Jul 2019 10:13:34 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 by picard.linux.it (Postfix) with ESMTP id 33E6E3C1C9A
 for <ltp@lists.linux.it>; Wed, 31 Jul 2019 10:13:31 +0200 (CEST)
Received: from mail-ua1-f45.google.com (mail-ua1-f45.google.com
 [209.85.222.45])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 20D981A0192A
 for <ltp@lists.linux.it>; Wed, 31 Jul 2019 10:13:30 +0200 (CEST)
Received: by mail-ua1-f45.google.com with SMTP id c4so26610377uad.1
 for <ltp@lists.linux.it>; Wed, 31 Jul 2019 01:13:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=jljme5Swi1hIVns7EpFzQwXteWS6QeAT2sj/c5gp8Fw=;
 b=jneqxbam9xarCGmMxMIjIkQoUCbFf2UZN6tHas+KLQOH5BYjFy85CYtX9HJtnqxScS
 MUh6WXzSLw1JY+ZPp2YSEqSn1wEEbcOkNfb1s8oREH4PBYbI3l8DlXzzbr+cGKP0SP8I
 815P+xJ+jQ4es6Uvla/7GlJidaL8wqxSs1BlrQaZHf+u2CYViMoVhyWm/yzFPGKY9q2L
 nb536n+fLSAR4fOghhz3M2se+4abiQLVqKBar16b4fo7CwkwOaqILlP2kkJYzFswGPue
 MQxq7hVlOF+NZ1ulR0XMGcNp758BXmvRc8lvLXqrBbKD6/l/8+lq2tYkacVXlRRYpEbu
 CIrg==
X-Gm-Message-State: APjAAAWefAFLvjVC5iMsGWcXUcsJjFxSzlTcS2LpxbRse3QArUZz5f19
 vNLmAt/sNRFXFup7A25igMpvxtmyG1yJEmOOZNSlS3cA
X-Google-Smtp-Source: APXvYqwZWw1riRrrkwsCL6m+btTHDB1R0C6NTNgUaVo+pSm2WdBq/nHo5Wb/XPfewrJnKiRtTsCw7/37GJ1FiYHw6Ds=
X-Received: by 2002:ab0:67d6:: with SMTP id w22mr8790701uar.68.1564560808953; 
 Wed, 31 Jul 2019 01:13:28 -0700 (PDT)
MIME-Version: 1.0
References: <20190731075051.5830-1-po-hsu.lin@canonical.com>
In-Reply-To: <20190731075051.5830-1-po-hsu.lin@canonical.com>
From: Li Wang <liwang@redhat.com>
Date: Wed, 31 Jul 2019 16:13:18 +0800
Message-ID: <CAEemH2fkeu4uzA3zzbU0-i4vN2iW-mOi3dPC=TVRLvG9skNwPA@mail.gmail.com>
To: Po-Hsu Lin <po-hsu.lin@canonical.com>
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] scenario_groups/default: remove the timers test
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

On Wed, Jul 31, 2019 at 3:51 PM Po-Hsu Lin <po-hsu.lin@canonical.com> wrote:
>
> The timers tests were merged into syscalls in commit 0051eab2,
> remove the no-longer-exists timers from default test plan.

Good catch. Pushed.

-- 
Regards,
Li Wang

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
