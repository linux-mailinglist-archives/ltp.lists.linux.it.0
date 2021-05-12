Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id F399237B768
	for <lists+linux-ltp@lfdr.de>; Wed, 12 May 2021 10:05:34 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 76E2B3C4E04
	for <lists+linux-ltp@lfdr.de>; Wed, 12 May 2021 10:05:34 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 0B1E63C4D47
 for <ltp@lists.linux.it>; Wed, 12 May 2021 10:05:33 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id AAA711000996
 for <ltp@lists.linux.it>; Wed, 12 May 2021 10:05:32 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 19D96AE86;
 Wed, 12 May 2021 08:05:32 +0000 (UTC)
Date: Wed, 12 May 2021 10:05:30 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Cyril Hrubis <chrubis@suse.cz>
Message-ID: <YJuMSuFNH4EIFg1F@pevik>
References: <20210401141210.9536-1-pvorel@suse.cz> <YJpF5mq0oftICi+u@yuki>
 <YJp7LBc0IxKuwNh2@pevik> <YJuFTZj5h9V02axd@yuki>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YJuFTZj5h9V02axd@yuki>
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [RFC PATCH v2 1/1] netns_netlink: Rewrite into new API
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
Cc: Feiyu Zhu <zhufy.jy@cn.fujitsu.com>, ltp@lists.linux.it,
 Xiao Yang <yangx.jy@cn.fujitsu.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi Cyril,

> > BTW I guess sooner or later we should introduce variable to print only info that
> > config file is not available (for these embedded platforms and old android).

> But that would mean that tests would fail when something is missing. It
> makes much more sense to just copy the file somewhere and set
> KCONFIG_PATH even if you have to craft that file by hand in order to
> enable tests.
OK, that makes sense.

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
