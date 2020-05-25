Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id A15801E12A5
	for <lists+linux-ltp@lfdr.de>; Mon, 25 May 2020 18:28:48 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 127B43C3352
	for <lists+linux-ltp@lfdr.de>; Mon, 25 May 2020 18:28:47 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 by picard.linux.it (Postfix) with ESMTP id 2DC443C3326
 for <ltp@lists.linux.it>; Mon, 25 May 2020 18:28:42 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id C67C31001265
 for <ltp@lists.linux.it>; Mon, 25 May 2020 18:28:41 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id B842AADB3
 for <ltp@lists.linux.it>; Mon, 25 May 2020 16:28:43 +0000 (UTC)
Date: Mon, 25 May 2020 18:28:39 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Martin Doucha <mdoucha@suse.cz>
Message-ID: <20200525162839.GA18169@dell5510>
References: <20200505152315.29216-1-mdoucha@suse.cz>
 <20200505152315.29216-3-mdoucha@suse.cz>
 <20200525141510.GC26837@dell5510>
 <f24e98c8-0aba-aaeb-0401-dafe2fffa897@suse.cz>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <f24e98c8-0aba-aaeb-0401-dafe2fffa897@suse.cz>
X-Virus-Scanned: clamav-milter 0.99.2 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2 3/3] Add test for CVE 2017-1000111
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

> > Don't we want to add here taint check (you had it in v1)?
> > tst_taint_init(TST_TAINT_W | TST_TAINT_D);

> Taint check is meaningless in this test because the only ill effect from
> the race condition is that all incoming packets will be truncated to 0
> bytes. Somebody would have to horribly break the code for receiving
> incoming packets in order to turn this bug into something that can
> actually taint the kernel.

Right, that makes no sense to add it then.
Thanks for explanation and your patchset, merged.

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
