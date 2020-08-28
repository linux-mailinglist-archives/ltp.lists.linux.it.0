Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id E9F712558ED
	for <lists+linux-ltp@lfdr.de>; Fri, 28 Aug 2020 12:54:41 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 7BD8D3C2EDD
	for <lists+linux-ltp@lfdr.de>; Fri, 28 Aug 2020 12:54:41 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 by picard.linux.it (Postfix) with ESMTP id C47EE3C2218
 for <ltp@lists.linux.it>; Fri, 28 Aug 2020 12:54:37 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id C68CA600B15
 for <ltp@lists.linux.it>; Fri, 28 Aug 2020 12:54:36 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id E5B73AAC7;
 Fri, 28 Aug 2020 10:55:08 +0000 (UTC)
Date: Fri, 28 Aug 2020 12:55:04 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
Message-ID: <20200828105504.GC10501@yuki.lan>
References: <20200825064706.GA7135@x230>
 <1598339667-24948-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
 <CAEemH2eS0PS=hmpiWBzkfBQ3cO4K2u2bVgcO5ZK4fz9N+xg7uQ@mail.gmail.com>
 <716a3ffc-fa20-01df-a63f-86a5a50239af@cn.fujitsu.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <716a3ffc-fa20-01df-a63f-86a5a50239af@cn.fujitsu.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.2 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2] travis: Use centos:7 instead of centos:6
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
Cc: LTP List <ltp@lists.linux.it>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi!
> Does have anything block this patch? Or, we should listen some advise 
> from Jan and Cyril?

I would be for dropping centos 6 (if nobody objects) after next release,
which will happen in a couple of weeks anyways.

So for now on I would be for adding centos 7, so that the next release
compiles cleanly both on centos 6 and 7.

Then we can work on our minimal requirements and drop obsolete code.

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
