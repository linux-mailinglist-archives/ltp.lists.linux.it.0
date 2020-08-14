Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 67DCE244E79
	for <lists+linux-ltp@lfdr.de>; Fri, 14 Aug 2020 20:36:41 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 2863F3C309D
	for <lists+linux-ltp@lfdr.de>; Fri, 14 Aug 2020 20:36:41 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 by picard.linux.it (Postfix) with ESMTP id 939573C185D
 for <ltp@lists.linux.it>; Fri, 14 Aug 2020 20:36:39 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 01DCF1A005F4
 for <ltp@lists.linux.it>; Fri, 14 Aug 2020 20:36:38 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 36630AE64
 for <ltp@lists.linux.it>; Fri, 14 Aug 2020 18:37:01 +0000 (UTC)
Date: Fri, 14 Aug 2020 20:36:36 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Martin Doucha <mdoucha@suse.cz>
Message-ID: <20200814183636.GB133866@x230>
References: <20200811130502.12010-1-mdoucha@suse.cz>
 <20200811130502.12010-2-mdoucha@suse.cz>
 <20200814153803.GB30390@dell5510>
 <2b34ef8e-2697-7692-8c96-9e1fa25140a1@suse.cz>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <2b34ef8e-2697-7692-8c96-9e1fa25140a1@suse.cz>
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 2/4] Update tests to new taint check API
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

Hi Martin,

> On 14. 08. 20 17:38, Petr Vorel wrote:
> > Have you tried to use .taint_check also for testcases/kernel/crypto/af_alg07.c
> > and testcases/kernel/syscalls/bpf/bpf_prog04.c?

> I'm planning to update those on Monday after I submit the CVE test I'm
> working on right now. But feel free to update them when you merge this
> patchset.
Thanks for info. Sure, I can do. Just wanted to double check if there was a
reason to omit it. Waiting if anybody else review the library change.

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
