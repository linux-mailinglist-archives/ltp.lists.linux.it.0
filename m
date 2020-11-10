Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C2E82AD5A0
	for <lists+linux-ltp@lfdr.de>; Tue, 10 Nov 2020 12:51:54 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 627AE3C2F76
	for <lists+linux-ltp@lfdr.de>; Tue, 10 Nov 2020 12:51:54 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 by picard.linux.it (Postfix) with ESMTP id D761C3C20D7
 for <ltp@lists.linux.it>; Tue, 10 Nov 2020 12:51:49 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id D3838600AA5
 for <ltp@lists.linux.it>; Tue, 10 Nov 2020 12:51:48 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 27095ABD1
 for <ltp@lists.linux.it>; Tue, 10 Nov 2020 11:51:48 +0000 (UTC)
Date: Tue, 10 Nov 2020 12:51:46 +0100
From: Petr Vorel <pvorel@suse.cz>
To: Martin Doucha <mdoucha@suse.cz>
Message-ID: <20201110115146.GC10788@pevik>
References: <20201109164605.25965-1-mdoucha@suse.cz>
 <20201109164605.25965-2-mdoucha@suse.cz>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201109164605.25965-2-mdoucha@suse.cz>
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v3 2/2] syscalls/iopl,
 ioperm: Check for SecureBoot lockdown
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

Hi,

> SecureBoot implies integrity lockdown even if tst_lockdown_enabled() cannot
> check lockdown status directly. Udpate skip condition in ioperm() and iopl()
> tests.
Reviewed-by: Petr Vorel <pvorel@suse.cz>

...
> +	/* ioperm() is restricted under kernel lockdown. */
> +	if (tst_lockdown_enabled() || tst_secureboot_enabled() > 0)
> +		tst_brk(TCONF, "Kernel is locked down, skip this test");
> +
I wonder if this could be interesting for docparse to have this functionality
exposed as a struct tst_test flag:
.tst_lockdown_restricted = 1

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
