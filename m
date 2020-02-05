Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C6C8153241
	for <lists+linux-ltp@lfdr.de>; Wed,  5 Feb 2020 14:50:20 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 358073C264C
	for <lists+linux-ltp@lfdr.de>; Wed,  5 Feb 2020 14:50:20 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 by picard.linux.it (Postfix) with ESMTP id 81E703C262A
 for <ltp@lists.linux.it>; Wed,  5 Feb 2020 14:50:18 +0100 (CET)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
 by in-7.smtp.seeweb.it (Postfix) with ESMTP id 30D8A20075C
 for <ltp@lists.linux.it>; Wed,  5 Feb 2020 14:50:16 +0100 (CET)
X-IronPort-AV: E=Sophos;i="5.70,405,1574092800"; d="scan'208";a="82920589"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
 by heian.cn.fujitsu.com with ESMTP; 05 Feb 2020 21:50:14 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
 by cn.fujitsu.com (Postfix) with ESMTP id 8AFDC406AB15;
 Wed,  5 Feb 2020 21:40:45 +0800 (CST)
Received: from [10.167.220.84] (10.167.220.84) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1395.4; Wed, 5 Feb 2020 21:50:07 +0800
To: Cyril Hrubis <chrubis@suse.cz>
References: <1579686442-24689-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
 <1579686442-24689-2-git-send-email-xuyang2018.jy@cn.fujitsu.com>
 <20200127162726.GE30831@rei.lan>
From: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
Message-ID: <ded32418-0d78-983e-4283-09625b7bad1f@cn.fujitsu.com>
Date: Wed, 5 Feb 2020 21:50:07 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:68.0) Gecko/20100101
 Thunderbird/68.0
MIME-Version: 1.0
In-Reply-To: <20200127162726.GE30831@rei.lan>
X-Originating-IP: [10.167.220.84]
X-ClientProxiedBy: G08CNEXCHPEKD05.g08.fujitsu.local (10.167.33.203) To
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: 8AFDC406AB15.ACF03
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: xuyang2018.jy@cn.fujitsu.com
X-Spam-Status: No, score=0.4 required=7.0 tests=KHOP_HELO_FCRDNS, SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2 2/2] syscalls/fcntl37: add error test for fcntl
 with F_SETPIPE_SZ
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi Cyril
> Hi!
>> +static int fds[2];
>> +static unsigned int orig_value, invalid_value, half_value, sys_value;
>> +static char *wrbuf;
>> +
>> +static struct tcase {
>> +	unsigned int *setvalue;
>> +	int exp_err;
>> +	char *message;
>> +} tcases[] = {
>> +	{&invalid_value, EINVAL,
>> +	"cmd is F_SETPIPE_SZ and the arg is beyond 1<<31"},
>> +
>> +	{&half_value, EBUSY,
>> +	"cmd is F_SETPIPE_SZ and the arg is smaller than the amount of the current used buffer space"},
> 
> Ah the EBUSY is handled here.
> 
> 
> Also these descriptions are way too long, ideally these should be
> shorter and to the point. Something as:
> 
> "F_SETPIPE_SZ and size < data stored in pipe"
> 
OK. I will short them.
>> +	{&sys_value, EPERM,
>> +	"cmd is F_SETPIPE_SZ and the arg is over /proc/sys/fs/pipe-max-size limit under unprivileged users"},
> 
> Here something as:
> 
> "F_SETPIPE_SZ and size is over limit for unpriviledged user"
> 
>> +};
>> +
>> +static void verify_fcntl(unsigned int n)
>> +{
>> +	struct tcase *tc = &tcases[n];
>> +
>> +	tst_res(TINFO, "%s", tc->message);
>> +
>> +	TEST(fcntl(fds[1], F_SETPIPE_SZ, *(tc->setvalue)));
>> +	if (TST_RET != -1)
>> +		tst_res(TFAIL, "F_SETPIPE_SZ succeed");
> 
> Maybe we should print the TST_RET here as well, it may return completely
> random number that != -1.
OK.
> 
>> +	if (TST_ERR == tc->exp_err)
>> +		tst_res(TPASS | TTERRNO, "F_SETPIPE_SZ failed as expected");
>> +	else
>> +		tst_res(TFAIL | TTERRNO, "F_SETPIPE_SZ failed expected %s bu got",
>                                                                            ^
> 									  but?
> 
> I guess that we can completely drop the "but" here and just keep it
> "... expected %s got"
> 
OK.
>> +				tst_strerrno(tc->exp_err));
>> +}
>> +
>> +static void setup(void)
>> +{
>> +	SAFE_PIPE(fds);
>> +
>> +	TEST(fcntl(fds[1], F_GETPIPE_SZ));
>> +	if (TST_ERR == EINVAL)
>> +		tst_brk(TCONF, "kernel doesn't support F_GET/SETPIPE_SZ");
>> +
>> +	orig_value = TST_RET;
>> +
>> +	wrbuf = SAFE_MALLOC(orig_value);
>> +	memset(wrbuf, 'x', orig_value);
>> +	SAFE_WRITE(1, fds[1], wrbuf, orig_value);
>> +
>> +	SAFE_FILE_SCANF("/proc/sys/fs/pipe-max-size", "%d", &sys_value);
>> +	sys_value++;
>> +
>> +	half_value = orig_value / 2;
>> +	invalid_value = (1U << 31) + 1;
>> +}
>> +
>> +static void cleanup(void)
>> +{
>> +	SAFE_FCNTL(fds[1], F_SETPIPE_SZ, orig_value);
> 
> Again there is no point in restoring the value if we close the pipe
> right after.
> 
OK.
>> +	if (fds[0] > 0)
>> +		SAFE_CLOSE(fds[0]);
>> +	if (fds[1] > 0)
>> +		SAFE_CLOSE(fds[1]);
>> +	if (wrbuf)
>> +		free(wrbuf);
> 
> Why don't we free the buffer right in the test setup? There is no point
> in keeping it allocated.
> 
OK. I will free the buffer in setup.
>> +}
>> +
>> +static struct tst_test test = {
>> +	.setup = setup,
>> +	.cleanup = cleanup,
>> +	.tcnt = ARRAY_SIZE(tcases),
>> +	.test = verify_fcntl,
>> +	.caps = (struct tst_cap []) {
>> +		TST_CAP(TST_CAP_DROP, CAP_SYS_RESOURCE),
>> +		{}
>> +	},
>> +};
> 
> Other than the minor things the rest looks good.
> 



-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
