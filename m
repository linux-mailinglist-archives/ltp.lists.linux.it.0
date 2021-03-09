Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id DECF1332940
	for <lists+linux-ltp@lfdr.de>; Tue,  9 Mar 2021 15:54:52 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 634E43C6A87
	for <lists+linux-ltp@lfdr.de>; Tue,  9 Mar 2021 15:54:52 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 by picard.linux.it (Postfix) with ESMTP id B60A33C05B6
 for <ltp@lists.linux.it>; Tue,  9 Mar 2021 15:54:48 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 68F39600827
 for <ltp@lists.linux.it>; Tue,  9 Mar 2021 15:54:48 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id C6F10AE15;
 Tue,  9 Mar 2021 14:54:47 +0000 (UTC)
Date: Tue, 9 Mar 2021 15:54:46 +0100
From: Petr Vorel <pvorel@suse.cz>
To: zhaogongyi <zhaogongyi@huawei.com>
Message-ID: <YEeMNhvwrrfZA0rD@pevik>
References: <F3D3F6AC3820BB4C9FCA340DB5C32CB4038900ED@dggeml511-mbs.china.huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <F3D3F6AC3820BB4C9FCA340DB5C32CB4038900ED@dggeml511-mbs.china.huawei.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] max_map_count: Add judgment of abnormal situation
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
Cc: "ltp@lists.linux.it" <ltp@lists.linux.it>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi Gongyi,

> > > When CommitLimit - Committed_AS < 128, there is no post processing,
> > > and the test will report "TBROK: Test haven't reported results".
Actually, I have problem for CommitLimit - Committed_AS < 5280
(depends on actual system).

But that means that even check for max_iters < 0 is not enough,
because while (max_maps <= max_iters) block should be run at least once
to avoid TBROK: Test haven't reported results!

max_maps is always 1024, thus how about this?

	max_maps = MAP_COUNT_DEFAULT;
+	if (max_iters < max_maps)
+		tst_brk(TCONF, "test requires more free memory");


> > You seems to exploring limits. Out of curiosity, which system / hw do you
> > test?

> We are testing linux on some different embedded systems whose hw resource is limited. 
Thanks for info.

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
