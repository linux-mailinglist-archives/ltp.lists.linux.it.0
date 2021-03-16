Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id B5F5733D9B6
	for <lists+linux-ltp@lfdr.de>; Tue, 16 Mar 2021 17:44:00 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 71F763C6427
	for <lists+linux-ltp@lfdr.de>; Tue, 16 Mar 2021 17:44:00 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 by picard.linux.it (Postfix) with ESMTP id 52F7D3C565A
 for <ltp@lists.linux.it>; Tue, 16 Mar 2021 17:43:57 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id E89B91A008A1
 for <ltp@lists.linux.it>; Tue, 16 Mar 2021 17:43:56 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 3C412AC23;
 Tue, 16 Mar 2021 16:43:56 +0000 (UTC)
Date: Tue, 16 Mar 2021 17:43:54 +0100
From: Petr Vorel <pvorel@suse.cz>
To: Shiyang Ruan <ruansy.fnst@fujitsu.com>
Message-ID: <YFDgSgFNMH8fUwNr@pevik>
References: <20210304021304.1126635-1-ruansy.fnst@fujitsu.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210304021304.1126635-1-ruansy.fnst@fujitsu.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 1/2] syscalls/getppid01: Convert to the new API
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

Hi Ruan,

Reviewed-by: Petr Vorel <pvorel@suse.cz>

You extended test: checking PID range, good.

> +/*\
> + * [DESCRIPTION]
> + * 
> + * Test whether parent process id that getpid() returns is out of range.
> +\*/
nit: only */

...
> +	SAFE_FILE_SCANF("/proc/sys/kernel/pid_max", "%d\n", &pid_max);

> +	if (ppid > pid_max)
> +		tst_res(TFAIL, "getppid() returned %d, out of range!", ppid);
> +	else
> +		tst_res(TPASS, "getppid() returned %d", ppid);
>  }

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
