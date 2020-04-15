Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 62D321A9E25
	for <lists+linux-ltp@lfdr.de>; Wed, 15 Apr 2020 13:52:55 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 836B63C64F1
	for <lists+linux-ltp@lfdr.de>; Wed, 15 Apr 2020 13:52:54 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 by picard.linux.it (Postfix) with ESMTP id 22B483C20DE
 for <ltp@lists.linux.it>; Wed, 15 Apr 2020 13:52:49 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 29295600048
 for <ltp@lists.linux.it>; Wed, 15 Apr 2020 13:52:48 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 8C807AF19;
 Wed, 15 Apr 2020 11:52:47 +0000 (UTC)
Date: Wed, 15 Apr 2020 13:52:34 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: Viresh Kumar <viresh.kumar@linaro.org>
Message-ID: <20200415115234.GD12705@rei.lan>
References: <cover.1586861885.git.viresh.kumar@linaro.org>
 <0b30a19ac2938561f6e5e8e3264528aad6e42a76.1586861885.git.viresh.kumar@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <0b30a19ac2938561f6e5e8e3264528aad6e42a76.1586861885.git.viresh.kumar@linaro.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Virus-Scanned: clamav-milter 0.99.2 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.2 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [PATCH V2 1/2] tst_timer: Add time64 related helpers
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
Cc: Vincent Guittot <vincent.guittot@linaro.org>, arnd@arndb.de,
 ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi!
> This introduces a new set of helpers to handle the time64 related
> timespec. Instead of duplicating the code, this moves the existing code
> into a macro and then defines timespec and time64 related helpers using
> it.

I'm not sure that adding a macro that spans over ~150 lines is a good
idea. Unfortunately there is not so much options for a C language that
lacks generics.

Maybe it would be slightly better to write a shell script that would
generate these defintions into a separate header that would be included
in the tst_timer.h. That way we can run it manually to regenerate the
header if needed. At least we would get saner error message from
compiler that way.

-- 
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
