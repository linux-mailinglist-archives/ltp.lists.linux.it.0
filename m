Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C7606351B
	for <lists+linux-ltp@lfdr.de>; Tue,  9 Jul 2019 13:44:18 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 1497F3C1CFC
	for <lists+linux-ltp@lfdr.de>; Tue,  9 Jul 2019 13:44:18 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 by picard.linux.it (Postfix) with ESMTP id 1397E3C003C
 for <ltp@lists.linux.it>; Tue,  9 Jul 2019 13:44:14 +0200 (CEST)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id BCEC41001268
 for <ltp@lists.linux.it>; Tue,  9 Jul 2019 13:44:09 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id B769AABD7;
 Tue,  9 Jul 2019 11:44:13 +0000 (UTC)
Date: Tue, 9 Jul 2019 13:44:13 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: Po-Hsu Lin <po-hsu.lin@canonical.com>
Message-ID: <20190709114412.GC5888@rei.lan>
References: <20190703102303.32166-1-po-hsu.lin@canonical.com>
 <20190703102303.32166-3-po-hsu.lin@canonical.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190703102303.32166-3-po-hsu.lin@canonical.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Virus-Scanned: clamav-milter 0.99.2 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.2 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 2/3] zram/zram_lib.sh: fix variable name and
 algorithm retrieval
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
>  	tst_resm TINFO "test that we can set compression algorithm"
>  
> -	local algs="$(cat /sys/block/zram0/comp_algorithm)"
> -	tst_resm TINFO "supported algs: $algs"
> +	local zram_algs="$(sed 's/[][]//g' /sys/block/zram0/comp_algorithm)"

This has still the same name as the variable set in the zram01.sh.

There are two options what to do here, either we remove zram_algs from
the zram01.sh or set the algorithms to the ones defined in the zram01.sh
test at the end of this function.

> +	tst_resm TINFO "supported algs: $zram_algs"
>  	local i=0
>  	for alg in $zram_algs; do
>  		local sys_path="/sys/block/zram${i}/comp_algorithm"
> -- 
> 2.17.1
> 
> 
> -- 
> Mailing list info: https://lists.linux.it/listinfo/ltp

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
