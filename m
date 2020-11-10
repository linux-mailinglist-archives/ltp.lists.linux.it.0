Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C5592AD5D6
	for <lists+linux-ltp@lfdr.de>; Tue, 10 Nov 2020 13:04:32 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 5D16D3C3017
	for <lists+linux-ltp@lfdr.de>; Tue, 10 Nov 2020 13:04:32 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 by picard.linux.it (Postfix) with ESMTP id B0CA23C20D7
 for <ltp@lists.linux.it>; Tue, 10 Nov 2020 13:04:30 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 7AAC41A00902
 for <ltp@lists.linux.it>; Tue, 10 Nov 2020 13:04:30 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id C3E67ABD1
 for <ltp@lists.linux.it>; Tue, 10 Nov 2020 12:04:29 +0000 (UTC)
Date: Tue, 10 Nov 2020 13:04:28 +0100
From: Petr Vorel <pvorel@suse.cz>
To: Martin Doucha <mdoucha@suse.cz>
Message-ID: <20201110120428.GB16821@pevik>
References: <20201109164605.25965-1-mdoucha@suse.cz>
 <20201110114907.GB10788@pevik>
 <2864fc7e-5d23-8c07-357e-6161121dc4be@suse.cz>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <2864fc7e-5d23-8c07-357e-6161121dc4be@suse.cz>
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v3 1/2] Add tst_secureboot_enabled() helper
 function
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

> On 10. 11. 20 12:49, Petr Vorel wrote:
> >> Also check for SecureBoot status in tst_lockdown_enabled() if the lockdown
> >> sysfile is not available/readable

> > Reviewed-by: Petr Vorel <pvorel@suse.cz>

> > Kind regards,
> > Petr

> Ah, yes, I guess that part of commit message should be dropped. Sorry
> about that.
np, maintainer will drop that.

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
