Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id EEAEA963F6
	for <lists+linux-ltp@lfdr.de>; Tue, 20 Aug 2019 17:17:32 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id A7E873C1D01
	for <lists+linux-ltp@lfdr.de>; Tue, 20 Aug 2019 17:17:32 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 by picard.linux.it (Postfix) with ESMTP id 0C1BC3C1CE4
 for <ltp@lists.linux.it>; Tue, 20 Aug 2019 17:17:31 +0200 (CEST)
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 975A91401139
 for <ltp@lists.linux.it>; Tue, 20 Aug 2019 17:17:29 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id A97A8307D95F;
 Tue, 20 Aug 2019 15:17:27 +0000 (UTC)
Received: from colo-mx.corp.redhat.com
 (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 9D2091EF;
 Tue, 20 Aug 2019 15:17:27 +0000 (UTC)
Received: from zmail17.collab.prod.int.phx2.redhat.com
 (zmail17.collab.prod.int.phx2.redhat.com [10.5.83.19])
 by colo-mx.corp.redhat.com (Postfix) with ESMTP id 955D418005B9;
 Tue, 20 Aug 2019 15:17:27 +0000 (UTC)
Date: Tue, 20 Aug 2019 11:17:27 -0400 (EDT)
From: Jan Stancek <jstancek@redhat.com>
To: zhe he <zhe.he@windriver.com>
Message-ID: <1181420641.7386594.1566314247400.JavaMail.zimbra@redhat.com>
In-Reply-To: <1566311128-454547-1-git-send-email-zhe.he@windriver.com>
References: <1566311128-454547-1-git-send-email-zhe.he@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [10.43.17.163, 10.4.195.20]
Thread-Topic: Fix kernel symbol finding for meltdown case
Thread-Index: oASIkeNB9DhYR32Kuq/RFD5zeB3EzA==
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.48]); Tue, 20 Aug 2019 15:17:27 +0000 (UTC)
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-0.0 required=7.0 tests=SPF_HELO_PASS,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] cve: Fix kernel symbol finding for meltdown case
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


----- Original Message -----
> From: He Zhe <zhe.he@windriver.com>
> 
> meltdown case failed as below.
> safe_file_ops.c:219: BROK: Expected 3 conversions got 2 at meltdown.c:272

What line doesn't match current pattern?
I'm not seeing any changes in kallsyms output:

kernel: "%px %c %s\n"
        "%px %c %s\t[%s]\n"
LTP:    "%lx %c SYMBOL%c"

> 
> The case used SAFE_FILE_LINES_SCANF which is a wrapper of vsscanf which
> cannot
> extract the symbol name from the following line pattern of kernel symbol
> table.

Did you mean "extract symbol address"?

> 
> 01234567 T SYMBOL_NAME
> 
> Also the original format pattern is not correct.
> 
> This patch re-writes the symbol extraction process and adds a NULL pointer
> check.
> 
> Signed-off-by: He Zhe <zhe.he@windriver.com>
> ---
>  testcases/cve/meltdown.c | 38 +++++++++++++++++++++++++++++++-------
>  1 file changed, 31 insertions(+), 7 deletions(-)
> 
> diff --git a/testcases/cve/meltdown.c b/testcases/cve/meltdown.c
> index f78c38b..4c3f3b2 100644
> --- a/testcases/cve/meltdown.c
> +++ b/testcases/cve/meltdown.c
> @@ -248,15 +248,34 @@ set_cache_hit_threshold(void)
>  static unsigned long
>  find_symbol_in_file(const char *filename, const char *symname)
>  {
> -	unsigned long addr;
> -	char type;
> -	int ret, read;
> -	char fmt[strlen(symname) + 64];
> +	unsigned long addr = 0;
> +	int found = 0;
> +	char line[BUFSIZ] = {0};
> +	FILE *fp = NULL;
> +	char *p = NULL;
> +
> +	fp = fopen(filename, "r");
> +	if (fp == NULL) {
> +		tst_res(TBROK | TERRNO,
> +			"Failed to open file:%s for symbol:%s",
> +			filename, symname);
> +		return 0;
> +	}
>  
> -	sprintf(fmt, "%%lx %%c %s%%c", symname);
> +	while (fgets(line, BUFSIZ, fp) != NULL) {
> +		p = strstr(line, symname);
> +		/* Make sure this line is exactly for this symbol.
> +		 * Substract the EOL added by fgets for each line.
> +		 */
> +		if (p && ((strlen(p) - 1) == strlen(symname))) {
> +			found = sscanf(line, "%lx", &addr);
> +			if (found == 1)
> +				break;
> +		}
> +	}
> +	fclose(fp);
>  
> -	ret = SAFE_FILE_LINES_SCANF(filename, fmt, &addr, &type, &read);
> -	if (ret)
> +	if (found != 1)
>  		return 0;
>  
>  	return addr;
> @@ -322,6 +341,11 @@ static void run(void)
>  
>  	/* read address of saved_cmdline_addr */
>  	addr = saved_cmdline_addr;
> +	if (!addr) {
> +		tst_res(TBROK | TERRNO, "saved_cmdline_addr is 0\n");
> +		return;
> +	}
> +
>  	size = sizeof(addr);
>  	for (i = 0; i < size; i++) {
>  		ret = readbyte(spec_fd, addr);
> --
> 2.7.4
> 
> 
> --
> Mailing list info: https://lists.linux.it/listinfo/ltp
> 

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
