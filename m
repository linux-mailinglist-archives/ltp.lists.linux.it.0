Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id DCD32360B2A
	for <lists+linux-ltp@lfdr.de>; Thu, 15 Apr 2021 15:58:16 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id AEC1B3C702F
	for <lists+linux-ltp@lfdr.de>; Thu, 15 Apr 2021 15:58:16 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 12FF43C608A
 for <ltp@lists.linux.it>; Thu, 15 Apr 2021 15:58:14 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 7204410011CA
 for <ltp@lists.linux.it>; Thu, 15 Apr 2021 15:58:14 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id D7AB0AE58;
 Thu, 15 Apr 2021 13:58:13 +0000 (UTC)
Date: Thu, 15 Apr 2021 15:58:12 +0200
From: Petr Vorel <pvorel@suse.cz>
To: zhaogongyi <zhaogongyi@huawei.com>
Message-ID: <YHhGdMq97alWwWi4@pevik>
References: <377e1a36e883400eaff3812a6bc54f50@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <377e1a36e883400eaff3812a6bc54f50@huawei.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] lib/tst_test.c: Bugfix for heartbeat
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

Hi Gongyi, Cyril,

Reviewed-by: Petr Vorel <pvorel@suse.cz>

> Hi Cyril,

> I am sorry for my fault, I will make sure that it is right before sending out.
+1, Thanks!

> Thanks so much!

> Best Regards,
> Gongyi


> > Hi!
> > This should have had v2 in the email subject, please do not forget to add
> > the -v flag when generating/sending patches to git.

> > Otherwise this looks fine, but let's give peter chance to look at it.

> > Reviewed-by: Cyril Hrubis <chrubis@suse.cz>

> > --
> > Cyril Hrubis
> > chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
