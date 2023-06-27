Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 9790C7422DD
	for <lists+linux-ltp@lfdr.de>; Thu, 29 Jun 2023 11:06:36 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 1315B3CE14C
	for <lists+linux-ltp@lfdr.de>; Thu, 29 Jun 2023 11:06:36 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384) server-digest SHA384)
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 317163C8998
 for <ltp@lists.linux.it>; Wed, 28 Jun 2023 01:33:51 +0200 (CEST)
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 40AA51A0027B
 for <ltp@lists.linux.it>; Wed, 28 Jun 2023 01:33:50 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id C2D6461200;
 Tue, 27 Jun 2023 23:33:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 70C16C433C8;
 Tue, 27 Jun 2023 23:33:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1687908827;
 bh=ICAejiuFUC/1Y/I67hPGjW+XknCM1NTjVehtolvc5/w=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=CCgLg90R9nb6tEwNk63w9P5PVVk25wJ+WW6pX7u4s0m+h3Deg7440fxTOv5yMR7JD
 tZSL7Mii3FkTTTN0i29DtuyTcwm3pPKVhMUqwK591eZ6VuEe8LSDmTg8bXVwg/JdNZ
 eok58l6KnUzC0iB68zgoz0skXHB8LFhYNdStUgwz21jP73sTYU8l1ftWUxiP7fLzXp
 MLbTtCVO5jRUWALfmoQu0BRNZB4BW+O7qejH5Rl0PsPWUj5N4VE9Nf+R8wJLhVFIca
 FPEf4XWqCae/fuQ4slLWCptdFsyvJyuUn2ArHtu57JCu9fOLnxeKFJEZmfga5SZ4Wx
 pmDuJTsM+0Rwg==
Date: Tue, 27 Jun 2023 16:33:44 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Rahul Rameshbabu <rrameshbabu@nvidia.com>
Message-ID: <20230627233344.GA1914803@dev-arch.thelio-3990X>
References: <20230627232139.213130-1-rrameshbabu@nvidia.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230627232139.213130-1-rrameshbabu@nvidia.com>
X-Virus-Scanned: clamav-milter 1.0.1 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
 T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on in-3.smtp.seeweb.it
X-Mailman-Approved-At: Thu, 29 Jun 2023 11:05:53 +0200
Subject: Re: [LTP] [PATCH net v1] ptp: Make max_phase_adjustment sysfs
 device attribute invisible when not supported
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
Cc: Linux Kernel Functional Testing <lkft@linaro.org>, netdev@vger.kernel.org,
 Richard Cochran <richardcochran@gmail.com>, lkft-triage@lists.linaro.org,
 "David S. Miller" <davem@davemloft.net>, Saeed Mahameed <saeed@kernel.org>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Gal Pressman <gal@nvidia.com>, LTP List <ltp@lists.linux.it>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

On Tue, Jun 27, 2023 at 04:21:39PM -0700, Rahul Rameshbabu wrote:
> The .adjphase operation is an operation that is implemented only by certain
> PHCs. The sysfs device attribute node for querying the maximum phase
> adjustment supported should not be exposed on devices that do not support
> .adjphase.
> 
> Fixes: c3b60ab7a4df ("ptp: Add .getmaxphase callback to ptp_clock_info")
> Signed-off-by: Rahul Rameshbabu <rrameshbabu@nvidia.com>
> Reported-by: Nathan Chancellor <nathan@kernel.org>
> Reported-by: Naresh Kamboju <naresh.kamboju@linaro.org>
> Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>
> Link: https://lore.kernel.org/netdev/20230627162146.GA114473@dev-arch.thelio-3990X/
> Link: https://lore.kernel.org/all/CA+G9fYtKCZeAUTtwe69iK8Xcz1mOKQzwcy49wd+imZrfj6ifXA@mail.gmail.com/

Thanks a lot for the fix!

Tested-by: Nathan Chancellor <nathan@kernel.org>

> ---
>  drivers/ptp/ptp_sysfs.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/ptp/ptp_sysfs.c b/drivers/ptp/ptp_sysfs.c
> index 77219cdcd683..6e4d5456a885 100644
> --- a/drivers/ptp/ptp_sysfs.c
> +++ b/drivers/ptp/ptp_sysfs.c
> @@ -358,6 +358,9 @@ static umode_t ptp_is_attribute_visible(struct kobject *kobj,
>  		   attr == &dev_attr_max_vclocks.attr) {
>  		if (ptp->is_virtual_clock)
>  			mode = 0;
> +	} else if (attr == &dev_attr_max_phase_adjustment.attr) {
> +		if (!info->adjphase || !info->getmaxphase)
> +			mode = 0;
>  	}
>  
>  	return mode;
> -- 
> 2.40.1
> 

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
