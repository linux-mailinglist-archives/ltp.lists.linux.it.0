Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id D39DB398367
	for <lists+linux-ltp@lfdr.de>; Wed,  2 Jun 2021 09:44:41 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 9C64E3C54B1
	for <lists+linux-ltp@lfdr.de>; Wed,  2 Jun 2021 09:44:41 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 2E8983C2945
 for <ltp@lists.linux.it>; Wed,  2 Jun 2021 09:44:40 +0200 (CEST)
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com
 [IPv6:2a00:1450:4864:20::12b])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 7A7F320032E
 for <ltp@lists.linux.it>; Wed,  2 Jun 2021 09:44:39 +0200 (CEST)
Received: by mail-lf1-x12b.google.com with SMTP id r5so1916576lfr.5
 for <ltp@lists.linux.it>; Wed, 02 Jun 2021 00:44:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bell-sw-com.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=eVCfryPK9c1lV695W8KvQyZ//tca/B4ruVeWI919rA4=;
 b=NGTgQURsr0VhAXcCGY0XenNcIRciliarhNeKBdT9KX3Y45KOJ78oaj7pq+/Fvjm+Nj
 xFvYICY5hZwdEZbIuiEatXhZ+jJOwLBIcWUdhpDZ/AOQJUwDc0i7q05tt5i7aiMAbnPC
 LU1wuPXwiSHZYbOeAnZ/xKUJfm5sRGfBJiRC+hKE1IrgzBx+bbj6swphIZ7+Hpf7RWXs
 zND0Q9uQ4Lul+RqX23nZkG9ghqhEho7dGDbIeNAvmMXXsf1NHoyFpyFbmpjlSgJMFCEp
 2FaNRqIy+1x5sKP3t1Jr8GVPWiWsrAu6wT3N5xWmAuwWADMdjGVA4z6Eh8P6Yjkna4vF
 QBYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=eVCfryPK9c1lV695W8KvQyZ//tca/B4ruVeWI919rA4=;
 b=BBl1wTPHBm8kQQv9d1x0X19ucv+ZoGq/i8MHpn4oF+hUrbOUI7X9NYOpA7YjWlgKsL
 M/KD+9EYf0QStxGuu9AYYSFN0SjC+o/1SNqD9SVkbpWvxNLkKbffuoYzXe/QIBJ2Da5U
 QVmcr7MWpV57qE34X3yw1F/lUSV2ZaBa9qy3ZABiObQu6q7h9rGm5l3r/3fIuV2KBxMD
 KmXx+xy/r+S9mNDNfol9c3YC067PA4RudFqs4JlHfnzdzuz9eZtWfRmQapWz8fiskWJX
 AhjMy4/u7yJiowWnSandjfe90jXOSadMRE3oiolV8SvbyqBaXIl/RRYGP9PSOvh0KIyV
 WNPg==
X-Gm-Message-State: AOAM530439d+yA2y25WQ6VVV6CsgBlzr/crGb3gH7r38vCi10b6vA750
 d3Ph+kvlWi4cvu7b2ZyHqm6D
X-Google-Smtp-Source: ABdhPJzaNvxWQ6NIpL3BdvU7VQHxjbApqn8A9/uNgl5E0nyb2pY/NUpmR+Ieu51klKiao3bd5vswjA==
X-Received: by 2002:ac2:414f:: with SMTP id c15mr893963lfi.307.1622619878905; 
 Wed, 02 Jun 2021 00:44:38 -0700 (PDT)
Received: from [192.168.1.52] ([95.161.221.177])
 by smtp.gmail.com with ESMTPSA id r17sm1924502lfr.18.2021.06.02.00.44.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 02 Jun 2021 00:44:38 -0700 (PDT)
To: Petr Vorel <pvorel@suse.cz>, ltp@lists.linux.it
References: <20210526172503.18621-1-pvorel@suse.cz>
From: Alexey Kodanev <aleksei.kodanev@bell-sw.com>
Message-ID: <210e1e4f-23d8-6a8b-18cb-ea7a4e7f89c2@bell-sw.com>
Date: Wed, 2 Jun 2021 10:44:38 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210526172503.18621-1-pvorel@suse.cz>
Content-Language: en-US
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-0.5 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
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
Cc: linux-nfs@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

On 26.05.2021 20:25, Petr Vorel wrote:
> Caused by disabled CONFIG_NFSD_V[34] in kernel config.
> 
> Signed-off-by: Petr Vorel <pvorel@suse.cz>
> ---
> new in v2
> 
>  testcases/network/nfs/nfs_stress/nfs_lib.sh | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/testcases/network/nfs/nfs_stress/nfs_lib.sh b/testcases/network/nfs/nfs_stress/nfs_lib.sh
> index 3fad8778a..b80ee0e18 100644
> --- a/testcases/network/nfs/nfs_stress/nfs_lib.sh
> +++ b/testcases/network/nfs/nfs_stress/nfs_lib.sh
> @@ -94,9 +94,15 @@ nfs_mount()
>  
>  	if [ $? -ne 0 ]; then
>  		cat mount.log
> +
>  		if [ "$type" = "udp" -o "$type" = "udp6" ] && tst_kvcmp -ge 5.6; then
>  			tst_brk TCONF "UDP support disabled with the kernel config NFS_DISABLE_UDP_SUPPORT?"
>  		fi
> +
> +		if grep -i "Protocol not supported" mount.log; then

Hi Petr,

It's better to add '-q' flag to grep.

> +			tst_brk TCONF "Protocol not supported"
> +		fi
> +
>  		tst_brk TBROK "mount command failed"
>  	fi
>  }
> 


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
