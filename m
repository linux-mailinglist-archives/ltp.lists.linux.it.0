Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C46864020
	for <lists+linux-ltp@lfdr.de>; Wed, 10 Jul 2019 06:36:03 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 1E9623C1CF7
	for <lists+linux-ltp@lfdr.de>; Wed, 10 Jul 2019 06:36:03 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 by picard.linux.it (Postfix) with ESMTP id 944DF3C0232
 for <ltp@lists.linux.it>; Wed, 10 Jul 2019 06:35:59 +0200 (CEST)
Received: from youngberry.canonical.com (youngberry.canonical.com
 [91.189.89.112])
 by in-3.smtp.seeweb.it (Postfix) with ESMTP id 8C97F1A0149C
 for <ltp@lists.linux.it>; Wed, 10 Jul 2019 06:35:58 +0200 (CEST)
Received: from mail-wr1-f69.google.com ([209.85.221.69])
 by youngberry.canonical.com with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.76) (envelope-from <po-hsu.lin@canonical.com>)
 id 1hl4Kj-0007ED-BC
 for ltp@lists.linux.it; Wed, 10 Jul 2019 04:35:57 +0000
Received: by mail-wr1-f69.google.com with SMTP id g8so390750wrw.2
 for <ltp@lists.linux.it>; Tue, 09 Jul 2019 21:35:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Q3JrnTTh5FLPtYnzZJkBRD4X8cPkFOu7sXcc6R2I2fE=;
 b=Pkbim0tTcgcJCE3WVyU7M86c/+WAiN4fZJx4KAVNYXbDY/mNojpqo3Us67f3y/snwI
 iwU2pX9iEBSK3YYmnlUIMSn9EDM2+9ZHu9lfJrQor5Upk0slwJ3wv5EbomM9OBUum1Pe
 ktX9cjLzfXNT1xnTq6IHqav1mp8h5sc6KoNrHwhb1kbceE1LCHfOt8l2MHqfy2oKu6we
 Ho2TFIacG9eAiq8sBN5Yy4nB5wjBNXfNJQvpBtZ1Vk0x7QZPDbdi/nhC0i+0S/5+I33N
 a706lvWf5MXeYZKtgwXXWuzm0232F/unBznLoquQjSO+Eg8VHpHta1fuNpovqFTezbZK
 fsGg==
X-Gm-Message-State: APjAAAU6PBxOz/h3zNUr/dJhXw40Efjxc834a1QnftZqHZzI2WQ1deWi
 rN5OfexffOaLdqEW7Sy2FFflBaeiUPu3h7/S5n/JL7OMK0G0+aSNFjzl6lJT4PcnkOvR5+/3QZI
 7+2ywgkbJSRcfhzMrsPZ5XNnnXmREguM7JoiD/106nNc=
X-Received: by 2002:a7b:c0d0:: with SMTP id s16mr3084106wmh.141.1562733357028; 
 Tue, 09 Jul 2019 21:35:57 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzd6/MqIl3DzMVTmB6jPuab3xMjXBWLjzVx9JdeEKHCzRcvuvoYsLvWfYehAI1g5ZhE+uY3FqbAZcBtdGowC5c=
X-Received: by 2002:a7b:c0d0:: with SMTP id s16mr3084046wmh.141.1562733356392; 
 Tue, 09 Jul 2019 21:35:56 -0700 (PDT)
MIME-Version: 1.0
References: <20190703102303.32166-1-po-hsu.lin@canonical.com>
 <20190703102303.32166-3-po-hsu.lin@canonical.com>
 <20190709114412.GC5888@rei.lan>
In-Reply-To: <20190709114412.GC5888@rei.lan>
From: Po-Hsu Lin <po-hsu.lin@canonical.com>
Date: Wed, 10 Jul 2019 12:35:45 +0800
Message-ID: <CAMy_GT_o7WiWo1zt7VDDqg+zjMGocL9K5EoxSTq1YzBuY1ekfg@mail.gmail.com>
To: Cyril Hrubis <chrubis@suse.cz>
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 2/3] zram/zram_lib.sh: fix variable name and
 algorithm retrieval
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

On Tue, Jul 9, 2019 at 7:44 PM Cyril Hrubis <chrubis@suse.cz> wrote:
>
> Hi!
> >       tst_resm TINFO "test that we can set compression algorithm"
> >
> > -     local algs="$(cat /sys/block/zram0/comp_algorithm)"
> > -     tst_resm TINFO "supported algs: $algs"
> > +     local zram_algs="$(sed 's/[][]//g' /sys/block/zram0/comp_algorithm)"
>
> This has still the same name as the variable set in the zram01.sh.
>
> There are two options what to do here, either we remove zram_algs from
> the zram01.sh or set the algorithms to the ones defined in the zram01.sh
> test at the end of this function.
>

OK thanks,
I think maybe it's better to keep zram_algs in zram01.sh, make the
mapped zram property structure intact.
That's probably the original purpose for the local variable "algs".

I will re-send a version with variable name unified with the local
algs here, so we don't need to restore the zram_algs in the end of
this function.


> > +     tst_resm TINFO "supported algs: $zram_algs"
> >       local i=0
> >       for alg in $zram_algs; do
> >               local sys_path="/sys/block/zram${i}/comp_algorithm"
> > --
> > 2.17.1
> >
> >
> > --
> > Mailing list info: https://lists.linux.it/listinfo/ltp
>
> --
> Cyril Hrubis
> chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
