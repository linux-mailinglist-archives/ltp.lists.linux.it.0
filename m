Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id AC25F1C5B08
	for <lists+linux-ltp@lfdr.de>; Tue,  5 May 2020 17:26:11 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 7D7E33C57F4
	for <lists+linux-ltp@lfdr.de>; Tue,  5 May 2020 17:26:11 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 by picard.linux.it (Postfix) with ESMTP id C7BD23C266A
 for <ltp@lists.linux.it>; Tue,  5 May 2020 17:26:09 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 950F51000C7F
 for <ltp@lists.linux.it>; Tue,  5 May 2020 17:26:09 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 5A9E2AC7B
 for <ltp@lists.linux.it>; Tue,  5 May 2020 15:26:11 +0000 (UTC)
Date: Tue, 5 May 2020 17:26:07 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Cyril Hrubis <chrubis@suse.cz>
Message-ID: <20200505152607.GC9949@dell5510>
References: <20200505102456.13004-1-mdoucha@suse.cz>
 <20200505131724.GA21884@dell5510> <20200505143135.GC27810@yuki.lan>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200505143135.GC27810@yuki.lan>
X-Virus-Scanned: clamav-milter 0.99.2 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 1/2] Add test for CVE 2016-8655
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

> > I wanted to propose after release dropping gcc 4 support by deleting CentOS 6
> > from Travis (but maybe we should drop it even now). To keep the support, it'd be
> > good to add lapi/if_packet.h with this definition.

> That mainly depends on if someone wants to still carry on supporting it.

> Does someone out there still need CentOS 6?
Should we send separate RFC about dropping support for this oldest distro in
Travis? If nobody interested and unless it requires too much effort I'd keep it
for this release.

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
