Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id C276CE8AD5
	for <lists+linux-ltp@lfdr.de>; Tue, 29 Oct 2019 15:35:31 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 4AC223C2273
	for <lists+linux-ltp@lfdr.de>; Tue, 29 Oct 2019 15:35:31 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 by picard.linux.it (Postfix) with ESMTP id 482593C1CB4
 for <ltp@lists.linux.it>; Tue, 29 Oct 2019 15:35:29 +0100 (CET)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 752101000D48
 for <ltp@lists.linux.it>; Tue, 29 Oct 2019 15:35:28 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 68244B201;
 Tue, 29 Oct 2019 14:35:27 +0000 (UTC)
Date: Tue, 29 Oct 2019 15:35:25 +0100
From: Petr Vorel <pvorel@suse.cz>
To: Joerg Vehlow <lkml@jv-coder.de>, Alexey Kodanev <alexey.kodanev@oracle.com>
Message-ID: <20191029143525.GA4187@dell5510>
References: <20191009062300.50219-1-lkml@jv-coder.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191009062300.50219-1-lkml@jv-coder.de>
User-Agent: Mutt/1.11.3 (2019-02-01)
X-Virus-Scanned: clamav-milter 0.99.2 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] tst_net.sh: Allow execution if xfrm is disabled
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
Cc: Joerg Vehlow <joerg.vehlow@aox-tech.de>, ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi Joerg,

> From: Joerg Vehlow <joerg.vehlow@aox-tech.de>

> If the kernel is configured without xfrm support, the setup of the
> interfaces for communication between local and remote host fails,
> because it tries to flush xfrm state and policy.
> There is no need to flush, if the system doesn't even support xfrm.

> Signed-off-by: Joerg Vehlow <joerg.vehlow@aox-tech.de>
Reviewed-by: Petr Vorel <pvorel@suse.cz>
Tested-by: Petr Vorel <pvorel@suse.cz>

> ---
>  testcases/lib/tst_net.sh | 12 ++++++++----
>  1 file changed, 8 insertions(+), 4 deletions(-)

> diff --git a/testcases/lib/tst_net.sh b/testcases/lib/tst_net.sh
> index 6c3ae708d..3aaf21cb5 100644
> --- a/testcases/lib/tst_net.sh
> +++ b/testcases/lib/tst_net.sh
> @@ -430,8 +430,10 @@ tst_init_iface()
>  	tst_res_ TINFO "initialize '$type' '$iface' interface"

>  	if [ "$type" = "lhost" ]; then
> -		ip xfrm policy flush || return $?
> -		ip xfrm state flush || return $?
> +		if ip xfrm state 1>/dev/null 2>&1; then
> +			ip xfrm policy flush || return $?
> +			ip xfrm state flush || return $?
> +		fi
>  		ip link set $iface down || return $?
>  		ip route flush dev $iface || return $?
>  		ip addr flush dev $iface || return $?
> @@ -439,8 +441,10 @@ tst_init_iface()
>  		return $?
>  	fi

> -	tst_rhost_run -c "ip xfrm policy flush" || return $?
> -	tst_rhost_run -c "ip xfrm state flush" || return $?
> +	if tst_rhost_run -c "ip xfrm state 1>/dev/null 2>&1"; then
> +		tst_rhost_run -c "ip xfrm policy flush" || return $?
> +		tst_rhost_run -c "ip xfrm state flush" || return $?
> +	fi
>  	tst_rhost_run -c "ip link set $iface down" || return $?
>  	tst_rhost_run -c "ip route flush dev $iface" || return $?
>  	tst_rhost_run -c "ip addr flush dev $iface" || return $?

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
