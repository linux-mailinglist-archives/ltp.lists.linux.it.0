Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D85D255B35
	for <lists+linux-ltp@lfdr.de>; Fri, 28 Aug 2020 15:28:32 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 094B43C2E3B
	for <lists+linux-ltp@lfdr.de>; Fri, 28 Aug 2020 15:28:32 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 by picard.linux.it (Postfix) with ESMTP id 52D083C04C3
 for <ltp@lists.linux.it>; Fri, 28 Aug 2020 15:28:28 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id E48766002ED
 for <ltp@lists.linux.it>; Fri, 28 Aug 2020 15:28:27 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id E25CAAE41;
 Fri, 28 Aug 2020 13:28:59 +0000 (UTC)
Date: Fri, 28 Aug 2020 15:28:25 +0200
From: Petr Vorel <pvorel@suse.cz>
To: ltp@lists.linux.it, Cyril Hrubis <chrubis@suse.cz>,
 Li Wang <liwang@redhat.com>, Jan Stancek <jstancek@redhat.com>,
 Yang Xu <xuyang2018.jy@cn.fujitsu.com>
Message-ID: <20200828132825.GA12601@x230>
References: <20200820090824.3033-1-pvorel@suse.cz>
 <20200820090824.3033-4-pvorel@suse.cz>
 <20200828131856.GA29915@dell5510>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200828131856.GA29915@dell5510>
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [LTP v4 3/5] IMA: Refactor datafiles directory
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
Cc: Lakshmi Ramasubramanian <nramas@linux.microsoft.com>,
 Mimi Zohar <zohar@linux.vnet.ibm.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi,

> > +SUBDIRS	:= ima_*
I guess this could fix it:
SUBDIRS	:= $(shell ls ima_*) 

I'm surprised that glob does not work on SUBDIRS.

> It looks this broke build on out-of-tree build:
> https://travis-ci.org/github/linux-test-project/ltp/builds/722003659
> https://travis-ci.org/github/linux-test-project/ltp/jobs/722003661
> https://travis-ci.org/github/linux-test-project/ltp/jobs/722003662
> https://travis-ci.org/github/linux-test-project/ltp/jobs/722003663
> ...

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
