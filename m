Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D4C92A2A3D
	for <lists+linux-ltp@lfdr.de>; Mon,  2 Nov 2020 12:59:35 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 5A7933C302B
	for <lists+linux-ltp@lfdr.de>; Mon,  2 Nov 2020 12:59:35 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 by picard.linux.it (Postfix) with ESMTP id 81F103C23B9
 for <ltp@lists.linux.it>; Mon,  2 Nov 2020 12:59:33 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by in-7.smtp.seeweb.it (Postfix) with ESMTP id 162D4200B7E
 for <ltp@lists.linux.it>; Mon,  2 Nov 2020 12:59:32 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id A282EAC2F;
 Mon,  2 Nov 2020 11:59:32 +0000 (UTC)
Date: Mon, 2 Nov 2020 13:00:14 +0100
From: Cyril Hrubis <chrubis@suse.cz>
To: Radoslav Kolev <radoslav.kolev@suse.com>
Message-ID: <20201102120014.GB7653@yuki.lan>
References: <20201102082751.9807-1-radoslav.kolev@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201102082751.9807-1-radoslav.kolev@suse.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.2 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2] Convert dup01 to new API and clean up
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
> +	TEST(dup(fd));
> +	
   ^
   Trailing whitespace
> +	if (TST_RET < -1) { 
                           ^
			   Here as well.

You can use checkpatch.pl from kernel sources to check for these (and a
few more common coding style violations) before submitting.

> +		tst_brk(TBROK, "Invalid dup() return value %ld", TST_RET);

I would argue that this is a TFAIL since TBROK means that test has
failed in preparation phase.


Other than these two minor issues the rest is good.

I can fix these two issues before applying if you agree, no need to send
a v3.

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
