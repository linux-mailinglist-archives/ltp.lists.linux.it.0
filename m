Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A9E7171CA0
	for <lists+linux-ltp@lfdr.de>; Thu, 27 Feb 2020 15:14:01 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id CC92B3C24C6
	for <lists+linux-ltp@lfdr.de>; Thu, 27 Feb 2020 15:14:00 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 by picard.linux.it (Postfix) with ESMTP id A99AB3C1F2A
 for <ltp@lists.linux.it>; Thu, 27 Feb 2020 15:13:58 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id B3EC71400B89
 for <ltp@lists.linux.it>; Thu, 27 Feb 2020 15:13:57 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 0EAFFB1AF
 for <ltp@lists.linux.it>; Thu, 27 Feb 2020 14:13:57 +0000 (UTC)
Date: Thu, 27 Feb 2020 15:13:56 +0100
From: Cyril Hrubis <chrubis@suse.cz>
To: Martin Doucha <mdoucha@suse.cz>
Message-ID: <20200227141356.GA29089@rei>
References: <20200224100932.10349-1-mdoucha@suse.cz>
 <20200226135748.GD24080@rei>
 <0d875613-07a4-b9fe-9c83-76c2e403d6dc@suse.cz>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <0d875613-07a4-b9fe-9c83-76c2e403d6dc@suse.cz>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.2 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v5] Add test for misaligned fallocate()
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
> > Are the failures on xfs fixed by now?
> > 
> > Do we have a upstrem kernel commit we can add to the test as a tag?
> > 
> 
> Anthony Iliopoulos says in the BSC that the upstream fix is
> commit e093c4be760e ("xfs: Fix tail rounding in xfs_alloc_file_space()")

I've added this as a tag and commend and also added a .gitignore entry
and pushed. Thanks.

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
