Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A1C7BB893
	for <lists+linux-ltp@lfdr.de>; Mon, 23 Sep 2019 17:52:20 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 364BD3C2077
	for <lists+linux-ltp@lfdr.de>; Mon, 23 Sep 2019 17:52:20 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 by picard.linux.it (Postfix) with ESMTP id 80EE83C1C86
 for <ltp@lists.linux.it>; Mon, 23 Sep 2019 17:52:18 +0200 (CEST)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id C43111001749
 for <ltp@lists.linux.it>; Mon, 23 Sep 2019 17:52:09 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 1F8ABAE7F;
 Mon, 23 Sep 2019 15:52:17 +0000 (UTC)
Date: Mon, 23 Sep 2019 17:52:15 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Richard Palethorpe <rpalethorpe@suse.com>
Message-ID: <20190923155215.GA2531@dell5510>
References: <20190923125914.2572-1-rpalethorpe@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190923125914.2572-1-rpalethorpe@suse.com>
User-Agent: Mutt/1.11.3 (2019-02-01)
X-Virus-Scanned: clamav-milter 0.99.2 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] fzsync: Add reproducing race-conditions section
 to docs
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
Cc: ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi Richie,

> Give people some hint about how to do this with the Fuzzy Sync library. This
> is really just a pointer. A full explanation would require way too much detail
> for this document.

> Signed-off-by: Richard Palethorpe <rpalethorpe@suse.com>
Nice, thanks for caring about docs.
Acked-by: Petr Vorel <pvorel@suse.cz>

> ---
>  doc/test-writing-guidelines.txt | 79 +++++++++++++++++++++++++++++++++
>  1 file changed, 79 insertions(+)

> diff --git a/doc/test-writing-guidelines.txt b/doc/test-writing-guidelines.txt
> index a735b43bb..49cc92a27 100644
> --- a/doc/test-writing-guidelines.txt
> +++ b/doc/test-writing-guidelines.txt
> @@ -1854,6 +1854,85 @@ However a lot of problems can be solved by using 'tst_cap_action(struct
>  tst_cap  *cap)' directly which can be called at any time. This also helps if
>  you wish to drop a capability at the begining of setup.

> +2.2.33 Reproducing race-conditions
> +^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
> +
> +If a bug is caused by two tasks in the kernel racing and you wish to create a
> +regression test (or bug-fix validation test). The 'tst_fuzzy_sync.h' library
> +should be used.
Looks a bit strange to have this in 2 sentences (I'd write single one),
but you're a native speaker, so you must know what is correct :).

...
> +Fuzzy sync synchronises 'run_a' and 'run_b', which act as barriers, so that
> +niether thread can progress until the other has caught up with it. There is
typo: niether => neither

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
