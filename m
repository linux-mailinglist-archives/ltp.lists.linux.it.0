Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 833DF95B63
	for <lists+linux-ltp@lfdr.de>; Tue, 20 Aug 2019 11:45:55 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 4DAE13C1D06
	for <lists+linux-ltp@lfdr.de>; Tue, 20 Aug 2019 11:45:55 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 by picard.linux.it (Postfix) with ESMTP id A7FA93C1CF3
 for <ltp@lists.linux.it>; Tue, 20 Aug 2019 11:45:53 +0200 (CEST)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 976E1600126
 for <ltp@lists.linux.it>; Tue, 20 Aug 2019 11:45:52 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 9BB23AE9A;
 Tue, 20 Aug 2019 09:45:51 +0000 (UTC)
Date: Tue, 20 Aug 2019 11:45:50 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: He Zhe <zhe.he@windriver.com>
Message-ID: <20190820094550.GA19308@rei.lan>
References: <2c982dfd-9929-8969-4c4e-18d2d91ede1b@windriver.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <2c982dfd-9929-8969-4c4e-18d2d91ede1b@windriver.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Virus-Scanned: clamav-milter 0.99.2 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.2 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-2.smtp.seeweb.it
Subject: Re: [LTP] MIPS/MIPS64 syscalls
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
> There seems not any mips/mips64 syscalls defined. Where can we find
> them? or do we support them?

You need to create these files based on the numbers defined in kernel
syscall tables, look at arch/mips/kernel/syscalls/*.tbl, then you need
to add newly added architectures into the order file so that the headers
are generated correctly.

Also it looks like there are two 32bit ABIs there though not sure if we
need to support both in LTP though.

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
