Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id AFF68F4FA8
	for <lists+linux-ltp@lfdr.de>; Fri,  8 Nov 2019 16:29:10 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 097183C2409
	for <lists+linux-ltp@lfdr.de>; Fri,  8 Nov 2019 16:29:10 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 by picard.linux.it (Postfix) with ESMTP id CEEC93C1C90
 for <ltp@lists.linux.it>; Fri,  8 Nov 2019 16:29:05 +0100 (CET)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 0717320FBB1
 for <ltp@lists.linux.it>; Fri,  8 Nov 2019 16:29:04 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id E6E8FAC31
 for <ltp@lists.linux.it>; Fri,  8 Nov 2019 15:29:03 +0000 (UTC)
Date: Fri, 8 Nov 2019 16:29:02 +0100
From: Cyril Hrubis <chrubis@suse.cz>
To: Martin Doucha <mdoucha@suse.cz>
Message-ID: <20191108152902.GA8931@rei>
References: <20191105082322.GA16218@dell5510>
 <20191105090339.6522-1-mdoucha@suse.cz>
 <20191105090339.6522-2-mdoucha@suse.cz>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191105090339.6522-2-mdoucha@suse.cz>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Virus-Scanned: clamav-milter 0.99.2 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.2 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2 1/1] Fix compression ratio calculation in zram01
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
> +		if [ ! -f "/sys/block/zram$i/mm_stat" ]; then
> +			if [ $i -eq 0 ]; then
> +				tst_resm TCONF "zram compression ratio test requires zram mm_stat sysfs file"
> +			fi
>  
> -	tst_resm TINFO "zram used ${used_mem}M, zram disk sizes ${total_size}M"
> +			continue
> +		fi
>  
> -	local v=$((100 * $total_size / $used_mem))
> +		local compr_size=`cat "/sys/block/zram$i/mm_stat" | awk '{print $2}'`

Why not just:

	awk '{print $2}' /sys/block/zram$i/mm_stat

Other than this it looks good. Also no need to send v3, I can fix this
when applying.


-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
