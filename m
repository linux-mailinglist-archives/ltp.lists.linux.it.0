Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E96725C1A7
	for <lists+linux-ltp@lfdr.de>; Thu,  3 Sep 2020 15:30:10 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id C0B873C54EA
	for <lists+linux-ltp@lfdr.de>; Thu,  3 Sep 2020 15:30:09 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 by picard.linux.it (Postfix) with ESMTP id F26643C2D14
 for <ltp@lists.linux.it>; Thu,  3 Sep 2020 15:30:06 +0200 (CEST)
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 3EBAA200BA0
 for <ltp@lists.linux.it>; Thu,  3 Sep 2020 15:30:03 +0200 (CEST)
IronPort-SDR: wbwbcQMKm/IJBkHI813VMoq3YiRuaMR97+OzGBmk6mWFA2mlBaKqHqxSKYvZifj5NILwqIcHhn
 BLNaUlyhqzMw==
X-IronPort-AV: E=McAfee;i="6000,8403,9732"; a="137089171"
X-IronPort-AV: E=Sophos;i="5.76,386,1592895600"; d="scan'208";a="137089171"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Sep 2020 06:30:00 -0700
IronPort-SDR: Ii80nP53OMhKu3YPQanI2V3JEHYHtL7FOqbXWnBxegPkQJnHeLe8iGmOnrNuw5ZytWdFKHt8+v
 PmIgzgzmD4iA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.76,386,1592895600"; d="scan'208";a="282676539"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmsmga007.fm.intel.com with ESMTP; 03 Sep 2020 06:30:00 -0700
Received: from shsmsx601.ccr.corp.intel.com (10.109.6.141) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Thu, 3 Sep 2020 06:29:59 -0700
Received: from shsmsx601.ccr.corp.intel.com (10.109.6.141) by
 SHSMSX601.ccr.corp.intel.com (10.109.6.141) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Thu, 3 Sep 2020 21:29:57 +0800
Received: from shsmsx601.ccr.corp.intel.com ([10.109.6.141]) by
 SHSMSX601.ccr.corp.intel.com ([10.109.6.141]) with mapi id 15.01.1713.004;
 Thu, 3 Sep 2020 21:29:57 +0800
From: "Sang, Oliver" <oliver.sang@intel.com>
To: "dsterba@suse.cz" <dsterba@suse.cz>
Thread-Topic: [btrfs] c0aaf9b7a1: ltp: stuck at diotest4
Thread-Index: AQHWgdJgTz1eQ6GVAE+fMaKAQV67JalW6OSQ
Date: Thu, 3 Sep 2020 13:29:57 +0000
Message-ID: <06668b52b9ac4d4e81f945e06223d9b7@intel.com>
References: <20200903062837.GA3654@xsang-OptiPlex-9020>
 <20200903091123.GO28318@suse.cz>
In-Reply-To: <20200903091123.GO28318@suse.cz>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-reaction: no-action
dlp-version: 11.5.1.3
x-originating-ip: [10.239.127.36]
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-0.0 required=7.0 tests=SPF_HELO_PASS,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [btrfs] c0aaf9b7a1: ltp: stuck at diotest4
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
Cc: lkp <lkp@intel.com>,
 "linux-btrfs@vger.kernel.org" <linux-btrfs@vger.kernel.org>,
 LKML <linux-kernel@vger.kernel.org>, "lkp@lists.01.org" <lkp@lists.01.org>,
 Goldwyn Rodrigues <rgoldwyn@suse.com>, David Sterba <dsterba@suse.com>,
 "ltp@lists.linux.it" <ltp@lists.linux.it>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

> -----Original Message-----
> From: David Sterba <dsterba@suse.cz>
> Sent: Thursday, September 3, 2020 5:11 PM
> To: Sang, Oliver <oliver.sang@intel.com>
> Cc: Goldwyn Rodrigues <rgoldwyn@suse.com>; David Sterba
> <dsterba@suse.com>; LKML <linux-kernel@vger.kernel.org>; lkp@lists.01.org;
> lkp <lkp@intel.com>; ltp@lists.linux.it; linux-btrfs@vger.kernel.org
> Subject: Re: [btrfs] c0aaf9b7a1: ltp: stuck at diotest4
> 
> On Thu, Sep 03, 2020 at 02:28:37PM +0800, kernel test robot wrote:
> > Greeting,
> >
> > FYI, we noticed the following commit (built with gcc-9):
> >
> > commit: c0aaf9b7a114f6b75e0da97be7d99c102347a751 ("btrfs: switch to
> > iomap_dio_rw() for dio")
> > https://git.kernel.org/cgit/linux/kernel/git/next/linux-next.git
> > master
> 
> That's probably the O_DIRECT + O_(D)SYNC deadlock that was found recently.
> One of the cases in diotest4 does
> 
> 	open(filename, O_DIRECT | O_RDWR | O_SYNC)
> 
> Fix is work in progress, thanks for the report.

Thanks a lot for information!

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
