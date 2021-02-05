Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id C6D9831054A
	for <lists+linux-ltp@lfdr.de>; Fri,  5 Feb 2021 07:59:57 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 896CC3C5E0C
	for <lists+linux-ltp@lfdr.de>; Fri,  5 Feb 2021 07:59:57 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 by picard.linux.it (Postfix) with ESMTP id D94DB3C230F
 for <ltp@lists.linux.it>; Fri,  5 Feb 2021 07:59:55 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 8D6F9601BD2
 for <ltp@lists.linux.it>; Fri,  5 Feb 2021 07:59:55 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 98CB3ACBA;
 Fri,  5 Feb 2021 06:59:54 +0000 (UTC)
Date: Fri, 5 Feb 2021 07:59:53 +0100
From: Petr Vorel <pvorel@suse.cz>
To: Alexey Kodanev <alexey.kodanev@oracle.com>
Message-ID: <YBzs6V68xkamzfcx@pevik>
References: <20210202133454.59224-1-alexey.kodanev@oracle.com>
 <20210202133454.59224-2-alexey.kodanev@oracle.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210202133454.59224-2-alexey.kodanev@oracle.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 1/3] lib/tst_net.sh: print all netstress results
 in tst_netload()
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

...
> -	res=$((res / $passed))
> -	echo "$res" > $rfile
> +	local mean res_sum
r should be also local.
> +	for r in $results; do
> +		res_sum="$((res_sum + r))"
> +	done
> +	mean=$((res_sum / passed))
> +	echo "$mean" > $rfile

> -	tst_res_ TPASS "netstress passed, mean time '$res' ms"
> +	tst_res_ TPASS "netstress passed, mean time $mean ms, data:$results"

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
