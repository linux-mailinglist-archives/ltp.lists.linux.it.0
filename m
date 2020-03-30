Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id A07E91977B4
	for <lists+linux-ltp@lfdr.de>; Mon, 30 Mar 2020 11:20:45 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id F2F8C3C3153
	for <lists+linux-ltp@lfdr.de>; Mon, 30 Mar 2020 11:20:44 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 by picard.linux.it (Postfix) with ESMTP id CCF503C3133
 for <ltp@lists.linux.it>; Mon, 30 Mar 2020 11:20:39 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 7CBCF1000D4C
 for <ltp@lists.linux.it>; Mon, 30 Mar 2020 11:20:39 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id DAE78B00A;
 Mon, 30 Mar 2020 09:20:38 +0000 (UTC)
Date: Mon, 30 Mar 2020 11:20:46 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: Zou Wei <zou_wei@huawei.com>
Message-ID: <20200330092046.GB9845@yuki.lan>
References: <1585553269-119544-1-git-send-email-zou_wei@huawei.com>
 <1585553269-119544-2-git-send-email-zou_wei@huawei.com>
 <20200330091835.GA9845@yuki.lan>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200330091835.GA9845@yuki.lan>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Virus-Scanned: clamav-milter 0.99.2 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.2 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v3 1/3] security/dirtyc0w: Fix bug caused by
 default umask
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
> > The case is only successful when system default umask is 0022.
> > When default umask is 0077 or other values, should clear current umask by umask(0) in setup().
> 
> What exactly fails in the dirtyc0w because of non-standard umask?
> 
> I can easily understand why fstat and statx fail, since we check the
> file permissions there. Ideally the failure should have been part of the
> patch description.

Looking at the code I guess that the child fails to open the file
created in parent before the setgid/setuid, something like this should
really have been part of the patch description.

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
