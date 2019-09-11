Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 360B8AFD0B
	for <lists+linux-ltp@lfdr.de>; Wed, 11 Sep 2019 14:47:21 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id ACC303C20C3
	for <lists+linux-ltp@lfdr.de>; Wed, 11 Sep 2019 14:47:20 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 by picard.linux.it (Postfix) with ESMTP id 1BE213C0232
 for <ltp@lists.linux.it>; Wed, 11 Sep 2019 14:47:17 +0200 (CEST)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 05882201296
 for <ltp@lists.linux.it>; Wed, 11 Sep 2019 14:47:15 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 13914B6BD;
 Wed, 11 Sep 2019 12:47:15 +0000 (UTC)
Date: Wed, 11 Sep 2019 14:47:14 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: "Xu, Yang/??? ???" <xuyang2018.jy@cn.fujitsu.com>
Message-ID: <20190911124714.GA21670@rei.lan>
References: <20190802115046.GB27727@rei>
 <1566282838-2980-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
 <20190827092520.GA28859@dell5510> <20190827095858.GB28859@dell5510>
 <20190827101644.GA30582@rei>
 <05330771-04f6-0fe4-f99d-eb55ff8b733c@cn.fujitsu.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <05330771-04f6-0fe4-f99d-eb55ff8b733c@cn.fujitsu.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Virus-Scanned: clamav-milter 0.99.2 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2] syscalls/statx04: use stx_attributes_mask
 before test
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

Hi!
> Do you mean use getxattr to ensure bitflags are enable or a functions test?
> I am confused.

For a given filesystem the support for filling in these flags was added
at some point to the kernel. If any kernel newer that this version fails
to fill them up it's a bug.

For ext2 it has been added in:

commit 93bc420ed41df63a18ae794101f7cbf45226a6ef
Author: yangerkun <yangerkun@huawei.com>
Date:   Mon Feb 18 09:07:02 2019 +0800

    ext2: support statx syscall

Hence starting kernel 5.0 ext2 (with ext2 driver) has to set the mask.

For ext4 it has been added in:

commit 3209f68b3ca4667069923a325c88b21131bfdf9f
Author: David Howells <dhowells@redhat.com>
Date:   Fri Mar 31 18:32:17 2017 +0100

	statx: Include a mask for stx_attributes in struct statx


Hence for ext4 the flags should be enabled since kernel 4.11

etc.

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
