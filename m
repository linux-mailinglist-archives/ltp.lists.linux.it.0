Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 80AD93FC2AE
	for <lists+linux-ltp@lfdr.de>; Tue, 31 Aug 2021 08:30:46 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 82D623C9A46
	for <lists+linux-ltp@lfdr.de>; Tue, 31 Aug 2021 08:30:45 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 8A7AD3C2A1F
 for <ltp@lists.linux.it>; Tue, 31 Aug 2021 08:30:40 +0200 (CEST)
Received: from mail.jv-coder.de (mail.jv-coder.de [5.9.79.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 3BC901A00A2C
 for <ltp@lists.linux.it>; Tue, 31 Aug 2021 08:30:39 +0200 (CEST)
Received: from [192.168.178.40] (unknown [188.192.255.100])
 by mail.jv-coder.de (Postfix) with ESMTPSA id AA4699F66D;
 Tue, 31 Aug 2021 06:30:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jv-coder.de; s=dkim;
 t=1630391438; bh=DXeMujXS5zPjpSNEg4B3piGgym6IaFdyowYB8FufB04=;
 h=Subject:From:To:Message-ID:Date:MIME-Version;
 b=Xpm3X1x0YFzuhpSXbyA3+m/8FEzZm6CEbZeh77mjW+DRmMTyjTK6pdTkv8JVC2oI9
 V1Thp+WZlpCmRe/LQ/BSftmdQhlM3RB1NTA6NjxO7QDmR8CXRdUBKWDUGETZLUU/wu
 9Dk4QWOPumDHixbN6gmqUWO1uRi3u5n1DTC67dv8=
From: Joerg Vehlow <lkml@jv-coder.de>
To: ltp@lists.linux.it, rpalethorpe@suse.com, Petr Vorel <pvorel@suse.cz>
References: <20210831054557.944172-1-lkml@jv-coder.de>
Message-ID: <f05a5719-e568-ac53-5694-fc970e796d53@jv-coder.de>
Date: Tue, 31 Aug 2021 08:30:41 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210831054557.944172-1-lkml@jv-coder.de>
Content-Language: en-US
X-Spam-Status: No, score=-0.8 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
Subject: Re: [LTP] [PATCH] broken_ip: Fix runtest for broken_ip4-plen
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
Cc: Joerg Vehlow <joerg.vehlow@aox-tech.de>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Sorry Richard, I wanted to add Petr, not you...

On 8/31/2021 7:45 AM, Joerg Vehlow wrote:
> From: Joerg Vehlow <joerg.vehlow@aox-tech.de>
>
> Fixes: 5d8f9dfd6b8 ("broken_ip: Remove duplicate broken_ip-totlen")
> Signed-off-by: Joerg Vehlow <joerg.vehlow@aox-tech.de>
> ---
>   runtest/net_stress.broken_ip | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/runtest/net_stress.broken_ip b/runtest/net_stress.broken_ip
> index 75791986e..a5536c0c2 100644
> --- a/runtest/net_stress.broken_ip
> +++ b/runtest/net_stress.broken_ip
> @@ -6,7 +6,7 @@
>   broken_ip4-version broken_ip-version.sh
>   broken_ip4-ihl broken_ip-ihl.sh
>   broken_ip4-fragment broken_ip-fragment.sh
> -broken_ip6-plen broken_ip-plen.sh
> +broken_ip4-plen broken_ip-plen.sh
>   broken_ip4-protcol broken_ip-protcol.sh
>   broken_ip4-checksum broken_ip-checksum.sh
>   broken_ip4-dstaddr broken_ip-dstaddr.sh


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
