Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id ED03D298734
	for <lists+linux-ltp@lfdr.de>; Mon, 26 Oct 2020 08:06:48 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 46C223C5622
	for <lists+linux-ltp@lfdr.de>; Mon, 26 Oct 2020 08:06:48 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 by picard.linux.it (Postfix) with ESMTP id 974EB3C2507
 for <ltp@lists.linux.it>; Mon, 26 Oct 2020 08:06:43 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 55C45600780
 for <ltp@lists.linux.it>; Mon, 26 Oct 2020 08:06:43 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id A791CACA3;
 Mon, 26 Oct 2020 07:06:42 +0000 (UTC)
Date: Mon, 26 Oct 2020 08:06:41 +0100
From: Petr Vorel <pvorel@suse.cz>
To: Alexey Kodanev <alexey.kodanev@oracle.com>
Message-ID: <20201026070641.GD21306@dell5510>
References: <20201015122056.20715-1-alexey.kodanev@oracle.com>
 <20201015122056.20715-3-alexey.kodanev@oracle.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201015122056.20715-3-alexey.kodanev@oracle.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 3/5] network/virt: skip setting neighbour table if
 tunnel doesn't have hwaddr
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

good idea.

Reviewed-by: Petr Vorel <pvorel@suse.cz>

> diff --git a/testcases/network/virt/virt_lib.sh b/testcases/network/virt/virt_lib.sh
> index 80b9bcc90..f62120347 100644
> --- a/testcases/network/virt/virt_lib.sh
> +++ b/testcases/network/virt/virt_lib.sh
> @@ -229,10 +229,13 @@ virt_minimize_timeout()
>  	local mac_loc="$(cat /sys/class/net/ltp_v0/address)"
>  	local mac_rmt="$(tst_rhost_run -c 'cat /sys/class/net/ltp_v0/address')"

> -	ROD_SILENT "ip ne replace $ip_virt_remote lladdr \
> -		    $mac_rmt nud permanent dev ltp_v0"
> -	tst_rhost_run -s -c "ip ne replace $ip_virt_local lladdr \
> -			     $mac_loc nud permanent dev ltp_v0"
> +	if [ "$mac_loc" ]; then
NOTE: I guess it's safe to check only $mac_rmt (and not $mac_rmt)

> +		ROD_SILENT "ip ne replace $ip_virt_remote lladdr \
> +			    $mac_rmt nud permanent dev ltp_v0"
> +		tst_rhost_run -s -c "ip ne replace $ip_virt_local lladdr \
> +				     $mac_loc nud permanent dev ltp_v0"
> +	fi
> +
>  	virt_tcp_syn=$(sysctl -n net.ipv4.tcp_syn_retries)
>  	ROD sysctl -q net.ipv4.tcp_syn_retries=1
>  }

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
