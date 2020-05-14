Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 747BB1D2A8F
	for <lists+linux-ltp@lfdr.de>; Thu, 14 May 2020 10:46:19 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id A7AF93C5460
	for <lists+linux-ltp@lfdr.de>; Thu, 14 May 2020 10:46:18 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 by picard.linux.it (Postfix) with ESMTP id 83B283C180D
 for <ltp@lists.linux.it>; Thu, 14 May 2020 10:46:11 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 3F7791000CA2
 for <ltp@lists.linux.it>; Thu, 14 May 2020 10:46:10 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 5887EAC24
 for <ltp@lists.linux.it>; Thu, 14 May 2020 08:46:13 +0000 (UTC)
Date: Thu, 14 May 2020 10:46:08 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Martin Doucha <mdoucha@suse.cz>
Message-ID: <20200514084608.GA21852@dell5510>
References: <20200513152914.2703-1-mdoucha@suse.cz>
 <20200514071121.GA7101@dell5510>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200514071121.GA7101@dell5510>
X-Virus-Scanned: clamav-milter 0.99.2 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] Add missing mode argument to open(..., O_CREAT)
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

Hi Martin,

> According to man open(2), mode must be specified when O_CREAT or O_TMPFILE is
> specified in flags. Thus it looks to me that also these files are missing mode:

> testcases/kernel/syscalls/fallocate/fallocate05.c
> fd = SAFE_OPEN(MNTPOINT "/test_file", O_WRONLY | O_CREAT);
> fd = SAFE_OPEN(MNTPOINT "/test_file", O_WRONLY | O_CREAT | O_TRUNC);

> testcases/kernel/syscalls/fallocate/fallocate06.c
> fd = SAFE_OPEN(TEMPFILE, O_RDWR | O_CREAT | O_TRUNC);

I'm sorry, I accidentally looked at the master for these 2 files
(switching between branches a lot). Sorry for the noise, merged.

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
