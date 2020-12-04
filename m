Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 279FF2CEFAD
	for <lists+linux-ltp@lfdr.de>; Fri,  4 Dec 2020 15:27:13 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id E55393C4C15
	for <lists+linux-ltp@lfdr.de>; Fri,  4 Dec 2020 15:27:12 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 by picard.linux.it (Postfix) with ESMTP id A13F23C0041
 for <ltp@lists.linux.it>; Fri,  4 Dec 2020 15:27:10 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 699366008E5
 for <ltp@lists.linux.it>; Fri,  4 Dec 2020 15:27:10 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id A55BAACA8;
 Fri,  4 Dec 2020 14:27:09 +0000 (UTC)
Date: Fri, 4 Dec 2020 15:27:08 +0100
From: Petr Vorel <pvorel@suse.cz>
To: Amir Goldstein <amir73il@gmail.com>
Message-ID: <X8pHPA/8hI2zf4Qo@pevik>
References: <20201204095930.866421-1-amir73il@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201204095930.866421-1-amir73il@gmail.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 0/5] Fanotify cleanup and test for v5.9 regression
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
Cc: Jan Kara <jack@suse.cz>, ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi Amir,

> Hi Petr,

> Here are my followup patches to your great cleanup and
> a new test for a bug fix that is already included in v5.9.y.

> Note that I resurrected the helper from your V5 patches that
> you turned into a macro following Cyril's comment.
> I hope you both find the result satisfying.
Nice clean patchset, as usually. Thank you.
I'll do some testing on Monday.
@Jan, if you have time please have a quick look into the patchset.

> There are no direct calls to fanotify_init() after those
> cleanups (except for the intended use in fanotify14).
+1

> FYI, I have another test (inotify) for another v5.9 regression.
> The fix is queued for upstream, but did reach upstream yet, so
> I will post that test later.
+1

> Thanks,
> Amir.

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
