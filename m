Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 58187330CBD
	for <lists+linux-ltp@lfdr.de>; Mon,  8 Mar 2021 12:53:13 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 15EC93C5573
	for <lists+linux-ltp@lfdr.de>; Mon,  8 Mar 2021 12:53:13 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 by picard.linux.it (Postfix) with ESMTP id 03F0F3C0BCB
 for <ltp@lists.linux.it>; Mon,  8 Mar 2021 12:53:11 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id A939B600856
 for <ltp@lists.linux.it>; Mon,  8 Mar 2021 12:53:11 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id B70C5AD21;
 Mon,  8 Mar 2021 11:53:10 +0000 (UTC)
References: <20210308072510.GA902@xsang-OptiPlex-9020>
User-agent: mu4e 1.4.15; emacs 27.1
From: Richard Palethorpe <rpalethorpe@suse.de>
To: kernel test robot <oliver.sang@intel.com>
In-reply-to: <20210308072510.GA902@xsang-OptiPlex-9020>
Date: Mon, 08 Mar 2021 11:53:09 +0000
Message-ID: <87h7llhnfe.fsf@suse.de>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [f2fs]  02eb84b96b: ltp.swapon03.fail
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
Reply-To: rpalethorpe@suse.de
Cc: lkp@intel.com, lkp@lists.01.org, Chao Yu <yuchao0@huawei.com>,
 LKML <linux-kernel@vger.kernel.org>,
 "huangjianan@oppo.com" <huangjianan@oppo.com>,
 Linux Memory Management List <linux-mm@kvack.org>,
 Jaegeuk Kim <jaegeuk@kernel.org>, Guo Weichao <guoweichao@oppo.com>,
 ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hello,

> kern  :err   : [  187.461914] F2FS-fs (sda1): Swapfile does not align to section

> commit 02eb84b96bc1b382dd138bf60724edbefe77b025
> Author: huangjianan@oppo.com <huangjianan@oppo.com>
> Date:   Mon Mar 1 12:58:44 2021 +0800

>     f2fs: check if swapfile is section-alligned

>     If the swapfile isn't created by pin and fallocate, it can't be
>     guaranteed section-aligned, so it may be selected by f2fs gc. When
>     gc_pin_file_threshold is reached, the address of swapfile may change,
>     but won't be synchronized to swap_extent, so swap will write to wrong
>     address, which will cause data corruption.

>     Signed-off-by: Huang Jianan <huangjianan@oppo.com>
>     Signed-off-by: Guo Weichao <guoweichao@oppo.com>
>     Reviewed-by: Chao Yu <yuchao0@huawei.com>
>     Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>

The test uses fallocate to preallocate the swap file and writes zeros to
it. I'm not sure what pin refers to?

-- 
Thank you,
Richard.

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
