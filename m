Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A502293DCA
	for <lists+linux-ltp@lfdr.de>; Tue, 20 Oct 2020 15:52:15 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 2C5253C31B0
	for <lists+linux-ltp@lfdr.de>; Tue, 20 Oct 2020 15:52:15 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 by picard.linux.it (Postfix) with ESMTP id A69A73C2403
 for <ltp@lists.linux.it>; Tue, 20 Oct 2020 15:52:13 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 262D7140013E
 for <ltp@lists.linux.it>; Tue, 20 Oct 2020 15:52:12 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 67FE1AC65;
 Tue, 20 Oct 2020 13:52:12 +0000 (UTC)
Date: Tue, 20 Oct 2020 15:52:10 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Alexey Kodanev <alexey.kodanev@oracle.com>
Message-ID: <20201020135210.GA23197@dell5510>
References: <20201015122056.20715-1-alexey.kodanev@oracle.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201015122056.20715-1-alexey.kodanev@oracle.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 1/5] lib/tst_net: add generic tst_netload_compare()
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

Hi Alexey,

Reviewed-by: Petr Vorel <pvorel@suse.cz>

> * Remove duplicate code for comparing time-based results in
>   network tests (bbr, busy_poll, sctp, tcp fastopen, virt tests)

> * Expand thresholds for sctp, bbr test-cases, in order to avoid
>   false-positive failures.
I'm ok to keep more changes in single commit, but this change is affecting the
result, thus maybe put into separate commit?
(easier if somebody wants to bisect).

> * In virt_lib.sh, keep sign for VIRT_PERF_THRESHOLD.

> * TWARN when the base result is too bad (threshold_hi arg is set)

> Signed-off-by: Alexey Kodanev <alexey.kodanev@oracle.com>
> ---
>  testcases/lib/tst_net.sh                      | 31 +++++++++++++++++++
>  testcases/network/busy_poll/busy_poll01.sh    | 10 ++----
>  testcases/network/busy_poll/busy_poll02.sh    |  8 +----
>  testcases/network/busy_poll/busy_poll03.sh    |  8 +----
>  testcases/network/dccp/dccp01.sh              | 15 ++-------
>  testcases/network/sctp/sctp01.sh              |  8 +----
>  testcases/network/tcp_cc/bbr01.sh             |  2 +-
>  testcases/network/tcp_cc/bbr02.sh             |  2 +-
>  testcases/network/tcp_cc/dctcp01.sh           |  2 +-
>  testcases/network/tcp_cc/tcp_cc_lib.sh        |  8 +----
>  .../network/tcp_fastopen/tcp_fastopen_run.sh  | 15 ++-------
>  testcases/network/virt/virt_lib.sh            | 21 ++-----------
>  12 files changed, 46 insertions(+), 84 deletions(-)

> diff --git a/testcases/lib/tst_net.sh b/testcases/lib/tst_net.sh
> index d939a5780..b29e076c3 100644
> --- a/testcases/lib/tst_net.sh
> +++ b/testcases/lib/tst_net.sh
> @@ -741,6 +741,37 @@ tst_netload()
>  	return $ret
>  }

> +# Compares results for netload runs.
> +# tst_netload_compare TIME_BASE TIME THRESHOLD_LOW [THRESHOLD_HI]
> +# TIME_BASE: time taken to run netstress load test - 100%
> +# TIME: time that is compared to the base one
> +# THRESHOD_LOW: lower limit for TFAIL
> +# THRESHOD_HIGH: upper limit for TWARN
> +tst_netload_compare()
> +{
> +	local base_time=$1
> +	local new_time=$2
> +	local threshold_low=$3
> +	local threshold_hi=$4
> +
> +	if [ -z "$base_time" -o -z "$new_time" -o -z "$threshold_low" ]; then
> +		tst_brk_ TBROK "tst_netload_compare: invalid argument(s)"
> +	fi
> +
> +	local res=$(((base_time - new_time) * 100 / base_time))
> +	local msg="performance result is ${res}%"
> +
> +	if [ "$res" -lt "$threshold_low" ]; then
> +		tst_res_ TFAIL "$msg < threshold ${threshold_low}%"
> +		return
> +	fi
> +
> +	[ "$threshold_hi" ] && [ "$res" -gt "$threshold_hi" ] && \
> +		tst_res_ TWARN "$msg > threshold ${threshold_hi}%"
> +
> +	tst_res_ TPASS "$msg, in range [${threshold_low}:${threshold_hi:-}]%"

Do you mean ${threshold_hi:--} (to print "-" when $threshold_hi not set?)
As ${threshold_hi:-} prints empty string when unset (equivalent of ${threshold_hi}).


> +}

...

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
