Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EE901FF2E3
	for <lists+linux-ltp@lfdr.de>; Thu, 18 Jun 2020 15:23:06 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 104353C2C8C
	for <lists+linux-ltp@lfdr.de>; Thu, 18 Jun 2020 15:23:06 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 by picard.linux.it (Postfix) with ESMTP id 1B9923C1C9A
 for <ltp@lists.linux.it>; Thu, 18 Jun 2020 15:23:04 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 0A34360086A
 for <ltp@lists.linux.it>; Thu, 18 Jun 2020 15:22:14 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 5C88AAFF2;
 Thu, 18 Jun 2020 13:23:02 +0000 (UTC)
Date: Thu, 18 Jun 2020 15:23:00 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Alexey Kodanev <alexey.kodanev@oracle.com>
Message-ID: <20200618132300.GA7101@dell5510>
References: <20200608142744.274287-1-yangx.jy@cn.fujitsu.com>
 <20200608145831.GA2746544@x230>
 <423c55db-a393-d1d9-6de6-28f65f76557a@oracle.com>
 <20200617184356.GA7422@dell5510>
 <3e8b407b-fd12-c637-e199-3651fd280bbc@oracle.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <3e8b407b-fd12-c637-e199-3651fd280bbc@oracle.com>
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] network/nfs_lib.sh: Use double quotes for grep
 pattern
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

Hi Alexey,

> > And removing it from all 3 variants would be great (keeping them to be the same,
> > also it might allow to also use shell functions, which doesn't work with sh -c
> > "..."). Why was sh -c "..." used anyway?

> Hi Petr,

> Don't remember, so if all work without it I would remove it. For rsh,
> I doubt that's is used now days, let's remove it too? The replacement (ssh)
> in the tst_rhost_run() has been for a long time already.
+1 agree, go ahead :).

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
