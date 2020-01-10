Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 32E71137153
	for <lists+linux-ltp@lfdr.de>; Fri, 10 Jan 2020 16:33:08 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 01A8A3C2573
	for <lists+linux-ltp@lfdr.de>; Fri, 10 Jan 2020 16:33:08 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 by picard.linux.it (Postfix) with ESMTP id 0CAFA3C24FA
 for <ltp@lists.linux.it>; Fri, 10 Jan 2020 16:33:01 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id C962A601D16
 for <ltp@lists.linux.it>; Fri, 10 Jan 2020 16:33:01 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 24ACEB184;
 Fri, 10 Jan 2020 15:33:01 +0000 (UTC)
Date: Fri, 10 Jan 2020 16:32:59 +0100
From: Petr Vorel <pvorel@suse.cz>
To: Steve Dickson <SteveD@RedHat.com>
Message-ID: <20200110153259.GB219598@x230>
References: <20191230201122.9749-1-petr.vorel@gmail.com>
 <e01fdaab-617b-dfc3-021c-ea04d0ab42cf@RedHat.com>
 <20200109075835.GB12486@dell5510>
 <6eaebd7c-90bb-07ea-62f0-38cae6a34e42@RedHat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <6eaebd7c-90bb-07ea-62f0-38cae6a34e42@RedHat.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
X-Virus-Scanned: clamav-milter 0.99.2 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [RFC PATCH 1/1] rpc-tirpc: Remove authdes related tests
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
Cc: libtirpc-devel@lists.sourceforge.net, ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi Steve,

> > Can you please either ack this patch or request we detect authdes support
> > support (i.e. libtirpc < 1.2.5) and keep tests in this case?
> The ack is done! :-)
Thanks a lot, merged!


> steved.

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
