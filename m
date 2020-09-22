Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C5EA273ECB
	for <lists+linux-ltp@lfdr.de>; Tue, 22 Sep 2020 11:47:50 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id E8EDC3C2A42
	for <lists+linux-ltp@lfdr.de>; Tue, 22 Sep 2020 11:47:49 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 by picard.linux.it (Postfix) with ESMTP id 4A6623C29B2
 for <ltp@lists.linux.it>; Tue, 22 Sep 2020 11:47:47 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 847C51401106
 for <ltp@lists.linux.it>; Tue, 22 Sep 2020 11:47:47 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 20B03AD1A;
 Tue, 22 Sep 2020 09:48:23 +0000 (UTC)
Date: Tue, 22 Sep 2020 11:47:45 +0200
From: Petr Vorel <pvorel@suse.cz>
To: "Bird, Tim" <Tim.Bird@sony.com>
Message-ID: <20200922094745.GB14557@dell5510>
References: <20200921114026.11184-1-chrubis@suse.cz>
 <CY4PR13MB1175D646B9A4D84ABC6C9276FD3A0@CY4PR13MB1175.namprd13.prod.outlook.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CY4PR13MB1175D646B9A4D84ABC6C9276FD3A0@CY4PR13MB1175.namprd13.prod.outlook.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 1/2] runtest/smoketest: Add smoketest
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

Hi,

...
> > +route4-change-dst route-change-dist.sh

> this should be:
> route4-change-dst route-change-dst.sh
Good catch, thanks! Obviously typo.

Kind regards,
Petr

> $ find . -name "route-change-d*"
> ./testcases/network/stress/route/route-change-dst.sh

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
