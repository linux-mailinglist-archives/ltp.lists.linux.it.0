Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 51D4C1468D7
	for <lists+linux-ltp@lfdr.de>; Thu, 23 Jan 2020 14:15:27 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 0530D3C24D7
	for <lists+linux-ltp@lfdr.de>; Thu, 23 Jan 2020 14:15:27 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 by picard.linux.it (Postfix) with ESMTP id 61FD23C249A
 for <ltp@lists.linux.it>; Thu, 23 Jan 2020 14:15:25 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id F30871A013CA
 for <ltp@lists.linux.it>; Thu, 23 Jan 2020 14:15:24 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 29CB8AC81
 for <ltp@lists.linux.it>; Thu, 23 Jan 2020 13:15:24 +0000 (UTC)
Date: Thu, 23 Jan 2020 14:15:22 +0100
From: Petr Vorel <pvorel@suse.cz>
To: Cyril Hrubis <chrubis@suse.cz>
Message-ID: <20200123131522.GA94750@x230>
References: <20200116075633.29752-1-zlang@redhat.com>
 <20200116114900.GA4897@rei>
 <20200116150849.GF14282@dhcp-12-102.nay.redhat.com>
 <20200117074828.GA3979@dell5510>
 <20200117110554.GG14282@dhcp-12-102.nay.redhat.com>
 <20200123104114.GD27845@rei>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200123104114.GD27845@rei>
User-Agent: Mutt/1.12.2 (2019-09-21)
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v4] syscalls/newmount: new test case for new mount
 API
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

Hi,

Cyril, thanks for review.

> > For FUSE, I think we'd better to not test FUSE by default. Then let the case decide if
> > it would like to support a FUSE fs test. Change the TST_FS_SKIP_FUSE to TST_FS_SUP_FUSE,
> > if someone case wants to test a FUSE fs (likes ntfs), it should do special steps to mount
> > it, or it'll test linux internal ntfs.ko.

> It works fine for majority of testcases, the mount() and fsmount()
> syscalls are kind of special here. I guess that all we need to do here
> is to skip the fuse here.
Great, we get back to the original suggestion, which is in v4:
.dev_fs_flags	= TST_FS_SKIP_FUSE,

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
