Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id E5ADF397526
	for <lists+linux-ltp@lfdr.de>; Tue,  1 Jun 2021 16:11:12 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id ABC6B3C8019
	for <lists+linux-ltp@lfdr.de>; Tue,  1 Jun 2021 16:11:12 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id ADB863C5592
 for <ltp@lists.linux.it>; Tue,  1 Jun 2021 16:11:11 +0200 (CEST)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 316D51000DEC
 for <ltp@lists.linux.it>; Tue,  1 Jun 2021 16:11:10 +0200 (CEST)
Received: from imap.suse.de (imap-alt.suse-dmz.suse.de [192.168.254.47])
 (using TLSv1.2 with cipher ECDHE-ECDSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 5A7EF1FD2A;
 Tue,  1 Jun 2021 14:11:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1622556670;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=d/8LtOYLHOjmpyu57r8dcTE5DKcRdePo0yQQE+IKBkM=;
 b=Jj3ZT4B2x21wBbrUCO9UYCjOSqtNL8WdXf0LJiSPpN/NZ1vEeg2PPZGO4nuKT1ME5eqKNg
 hmbdiimFnjR9RyGaGw8ja5bWMp2RFBmDZBBZQ8N32mO4rCZ4Lm+geMVCBvu8x8dX27/0mx
 XD7RGw0hetN3T1270hqhs6M4jqfCdMk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1622556670;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=d/8LtOYLHOjmpyu57r8dcTE5DKcRdePo0yQQE+IKBkM=;
 b=pY1lju/1c1I+hsO1kBqBtp2Qoe6ReHxtm0wF+/Nvhx8a1Vfyh62TSor8wNb7LNvlhAlAgg
 X/5kLmSh3QHVkMAg==
Received: from imap3-int (imap-alt.suse-dmz.suse.de [192.168.254.47])
 by imap.suse.de (Postfix) with ESMTP id 243A8118DD;
 Tue,  1 Jun 2021 14:11:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1622556670;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=d/8LtOYLHOjmpyu57r8dcTE5DKcRdePo0yQQE+IKBkM=;
 b=Jj3ZT4B2x21wBbrUCO9UYCjOSqtNL8WdXf0LJiSPpN/NZ1vEeg2PPZGO4nuKT1ME5eqKNg
 hmbdiimFnjR9RyGaGw8ja5bWMp2RFBmDZBBZQ8N32mO4rCZ4Lm+geMVCBvu8x8dX27/0mx
 XD7RGw0hetN3T1270hqhs6M4jqfCdMk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1622556670;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=d/8LtOYLHOjmpyu57r8dcTE5DKcRdePo0yQQE+IKBkM=;
 b=pY1lju/1c1I+hsO1kBqBtp2Qoe6ReHxtm0wF+/Nvhx8a1Vfyh62TSor8wNb7LNvlhAlAgg
 X/5kLmSh3QHVkMAg==
Received: from director2.suse.de ([192.168.254.72]) by imap3-int with ESMTPSA
 id wreOB/4/tmCOIAAALh3uQQ
 (envelope-from <pvorel@suse.cz>); Tue, 01 Jun 2021 14:11:10 +0000
Date: Tue, 1 Jun 2021 16:11:08 +0200
From: Petr Vorel <pvorel@suse.cz>
To: ltp@lists.linux.it
Message-ID: <YLY//HUlsrK2eBb2@pevik>
References: <20210526172503.18621-1-pvorel@suse.cz>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210526172503.18621-1-pvorel@suse.cz>
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [LTP PATCH v2 1/3] nfs_lib.sh: Detect unsupported protocol
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
Cc: linux-nfs@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi Alexey,

could you please have look on v2 before I merge it?

Kind regards,
Petr

> Caused by disabled CONFIG_NFSD_V[34] in kernel config.

> Signed-off-by: Petr Vorel <pvorel@suse.cz>
> ---
> new in v2

>  testcases/network/nfs/nfs_stress/nfs_lib.sh | 6 ++++++
>  1 file changed, 6 insertions(+)

> diff --git a/testcases/network/nfs/nfs_stress/nfs_lib.sh b/testcases/network/nfs/nfs_stress/nfs_lib.sh
> index 3fad8778a..b80ee0e18 100644
> --- a/testcases/network/nfs/nfs_stress/nfs_lib.sh
> +++ b/testcases/network/nfs/nfs_stress/nfs_lib.sh
> @@ -94,9 +94,15 @@ nfs_mount()

>  	if [ $? -ne 0 ]; then
>  		cat mount.log
> +
>  		if [ "$type" = "udp" -o "$type" = "udp6" ] && tst_kvcmp -ge 5.6; then
>  			tst_brk TCONF "UDP support disabled with the kernel config NFS_DISABLE_UDP_SUPPORT?"
>  		fi
> +
> +		if grep -i "Protocol not supported" mount.log; then
> +			tst_brk TCONF "Protocol not supported"
> +		fi
> +
>  		tst_brk TBROK "mount command failed"
>  	fi
>  }

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
