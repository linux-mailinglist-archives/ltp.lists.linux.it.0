Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id B80E61C5724
	for <lists+linux-ltp@lfdr.de>; Tue,  5 May 2020 15:37:50 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 7FA303C57E7
	for <lists+linux-ltp@lfdr.de>; Tue,  5 May 2020 15:37:50 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 by picard.linux.it (Postfix) with ESMTP id 9BD263C061B
 for <ltp@lists.linux.it>; Tue,  5 May 2020 15:37:48 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 40A8B1400214
 for <ltp@lists.linux.it>; Tue,  5 May 2020 15:37:48 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 21ADDABB2;
 Tue,  5 May 2020 13:37:50 +0000 (UTC)
Date: Tue, 5 May 2020 15:37:46 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Richard Palethorpe <rpalethorpe@suse.com>
Message-ID: <20200505133746.GB21884@dell5510>
References: <20200505101625.25020-1-rpalethorpe@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200505101625.25020-1-rpalethorpe@suse.com>
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v4 1/2] pty04: Use guarded buffers for transmission
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

Hi Richard,

> Signed-off-by: Richard Palethorpe <rpalethorpe@suse.com>
> ---

Reviewed-by: Petr Vorel <pvorel@suse.cz>

BTW Every second run with this patch it blocks after pty04.c:214: PASS: Read netdev 1
and then:
tst_checkpoint.c:147: BROK: pty04.c:249: tst_checkpoint_wait(0, 10000): ETIMEDOUT (110)
tst_test.c:373: BROK: Reported by child (26650)
safe_macros.c:258: BROK: pty04.c:215: read(5,0x7efebc306001,8191) failed, returned -1: ENETDOWN (100)
pty04.c:139: PASS: Writing to PTY interrupted by hangup
tst_test.c:373: WARN: Reported by child (26648)

Tested on 5.7.0-rc3 in Tumbleweed.
But it looks this is not caused by this change, but was here before, because the
same behavior I see when testing pty04 *without* this patch on various kernels
(5.3.7, 5.6.0-rc5) and some of the never SLES (4.12 based).

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
