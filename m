Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id C5897B1E37
	for <lists+linux-ltp@lfdr.de>; Fri, 13 Sep 2019 15:07:33 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 96C443C207A
	for <lists+linux-ltp@lfdr.de>; Fri, 13 Sep 2019 15:07:33 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 by picard.linux.it (Postfix) with ESMTP id 216C53C1C97
 for <ltp@lists.linux.it>; Fri, 13 Sep 2019 15:07:31 +0200 (CEST)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 54EC010282E8
 for <ltp@lists.linux.it>; Fri, 13 Sep 2019 15:07:23 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 24DCAAFA5
 for <ltp@lists.linux.it>; Fri, 13 Sep 2019 13:07:30 +0000 (UTC)
Date: Fri, 13 Sep 2019 15:07:28 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Cyril Hrubis <chrubis@suse.cz>
Message-ID: <20190913130728.GA335@dell5510>
References: <20190906130707.GA7515@rei.lan>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190906130707.GA7515@rei.lan>
User-Agent: Mutt/1.11.3 (2019-02-01)
X-Virus-Scanned: clamav-milter 0.99.2 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-4.smtp.seeweb.it
Subject: Re: [LTP] LTP Release
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

Hi Cyril,

> Hi!
> As usually we should start prepare for a release somewhere at the end of
> the September.

> I will try to review as much patches as possible next week, then I would
> like to start the pre-release testing. So if there is something that
> really should go in before the release let me know.
I'd like to have shell timeout fixes + enhancements [1].
I hope I'll send route shell tests rewrite v5, tst_res return exit value [2] is a preparation
for it (if acceptable).

Kind regards,
Petr

[1] https://patchwork.ozlabs.org/project/ltp/list/?series=130562&state=*
[2] https://patchwork.ozlabs.org/patch/1161773/

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
