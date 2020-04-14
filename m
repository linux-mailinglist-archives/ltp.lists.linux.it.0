Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 87D931A7BB9
	for <lists+linux-ltp@lfdr.de>; Tue, 14 Apr 2020 15:05:47 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 104313C2B71
	for <lists+linux-ltp@lfdr.de>; Tue, 14 Apr 2020 15:05:47 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 by picard.linux.it (Postfix) with ESMTP id 4913A3C2B41
 for <ltp@lists.linux.it>; Tue, 14 Apr 2020 15:05:43 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id DD54714011B4
 for <ltp@lists.linux.it>; Tue, 14 Apr 2020 15:05:42 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 8497FABBD
 for <ltp@lists.linux.it>; Tue, 14 Apr 2020 13:05:41 +0000 (UTC)
Date: Tue, 14 Apr 2020 15:05:59 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: Martin Doucha <mdoucha@suse.cz>
Message-ID: <20200414130559.GB6700@yuki.lan>
References: <20200414085934.8840-1-mdoucha@suse.cz>
 <20200414085934.8840-2-mdoucha@suse.cz>
 <20200414122908.GA6700@yuki.lan>
 <45d1cdc4-0a15-e987-b88d-87624215019b@suse.cz>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <45d1cdc4-0a15-e987-b88d-87624215019b@suse.cz>
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.2 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v5 2/3] Add LVM support scripts
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

Jo!
> >> diff --git a/testcases/misc/lvm/generate_lvm_runfile.sh b/testcases/misc/lvm/generate_lvm_runfile.sh
> > 
> > Hmm, where exactly is this called?
> > 
> > How is the template used?
> 
> generate_lvm_runfile.sh will be called near the end of install_ltp to
> generate system-specific runfile for LVM tests using the template.
> prepare_lvm.sh will be called in a separate OpenQA module right after
> boot_ltp. None of these helper scripts should be included in any runfile.

So these are OpenQA specific scripts, I do not think that they belong to
LTP upstream unless we make then work with upstream LTP.

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
