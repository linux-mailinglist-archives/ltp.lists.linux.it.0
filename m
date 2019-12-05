Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id C148B1140E4
	for <lists+linux-ltp@lfdr.de>; Thu,  5 Dec 2019 13:36:38 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 834FC3C23DA
	for <lists+linux-ltp@lfdr.de>; Thu,  5 Dec 2019 13:36:38 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 by picard.linux.it (Postfix) with ESMTP id 2EF243C23C5
 for <ltp@lists.linux.it>; Thu,  5 Dec 2019 13:36:36 +0100 (CET)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id A8112600B8B
 for <ltp@lists.linux.it>; Thu,  5 Dec 2019 13:36:35 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id D965BB42A;
 Thu,  5 Dec 2019 12:36:34 +0000 (UTC)
Date: Thu, 5 Dec 2019 13:36:34 +0100
From: Cyril Hrubis <chrubis@suse.cz>
To: kernel test robot <rong.a.chen@intel.com>
Message-ID: <20191205123633.GC5693@rei.lan>
References: <20191205112439.GE32275@shao2-debian>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191205112439.GE32275@shao2-debian>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Virus-Scanned: clamav-milter 0.99.2 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.2 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [f*xattr]  ab91fe640f: ltp.open13.fail
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
Cc: Miklos Szeredi <mszeredi@redhat.com>, Miklos Szeredi <mszeredi@suse.cz>,
 linux-unionfs@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
 lkp@lists.01.org, ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi!
> commit: ab91fe640fca6de988a888b2de89d58014d120d4 ("f*xattr: allow O_PATH descriptors")
> https://git.kernel.org/cgit/linux/kernel/git/mszeredi/vfs.git for-viro

Looks like fgetxattr() on fd that has been opened with O_PATH returns
wrong errno after this patch, which I guess is OK because that seems to
be the point of this patch.

We will fix the test if/once this patch gets upstreamed.

Also btw man 2 open needs changes in the O_PATH paragraph after this as
well.

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
