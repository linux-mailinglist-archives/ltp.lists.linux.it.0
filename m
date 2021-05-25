Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 54C233906B5
	for <lists+linux-ltp@lfdr.de>; Tue, 25 May 2021 18:32:01 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id B20D93C8112
	for <lists+linux-ltp@lfdr.de>; Tue, 25 May 2021 18:32:00 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id E5C3E3C2B88
 for <ltp@lists.linux.it>; Tue, 25 May 2021 18:31:56 +0200 (CEST)
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [IPv6:2a00:1450:4864:20::132])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 5C3B9100040E
 for <ltp@lists.linux.it>; Tue, 25 May 2021 18:31:56 +0200 (CEST)
Received: by mail-lf1-x132.google.com with SMTP id b26so30932519lfq.4
 for <ltp@lists.linux.it>; Tue, 25 May 2021 09:31:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bell-sw-com.20150623.gappssmtp.com; s=20150623;
 h=from:subject:to:cc:references:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=SnfbBBXpQEyAdAlrdaGWIodfm4ZE6yLBBbBVAhRm72o=;
 b=YiguYJ17cR2/y6B3hw2I+VLKHJc12z6AONGAtIKyeRerZyal5mhv0mnTvxwUb0/keo
 +I42S+F2kaGmPszEtfaXNr9vhLkEF1jIz5HAl80ssxXryVSmjuhEX+JFADaMTxu41v2Z
 kbe18BLo1DBp1sGceSEmbR4n4gi2jGxWqbLOXc1dV2NkKN1iL3uYdZsaEABTk+Hm0HiO
 sqJU1S1WN+W0qZ+0Ms3lv4E1eKponIrFFsXlYrCF1yNp+m04raZSODcv/Q38bjIRmMFO
 n8BOT29coFOqgeM0eA7bysKO2FL7kEToGGzC60J1Qv3VOw27elFl0HzpGcivfcJN+gZF
 9XeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:subject:to:cc:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=SnfbBBXpQEyAdAlrdaGWIodfm4ZE6yLBBbBVAhRm72o=;
 b=qAg1NWSnolj9aAcILLY0yZVrgWMsnJS45BAl8zZ0oRoy85zGngKGajqrd6kqmKQ5uN
 PXJIGOTmmDog+Z8S6Dl565m32y7C5h4fD/wlSlvzEFKL6p8G3XhcICWilyPfBMiZLx8z
 cOeg6/DIcLX8Q0Rs2bZGDpZ9tYmv9Y8jIRg3JmGA3MK0lmmslDb96pAy4ArNhQWHBzgu
 SzASgUeqphoODCTt9iLDwWKOkGdPx6P4aUdOGsB7fUMzsKm5ZEFY8x7Mw52ahEHsOjfw
 IpQ5ZIc0zJb3GUlJe23myrz0M+UmJNxzf2NkURjR5FNc1kdDPIqcKFEfgMFt2zg8h0wx
 4Hig==
X-Gm-Message-State: AOAM531digqY7uQ9C36Qt53pDfkDXWUVr819JtuNbuTYX+5oEvoZoXos
 4Qs2xWGqWgq18hYgNJY9oZ5r
X-Google-Smtp-Source: ABdhPJwKC1Uljdk+leiVBHC3Qhe5N/LjTMHKV0r9Wr4+AcQhbL3qExsYa1XHMWkrZHg+B1s0UVKYBg==
X-Received: by 2002:ac2:5ddb:: with SMTP id x27mr1751878lfq.31.1621960315729; 
 Tue, 25 May 2021 09:31:55 -0700 (PDT)
Received: from [192.168.1.52] ([95.161.221.177])
 by smtp.gmail.com with ESMTPSA id i21sm1775271lfv.182.2021.05.25.09.31.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 25 May 2021 09:31:55 -0700 (PDT)
From: Alexey Kodanev <aleksei.kodanev@bell-sw.com>
To: Petr Vorel <pvorel@suse.cz>
References: <20210525135012.877-1-pvorel@suse.cz>
 <20210525135012.877-3-pvorel@suse.cz>
Message-ID: <ef263c10-d6f6-0ec7-aa4b-2e305f920d15@bell-sw.com>
Date: Tue, 25 May 2021 19:31:54 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210525135012.877-3-pvorel@suse.cz>
Content-Language: en-US
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 3/3] nfs_lib.sh: Print verbose mount info on error
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
Cc: NeilBrown <neilb@suse.de>, ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

On 25.05.2021 16:50, Petr Vorel wrote:
> Suggested-by: NeilBrown <neilb@suse.de>
> Signed-off-by: Petr Vorel <pvorel@suse.cz>
> ---
>  testcases/network/nfs/nfs_stress/nfs_lib.sh | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
> 
> diff --git a/testcases/network/nfs/nfs_stress/nfs_lib.sh b/testcases/network/nfs/nfs_stress/nfs_lib.sh
> index 25fe67bda..fb0f10020 100644
> --- a/testcases/network/nfs/nfs_stress/nfs_lib.sh
> +++ b/testcases/network/nfs/nfs_stress/nfs_lib.sh
> @@ -83,16 +83,17 @@ nfs_mount()
>  		mount_dir="$(tst_ipaddr $host_type):$remote_dir"
>  	fi
>  
> -	local mnt_cmd="mount -t nfs $opts $mount_dir $local_dir"
> +	local mnt_cmd="mount -v -t nfs $opts $mount_dir $local_dir"
>  
>  	tst_res TINFO "Mounting NFS: $mnt_cmd"
>  	if [ -n "$LTP_NETNS" ] && [ -z "$LTP_NFS_NETNS_USE_LO" ]; then
> -		tst_rhost_run -c "$mnt_cmd"
> +		tst_rhost_run -c "$mnt_cmd" > mount.log
>  	else
> -		$mnt_cmd > /dev/null
> +		$mnt_cmd > mount.log
>  	fi
>  
>  	if [ $? -ne 0 ]; then
> +		cat mount.log
>  		if [ "$type" = "udp" -o "$type" = "udp6" ] && tst_kvcmp -ge 5.6; then
>  			tst_brk TCONF "UDP support disabled with the kernel config NFS_DISABLE_UDP_SUPPORT?"
>  		fi
> 

Thanks Petr! For the patch series:

Reviewed-by: Alexey Kodanev <aleksei.kodanev@bell-sw.com>

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
