Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A90B1D4909
	for <lists+linux-ltp@lfdr.de>; Fri, 15 May 2020 11:06:23 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id A672F3C539E
	for <lists+linux-ltp@lfdr.de>; Fri, 15 May 2020 11:06:22 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 by picard.linux.it (Postfix) with ESMTP id 4F00C3C25C1
 for <ltp@lists.linux.it>; Fri, 15 May 2020 11:06:18 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 859521A01A2D
 for <ltp@lists.linux.it>; Fri, 15 May 2020 11:06:18 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 6DDECB03D;
 Fri, 15 May 2020 09:06:20 +0000 (UTC)
Date: Fri, 15 May 2020 11:06:16 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Jan Stancek <jstancek@redhat.com>
Message-ID: <20200515090616.GA29676@dell5510>
References: <20200515070022.16407-1-pvorel@suse.cz>
 <1321342340.12558723.1589531383298.JavaMail.zimbra@redhat.com>
 <20200515090238.GA29151@dell5510>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200515090238.GA29151@dell5510>
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v3 1/4] INSTALL: Update requirements,
 modernise text
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

Hi Jan,

> > Do we want to list also optional packages here?
> > libaio-devel libcap-devel numactl-devel openssl-devel and others?
> I was thinking to ask users to have look into travis/*.sh (if it's packaged),
Yes, travis files are packaged in tarball.

> as I was trying to avoid maintaining the dependencies on 2 places,
> but I can put it there.
No strong preference, I can add it and add note that other distros are
documented in travis/*.sh

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
