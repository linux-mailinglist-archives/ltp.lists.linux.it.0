Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 73AC52E0207
	for <lists+linux-ltp@lfdr.de>; Mon, 21 Dec 2020 22:25:07 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id C57C03C5A3D
	for <lists+linux-ltp@lfdr.de>; Mon, 21 Dec 2020 22:25:06 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 by picard.linux.it (Postfix) with ESMTP id E34673C28E4
 for <ltp@lists.linux.it>; Mon, 21 Dec 2020 22:25:03 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 8B8201000359
 for <ltp@lists.linux.it>; Mon, 21 Dec 2020 22:25:03 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id A4628ACC4;
 Mon, 21 Dec 2020 21:25:02 +0000 (UTC)
Date: Mon, 21 Dec 2020 22:25:01 +0100
From: Petr Vorel <pvorel@suse.cz>
To: Khem Raj <raj.khem@gmail.com>
Message-ID: <20201221212501.GB4453@pevik>
References: <20201221061415.2540216-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201221061415.2540216-1-raj.khem@gmail.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] ltp-pan: Use long long int to print time_t
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

Hi Khem,

> Some newer 32bit architectures ( e.g. riscv32 ) uses 64bit time_t so
> using %ld is not sufficient to print time_t, this also fixes a crash in
> ltp-pan on riscv32

> Signed-off-by: Khem Raj <raj.khem@gmail.com>

Reviewed-by: Petr Vorel <pvorel@suse.cz>

LGTM, thank you!

Kind regards,
Petr

> ---
>  pan/ltp-pan.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

> diff --git a/pan/ltp-pan.c b/pan/ltp-pan.c
> index 8b9fbe5594..54b7cb8f26 100644
> --- a/pan/ltp-pan.c
> +++ b/pan/ltp-pan.c
> @@ -1389,8 +1389,8 @@ static void write_test_start(struct tag_pgrp *running, int no_kmsg)
>  	if (!strcmp(reporttype, "rts")) {

>  		printf
> -		    ("%s\ntag=%s stime=%ld\ncmdline=\"%s\"\ncontacts=\"%s\"\nanalysis=%s\n%s\n",
> -		     "<<<test_start>>>", running->cmd->name, running->mystime,
> +		    ("%s\ntag=%s stime=%lld\ncmdline=\"%s\"\ncontacts=\"%s\"\nanalysis=%s\n%s\n",
> +		     "<<<test_start>>>", running->cmd->name, (long long)running->mystime,
>  		     running->cmd->cmdline, "", "exit", "<<<test_output>>>");
>  	}
>  	fflush(stdout);

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
