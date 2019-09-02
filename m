Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 07ACFA4D30
	for <lists+linux-ltp@lfdr.de>; Mon,  2 Sep 2019 03:50:48 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 8A8D83C20F7
	for <lists+linux-ltp@lfdr.de>; Mon,  2 Sep 2019 03:50:47 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 by picard.linux.it (Postfix) with ESMTP id 967DC3C20CC
 for <ltp@lists.linux.it>; Mon,  2 Sep 2019 03:50:44 +0200 (CEST)
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 5DF6360093A
 for <ltp@lists.linux.it>; Mon,  2 Sep 2019 03:50:43 +0200 (CEST)
X-Amp-Result: UNSCANNABLE
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 01 Sep 2019 18:50:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,457,1559545200"; d="scan'208";a="211551639"
Received: from yixin-dev.sh.intel.com ([10.239.161.25])
 by fmsmga002.fm.intel.com with ESMTP; 01 Sep 2019 18:50:36 -0700
Date: Mon, 2 Sep 2019 09:39:47 +0800
From: "Zhang, Yixin" <yixin.zhang@intel.com>
To: Petr Vorel <pvorel@suse.cz>
Message-ID: <20190902013947.GA19200@yixin-dev.sh.intel.com>
References: <20190809062000.8671-1-yixin.zhang@intel.com>
 <20190809062000.8671-4-yixin.zhang@intel.com>
 <20190830131359.GA28103@dell5510>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190830131359.GA28103@dell5510>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-5.smtp.seeweb.it
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
Cc: ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi Petr,

Understood and thanks.
Could you aslo have a look at "[PATCH ltp 3/5] runtest/ltp-aiodio.part4:
rename aiodio_append tests to avoid duplication"? That case is different
than this one. In that case cases with differnt commands share the same
name.

Br.
Yixin

On 2019-08-30 at 15:14:00 +0200, Petr Vorel wrote:
> Hi Yixin,
> 
> > mem01 is already in runtest file mm. Rename the test to mem01_crashme
> > here.
> 
> ...
> > -mem01 mem01 -r
> > +mem01_crashme mem01 -r
> >  # Memory eater. Loves to be run in parallel with other programs.
> >  # May panic on buggy systems if the OOM killer was not fast enough :-)
> >  fork12 fork12
> 
> Refused this one, as it's the same case as [5/5]. Quote Cyril:
> https://patchwork.ozlabs.org/comment/2234376/
> The test names in runtest files were never promised to be unique, if the
> command line is the same the test id should probably stay the same.
> 
> 
> Kind regards,
> Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
