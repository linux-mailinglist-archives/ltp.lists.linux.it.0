Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 485165D51E
	for <lists+linux-ltp@lfdr.de>; Tue,  2 Jul 2019 19:19:18 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id B583A3C1D91
	for <lists+linux-ltp@lfdr.de>; Tue,  2 Jul 2019 19:19:17 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 by picard.linux.it (Postfix) with ESMTP id E1CA63C1D37
 for <ltp@lists.linux.it>; Tue,  2 Jul 2019 19:19:13 +0200 (CEST)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id C21061401183
 for <ltp@lists.linux.it>; Tue,  2 Jul 2019 19:19:12 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 9428FAD4C;
 Tue,  2 Jul 2019 17:19:11 +0000 (UTC)
Date: Tue, 2 Jul 2019 19:19:10 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: Po-Hsu Lin <po-hsu.lin@canonical.com>
Message-ID: <20190702171910.GC20468@rei.lan>
References: <20190628103900.10113-1-po-hsu.lin@canonical.com>
 <5D19A7E1.10607@cn.fujitsu.com> <20190702130513.GB11122@rei>
 <CAMy_GT-Snxu5axLR6j=1yeDRNWJavofVAjdJH2FyBfCsnj=Hdw@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAMy_GT-Snxu5axLR6j=1yeDRNWJavofVAjdJH2FyBfCsnj=Hdw@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] scenario_groups/default: run the kernel_misc test
 after the cve test
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
> thanks for the review,
> do you think if we should put a comment (if possible) inside that file
> to avoid getting re-ordered for some reason in the future?

We cannot, the scenari files are simply read line by line, the format
does not support comments.

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
