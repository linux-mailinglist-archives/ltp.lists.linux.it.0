Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 235A8D3CFA
	for <lists+linux-ltp@lfdr.de>; Fri, 11 Oct 2019 12:06:12 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 69E013C229F
	for <lists+linux-ltp@lfdr.de>; Fri, 11 Oct 2019 12:06:11 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 by picard.linux.it (Postfix) with ESMTP id 88DCB3C1452
 for <ltp@lists.linux.it>; Fri, 11 Oct 2019 12:06:08 +0200 (CEST)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 2CFA71000C0B
 for <ltp@lists.linux.it>; Fri, 11 Oct 2019 12:04:22 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 8D1C7AD09;
 Fri, 11 Oct 2019 10:06:07 +0000 (UTC)
Date: Fri, 11 Oct 2019 12:06:06 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Joerg Vehlow <lkml@jv-coder.de>
Message-ID: <20191011100604.GA11441@dell5510>
References: <20191011090737.17997-1-lkml@jv-coder.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191011090737.17997-1-lkml@jv-coder.de>
User-Agent: Mutt/1.11.3 (2019-02-01)
X-Virus-Scanned: clamav-milter 0.99.2 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-4.smtp.seeweb.it
Subject: Re: [LTP] Rename tst_test_* to tst_require_*
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

Cc: Li and Clemens

> these patches rename tst_test_* to tst_require_*, to better describe
> their use. There is also tst_require_root, that has the same
> behavior: It also calls tst_brk in case of a failing requirement.

> You can also get this patch from the following repo:
> https://github.com/MofX/ltp/commits/rename_tst_test-tst_require

sorry for not thinking first, I wonder if we want to sync
tst_test_* (function name) vs $TST_NEEDS_* (test API variable name),
e.g.: tst_require_drivers $TST_NEEDS_DRIVERS

i.e. either of these:
s/tst_test_/tst_needs_/
s/TST_NEEDS_/TST_REQUIRE_/

I consider *require* as more descriptive than *needs*,
but changing to *require* would require more work :).

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
