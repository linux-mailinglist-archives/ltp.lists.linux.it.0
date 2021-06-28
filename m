Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C76B3B69A3
	for <lists+linux-ltp@lfdr.de>; Mon, 28 Jun 2021 22:29:36 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 5BD953C6E48
	for <lists+linux-ltp@lfdr.de>; Mon, 28 Jun 2021 22:29:36 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id B780E3C19DA
 for <ltp@lists.linux.it>; Mon, 28 Jun 2021 22:29:34 +0200 (CEST)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id CC37360094A
 for <ltp@lists.linux.it>; Mon, 28 Jun 2021 22:29:33 +0200 (CEST)
Received: from imap.suse.de (imap-alt.suse-dmz.suse.de [192.168.254.47])
 (using TLSv1.2 with cipher ECDHE-ECDSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 2B7832252F;
 Mon, 28 Jun 2021 20:29:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1624912173;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=sCmRAtqzeGqEUIqhpqftHGLbk7rsfqiKy2Jjy6IhE0E=;
 b=2E8ttNLX8V/ZlKwdaoZ0WuBRcV+DDo6GxGJB3CJLqaoLhsriyCMke1o8zdN3ajPefv6eQ8
 ADjL2m8FGKAi5kLhdsJvmzSuIS19mbbk0Qh/vFZLWrmra7w9TnH4p1Du+Zw6I2M9lQkQJa
 XUJPMCxBPMh+AWs811grZtibM9o3+BU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1624912173;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=sCmRAtqzeGqEUIqhpqftHGLbk7rsfqiKy2Jjy6IhE0E=;
 b=tikbkpqS5MKGYZAnTc4tSF2zKZDJChpcz6zzuj9I1A5UhDHzOWileoJrp5BDK3/UE++Y8v
 Y22A9dqXMkTt7gBg==
Received: from imap3-int (imap-alt.suse-dmz.suse.de [192.168.254.47])
 by imap.suse.de (Postfix) with ESMTP id D456211906;
 Mon, 28 Jun 2021 20:29:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1624912173;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=sCmRAtqzeGqEUIqhpqftHGLbk7rsfqiKy2Jjy6IhE0E=;
 b=2E8ttNLX8V/ZlKwdaoZ0WuBRcV+DDo6GxGJB3CJLqaoLhsriyCMke1o8zdN3ajPefv6eQ8
 ADjL2m8FGKAi5kLhdsJvmzSuIS19mbbk0Qh/vFZLWrmra7w9TnH4p1Du+Zw6I2M9lQkQJa
 XUJPMCxBPMh+AWs811grZtibM9o3+BU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1624912173;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=sCmRAtqzeGqEUIqhpqftHGLbk7rsfqiKy2Jjy6IhE0E=;
 b=tikbkpqS5MKGYZAnTc4tSF2zKZDJChpcz6zzuj9I1A5UhDHzOWileoJrp5BDK3/UE++Y8v
 Y22A9dqXMkTt7gBg==
Received: from director2.suse.de ([192.168.254.72]) by imap3-int with ESMTPSA
 id uVQDMSwx2mCmNAAALh3uQQ
 (envelope-from <pvorel@suse.cz>); Mon, 28 Jun 2021 20:29:32 +0000
Date: Mon, 28 Jun 2021 22:29:30 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Wang Xin <wangxin410@huawei.com>
Message-ID: <YNoxKg+Hm0qa3Z70@pevik>
References: <20210401125127.45600-1-wangxin410@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210401125127.45600-1-wangxin410@huawei.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] ltp_tpci.c: Add release operation before
 allocation
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

Hi Xin,

> When we run the test case, the following results will be obtained:
> test_pci  283  TPASS  :  PCI bus 7d slot 00 : Test-case '11'
> test_pci  284  TFAIL  :  tpci.c:74: PCI bus 7d slot 00 : Test-case '12'
> ...
> test_pci  300  TFAIL  :  tpci.c:74: PCI bus 7d slot 01 : Test-case '12'
> test_pci  301  TPASS  :  PCI bus 7d slot 01 : Test-case '13'

> The analysis is that the space allocated by the bios is insufficient.
> The solution to this problem can be in add pci_release_resource(dev, i)
> before system resources are reallocated.Because the resources have been
> allocated when the system is initialized.If it is redistributed, it
> should be released and then allocated.

I wonder if this is the same issue as the one described by Krzysztof in his
patch:
https://patchwork.ozlabs.org/project/ltp/patch/20210401125127.45600-1-wangxin410@huawei.com/

Could you please share what HW and kernel you use and post dmesg?

Kind regards,
Petr

> Signed-off-by: Wang Xin <wangxin410@huawei.com>
> ---
>  testcases/kernel/device-drivers/pci/tpci_kernel/ltp_tpci.c | 1 +
>  1 file changed, 1 insertion(+)

> diff --git a/testcases/kernel/device-drivers/pci/tpci_kernel/ltp_tpci.c b/testcases/kernel/device-drivers/pci/tpci_kernel/ltp_tpci.c
> index e29821dda..5b0896093 100644
> --- a/testcases/kernel/device-drivers/pci/tpci_kernel/ltp_tpci.c
> +++ b/testcases/kernel/device-drivers/pci/tpci_kernel/ltp_tpci.c
> @@ -439,6 +439,7 @@ static int test_assign_resources(void)
>  		if (r->flags & IORESOURCE_MEM &&
>  			r->flags & IORESOURCE_PREFETCH) {
> +			pci_release_resource(dev, i);
>  			ret = pci_assign_resource(dev, i);
>  			prk_info("assign resource to '%d', ret '%d'", i, ret);
>  			rc |= (ret < 0 && ret != -EBUSY) ? TFAIL : TPASS;
> 2.17.1

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
