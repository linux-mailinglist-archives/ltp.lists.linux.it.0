Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id C20D1BDF8B
	for <lists+linux-ltp@lfdr.de>; Wed, 25 Sep 2019 15:56:43 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 4FF6D3C20C6
	for <lists+linux-ltp@lfdr.de>; Wed, 25 Sep 2019 15:56:43 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 by picard.linux.it (Postfix) with ESMTP id 0D8CA3C1CD9
 for <ltp@lists.linux.it>; Wed, 25 Sep 2019 15:56:38 +0200 (CEST)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id A69D01401852
 for <ltp@lists.linux.it>; Wed, 25 Sep 2019 15:56:37 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id D7360AF3B
 for <ltp@lists.linux.it>; Wed, 25 Sep 2019 13:56:36 +0000 (UTC)
Date: Wed, 25 Sep 2019 15:56:34 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Cyril Hrubis <chrubis@suse.cz>
Message-ID: <20190925135634.GA32581@dell5510>
References: <20190925094721.18932-1-chrubis@suse.cz>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190925094721.18932-1-chrubis@suse.cz>
User-Agent: Mutt/1.11.3 (2019-02-01)
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] syscalls/acct02: Check read size.
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

Hi Cyril,

> This is just a minor adjustements that checks that we get correct size
> from read before we attempt to validate the data we read in order to
> print more meaningful failure message.

> Signed-off-by: Cyril Hrubis <chrubis@suse.cz>
Reviewed-by: Petr Vorel <pvorel@suse.cz>

>  testcases/kernel/syscalls/acct/acct02.c | 16 ++++++++++++++--
...
>  	do {
> -		tst_res(TINFO, "== entry %d ==", ++i);
> -
>  		read_bytes = SAFE_READ(0, fd, &acct_struct, acct_size);

> +		if (i == 0 && read_bytes == 0) {
> +			tst_res(TFAIL, "acct file is empty");
> +			goto exit;
> +		}
> +
> +		if (read_bytes != acct_size) {
> +			tst_res(TFAIL, "incomplete read %i bytes, expected %i",
> +			        read_bytes, acct_size);
> +			goto exit;
> +		}
> +
> +		tst_res(TINFO, "== entry %d ==", ++i);
> +
>  		if (v3)
>  			ret = verify_acct(&acct_struct.v3, acct_struct.v3.ac_etime);
>  		else
> @@ -192,6 +203,7 @@ static void run(void)
>  	else
>  		tst_res(TPASS, "acct() wrote correct file contents!");

> +exit:
>  	SAFE_CLOSE(fd);
>  }

OK, on s390 where it's failing it actually catches "incomplete read":

tst_kconfig.c:62: INFO: Parsing kernel config '/proc/config.gz'
tst_test.c:1118: INFO: Timeout per run is 0h 05m 00s
tst_kconfig.c:62: INFO: Parsing kernel config '/proc/config.gz'
acct02.c:234: INFO: Verifying using 'struct acct_v3'
acct02.c:187: INFO: == entry 1 ==
acct02.c:147: INFO: ac_version != 3 (131)
acct02.c:187: INFO: == entry 2 ==
acct02.c:82: INFO: ac_comm != 'acct02_helper' ('acct02')
acct02.c:133: INFO: ac_exitcode != 32768 (0)
acct02.c:141: INFO: ac_ppid != 54783 (54781)
acct02.c:147: INFO: ac_version != 3 (131)
acct02.c:183: FAIL: incomplete read 0 bytes, expected 64

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
