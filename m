Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id D2B58CFAA4
	for <lists+linux-ltp@lfdr.de>; Tue,  8 Oct 2019 14:56:33 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 951213C136C
	for <lists+linux-ltp@lfdr.de>; Tue,  8 Oct 2019 14:56:32 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 by picard.linux.it (Postfix) with ESMTP id 3BA633C110F
 for <ltp@lists.linux.it>; Tue,  8 Oct 2019 14:56:29 +0200 (CEST)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 48C83140139C
 for <ltp@lists.linux.it>; Tue,  8 Oct 2019 14:56:28 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 7D02CAE4D;
 Tue,  8 Oct 2019 12:56:27 +0000 (UTC)
Date: Tue, 8 Oct 2019 14:56:26 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Li Wang <liwang@redhat.com>
Message-ID: <20191008125625.GA6180@dell5510>
References: <20190926093921.21247-1-liwang@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190926093921.21247-1-liwang@redhat.com>
User-Agent: Mutt/1.11.3 (2019-02-01)
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [Patch v4.1] fzsync: revoke thread_b if parent hits
 accidental break
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
Reply-To: Petr Vorel <pvorel@suse.cz>
Cc: Richard Palethorpe <rpalethorpe@suse.com>, ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi LI,

> We shouldn't rely entirely on the pair->exit flag in tst_fzsync_pair_cleanup()
> since there is possible to call tst_brk() at anyplace of thread_a, that will
> lead to timeout eventually because of thread_b(tst_fzsync_wait_b) fall into
> an infinite(no explicit condition to exit) loop.

> Thread_a path trace:
>   tst_brk()
>     cleanup()
>       tst_fzsync_pair_cleanup()
>         SAFE_PTHREAD_JOIN(pair->thread_b, NULL)
>         #Or pthread_cancel(pair->thread_b)

> We fix the problem via a way to kill thread_b with pthread_cancel. With new
> thread wrapper involves enabling thread cancel at the start of the thread B,
> then do asynchronous cancellation in tst_fzsync_pair_cleanup if pair->exit
> is not being set to 1.

> Workaround: [commit 2e74d996: Check recvmmsg exists before entering fuzzy loop]
> Signed-off-by: Li Wang <liwang@redhat.com>
> Cc: Richard Palethorpe <rpalethorpe@suse.com>
> Cc: Cyril Hrubis <chrubis@suse.cz>
> Acked-by: Richard Palethorpe <rpalethorpe@suse.com>
Reviewed-by: Petr Vorel <pvorel@suse.cz>

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
