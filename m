Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A2DD3255C4
	for <lists+linux-ltp@lfdr.de>; Thu, 25 Feb 2021 19:45:40 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 390573C596E
	for <lists+linux-ltp@lfdr.de>; Thu, 25 Feb 2021 19:45:40 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 by picard.linux.it (Postfix) with ESMTP id 5AFFE3C4E6B
 for <ltp@lists.linux.it>; Thu, 25 Feb 2021 19:45:39 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id D4E1C601D10
 for <ltp@lists.linux.it>; Thu, 25 Feb 2021 19:45:38 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id D7561AC6E;
 Thu, 25 Feb 2021 18:45:37 +0000 (UTC)
Date: Thu, 25 Feb 2021 19:45:36 +0100
From: Petr Vorel <pvorel@suse.cz>
To: Martin Doucha <mdoucha@suse.cz>
Message-ID: <YDfwUJGckLfKexxY@pevik>
References: <20210225140925.16187-1-mdoucha@suse.cz>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210225140925.16187-1-mdoucha@suse.cz>
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] Reduce writev03 fuzzy_sync timeout
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

Hi Martin,

> Writev03 is fairly slow and tests multiple filesystems, each getting another
> round of timeout. Reduce fuzzy sync time limit to 25% of standard timeout
> to make the test finish slightly faster.

> Signed-off-by: Martin Doucha <mdoucha@suse.cz>

LGTM
Reviewed-by: Petr Vorel <pvorel@suse.cz>
> ---
>  testcases/kernel/syscalls/writev/writev03.c | 1 +
>  1 file changed, 1 insertion(+)

> diff --git a/testcases/kernel/syscalls/writev/writev03.c b/testcases/kernel/syscalls/writev/writev03.c
> index 4dc55c191..6514404e6 100644
> --- a/testcases/kernel/syscalls/writev/writev03.c
> +++ b/testcases/kernel/syscalls/writev/writev03.c
> @@ -49,6 +49,7 @@ static void setup(void)
>  	mapfd = SAFE_OPEN(MAPFILE, O_CREAT|O_RDWR|O_TRUNC, 0644);
>  	SAFE_WRITE(1, mapfd, buf, BUF_SIZE);

> +	fzsync_pair.exec_time_p = 0.25;
>  	tst_fzsync_pair_init(&fzsync_pair);
>  }

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
