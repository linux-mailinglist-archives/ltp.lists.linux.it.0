Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 2255AA3796
	for <lists+linux-ltp@lfdr.de>; Fri, 30 Aug 2019 15:14:06 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id DA9AE3C201B
	for <lists+linux-ltp@lfdr.de>; Fri, 30 Aug 2019 15:14:05 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 by picard.linux.it (Postfix) with ESMTP id 9C5A43C1C67
 for <ltp@lists.linux.it>; Fri, 30 Aug 2019 15:14:03 +0200 (CEST)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 58BBD600CE4
 for <ltp@lists.linux.it>; Fri, 30 Aug 2019 15:14:02 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 97DE0B6F1;
 Fri, 30 Aug 2019 13:14:01 +0000 (UTC)
Date: Fri, 30 Aug 2019 15:14:00 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Yixin Zhang <yixin.zhang@intel.com>
Message-ID: <20190830131359.GA28103@dell5510>
References: <20190809062000.8671-1-yixin.zhang@intel.com>
 <20190809062000.8671-4-yixin.zhang@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190809062000.8671-4-yixin.zhang@intel.com>
User-Agent: Mutt/1.11.3 (2019-02-01)
X-Virus-Scanned: clamav-milter 0.99.2 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [PATCH ltp 4/5] runtest/crashme: rename mem01 to avoid
 duplication
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

Hi Yixin,

> mem01 is already in runtest file mm. Rename the test to mem01_crashme
> here.

...
> -mem01 mem01 -r
> +mem01_crashme mem01 -r
>  # Memory eater. Loves to be run in parallel with other programs.
>  # May panic on buggy systems if the OOM killer was not fast enough :-)
>  fork12 fork12

Refused this one, as it's the same case as [5/5]. Quote Cyril:
https://patchwork.ozlabs.org/comment/2234376/
The test names in runtest files were never promised to be unique, if the
command line is the same the test id should probably stay the same.


Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
