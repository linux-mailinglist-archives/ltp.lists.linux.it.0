Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id EA6C93B699F
	for <lists+linux-ltp@lfdr.de>; Mon, 28 Jun 2021 22:24:32 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id BCE043C6E48
	for <lists+linux-ltp@lfdr.de>; Mon, 28 Jun 2021 22:24:32 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id CA7B53C19DA
 for <ltp@lists.linux.it>; Mon, 28 Jun 2021 22:24:30 +0200 (CEST)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 06E1D600914
 for <ltp@lists.linux.it>; Mon, 28 Jun 2021 22:24:29 +0200 (CEST)
Received: from imap.suse.de (imap-alt.suse-dmz.suse.de [192.168.254.47])
 (using TLSv1.2 with cipher ECDHE-ECDSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 5182B2032D;
 Mon, 28 Jun 2021 20:24:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1624911869;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=wUaCHQ4XP1jcRdJe68SKcoCGMZ7nbD6678y6TUYofqo=;
 b=wwqoK78wlE3+SBTQnAh+1brQIJ31oA7bqEnRK1iNEwhLtVnbYGJwdenevuYa1ODQUOTRPR
 L50Ybwsv+OHkxV3JTfFnQu+mVz2nC5YpLmDeZEqXpT4vGGloQOPSeZbtk7hlP0Ya/UpfJP
 0ETQEjpyZqoz9Iy41iDUy8Do2gWa2rQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1624911869;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=wUaCHQ4XP1jcRdJe68SKcoCGMZ7nbD6678y6TUYofqo=;
 b=kNbuch3L1MWRi4wkKRWDa1MpKhV1rSkjdyr27Ub365i0DMR8ckdfwG6QTU78FT7nvi2BP+
 kvAukmtwoop0HcBw==
Received: from imap3-int (imap-alt.suse-dmz.suse.de [192.168.254.47])
 by imap.suse.de (Postfix) with ESMTP id 10E0711906;
 Mon, 28 Jun 2021 20:24:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1624911869;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=wUaCHQ4XP1jcRdJe68SKcoCGMZ7nbD6678y6TUYofqo=;
 b=wwqoK78wlE3+SBTQnAh+1brQIJ31oA7bqEnRK1iNEwhLtVnbYGJwdenevuYa1ODQUOTRPR
 L50Ybwsv+OHkxV3JTfFnQu+mVz2nC5YpLmDeZEqXpT4vGGloQOPSeZbtk7hlP0Ya/UpfJP
 0ETQEjpyZqoz9Iy41iDUy8Do2gWa2rQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1624911869;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=wUaCHQ4XP1jcRdJe68SKcoCGMZ7nbD6678y6TUYofqo=;
 b=kNbuch3L1MWRi4wkKRWDa1MpKhV1rSkjdyr27Ub365i0DMR8ckdfwG6QTU78FT7nvi2BP+
 kvAukmtwoop0HcBw==
Received: from director2.suse.de ([192.168.254.72]) by imap3-int with ESMTPSA
 id aqUNAf0v2mD9MgAALh3uQQ
 (envelope-from <pvorel@suse.cz>); Mon, 28 Jun 2021 20:24:29 +0000
Date: Mon, 28 Jun 2021 22:24:27 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Message-ID: <YNov+zuL+C4JFlsJ@pevik>
References: <20210618130536.54806-1-krzysztof.kozlowski@canonical.com>
 <20210618130536.54806-2-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210618130536.54806-2-krzysztof.kozlowski@canonical.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 2/2] tpci: accept ENOMEM resource failure with
 virtio-pci
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

Hi Krzysztof,

> Assigning the memory prefetch resource to virtio-pci might fail on VM
> guests.  For example on Oracle cloud instance (describing itself as
> "Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.4.1
> 12/03/2020"):

>     test_pci   76  TFAIL  :  tpci.c:73: PCI bus 00 slot 20 : Test-case '12'

I'm not sure if we don't cover actual bug. Because I haven't found any issues on
virtio_pci used on VM boxes. But probably failing to assign memory is something
else than kernel bug.

> In dmesg:

>     ltp_tpci: test-case 12
>     ltp_tpci: assign resources
>     ltp_tpci: assign resource #0
>     ltp_tpci: name = 0000:00:04.0, flags = 262401, start 0xc000, end 0xc03f
>     ltp_tpci: assign resource #1
>     ltp_tpci: name = 0000:00:04.0, flags = 262656, start 0xc1010000, end 0xc1010fff
>     ltp_tpci: assign resource #2
>     ltp_tpci: name = 0000:00:04.0, flags = 0, start 0x0, end 0x0
>     ltp_tpci: assign resource #3
>     ltp_tpci: name = 0000:00:04.0, flags = 0, start 0x0, end 0x0
>     ltp_tpci: assign resource #4
>     ltp_tpci: name = 0000:00:04.0, flags = 538190348, start 0x800004000, end 0x800007fff
>     virtio-pci 0000:00:04.0: BAR 4: no space for [mem size 0x00004000 64bit pref]
>     virtio-pci 0000:00:04.0: BAR 4: failed to assign [mem size 0x00004000 64bit pref]

> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>

> ---

> Found the failure on multiple different kernels in different cloud
> providers (Oracle, AWS, Azure):
> https://bugs.launchpad.net/ubuntu/+source/linux/+bug/1878389
> ---
>  .../device-drivers/pci/tpci_kernel/ltp_tpci.c     | 15 ++++++++++++---
>  1 file changed, 12 insertions(+), 3 deletions(-)

> diff --git a/testcases/kernel/device-drivers/pci/tpci_kernel/ltp_tpci.c b/testcases/kernel/device-drivers/pci/tpci_kernel/ltp_tpci.c
> index f2d4a4ba497c..41462d4ead6d 100644
> --- a/testcases/kernel/device-drivers/pci/tpci_kernel/ltp_tpci.c
> +++ b/testcases/kernel/device-drivers/pci/tpci_kernel/ltp_tpci.c
> @@ -108,8 +108,9 @@ static int probe_pci_dev(unsigned int bus, unsigned int slot)
>  	if (!dev || !dev->driver)
>  		return -ENODEV;

> -	prk_info("found pci_dev '%s', bus %u, devfn %u",
> -		pci_name(dev), bus, slot);
> +	prk_info("found pci_dev '%s', driver '%s', bus %u, devfn %u",
> +		pci_name(dev), (dev->driver) ? dev->driver->name : "",
> +		bus, slot);

>  	ltp_pci.dev = dev;
>  	ltp_pci.bus = dev->bus;
> @@ -444,7 +445,15 @@ static int test_assign_resources(void)
>  			r->flags & IORESOURCE_PREFETCH) {
>  			ret = pci_assign_resource(dev, i);
>  			prk_info("assign resource to '%d', ret '%d'", i, ret);
> -			rc |= (ret < 0 && ret != -EBUSY) ? TFAIL : TPASS;
> +			if (dev->driver && !strncmp(dev->driver->name, "virtio-pci",
> +						    strlen("virtio-pci"))) {
> +				if (ret < 0 && ret != -EBUSY && ret != -ENOMEM)
> +					rc |= TFAIL;
> +				else

Shouldn't ENOMEM/EBUSY result to TCONF or TBROK?

https://github.com/linux-test-project/ltp/wiki/C-Test-API#12-basic-test-interface

Kind regards,
Petr

> +					rc |= TPASS;
> +			} else {
> +				rc |= (ret < 0 && ret != -EBUSY) ? TFAIL : TPASS;
> +			}
>  		}
>  	}

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
