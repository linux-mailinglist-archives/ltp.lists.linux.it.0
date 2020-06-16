Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id A7C811FB09E
	for <lists+linux-ltp@lfdr.de>; Tue, 16 Jun 2020 14:25:23 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id D3CEC3C5FBC
	for <lists+linux-ltp@lfdr.de>; Tue, 16 Jun 2020 14:25:22 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 by picard.linux.it (Postfix) with ESMTP id 77E243C2CF8
 for <ltp@lists.linux.it>; Tue, 16 Jun 2020 14:25:18 +0200 (CEST)
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 674861BC36C4
 for <ltp@lists.linux.it>; Tue, 16 Jun 2020 14:25:14 +0200 (CEST)
IronPort-SDR: ajr1MT6G1iYQPJDqMqqT/qUXjfliSHqjtfdpz6HTfK7b0acDsWWbBYuEyjuOi42yemJQboBPaQ
 im9nhHil4knw==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jun 2020 05:25:12 -0700
IronPort-SDR: 1bnQa6Z+nx5XOwk5MnWgETija5ju7Fp+hma9kfl2w+TDxXx95LW9d6xXMsLUpbhdFU57t3uwr/
 QXMrUFRb4DOQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,518,1583222400"; d="scan'208";a="476444896"
Received: from shao2-debian.sh.intel.com (HELO localhost) ([10.239.13.3])
 by fmsmga005.fm.intel.com with ESMTP; 16 Jun 2020 05:25:10 -0700
Date: Tue, 16 Jun 2020 20:24:52 +0800
From: Rong Chen <rong.a.chen@intel.com>
To: Thomas Gleixner <tglx@linutronix.de>
Message-ID: <20200616122451.GQ5653@shao2-debian>
References: <20200616075533.GL5653@shao2-debian>
 <87y2onbdtb.fsf@nanos.tec.linutronix.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <87y2onbdtb.fsf@nanos.tec.linutronix.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [LKP] Re: [x86/entry] 2bbc68f837: ltp.ptrace08.fail
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
Cc: Alexandre Chartre <alexandre.chartre@oracle.com>,
 Peter Zijlstra <peterz@infradead.org>, LKML <linux-kernel@vger.kernel.org>,
 lkp@lists.01.org, Andy Lutomirski <luto@kernel.org>, ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

On Tue, Jun 16, 2020 at 10:44:00AM +0200, Thomas Gleixner wrote:
> kernel test robot <rong.a.chen@intel.com> writes:
> > FYI, we noticed the following commit (built with gcc-9):
> >
> > commit: 2bbc68f8373c0631ebf137f376fbea00e8086be7 ("x86/entry: Convert Debug exception to IDTENTRY_DB")
> > https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git master
> 
> Is the head of linux.git exposing the same problem or is this an
> intermittent failure, which only affects bisectability?
> 

Hi Thomas,

The problem still exists in v5.8-rc1:

9f58fdde95c9509a  2bbc68f8373c0631ebf137f376                    v5.8-rc1  testcase/testparams/testbox
----------------  --------------------------  --------------------------  ---------------------------
       fail:runs  %reproduction    fail:runs  %reproduction    fail:runs
           |             |             |             |             |    
           :12          92%          11:12         100%          13:13    ltp/1HDD-xfs-syscalls_part4/vm-snb
           :12          92%          11:12         100%          13:13    TOTAL ltp.ptrace08.fail

Best Regards,
Rong Chen

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
