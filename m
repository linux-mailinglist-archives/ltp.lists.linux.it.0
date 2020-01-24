Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A7C21484ED
	for <lists+linux-ltp@lfdr.de>; Fri, 24 Jan 2020 13:07:11 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 5AB993C23C8
	for <lists+linux-ltp@lfdr.de>; Fri, 24 Jan 2020 13:07:10 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 by picard.linux.it (Postfix) with ESMTP id 3E5A93C2379
 for <ltp@lists.linux.it>; Fri, 24 Jan 2020 13:07:06 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 5D77B14052F8
 for <ltp@lists.linux.it>; Fri, 24 Jan 2020 13:07:06 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 910F8B1A8
 for <ltp@lists.linux.it>; Fri, 24 Jan 2020 12:07:05 +0000 (UTC)
Date: Fri, 24 Jan 2020 13:07:03 +0100
From: Cyril Hrubis <chrubis@suse.cz>
To: Jorik Cronenberg <jcronenberg@suse.de>
Message-ID: <20200124120643.GA31214@rei.lan>
References: <20200124094819.11710-1-jcronenberg@suse.de>
 <20200124094819.11710-2-jcronenberg@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200124094819.11710-2-jcronenberg@suse.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.2 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 2/2] syscalls/vmsplice: Add NONBLOCK testcase
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
Cc: ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi!
Pushed with minor changes, thanks.

* Moved the initial vmsplice() to fill the pipe into the test setup
  otherwise the test breaks on -i parameter

* Added curly braces around multiline if/else blocks
  since this is prefered by LKML see:
  https://www.kernel.org/doc/html/v4.10/process/coding-style.html#placing-braces-and-spaces

* I've put the parent code in the second test out of the else block,
  the child does not return, there is no need to execute the rest of the
  function in an else block

* Put single empty lines between functions, it's much more readable that
  way

Also btw, if you put signed-off-by line after the --- it gets removed,
since everything after --- that is not the actual patch gets ignored, so
the signed-off-by should have been before the block that described the
changes in the commit.

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
