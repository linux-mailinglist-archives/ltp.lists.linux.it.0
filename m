Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 324F21140CD
	for <lists+linux-ltp@lfdr.de>; Thu,  5 Dec 2019 13:27:41 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id F13093C23D4
	for <lists+linux-ltp@lfdr.de>; Thu,  5 Dec 2019 13:27:40 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 by picard.linux.it (Postfix) with ESMTP id 39D873C23C3
 for <ltp@lists.linux.it>; Thu,  5 Dec 2019 13:27:38 +0100 (CET)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 00A9B1A00905
 for <ltp@lists.linux.it>; Thu,  5 Dec 2019 13:27:36 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 485A5B0B3;
 Thu,  5 Dec 2019 12:27:36 +0000 (UTC)
Date: Thu, 5 Dec 2019 13:27:35 +0100
From: Cyril Hrubis <chrubis@suse.cz>
To: CKI Project <cki-project@redhat.com>
Message-ID: <20191205122735.GB5693@rei.lan>
References: <cki.A05205186F.8840CLEZ0B@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <cki.A05205186F.8840CLEZ0B@redhat.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.2 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
Subject: Re: [LTP] ??? FAIL: Test report for kernel 5.2.21-rt14-eccdce6.cki
 (rt-devel)
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
Cc: Memory Management <mm-qe@redhat.com>, LTP Mailing List <ltp@lists.linux.it>,
 Kernel RT Team <kernel-rt-ci@redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi!
> We ran automated tests on a recent commit from this kernel tree:
> 
>        Kernel repo: git://git.kernel.org/pub/scm/linux/kernel/git/rt/linux-rt-devel.git
>             Commit: eccdce6cb526 - v5.2.21-rt14
> 
> The results of these automated tests are provided below.
> 
>     Overall result: FAILED (see details below)
>              Merge: OK
>            Compile: OK
>              Tests: FAILED
> 
>     Pipeline: https://xci32.lab.eng.rdu2.redhat.com/cki-project/cki-pipeline/pipelines/323141

This URL does not seem to be accessible from outside.

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
