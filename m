Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C48237295D
	for <lists+linux-ltp@lfdr.de>; Tue,  4 May 2021 13:00:58 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 362C03C5832
	for <lists+linux-ltp@lfdr.de>; Tue,  4 May 2021 13:00:58 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 726683C57EB
 for <ltp@lists.linux.it>; Tue,  4 May 2021 13:00:56 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id ED3E2200C74
 for <ltp@lists.linux.it>; Tue,  4 May 2021 13:00:55 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 46C85B27F;
 Tue,  4 May 2021 11:00:55 +0000 (UTC)
Date: Tue, 4 May 2021 13:00:53 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Ankit Jain <ankitja@vmware.com>
Message-ID: <YJEpZfkvI7FuQyOT@pevik>
References: <1620029239-31643-1-git-send-email-ankitja@vmware.com>
 <YI/gQjOJK3dtjiPr@pevik>
 <SA1PR05MB8311C13BCB37A122FBB66337DD5A9@SA1PR05MB8311.namprd05.prod.outlook.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <SA1PR05MB8311C13BCB37A122FBB66337DD5A9@SA1PR05MB8311.namprd05.prod.outlook.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] realtime/func/pi-tests: testpi-2 parser
 indentation fix
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
Cc: Sharan Turlapati <sturlapati@vmware.com>,
 "ltp@lists.linux.it" <ltp@lists.linux.it>,
 Him Kalyan Bordoloi <bordoloih@vmware.com>, Vikash Bansal <bvikas@vmware.com>,
 "srivatsa@csail.mit.edu" <srivatsa@csail.mit.edu>,
 Srivatsa Bhat <srivatsab@vmware.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi Ankit,

> > If pi-tests are really working and worth to keep (one of my colleagues
> > realtime expert in the past didn't see much value in them), it'd be good
> > to rewrite these parsers to shell (to avoid unnecessary python3 dependency).

> Is there any other test suite or project which supersede or replaces the pi-tests in LTP?
No idea, maybe ask at appropriate ML (linux-rt-users@vger.kernel.org ?)

Kind regards,
Petr

> - Ankit


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
