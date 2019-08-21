Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B84B974E3
	for <lists+linux-ltp@lfdr.de>; Wed, 21 Aug 2019 10:27:03 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 1B6A63C1CFB
	for <lists+linux-ltp@lfdr.de>; Wed, 21 Aug 2019 10:27:03 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 by picard.linux.it (Postfix) with ESMTP id 9509E3C1866
 for <ltp@lists.linux.it>; Wed, 21 Aug 2019 10:27:01 +0200 (CEST)
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
 (using TLSv1.1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 04CEC1A011C2
 for <ltp@lists.linux.it>; Wed, 21 Aug 2019 10:26:58 +0200 (CEST)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
 by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id x7L8QsEw022729
 (version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
 Wed, 21 Aug 2019 01:26:54 -0700 (PDT)
Received: from [128.224.162.221] (128.224.162.221) by ALA-HCA.corp.ad.wrs.com
 (147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.468.0;
 Wed, 21 Aug 2019 01:26:53 -0700
To: Jan Stancek <jstancek@redhat.com>
References: <1566311128-454547-1-git-send-email-zhe.he@windriver.com>
 <1181420641.7386594.1566314247400.JavaMail.zimbra@redhat.com>
From: He Zhe <zhe.he@windriver.com>
Message-ID: <ebb19cf0-02e8-30b4-9e17-1eae1effaba5@windriver.com>
Date: Wed, 21 Aug 2019 16:26:50 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <1181420641.7386594.1566314247400.JavaMail.zimbra@redhat.com>
Content-Language: en-US
X-Originating-IP: [128.224.162.221]
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
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



On 8/20/19 11:17 PM, Jan Stancek wrote:
> ----- Original Message -----
>> From: He Zhe <zhe.he@windriver.com>
>>
>> meltdown case failed as below.
>> safe_file_ops.c:219: BROK: Expected 3 conversions got 2 at meltdown.c:272
> What line doesn't match current pattern?
> I'm not seeing any changes in kallsyms output:
>
> kernel: "%px %c %s\n"
>         "%px %c %s\t[%s]\n"
> LTP:    "%lx %c SYMBOL%c"

Thanks and yes, you're correct.

I just found the root cause and I'll send v2.

find_kernel_symbol is defined to try twice with each of /proc/kallsyms and
/boot/System.map-%s. Currently if the symbol is not found in /proc/kallsyms,
when kernel option CONFIG_KALLSYMS_ALL is disabled, it would stop the case
immediately due to SAFE_FILE_LINES_SCANF.

Zhe

>
>> The case used SAFE_FILE_LINES_SCANF which is a wrapper of vsscanf which
>> cannot
>> extract the symbol name from the following line pattern of kernel symbol
>> table.
> Did you mean "extract symbol address"?
>
>> 01234567 T SYMBOL_NAME
>>
>> Also the original format pattern is not correct.
>>
>> This patch re-writes the symbol extraction process and adds a NULL pointer
>> check.
>>
>> Signed-off-by: He Zhe <zhe.he@windriver.com>
>> ---
>>  testcases/cve/meltdown.c | 38 +++++++++++++++++++++++++++++++-------
>>  1 file changed, 31 insertions(+), 7 deletions(-)
>>
>> diff --git a/testcases/cve/meltdown.c b/testcases/cve/meltdown.c
>> index f78c38b..4c3f3b2 100644
>> --- a/testcases/cve/meltdown.c
>> +++ b/testcases/cve/meltdown.c
>> @@ -248,15 +248,34 @@ set_cache_hit_threshold(void)
>>  static unsigned long
>>  find_symbol_in_file(const char *filename, const char *symname)
>>  {
>> -	unsigned long addr;
>> -	char type;
>> -	int ret, read;
>> -	char fmt[strlen(symname) + 64];
>> +	unsigned long addr = 0;
>> +	int found = 0;
>> +	char line[BUFSIZ] = {0};
>> +	FILE *fp = NULL;
>> +	char *p = NULL;
>> +
>> +	fp = fopen(filename, "r");
>> +	if (fp == NULL) {
>> +		tst_res(TBROK | TERRNO,
>> +			"Failed to open file:%s for symbol:%s",
>> +			filename, symname);
>> +		return 0;
>> +	}
>>  
>> -	sprintf(fmt, "%%lx %%c %s%%c", symname);
>> +	while (fgets(line, BUFSIZ, fp) != NULL) {
>> +		p = strstr(line, symname);
>> +		/* Make sure this line is exactly for this symbol.
>> +		 * Substract the EOL added by fgets for each line.
>> +		 */
>> +		if (p && ((strlen(p) - 1) == strlen(symname))) {
>> +			found = sscanf(line, "%lx", &addr);
>> +			if (found == 1)
>> +				break;
>> +		}
>> +	}
>> +	fclose(fp);
>>  
>> -	ret = SAFE_FILE_LINES_SCANF(filename, fmt, &addr, &type, &read);
>> -	if (ret)
>> +	if (found != 1)
>>  		return 0;
>>  
>>  	return addr;
>> @@ -322,6 +341,11 @@ static void run(void)
>>  
>>  	/* read address of saved_cmdline_addr */
>>  	addr = saved_cmdline_addr;
>> +	if (!addr) {
>> +		tst_res(TBROK | TERRNO, "saved_cmdline_addr is 0\n");
>> +		return;
>> +	}
>> +
>>  	size = sizeof(addr);
>>  	for (i = 0; i < size; i++) {
>>  		ret = readbyte(spec_fd, addr);
>> --
>> 2.7.4
>>
>>
>> --
>> Mailing list info: https://lists.linux.it/listinfo/ltp
>>


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
