Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 469B51E5ED5
	for <lists+linux-ltp@lfdr.de>; Thu, 28 May 2020 13:56:43 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id B624A3C31D6
	for <lists+linux-ltp@lfdr.de>; Thu, 28 May 2020 13:56:42 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 by picard.linux.it (Postfix) with ESMTP id E0E3D3C050E
 for <ltp@lists.linux.it>; Thu, 28 May 2020 13:56:38 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 8C44961F75B
 for <ltp@lists.linux.it>; Thu, 28 May 2020 13:56:38 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 793FBAB5C
 for <ltp@lists.linux.it>; Thu, 28 May 2020 11:56:37 +0000 (UTC)
Date: Thu, 28 May 2020 13:56:36 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Martin Doucha <mdoucha@suse.cz>
Message-ID: <20200528115636.GB16726@dell5510>
References: <20200528110554.10179-1-pvorel@suse.cz>
 <20200528110554.10179-2-pvorel@suse.cz>
 <858875ff-2137-38b6-8301-f44e745f8026@suse.cz>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <858875ff-2137-38b6-8301-f44e745f8026@suse.cz>
X-Virus-Scanned: clamav-milter 0.99.2 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [RFC PATCH 1/2] LVM: Don't require root for
 generate_lvm_runfile.sh
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

> On 28. 05. 20 13:05, Petr Vorel wrote:
> > LTPROOT can be in user writable directory. Having rights for make
> > install is user responsibility, it does not have to be guarded by
> > TST_NEEDS_ROOT=1.

> TST_NEEDS_ROOT=1 is there for tst_supported_fs. It won't find any mkfs
> programs if it's not running as root.
Right, thanks for info. Hm, there can be some tests which just want to know
supported filesystems without running them and we have to require root for them.

There could be a solutions (tst_get_supported_fs_types() could have warning
about PATH when user is not root and no mkfs.* found or just changing in
has_mkfs() "mkfs.%s does not exist" to "mkfs.%s does not found" to give more
obvious hint). But it's just a corner case issue, no need to bother with it.

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
