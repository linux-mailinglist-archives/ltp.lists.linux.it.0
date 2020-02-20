Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A00A165FD6
	for <lists+linux-ltp@lfdr.de>; Thu, 20 Feb 2020 15:39:14 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 7DF4D3C25CC
	for <lists+linux-ltp@lfdr.de>; Thu, 20 Feb 2020 15:39:13 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 by picard.linux.it (Postfix) with ESMTP id 988BC3C104E
 for <ltp@lists.linux.it>; Thu, 20 Feb 2020 15:39:08 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id C2DA7601D96
 for <ltp@lists.linux.it>; Thu, 20 Feb 2020 15:39:07 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 5F7DCAD77
 for <ltp@lists.linux.it>; Thu, 20 Feb 2020 14:39:07 +0000 (UTC)
Date: Thu, 20 Feb 2020 15:39:06 +0100
From: Cyril Hrubis <chrubis@suse.cz>
To: Jorik Cronenberg <jcronenberg@suse.de>
Message-ID: <20200220143906.GB29116@rei>
References: <20200108135949.15048-1-jcronenberg@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200108135949.15048-1-jcronenberg@suse.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.2 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] syscalls/ptrace: Merge ptrace01 and ptrace02
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
Pushed with minor adjustements, thanks.

* Removed the runtest entry for ptrace02
* Removed the .gitignore entry for ptrace02
* Fixed the status handling at the end of the test

We should adjust our expectations based on which ptrace() call we did,
e.g. for PTRACE_CONT the child killed by sigkill is still a failure.
Also you have to call WIF*() first and only then you can get the
exit/term signal value.

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
