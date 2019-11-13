Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E63AFB48F
	for <lists+linux-ltp@lfdr.de>; Wed, 13 Nov 2019 17:03:03 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 8B9373C234E
	for <lists+linux-ltp@lfdr.de>; Wed, 13 Nov 2019 17:03:02 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 by picard.linux.it (Postfix) with ESMTP id 457C03C076F
 for <ltp@lists.linux.it>; Wed, 13 Nov 2019 17:02:58 +0100 (CET)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 147741A017C3
 for <ltp@lists.linux.it>; Wed, 13 Nov 2019 17:02:56 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 38E06AF19;
 Wed, 13 Nov 2019 16:02:56 +0000 (UTC)
Date: Wed, 13 Nov 2019 17:02:54 +0100
From: Petr Vorel <pvorel@suse.cz>
To: Joerg Vehlow <lkml@jv-coder.de>
Message-ID: <20191113160254.GA28826@dell5510>
References: <20191113104149.42407-1-lkml@jv-coder.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191113104149.42407-1-lkml@jv-coder.de>
User-Agent: Mutt/1.11.3 (2019-02-01)
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] configure.ac: Fix --with* options
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
Cc: Joerg Vehlow <joerg.vehlow@aox-tech.de>, ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi Joerg,

> From: Joerg Vehlow <joerg.vehlow@aox-tech.de>

> The usage of AC_ARG_WITH was wrong. This resulted in unexpected configuration.
> E.g --without-bash set with_bash=yes and --with-nume set with_numa=no.
> This is fixed by using "$withval" in the action-if-given. Also all AC_ARG_WITH
> are unified now (all use alos action-if-not-given)

> The "default=" help text did not make sense for same options.
> e.g. for --with expect was "default=yes", but it defaults to no.
> The "default=" strings are dropped, because defaultness is indicated by
> either "--with-<option>" or "--without-<option>" as done by other projects,
> that use autoconf.

> Defining AC_ARG_WITH within an if to express dependencies does not work.
> ./configure --with-realtime-testsuite set with_realtime_testsuite=yes,
> even if with_bash=no or with_python=no. The check is removed completely.

> Signed-off-by: Joerg Vehlow <joerg.vehlow@aox-tech.de>
LGTM, but I'll have more deep look tomorrow.
FYI: https://github.com/linux-test-project/ltp/issues/508

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
