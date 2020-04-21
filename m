Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 129001B2219
	for <lists+linux-ltp@lfdr.de>; Tue, 21 Apr 2020 10:55:30 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id BE6363C29B5
	for <lists+linux-ltp@lfdr.de>; Tue, 21 Apr 2020 10:55:29 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 by picard.linux.it (Postfix) with ESMTP id 103C93C299E
 for <ltp@lists.linux.it>; Tue, 21 Apr 2020 10:55:27 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 7D78310014A8
 for <ltp@lists.linux.it>; Tue, 21 Apr 2020 10:55:27 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id C5B76AC19;
 Tue, 21 Apr 2020 08:55:25 +0000 (UTC)
Date: Tue, 21 Apr 2020 10:55:44 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
Message-ID: <20200421085544.GB6577@yuki.lan>
References: <20200409075506.GA2828@yuki.lan>
 <1586429086-22975-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
 <1586429086-22975-2-git-send-email-xuyang2018.jy@cn.fujitsu.com>
 <20200417151050.GA2491@yuki.lan>
 <8dd0a496-c46f-55d2-2393-5566eff618ff@cn.fujitsu.com>
 <48142e6b-8169-2934-e8b2-f71927cd62b0@cn.fujitsu.com>
 <20200420130140.GB11604@yuki.lan>
 <d3063175-5014-51ea-9d1c-4a9f3e2243b1@cn.fujitsu.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <d3063175-5014-51ea-9d1c-4a9f3e2243b1@cn.fujitsu.com>
X-Virus-Scanned: clamav-milter 0.99.2 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.2 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2 02/10] syscalls/ioctl:add common c file for
 loop ioctl
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
> >> +void tst_assert_file_str(const char *file, const int lineno, const char
> >> *path, const char *buf, const char *val)
> >> +{
> >> +       char sys_val[1024];
> >> +
> >> +       SAFE_FILE_LINES_SCANF(path, buf, sys_val);
> > 
> > We should call the file_lines_scanf() here and pass the filename and
> > lineno that this functions takes as parameter instead.
> I don't understand the meaning of adding filename and line parameter(If 
> fail, it will report tst_assert.c: 29). Do you want to report the 
> correct parsed filename when failed?
> 
> If so, I think lineno is meaningless and it also overides the place of 
> the code meet problem . I prefer to add some path info in safe_file_ops.c.

What I want is to show the test source filename and line on failure, for
that we have to pass the lineno and file to the file_lines_scanf()
function. I think that it makes much more sense to print the line in a
test where the problem has happened rather than some location in the
library code.

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
