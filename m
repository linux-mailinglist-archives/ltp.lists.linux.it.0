Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FDFE355527
	for <lists+linux-ltp@lfdr.de>; Tue,  6 Apr 2021 15:31:04 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id B1C143C75A2
	for <lists+linux-ltp@lfdr.de>; Tue,  6 Apr 2021 15:31:03 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 4994D3C063A
 for <ltp@lists.linux.it>; Tue,  6 Apr 2021 15:31:00 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id CAAA11000F23
 for <ltp@lists.linux.it>; Tue,  6 Apr 2021 15:30:59 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id EDAABB15B;
 Tue,  6 Apr 2021 13:30:58 +0000 (UTC)
Date: Tue, 6 Apr 2021 15:30:57 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Zhao Gongyi <zhaogongyi@huawei.com>
Message-ID: <YGxikZJsqr7Knlc8@pevik>
References: <20210330122041.19700-1-zhaogongyi@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210330122041.19700-1-zhaogongyi@huawei.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] syscalls/getdtablesize01: Add abnormal handling
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

Hi,

> When /etc/hosts is not exist, test would fail, actually, we chould skip the
> the problem to improve maintainability.

...
> +++ b/testcases/kernel/syscalls/getdtablesize/getdtablesize01.c
> @@ -100,6 +100,8 @@ int main(void)
>  		tst_resm(TPASS, "%d = %d", count, (max_val_opfiles - 1));
>  	else if (fd < 0 && errno == ENFILE)
>  		tst_brkm(TCONF, cleanup, "Reached maximum number of open files for the system");
> +	else if (fd == 0)
> +		tst_brkm(TCONF, cleanup, "Maybe /etc/hosts is not exist");
>  	else
>  		tst_resm(TFAIL, "%d != %d", count, (max_val_opfiles - 1));

Why not to test for existence of the file in main(), where is file being opened?

	fd = open("/etc/hosts", O_RDONLY);

Also current patch does not work when I test on system without /etc/hosts:

./getdtablesize01
getdtablesize01    0  TINFO  :  Maximum number of files a process can have opened is 1024
getdtablesize01    0  TINFO  :  Checking with the value returned by getrlimit...RLIMIT_NOFILE
getdtablesize01    1  TPASS  :  got correct dtablesize, value is 1024
getdtablesize01    0  TINFO  :  Checking Max num of files that can be opened by a process.Should be: RLIMIT_NOFILE - 1
getdtablesize01    2  TFAIL  :  getdtablesize01.c:106: 0 != 1023

Besides, it'd help to also rewrite the test to the new API.

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
