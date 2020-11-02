Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id A83DC2A2866
	for <lists+linux-ltp@lfdr.de>; Mon,  2 Nov 2020 11:37:45 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 6154E3C3041
	for <lists+linux-ltp@lfdr.de>; Mon,  2 Nov 2020 11:37:45 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 by picard.linux.it (Postfix) with ESMTP id AC1FB3C23EC
 for <ltp@lists.linux.it>; Mon,  2 Nov 2020 11:37:40 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 580571000B4C
 for <ltp@lists.linux.it>; Mon,  2 Nov 2020 11:37:40 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 27DD4B2AF;
 Mon,  2 Nov 2020 10:37:39 +0000 (UTC)
Date: Mon, 2 Nov 2020 11:38:20 +0100
From: Cyril Hrubis <chrubis@suse.cz>
To: Li Wang <liwang@redhat.com>
Message-ID: <20201102103820.GA7653@yuki.lan>
References: <20201027110446.20416-1-chrubis@suse.cz>
 <20201027110446.20416-3-chrubis@suse.cz>
 <CAEemH2cOcAuoPcks4FPaTaS-THtjPvy+=uB3oGsnTSNp_umpMg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAEemH2cOcAuoPcks4FPaTaS-THtjPvy+=uB3oGsnTSNp_umpMg@mail.gmail.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.2 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2 2/2] lib/tst_kconfig: Make use of boolean
 expression eval
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
Cc: automated-testing@yoctoproject.org, LTP List <ltp@lists.linux.it>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi!
> But a tiny issue was found from my test, the tst_kconfig_check() would be
> failed to parse expression if reverse the sequence of the above string.
> 
> i.e.
> -       "CONFIG_MMU & CONFIG_EXT4_FS=m",
> +       "CONFIG_EXT4_FS=m & CONFIG_MMU",
> (Core dumped here)
> 
> But trying with =Num, it gets different errors:
> 
> "CONFIG_MMU & CONFIG_PGTABLE_LEVELS=4",
> (works well)
> 
> "CONFIG_PGTABLE_LEVELS=4 & CONFIG_MMU",
> (print Expression not satisfied!)

Looks like off by one in the strncmp() in the map() function, I will fix
that as well and send v3.

Thanks a lot for testing.

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
