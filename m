Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 45885D08BE
	for <lists+linux-ltp@lfdr.de>; Wed,  9 Oct 2019 09:47:21 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 0B5443C207C
	for <lists+linux-ltp@lfdr.de>; Wed,  9 Oct 2019 09:47:21 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 by picard.linux.it (Postfix) with ESMTP id 624DE3C0DFD
 for <ltp@lists.linux.it>; Wed,  9 Oct 2019 09:47:19 +0200 (CEST)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id E010020115E
 for <ltp@lists.linux.it>; Wed,  9 Oct 2019 09:47:18 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 07A72AE6D;
 Wed,  9 Oct 2019 07:47:18 +0000 (UTC)
Date: Wed, 9 Oct 2019 09:47:16 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Joerg Vehlow <lkml@jv-coder.de>
Message-ID: <20191009074716.GA601@dell5510>
References: <20191009062112.49947-1-lkml@jv-coder.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191009062112.49947-1-lkml@jv-coder.de>
User-Agent: Mutt/1.11.3 (2019-02-01)
X-Virus-Scanned: clamav-milter 0.99.2 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] ext4-new-features: Fix paths to ffsb-config files
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
Cc: Joerg Vehlow <joerg.vehlow@aox-tech.de>, ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi Joerg,

> The path to the ffsb-config files was just plain wrong (they are copied to
> $LTPROOT/testcases/data/ext4-ffsb, but searched in cwd.
> This is the same fix as in 4ae5699d, only for other tests.

> Signed-off-by: Joerg Vehlow <joerg.vehlow@aox-tech.de>
> ---
>  .../ext4-journal-checksum/ext4_journal_checksum.sh            | 2 +-
>  .../ext4-uninit-groups/ext4_uninit_groups_test.sh             | 4 ++--
>  2 files changed, 3 insertions(+), 3 deletions(-)

Thanks for your patch.
ext4_online_defrag_test.sh still contains wrong path.

I'd prefer to introduce some variable in ext4_funcs.sh, e.g.:
FFSB_CONFIG_DIR="$LTPROOT/testcases/data/ext4-ffsb"

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
