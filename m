Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B3F314CDFE
	for <lists+linux-ltp@lfdr.de>; Wed, 29 Jan 2020 17:10:09 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 07F213C2433
	for <lists+linux-ltp@lfdr.de>; Wed, 29 Jan 2020 17:10:09 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 by picard.linux.it (Postfix) with ESMTP id D58803C23E6
 for <ltp@lists.linux.it>; Wed, 29 Jan 2020 17:10:07 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id DFD4310014B1
 for <ltp@lists.linux.it>; Wed, 29 Jan 2020 17:10:06 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 443B2AE41
 for <ltp@lists.linux.it>; Wed, 29 Jan 2020 16:10:06 +0000 (UTC)
Date: Wed, 29 Jan 2020 17:10:01 +0100
From: Petr Vorel <pvorel@suse.cz>
To: Michael Moese <mmoese@suse.de>
Message-ID: <20200129161001.GA23969@dell5510>
References: <20200129120231.17375-1-mmoese@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200129120231.17375-1-mmoese@suse.de>
User-Agent: Mutt/1.12.2 (2019-09-21)
X-Virus-Scanned: clamav-milter 0.99.2 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2] Add a regression test for cve-2017-15649
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

Hi Michie,

> net/packet/af_packet.c in the Linux kernel before 4.13.6 allows local
> users to gain privileges via crafted system calls that trigger
> mishandling of packet_fanout data structures, because of a race
> condition (involving fanout_add and packet_do_bind) that leads to a
> use-after-free.
> 
> See https://ssd-disclosure.com/archives/3484 for more detail.

Reviewed-by: Petr Vorel <pvorel@suse.cz>
Thanks for your work!

Fuzzy sync library changes now LGTM, but I'd Richie or somebody else to double
check.

What a shame it requires Kasan for reproducing.

> +++ b/testcases/cve/Makefile
> @@ -46,5 +46,6 @@ cve-2017-17052:	CFLAGS += -pthread
>  cve-2017-17053:	CFLAGS += -pthread
>  
>  cve-2015-3290:	CFLAGS += -pthread
> +cve-2017-15649: CFLAGS += -pthread

testcases/cve/../../include/tst_fuzzy_sync.h:342: undefined reference to `clock_gettime'

You also need link with -lrt, otherwise it fails to build on very old distros:
cve-2017-15649: LDLIBS += -lrt

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
