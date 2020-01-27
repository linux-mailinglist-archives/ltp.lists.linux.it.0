Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id BEECD14A807
	for <lists+linux-ltp@lfdr.de>; Mon, 27 Jan 2020 17:27:33 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 45D483C23D8
	for <lists+linux-ltp@lfdr.de>; Mon, 27 Jan 2020 17:27:33 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 by picard.linux.it (Postfix) with ESMTP id 65CBC3C2379
 for <ltp@lists.linux.it>; Mon, 27 Jan 2020 17:27:28 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id D04171000F10
 for <ltp@lists.linux.it>; Mon, 27 Jan 2020 17:27:27 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 18D9CAD81;
 Mon, 27 Jan 2020 16:27:27 +0000 (UTC)
Date: Mon, 27 Jan 2020 17:27:26 +0100
From: Cyril Hrubis <chrubis@suse.cz>
To: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
Message-ID: <20200127162726.GE30831@rei.lan>
References: <1579686442-24689-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
 <1579686442-24689-2-git-send-email-xuyang2018.jy@cn.fujitsu.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1579686442-24689-2-git-send-email-xuyang2018.jy@cn.fujitsu.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Virus-Scanned: clamav-milter 0.99.2 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.2 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-4.smtp.seeweb.it
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi!
> +static int fds[2];
> +static unsigned int orig_value, invalid_value, half_value, sys_value;
> +static char *wrbuf;
> +
> +static struct tcase {
> +	unsigned int *setvalue;
> +	int exp_err;
> +	char *message;
> +} tcases[] = {
> +	{&invalid_value, EINVAL,
> +	"cmd is F_SETPIPE_SZ and the arg is beyond 1<<31"},
> +
> +	{&half_value, EBUSY,
> +	"cmd is F_SETPIPE_SZ and the arg is smaller than the amount of the current used buffer space"},

Ah the EBUSY is handled here.


Also these descriptions are way too long, ideally these should be
shorter and to the point. Something as:

"F_SETPIPE_SZ and size < data stored in pipe"

> +	{&sys_value, EPERM,
> +	"cmd is F_SETPIPE_SZ and the arg is over /proc/sys/fs/pipe-max-size limit under unprivileged users"},

Here something as:

"F_SETPIPE_SZ and size is over limit for unpriviledged user"

> +};
> +
> +static void verify_fcntl(unsigned int n)
> +{
> +	struct tcase *tc = &tcases[n];
> +
> +	tst_res(TINFO, "%s", tc->message);
> +
> +	TEST(fcntl(fds[1], F_SETPIPE_SZ, *(tc->setvalue)));
> +	if (TST_RET != -1)
> +		tst_res(TFAIL, "F_SETPIPE_SZ succeed");

Maybe we should print the TST_RET here as well, it may return completely
random number that != -1.

> +	if (TST_ERR == tc->exp_err)
> +		tst_res(TPASS | TTERRNO, "F_SETPIPE_SZ failed as expected");
> +	else
> +		tst_res(TFAIL | TTERRNO, "F_SETPIPE_SZ failed expected %s bu got",
                                                                          ^
									  but?

I guess that we can completely drop the "but" here and just keep it
"... expected %s got"

> +				tst_strerrno(tc->exp_err));
> +}
> +
> +static void setup(void)
> +{
> +	SAFE_PIPE(fds);
> +
> +	TEST(fcntl(fds[1], F_GETPIPE_SZ));
> +	if (TST_ERR == EINVAL)
> +		tst_brk(TCONF, "kernel doesn't support F_GET/SETPIPE_SZ");
> +
> +	orig_value = TST_RET;
> +
> +	wrbuf = SAFE_MALLOC(orig_value);
> +	memset(wrbuf, 'x', orig_value);
> +	SAFE_WRITE(1, fds[1], wrbuf, orig_value);
> +
> +	SAFE_FILE_SCANF("/proc/sys/fs/pipe-max-size", "%d", &sys_value);
> +	sys_value++;
> +
> +	half_value = orig_value / 2;
> +	invalid_value = (1U << 31) + 1;
> +}
> +
> +static void cleanup(void)
> +{
> +	SAFE_FCNTL(fds[1], F_SETPIPE_SZ, orig_value);

Again there is no point in restoring the value if we close the pipe
right after.

> +	if (fds[0] > 0)
> +		SAFE_CLOSE(fds[0]);
> +	if (fds[1] > 0)
> +		SAFE_CLOSE(fds[1]);
> +	if (wrbuf)
> +		free(wrbuf);

Why don't we free the buffer right in the test setup? There is no point
in keeping it allocated.

> +}
> +
> +static struct tst_test test = {
> +	.setup = setup,
> +	.cleanup = cleanup,
> +	.tcnt = ARRAY_SIZE(tcases),
> +	.test = verify_fcntl,
> +	.caps = (struct tst_cap []) {
> +		TST_CAP(TST_CAP_DROP, CAP_SYS_RESOURCE),
> +		{}
> +	},
> +};

Other than the minor things the rest looks good.

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
