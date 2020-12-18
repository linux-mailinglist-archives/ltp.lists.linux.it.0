Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 1490C2DE765
	for <lists+linux-ltp@lfdr.de>; Fri, 18 Dec 2020 17:23:50 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id C53473C617A
	for <lists+linux-ltp@lfdr.de>; Fri, 18 Dec 2020 17:23:49 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 by picard.linux.it (Postfix) with ESMTP id 52ADA3C29E1
 for <ltp@lists.linux.it>; Fri, 18 Dec 2020 17:23:47 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 8913E1A008A3
 for <ltp@lists.linux.it>; Fri, 18 Dec 2020 17:23:47 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id AC52DACC6;
 Fri, 18 Dec 2020 16:23:46 +0000 (UTC)
Date: Fri, 18 Dec 2020 17:23:45 +0100
From: Petr Vorel <pvorel@suse.cz>
To: Amir Goldstein <amir73il@gmail.com>, Hugh Dickins <hughd@google.com>,
 Jan Kara <jack@suse.cz>, ltp@lists.linux.it
Message-ID: <X9zXkVLKhRjee5bE@pevik>
References: <20201218070631.1182292-1-amir73il@gmail.com>
 <X9xv+6e0tJgVDN/9@pevik>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <X9xv+6e0tJgVDN/9@pevik>
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 0/3] inotify tests for v5.9 regression
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi Amir,

> > Hi Petr,

> > Here is the test for the other v5.9 regression that I mentioned earlier.
> > The fix commit has just been merged to master.
> Thanks for your patch, LGTM. I'll probably merge it later today.
Merged.

Thanks for your pathset. I wish other kernel subsystems were getting the
same care as {fa,i}notify.

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
