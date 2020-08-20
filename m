Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C82324C6CA
	for <lists+linux-ltp@lfdr.de>; Thu, 20 Aug 2020 22:33:40 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 31C3B3C2FB0
	for <lists+linux-ltp@lfdr.de>; Thu, 20 Aug 2020 22:33:40 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 by picard.linux.it (Postfix) with ESMTP id 79B633C2F97
 for <ltp@lists.linux.it>; Thu, 20 Aug 2020 22:33:38 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id E7C82100054D
 for <ltp@lists.linux.it>; Thu, 20 Aug 2020 22:33:37 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 6D943AD29;
 Thu, 20 Aug 2020 20:34:04 +0000 (UTC)
Date: Thu, 20 Aug 2020 22:33:35 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Po-Hsu Lin <po-hsu.lin@canonical.com>
Message-ID: <20200820203335.GA7560@x230>
References: <20200820133032.16840-1-pvorel@suse.cz>
 <20200820134557.GG9000@yuki.lan>
 <CAMy_GT_0yg4CEW+a8TC-9rrYeNWW0Xa+UsMa70v495WBrUXeBA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAMy_GT_0yg4CEW+a8TC-9rrYeNWW0Xa+UsMa70v495WBrUXeBA@mail.gmail.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v3 1/1] tst_kvcmp: Strip double quotes when
 parsing /etc/os-release
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

Hi Po-Hsu,

> LGTM,
> Tested with crafted ID, it can correctly parse the ID with or without
> the double quote.

> Another thing to note is that I found the loop in tst_kvercmp2 could
> iterate outside the size of "vers" and causing
> tst_test.c:1298: BROK: Test killed by SIGSEGV!
Will you post the patch for this?

> Reviewed-by: Po-Hsu Lin <po-hsu.lin@canonical.com>
I'm sorry, I've merged it before, but forget to notify.
Is the bug mentioned above related to my commit?

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
