Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id D46DC1C5AC5
	for <lists+linux-ltp@lfdr.de>; Tue,  5 May 2020 17:14:21 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 903EC3C57F2
	for <lists+linux-ltp@lfdr.de>; Tue,  5 May 2020 17:14:21 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 by picard.linux.it (Postfix) with ESMTP id 69E573C176A
 for <ltp@lists.linux.it>; Tue,  5 May 2020 17:14:19 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id C8FFD600BEB
 for <ltp@lists.linux.it>; Tue,  5 May 2020 17:14:06 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id EFFC8ABD1
 for <ltp@lists.linux.it>; Tue,  5 May 2020 15:14:20 +0000 (UTC)
Date: Tue, 5 May 2020 17:14:17 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Martin Doucha <mdoucha@suse.cz>
Message-ID: <20200505151417.GB9949@dell5510>
References: <20200505102456.13004-1-mdoucha@suse.cz>
 <20200505131724.GA21884@dell5510>
 <cdd26392-10a9-b952-361d-8308585c3980@suse.cz>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <cdd26392-10a9-b952-361d-8308585c3980@suse.cz>
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-5.smtp.seeweb.it
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

Hi Martin,

> On 05. 05. 20 15:17, Petr Vorel wrote:
> > I wanted to propose after release dropping gcc 4 support by deleting CentOS 6
> > from Travis (but maybe we should drop it even now). To keep the support, it'd be
> > good to add lapi/if_packet.h with this definition.

> I don't really care about CentOS 6 either way but I'll add the new LAPI
> header and resubmit.
Thanks a lot!

And we should really decide when drop it.

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
