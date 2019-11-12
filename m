Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B7E9F8FBE
	for <lists+linux-ltp@lfdr.de>; Tue, 12 Nov 2019 13:37:53 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 3F49B3C25BD
	for <lists+linux-ltp@lfdr.de>; Tue, 12 Nov 2019 13:37:53 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 by picard.linux.it (Postfix) with ESMTP id BD5CB3C2585
 for <ltp@lists.linux.it>; Tue, 12 Nov 2019 13:37:48 +0100 (CET)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 39D2F600A54
 for <ltp@lists.linux.it>; Tue, 12 Nov 2019 13:37:46 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 7CB73AC12;
 Tue, 12 Nov 2019 12:37:46 +0000 (UTC)
Date: Tue, 12 Nov 2019 13:37:44 +0100
From: Petr Vorel <pvorel@suse.cz>
To: Jan Stancek <jstancek@redhat.com>
Message-ID: <20191112123744.GA760@dell5510>
References: <95d94fede00533a07fc604de3252636b094fc8f8.1573550061.git.jstancek@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <95d94fede00533a07fc604de3252636b094fc8f8.1573550061.git.jstancek@redhat.com>
User-Agent: Mutt/1.11.3 (2019-02-01)
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] acct02: relax ac_btime checks
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

Hi Jan,

> ac_btime is calculated back from current time and isn't accurate.
> Problems include nanoseconds accumulation (lags behind gettimeofday),
> suspend/resume isn't taken into account and any adjtime() (like DST
> change) will cause ac_btime to jump as well.

> Relax the condition to ~2h around gettimeofday value at start of
> the test. That should be enough to cover usual DST time jumps.

> Signed-off-by: Jan Stancek <jstancek@redhat.com>
Reviewed-by: Petr Vorel <pvorel@suse.cz>
Tested-by: Petr Vorel <pvorel@suse.cz>
on both 390x and intel.

LGTM, although on in intel I got quite a lot of entries:

acct02.c:202: INFO: Number of accounting file entries tested: 159

> ---
>  testcases/kernel/syscalls/acct/acct02.c | 17 ++++++++---------
>  1 file changed, 8 insertions(+), 9 deletions(-)

> diff --git a/testcases/kernel/syscalls/acct/acct02.c b/testcases/kernel/syscalls/acct/acct02.c
> index 890568b08774..2f1290fa287f 100644
> --- a/testcases/kernel/syscalls/acct/acct02.c
> +++ b/testcases/kernel/syscalls/acct/acct02.c
> @@ -74,7 +74,8 @@ static int verify_acct(void *acc, int elap_time)
>  {
>  	int sys_time  = UNPACK(ACCT_MEMBER(ac_stime));
>  	int user_time = UNPACK(ACCT_MEMBER(ac_stime));
> -	int ret = 0, tmp;
> +	unsigned int btime_diff;
> +	int ret = 0;
>  	float tmp2;
We could rename tmp2 to tmp (but understand if you don't want to bother
with it).

>  	if (strcmp(ACCT_MEMBER(ac_comm), COMMAND)) {
> @@ -83,15 +84,13 @@ static int verify_acct(void *acc, int elap_time)
>  		ret = 1;
>  	}

> -	if (ACCT_MEMBER(ac_btime) < start_time) {
> -		tst_res(TINFO, "ac_btime < %d (%d)", start_time,
> -			ACCT_MEMBER(ac_btime));
> -		ret = 1;
> -	}
> +	if (start_time > ACCT_MEMBER(ac_btime))
> +		btime_diff = start_time - ACCT_MEMBER(ac_btime);
> +	else
> +		btime_diff = ACCT_MEMBER(ac_btime) - start_time;

> -	tmp = ACCT_MEMBER(ac_btime) - start_time;
> -	if (tmp > 1) {
> -		tst_res(TINFO, "ac_btime - %d > 1 (%d)", start_time, tmp);
> +	if (btime_diff > 7200) {
IMHO It's probably obvious that it's time in seconds without digging in git, so
we don't have to bother with a constant definition.

> +		tst_res(TINFO, "ac_btime_diff %u", btime_diff);
>  		ret = 1;
>  	}

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
