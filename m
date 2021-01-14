Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 43BC72F621C
	for <lists+linux-ltp@lfdr.de>; Thu, 14 Jan 2021 14:37:23 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id DBFD03C581A
	for <lists+linux-ltp@lfdr.de>; Thu, 14 Jan 2021 14:37:22 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 by picard.linux.it (Postfix) with ESMTP id 436F83C315C
 for <ltp@lists.linux.it>; Thu, 14 Jan 2021 14:37:21 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id A51F91400FA3
 for <ltp@lists.linux.it>; Thu, 14 Jan 2021 14:37:21 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id DDE40ADE5
 for <ltp@lists.linux.it>; Thu, 14 Jan 2021 13:37:20 +0000 (UTC)
Date: Thu, 14 Jan 2021 14:38:20 +0100
From: Cyril Hrubis <chrubis@suse.cz>
To: Martin Doucha <mdoucha@suse.cz>
Message-ID: <YABJTK2hRHBjJ6lc@yuki.lan>
References: <20210112095759.11910-1-mdoucha@suse.cz>
 <20210112095759.11910-2-mdoucha@suse.cz>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210112095759.11910-2-mdoucha@suse.cz>
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.2 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v6 2/3] Add tst_secureboot_enabled() helper
 function
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
> +int tst_secureboot_enabled(void)
> +{
> +	int fd;
> +	char data[5];
> +
> +	if (access(EFIVAR_SECUREBOOT, F_OK)) {
> +		tst_res(TINFO, "Efivar FS not available");
> +		return -1;
> +	}
> +
> +	fd = open(EFIVAR_SECUREBOOT, O_RDONLY);
> +
> +	if (fd == -1) {
> +		tst_res(TINFO | TERRNO,
> +			"Cannot open SecureBoot Efivar sysfile");
> +		return -1;
> +	} else if (fd < 0) {
> +		tst_brk(TBROK | TERRNO, "Invalid open() return value %d", fd);
> +		return -1;
> +	}

If we change the access() above to R_OK we can just do SAFE_OPEN() here, right?

Other than this the code looks good.

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
