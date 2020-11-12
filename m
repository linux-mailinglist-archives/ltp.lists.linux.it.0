Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B9762B07B4
	for <lists+linux-ltp@lfdr.de>; Thu, 12 Nov 2020 15:43:12 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id EB8873C525F
	for <lists+linux-ltp@lfdr.de>; Thu, 12 Nov 2020 15:43:11 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 by picard.linux.it (Postfix) with ESMTP id 35AD13C262E
 for <ltp@lists.linux.it>; Thu, 12 Nov 2020 15:43:10 +0100 (CET)
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id B73A51A014E2
 for <ltp@lists.linux.it>; Thu, 12 Nov 2020 15:43:09 +0100 (CET)
Received: by verein.lst.de (Postfix, from userid 2407)
 id A475567373; Thu, 12 Nov 2020 15:43:07 +0100 (CET)
Date: Thu, 12 Nov 2020 15:43:07 +0100
From: Christoph Hellwig <hch@lst.de>
To: Petr Vorel <pvorel@suse.cz>
Message-ID: <20201112144307.GA8377@lst.de>
References: <20201111180846.21515-1-pvorel@suse.cz>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201111180846.21515-1-pvorel@suse.cz>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 1/1] loop: Fix occasional uevent drop
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
Cc: Jens Axboe <axboe@kernel.dk>,
 Johannes Thumshirn <johannes.thumshirn@wdc.com>,
 Josef Bacik <josef@toxicpanda.com>, linux-block@vger.kernel.org,
 Hannes Reinecke <hare@suse.de>, Martijn Coenen <maco@android.com>,
 Christoph Hellwig <hch@lst.de>, ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

On Wed, Nov 11, 2020 at 07:08:46PM +0100, Petr Vorel wrote:
> 716ad0986cbd caused to occasional drop of loop device uevent, which was
> no longer triggered in loop_set_size() but in a different part of code.
> 
> Bug is reproducible with LTP test uevent01 [1]:
> 
> i=0; while true; do
>     i=$((i+1)); echo "== $i =="
>     lsmod |grep -q loop && rmmod -f loop
>     ./uevent01 || break
> done
> 
> Put back triggering through code called in loop_set_size().
> 
> Fix required to add yet another parameter to
> set_capacity_revalidate_and_notify().

I don't like where this is heading, especially as I've rewritten the whole
area pending inclusion for 5.11. I think the you want something like what
I did in this three commits with a loop commit equivalent to the last
commit for nbd:

http://git.infradead.org/users/hch/block.git/commitdiff/89348f9f510d77d0bf69994f096eb6b71199e0f4

http://git.infradead.org/users/hch/block.git/commitdiff/89348f9f510d77d0bf69994f096eb6b71199e0f4

Jens, maybe I should rebase things so that a version of that first
commit can go into 5.10 and stable?

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
