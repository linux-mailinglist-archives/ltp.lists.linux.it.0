Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id AD04D25C001
	for <lists+linux-ltp@lfdr.de>; Thu,  3 Sep 2020 13:17:36 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 58BAF3C54F9
	for <lists+linux-ltp@lfdr.de>; Thu,  3 Sep 2020 13:17:36 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 by picard.linux.it (Postfix) with ESMTP id 57D9D3C2D16
 for <ltp@lists.linux.it>; Thu,  3 Sep 2020 11:12:38 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 0290B1000BE1
 for <ltp@lists.linux.it>; Thu,  3 Sep 2020 11:12:37 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 13F96AC4C;
 Thu,  3 Sep 2020 09:12:38 +0000 (UTC)
Received: by ds.suse.cz (Postfix, from userid 10065)
 id 3CD95DA6E0; Thu,  3 Sep 2020 11:11:24 +0200 (CEST)
Date: Thu, 3 Sep 2020 11:11:23 +0200
From: David Sterba <dsterba@suse.cz>
To: kernel test robot <oliver.sang@intel.com>
Message-ID: <20200903091123.GO28318@suse.cz>
Mail-Followup-To: dsterba@suse.cz, kernel test robot <oliver.sang@intel.com>,
 Goldwyn Rodrigues <rgoldwyn@suse.com>,
 David Sterba <dsterba@suse.com>,
 LKML <linux-kernel@vger.kernel.org>, lkp@lists.01.org,
 lkp@intel.com, ltp@lists.linux.it, linux-btrfs@vger.kernel.org
References: <20200903062837.GA3654@xsang-OptiPlex-9020>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200903062837.GA3654@xsang-OptiPlex-9020>
User-Agent: Mutt/1.5.23.1-rc1 (2014-03-12)
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
X-Mailman-Approved-At: Thu, 03 Sep 2020 13:17:31 +0200
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
Reply-To: dsterba@suse.cz
Cc: lkp@intel.com, linux-btrfs@vger.kernel.org,
 LKML <linux-kernel@vger.kernel.org>, lkp@lists.01.org,
 Goldwyn Rodrigues <rgoldwyn@suse.com>, David Sterba <dsterba@suse.com>,
 ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

On Thu, Sep 03, 2020 at 02:28:37PM +0800, kernel test robot wrote:
> Greeting,
> 
> FYI, we noticed the following commit (built with gcc-9):
> 
> commit: c0aaf9b7a114f6b75e0da97be7d99c102347a751 ("btrfs: switch to iomap_dio_rw() for dio")
> https://git.kernel.org/cgit/linux/kernel/git/next/linux-next.git master

That's probably the O_DIRECT + O_(D)SYNC deadlock that was found
recently. One of the cases in diotest4 does

	open(filename, O_DIRECT | O_RDWR | O_SYNC)

Fix is work in progress, thanks for the report.

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
